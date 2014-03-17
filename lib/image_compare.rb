require 'chunky_png'

class ImageCompare
  def self.compare(test_img_blob, good_img_blob)
    new(test_img_blob, good_img_blob).compare
  end

  def initialize(test_img_blob, good_img_blob)
    @test_img_blob = test_img_blob
    @good_img_blob = good_img_blob
  end

  def compare
    diff = []

    good_img.height.times do |y|
      good_img.row(y).each_with_index do |pixel, x|
        diff << [x,y] unless pixel == test_img[x,y]
      end
    end

    changed_percent = diff.length.to_f / good_img.pixels.length

    puts "pixels (total):     #{good_img.pixels.length}"
    puts "pixels changed:     #{diff.length}"
    puts "pixels changed (%): #{changed_percent * 100}%"

    if diff.length > 0
      x, y = diff.map{ |xy| xy[0] }, diff.map{ |xy| xy[1] }

      test_img.rect(x.min, y.min, x.max, y.max, ChunkyPNG::Color.rgb(0,255,0))
      test_img.save('diff.png')
    end

    changed_percent
  end

  def test_img
    @test_img ||= ChunkyPNG::Image.from_blob(@test_img_blob)
  end

  def good_img
    @good_img ||= ChunkyPNG::Image.from_blob(@good_img_blob)
  end
end