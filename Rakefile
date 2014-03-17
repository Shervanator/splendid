require "bundler/gem_tasks"

# Console
task :console do
  require 'irb'
  require 'irb/completion'
  require 'splendid'
  require 'proxy'
  require 'image_compare'

  def test
    Splendid.create_good_copy('http://localhost:3000/')
  end

  def test2
    Splendid.looks_good?('http://localhost:3000/')
  end

  def test3
    p = Proxy.new('www.microlancer.com')
    p.start
  end

  ARGV.clear

  IRB.start
end