require 'rails_helper'
describe Product do
  describe '#create' do
    it "is valid with a name, price, description, status, size, days, cost, prefecture_id, category_id, user_id" do
      user = create(:user)
      category = create(:category)
      product = build(:product, user_id: user[:id], category_id: category[:id])
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      product = build(:product, user_id: nil)
      product.valid?
      expect(product.errors[:user_id]).to include("を入力してください")
    end
    
  end
end
