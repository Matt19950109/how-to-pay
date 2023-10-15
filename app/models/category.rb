class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '食費' },
    { id: 2, name: '外食費' },
    { id: 3, name: '日用品' },
    { id: 4, name: '交通費' },
    { id: 5, name: '衣服' },
    { id: 6, name: '交際費' },
    { id: 7, name: '趣味' },
    { id: 8, name: '光熱費' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :spendings
  end