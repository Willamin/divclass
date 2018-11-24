require "xml"

module Divclass
  VERSION     = {{ `shards version #{__DIR__}`.chomp.stringify }}
  IGNORE_TAGS = %w(div)

  def self.translate(input : String) : String
    input.gsub(/\<.*\>/) do |match|
      list = XML.parse(match).children

      if list.size == 0
        "</div>"
      else
        node = list[0]
        name = node.name
        return match if IGNORE_TAGS.includes?(name)

        old_class = node["class"]?

        new_class =
          if old_class
            [name, old_class].join(" ")
          else
            name
          end

        %[<div class="#{new_class}">]
      end
    end
  end
end

puts Divclass.translate("<card>")
