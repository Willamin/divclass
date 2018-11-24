require "xml"
require "./ignored_tags"

module Divclass
  VERSION     = {{ `shards version #{__DIR__}`.chomp.stringify }}
  TAG         = /\<.*\>/
  BANG_TAG    = /\<\!.*\>/
  CLOSING_TAG = /\<\/.*\>/

  def self.closing_tag(input : String) : String
    match_data = input.match(/\<\/(.*)\>/)
    return input if IGNORE_TAGS.includes?(match_data.try(&.[1]))
    "</div>"
  end

  def self.translate(input : String) : String
    input.gsub(TAG) do |match|
      case match
      when .=~ BANG_TAG    then return match
      when .=~ CLOSING_TAG then return closing_tag(match)
      end

      nodes = XML.parse(match).children

      name = nodes[0].name
      return match if IGNORE_TAGS.includes?(name)

      old_class = nodes[0]["class"]?

      classes = [] of String
      classes << name
      classes << old_class if old_class
      new_class = classes.join(" ")

      %[<div class="#{new_class}">]
    end
  end
end

STDIN.each_line do |line|
  STDOUT.puts Divclass.translate(line)
end
