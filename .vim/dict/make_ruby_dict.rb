# coding: utf-8

require 'uri'

# Neocomplete用のRuby辞書を作る
# e.g. ruby make_ruby_dict.rb ~/.rbenv/versions/2.0.0-p247/share/ri/2.0.0/system > ruby.dict
#

if ARGV.size != 1
  warn "Invalid argument"
  exit
end

methods = []
Dir.glob(File.expand_path(ARGV[0]) + "/**/*.ri").each do |file|
  method = URI.decode(File.basename(file))
  if /^(.*)-\w*\.ri$/ =~ method
    methods << $1
  else
    warn file
  end
end

methods.uniq!.sort.each do |method|
  puts method
end
