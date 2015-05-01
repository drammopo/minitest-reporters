module Minitest
  module Reporters
    module ANSI
      module Code

        def self.color?
          color_terminal = ENV['TERM'].to_s.downcase.index("color")
          $stdout.tty? || color_terminal
        end

        if color?
          require 'ansi/code'

          include ::ANSI::Code
          extend ::ANSI::Code
        else
          def black(s = nil)
            block_given? ? yield : s
          end

          %w[ red green yellow blue magenta cyan white ].each do |color|
            alias_method color, :black
          end

          extend self
        end
      end
    end
  end
end
