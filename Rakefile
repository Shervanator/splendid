require "bundler/gem_tasks"

# Console
task :console do
  require 'irb'
  require 'irb/completion'
  require 'splendid'
  require 'proxy'

  def test
    Splendid.looks_good?('www.microlancer.com/')
  end

  def test2
    p = Proxy.new('www.microlancer.com')
    p.start
  end

  ARGV.clear

  IRB.start
end