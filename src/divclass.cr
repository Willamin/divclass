require "xml"
require "./ignored_tags"

module Divclass
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  def self.translate(input : IO)
    translate(input.gets_to_end)
  end

  def self.translate(input : String) : String
    document = XML.parse_html(input, options: XML::HTMLParserOptions.default | XML::HTMLParserOptions::NOIMPLIED | XML::HTMLParserOptions::NODEFDTD)

    translate(document)
    document.to_xml(options: XML::SaveOptions::NO_DECL | XML::SaveOptions::AS_HTML)
  end

  def self.translate(node : XML::Node) : XML::Node
    if node.element? && !IGNORE_TAGS.includes?(node.name)
      if node["class"]?
        node["class"] = node.name + " " + node["class"]
      else
        node["class"] = node.name
      end

      node.name = "div"
    end
    node.children.each { |child| translate(child) }
    node
  end
end
