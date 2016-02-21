class Stock < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :stockID, presence:true, uniqueness: true,
                    length: { maximum: 6 }
end