require 'net/http'
require 'imgkit'
require 'nokogiri'
require 'tmpdir'
require 'pathname'
require "splendid/version"
require 'digest/md5'

class Splendid
  def self.looks_good?(uri)
    new(uri).looks_good?
  end

  def self.create_good_copy(uri)
    new(uri).create_good_copy
  end

  def initialize(uri)
    @uri = uri
  end

  def looks_good?
    test_img = to_image(@uri).to_img(:png)
    ImageCompare.compare(test_img, good_copy_img) < 0.1
  end

  def create_good_copy
    img = to_image(@uri)
    img.to_file("tmp/#{file_name}")
  end

  def good_copy_img
    File.read("tmp/#{file_name}")
  end

  private

  def to_image(url)
    IMGKit.new(url, :"disable-javascript" => true, :quality => 5, :zoom => 0.4, :width => 500, :height => 1000)
  end

  def file_name
    "splendid_#{Digest::MD5.hexdigest(@uri)}.png"
  end
end
