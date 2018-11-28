require "./spec_helper"
require "xml"

class String
  def collapse : String
    XML.parse(self).to_xml(options: XML::SaveOptions::NO_DECL)
  end
end

describe Divclass do
  test "that tags work" do
    assert Divclass.translate(%[<card></card>]).collapse == %[<div class="card"></div>].collapse
  end

  test "that tags with class work" do
    assert Divclass.translate(%[<card class="text-center"></card>]).collapse == %[<div class="card text-center"></div>].collapse
  end

  test "that normal tags work" do
    assert Divclass.translate(%[<div></div>]).collapse == %[<div></div>].collapse
  end

  test "that normal tags with class work" do
    assert Divclass.translate(%[<div class="text-center"></div>]).collapse == %[<div class="text-center"></div>].collapse
  end

  test "that newlines in tags work" do
    tag = <<-TAG
    <card
      class="text-center"
    ></card>
    TAG
    assert Divclass.translate(tag).collapse == %[<div class="card text-center"></div>].collapse
  end

  test "that newlines in comment tags work" do
    tag = <<-TAG
    <!--
    <card
      class="text-center"
    >
    </card>
    -->
    TAG
    assert Divclass.translate(tag).collapse == tag.collapse
  end
end
