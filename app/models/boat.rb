class Boat < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to_active_hash :brand
  has_many :comments
  validates :image, presence: true
  validates :name , presence: true, length: { maximum: 20 }
  validates :brand_id, presence: true
  validates :size_id, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: { in: (1000..50_000) }
  def self.search(search) #引数は入力された文字
    if search != "" #もし検索が空欄でなければ
      Boat.where('description LIKE(?)', "%#{search}%")
    else            #もし検索が空欄であれば全て取得する
      Boat.all
    end
  end
end
