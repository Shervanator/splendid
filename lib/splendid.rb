require 'net/http'
require 'imgkit'
require 'nokogiri'
require 'tmpdir'
require 'pathname'
require "splendid/version"

class Splendid
  def self.looks_good?(url_string)
    new(url_string).looks_good?
  end

  def initialize(url_string)
    @url_string = url_string
  end

  def looks_good?
    to_image(uri_html)
  end

  private

  def to_image(html)
    kit = IMGKit.new(html)

    Dir.mktmpdir do |temp_dir|
      css_files(temp_dir).each do |css_file|
        kit.stylesheets << css_file
      end

      kit.to_file './test.png'
    end
  end

  def uri_html
    @uri_html ||= Net::HTTP.get(uri)
  end

  def css_files(dir)
    doc = Nokogiri::HTML(uri_html)
    doc.css('link[href$=".css"]').map do |elem|
      file = Pathname.new(elem.attributes["href"].value).basename
      path = "#{dir}/#{file}"
      
      File.open path, 'w' do |f|
        f.write Net::HTTP.get(URI("http:#{elem.attributes["href"].value}"))
      end

      path
    end
  end

  def uri
    @uri ||= URI(@url_string)
  end
end
