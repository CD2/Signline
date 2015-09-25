require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @cat = Category.new(name: "Example Cat", machine_name: "example_cat", site_id: 1)
  end 

  test "category should be valid" do
    assert @cat.valid?
  end

  test "machine name must not be blank" do
    @cat.machine_name = nil
    assert_not @cat.valid?
  end
end
