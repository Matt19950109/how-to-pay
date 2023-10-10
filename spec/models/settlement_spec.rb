require 'rails_helper'

RSpec.describe Settlement, type: :model do
  describe '決済方法登録' do
    before do
      @settlement = FactoryBot.build(:settlement)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
      end
      it '他のユーザーが同名の銀行名を保存してる場合でも問題なく登録できること' do
      end
    end

    context '内容に問題がある場合' do
      it '決済方法を入力しないと登録できない' do
      end
      it '決済方法が30字以上なら登録できない' do
      end
      it '一人のユーザーが重複した決済名を登録できない' do
      end
      it 'Userが紐づいていないと登録できない' do
      end
      it '銀行名の登録(Bankモデル)のデータが紐づいていないと登録できない' do
      end
    end
  end
end
