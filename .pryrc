require 'rubygems' if RUBY_VERSION < '1.9'

# Custom prompt
prompt = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{prompt} (#{obj}):#{nest_level} * " }
]

# https://github.com/michaeldv/awesome_print/
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai(:indent => 2) }
rescue LoadError => e
  warn "[WARN] #{e}"
end

# Use Array.toy to get an array to play with
class Array
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |i| i+1 }
  end
end

# Use Hash.toy to get an hash to play with
class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n){ |c| (96+(c+1)).chr })]
  end
end
