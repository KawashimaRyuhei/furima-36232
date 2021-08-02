require 'rails_helper'

RSpec.describe Item, type: :model do
  describe do
    before do
      @item = FactoryBot.build(:item)
    end
  
    it '情報が全て入力されていれば出品できる'do
      expect(@item).to be_valid
    end

    it '画像が添付されていないと出品できない'do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空だと出品できない'do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it '商品説明が空だと出品できない'do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    
    it 'カテゴリーが未選択だと出品できない'do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be choose")
    end

    it '商品の状態が未選択だと出品できない'do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be choose")
    end
    
    it '配送料の負担が未選択だと出品できない'do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be choose")
    end

    it '発送元の地域が未選択だと出品できない'do
      @item.prefectures_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures must be choose")
    end
    
    it '発送までの日数が未選択だと出品できない'do
      @item.shipment_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment day must be choose")
    end

    it '販売価格が空だと出品できない'do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格が小数まで含まれていると出品できない'do
      @item.price = 300.1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be an integer")
    end
    
    it '販売価格が300未満だと出品できない'do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '販売価格が10,000,000以上だと出品できない'do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'Userが紐づいていないと出品できない'do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end

end
