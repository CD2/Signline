require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:name].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(name:       "My Book Title",
                          body: "yyy")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], 
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "product is not valid without a unique name" do
    product = Product.new(name:       products(:one).name,
                          body: "yyy", 
                          price:       1)

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:name]
  end

  test "product is not valid without a unique name - i18n" do
    product = Product.new(name:       products(:one).name,
                          body: "yyy", 
                          price:       1)

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:name]
  end

  test "should be categorised and not categorised" do

    product = products(:one)
    category = categories(:one)
    assert_not product.categorised?(category)
    product.categorise(category)
    assert product.categorised?(category)
    product.uncategorise(category)
    assert_not product.categorised?(category)

  end
  
end