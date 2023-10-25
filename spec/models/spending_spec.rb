require 'rails_helper'

RSpec.describe Spending, type: :model do
  describe '支出登録' do
    before do
      @spending = FactoryBot.build(:spending)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@spending).to be_valid
      end
      it '添付写真を空欄にしても問題なく登録できること' do
        @spending.image = nil
        @spending.valid?
        expect(@spending).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '支出額を入力しないと登録できない' do
        @spending.price = nil
        @spending.valid?
        expect(@spending.errors.full_messages).to include("Price can't be blank")
      end
      it '金額が100,000,000円以上の支出は登録できない' do
        @spending.price = 100000000
        @spending.valid?
        expect(@spending.errors.full_messages).to include("Price is out of range")
      end
      it 'カテゴリーを指定しないと登録できない' do
        @spending.category_id = nil
        @spending.valid?
        expect(@spending.errors.full_messages).to include("Category can't be blank")
      end
      it '品目名を入力しないと登録できない' do
        @spending.item_name = nil
        @spending.valid?
        expect(@spending.errors.full_messages).to include("Item name can't be blank")
      end
      it '購入日を指定しないと登録できない' do
        @spending.start_time = nil
        @spending.valid?
        expect(@spending.errors.full_messages).to include("Start time can't be blank")
      end
      it 'Userが紐づいていないと登録できない' do
        @spending.user = nil
        @spending.valid?
        expect(@spending.errors.full_messages).to include("User must exist")
      end
      it '決済方法(settlementモデル)のデータが紐づいていないと登録できない' do
        @spending.settlement = nil
        @spending.valid?
        expect(@spending.errors.full_messages).to include("Settlement must exist")
      end
    end
  end
end
