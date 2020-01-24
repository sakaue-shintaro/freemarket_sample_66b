require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# describe Product do
#   describe '#create' do
#     it "is invalid without a seller_id" do
#       product = build(:product, seller_id: nil)
#       product.valid?
#       expect(product.errors[:seller_id]).to include("can't be blank")
#     end
#   end
# end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a seller_id" do
      product = build(:product, seller_id: nil)
      product.valid?
      expect(product.errors[:seller_id]).to include("can't be blank")
    end
  end
end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
  end
end


RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a discription" do
      product = build(:product, discription: nil)
      product.valid?
      expect(product.errors[:discription]).to include("can't be blank")
    end
  end
end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end
  end
end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a state" do
      product = build(:product, state: nil)
      product.valid?
      expect(product.errors[:state]).to include("can't be blank")
    end
  end
end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a delivery_fee" do
      product = build(:product, delivery_fee: nil)
      product.valid?
      expect(product.errors[:delivery_fee]).to include("can't be blank")
    end
  end
end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a sending_method" do
      product = build(:product, sending_method: nil)
      product.valid?
      expect(product.errors[:sending_method]).to include("can't be blank")
    end
  end
end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a sending_area" do
      product = build(:product, sending_area: nil)
      product.valid?
      expect(product.errors[:sending_area]).to include("can't be blank")
    end
  end
end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a sending_day" do
      product = build(:product, sending_day: nil)
      product.valid?
      expect(product.errors[:sending_day]).to include("can't be blank")
    end
  end
end

RSpec.describe Product, type: :model do
  describe '#create' do
    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
  end
end