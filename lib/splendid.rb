require "splendid/image_compare"
require "splendid/version"
require 'digest/md5'
require 'fileutils'

module Capybara
  class Session
    def splendid?
      Dir.mktmpdir do |dir|
        path = "#{dir}/page.png"
        save_screenshot(path, :full => true)

        Splendid.new(current_host + current_path).looks_good?(path)
      end
    end
  end
end


class Splendid
  def initialize(key)
    @key = hash(key)
  end

  def looks_good?(image_path)
    if File.exist?(file_name)
      looks_the_same?(image_path, file_name)
    else
      FileUtils.mv(image_path, file_name)
      true
    end
  end

  private

  def looks_the_same?(img_path_a, img_path_b)
    img_a = File.open(img_path_a, 'rb').read
    img_b = File.open(img_path_b, 'rb').read

    Splendid::ImageCompare.compare(img_a, img_b) <= 0.001
  end

  def hash(text)
    Digest::MD5.hexdigest(text)
  end

  def file_name
    "splendid_#{@key}.png"
  end
end
