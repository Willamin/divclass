require "./spec_helper"

describe Divclass do
  test "that opening tags work" do
    assert Divclass.translate(%[<card>]) == %[<div class="card">]
  end

  test "that closing tags work" do
    assert Divclass.translate(%[</card>]) == %[</div>]
  end

  test "that opening tags with class work" do
    assert Divclass.translate(%[<card class="text-center">]) == %[<div class="card text-center">]
  end

  test "that normal opening tags work" do
    assert Divclass.translate(%[<div>]) == %[<div>]
  end

  test "that normal closing tags work" do
    assert Divclass.translate(%[</div>]) == %[</div>]
  end

  test "that normal opening tags with class work" do
    assert Divclass.translate(%[<div class="text-center">]) == %[<div class="text-center">]
  end

  test "that newlines in tags work" do
    tag = <<-TAG
    <card
      class="text-center"
    >
    TAG
    assert Divclass.translate(tag) == %[<div class="card text-center">]
  end
end
