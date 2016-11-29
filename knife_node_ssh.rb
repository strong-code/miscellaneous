begin
  gem 'tty-prompt'
rescue Gem::LoadError
  puts "Installing 'tty-prompt' gem..."
  `gem install tty-prompt`
  Gem.clear_paths
end

require 'tty-prompt'

prompt = TTY::Prompt.new

nodes = `knife node list | grep #{ARGV[0]}`.split("\n")

unless nodes.empty?
  target = prompt.select("Select a node to SSH into", nodes)
  puts target
  exec("ssh #{target}.dox.box")
end
