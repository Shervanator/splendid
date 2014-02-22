require "bundler/gem_tasks"

# Console
task :console do
  require 'irb'
  require 'irb/completion'
  require 'splendid'

  def test
    Splendid.looks_good?('https://www.microlancer.com/')
  end

  ARGV.clear

  IRB.start
end