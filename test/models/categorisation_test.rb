require 'test_helper'

class CategorisationTest < ActiveSupport::TestCase
  def setup
    @categorisation = Categorisation.new(category_id: 1, product_id: 2)
  end

  test "should be valid" do
    assert @categorisation.valid?
  end

  test "should require a category_id" do
    @categorisation.category_id = nil
    assert_not @categorisation.valid?
  end

  test "should require a product_id" do
    @categorisation.product_id = nil
    assert_not @categorisation.valid?
  end
end
