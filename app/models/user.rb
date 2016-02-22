class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence:true, uniqueness: true
  validates :toggl, presence: true
end
