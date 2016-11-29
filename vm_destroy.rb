begin
  gem 'tty-prompt'
rescue Gem::LoadError
  puts "Installing 'tty-prompt' gem..."
  `gem install tty-prompt`
  Gem.clear_paths
end

require 'tty-prompt'

prompt = TTY::Prompt.new

running_vms = `VBoxManage list runningvms`.split('\n').map { |v| v.split(' ').first }

unless running_vms.empty?
  target = prompt.select("Select VM to destroy", running_vms)
  `VBoxManage controlvm #{target} acpipowerbutton`
  puts "#{target} shut down"
end
