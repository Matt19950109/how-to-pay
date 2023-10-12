require 'rails_helper'

RSpec.describe Settlement, type: :model do
  describe '決済方法登録' do
    before do
      @settlement = FactoryBot.build(:settlement)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@settlement).to be_valid
      end
      it '他のユーザーが既に同名の決済方法を保存していても問題なく登録できること' do
        @settlement.user.nickname = '決済方法ダミー'
        another_user = FactoryBot.create(:settlement)
        expect(@settlement).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '決済方法を入力しないと登録できない' do
        @settlement.payment = nil
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Payment can't be blank")
      end
      it '決済方法が30字以上なら登録できない' do
        @settlement.payment = Faker::Lorem.characters(number:31)
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Payment is too long (maximum is 30 characters)")
      end
      it '一人のユーザーが重複した決済名を登録できない' do
        same_data = FactoryBot.create(:settlement)
        @settlement.user.nickname = same_data.user.nickname
        @settlement.user_id = same_data.user_id
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Payment has already been taken")
      end
      it 'Userが紐づいていないと登録できない' do
        @settlement.user = nil
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("User must exist")
      end
      it '銀行名の登録(Bankモデル)のデータが紐づいていないと登録できない' do
        @settlement.bank = nil
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Bank must exist")
      end
    end
  end
end
