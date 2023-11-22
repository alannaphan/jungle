require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a valid product' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: 100, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it 'should not save without a name' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: nil, price: 100, quantity: 1, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should not save without a price' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price_cents: nil, quantity: 1, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should not save without a quantity' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: 100, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should not save without a category' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: 100, quantity: 1, category: nil)
      expect(@product).to_not be_valid
    end
  end
end
