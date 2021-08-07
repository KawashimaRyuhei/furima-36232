require 'rails_helper'

RSpec.describe BuyTransmit, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_transmit = FactoryBot.build(:buy_transmit, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'tokenがあり全ての値が正しく入力されておりいれば保存できる' do
        expect(@buy_transmit).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @buy_transmit.building_name = ''
        expect(@buy_transmit).to be_valid
      end
    end

    context '内容に問題がある' do
      it 'tokenが空だと購入できない' do
        @buy_transmit.token = nil
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'postal_codeが空だと購入できない' do
        @buy_transmit.postal_code = ''
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("Postal code can't be blank") 
      end
      
      it 'postal_codeが半角のハイフンを含んでいないと購入できない' do
        @buy_transmit.postal_code = '1234567'
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)") 
      end
      
      it 'prefecture_idを選択していないと購入できない' do
        @buy_transmit.prefectures_id = 1
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("Prefectures can't be blank") 
      end
      
      it 'cityが空だと購入できない' do
        @buy_transmit.city = ''
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("City can't be blank") 
      end
      
      it 'addressが空だと購入できない' do
        @buy_transmit.address = ''
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("Address can't be blank")  
      end
      
      it 'telephoneが空だと購入できない' do
        @buy_transmit.telephone = ''
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("Telephone can't be blank") 
      end
      
      it 'telephoneが半角のハイフンを含んでいると購入できない' do
        @buy_transmit.telephone = '090-1234-5678'
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("Telephone is invalid. Remove hyphen(-)") 
      end
      
      it 'userと紐づいていないと購入できない' do
        @buy_transmit.user_id = nil
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("User can't be blank") 
      end

      it 'itemと紐づいていないと購入できない' do
        @buy_transmit.item_id = nil
        @buy_transmit.valid?
        expect(@buy_transmit.errors.full_messages).to include("Item can't be blank") 
      end
    end
  end
end
