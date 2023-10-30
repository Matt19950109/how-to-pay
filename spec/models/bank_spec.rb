require 'rails_helper'

RSpec.describe Bank, type: :model do
  describe '銀行名登録' do
    before do
      @bank = FactoryBot.build(:bank)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@bank).to be_valid
      end
      it '他のユーザーが既に同名の銀行名を保存してる場合でも問題なく登録できること' do
        @bank.user.nickname = "銀行ダミー"
        another_user = FactoryBot.create(:bank)
        expect(@bank).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '設定金額を入力しないと登録できない' do
        @bank.amount_price = nil
        @bank.valid?
        expect(@bank.errors.full_messages).to include("設定金額を入力してください")
      end
      it '銀行名がないと登録できない' do
        @bank.name = nil
        @bank.valid?
        expect(@bank.errors.full_messages).to include("銀行名を入力してください")
      end
      it '銀行名が30字以上なら登録できない' do
        @bank.name = Faker::Lorem.characters(number:31)
        @bank.valid?
        expect(@bank.errors.full_messages).to include("銀行名は30文字以内で入力してください")
      end
      it '一人のユーザーが重複した銀行名を登録できない' do
        same_data = FactoryBot.create(:bank)
        @bank.user.nickname = same_data.user.nickname
        @bank.user_id = same_data.user_id
        @bank.valid?
        expect(@bank.errors.full_messages).to include("銀行名はすでに存在します")
      end
      it 'Userが紐づいていないと登録できない' do
        @bank.user = nil
        @bank.valid?
        expect(@bank.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
