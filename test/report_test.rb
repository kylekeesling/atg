# frozen_string_literal: true

require "test_helper"

class ReportTest < Minitest::Test
  # Answers every command with one canned response.
  class FixedResponseAdapter
    def initialize(response)
      @response = response
    end

    def write(_command_string)
      @response.dup
    end
  end

  def test_a_frame_with_a_valid_checksum_parses
    entries = run_full_volume_report(fixture("i60400"))

    assert_equal 4, entries.size
  end

  # A gateway cut a real answer off after the header: SOH, command code, and
  # timestamp — no tank rows, no checksum, no EXT. It used to parse as zero
  # tanks without raising.
  def test_a_header_only_frame_raises_a_checksum_error
    error = assert_raises(Atg::ChecksumError) do
      run_full_volume_report("\x01i604002610110329")
    end

    assert_match(/failed its checksum/, error.message)
  end

  def test_a_frame_with_dropped_bytes_raises_a_checksum_error
    garbled = fixture("i60400").sub("45FAA800", "45FAA8")

    assert_raises(Atg::ChecksumError) { run_full_volume_report(garbled) }
  end

  def test_a_frame_with_a_wrong_checksum_raises_a_checksum_error
    assert_raises(Atg::ChecksumError) do
      run_full_volume_report(fixture("i60400").sub("&&F3E0", "&&0000"))
    end
  end

  def test_a_checksum_error_is_an_invalid_response_error
    assert_raises(Atg::InvalidResponseError) do
      run_full_volume_report("\x01i604002610110329")
    end
  end

  def test_a_frame_without_the_end_mark_parses_when_its_checksum_holds
    frame = fixture("i60400").delete(Atg::EXT)

    assert_equal 4, run_full_volume_report(frame).size
    assert_equal 4, run_full_volume_report(frame + Atg::EXT).size
  end

  def test_an_unrecognized_command_still_raises_command_not_recognized
    assert_raises(Atg::CommandNotRecognizedError) do
      run_full_volume_report("\x019999FF1B\x03")
    end
  end

  def test_the_raw_frame_is_kept_when_the_checksum_fails
    report = Atg::TankFullVolumeReport.new(adapter: FixedResponseAdapter.new("\x01i604002610110329"))

    assert_raises(Atg::ChecksumError) { report.run }
    assert_equal "\x01i604002610110329", report.raw_data
  end

  private

  def run_full_volume_report(response)
    Atg::TankFullVolumeReport.new(adapter: FixedResponseAdapter.new(response)).run
  end

  def fixture(command_code)
    File.read("#{Dir.pwd}/test/fixtures/#{command_code}.txt")
  end
end
