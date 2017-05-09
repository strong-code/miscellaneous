module Utils

  module Prompt
    # returns a TTY::Prompt.new object
    def Prompt.new
      begin
        gem 'tty-prompt'
      rescue Gem::LoadError
        puts "Installing 'tty-prompt' gem..."
        `gem install tty-prompt`
        Gem.clear_paths
      end

      require 'tty-prompt'
      TTY::Prompt.new
    end
  end
  
end
