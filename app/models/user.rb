class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_presence_of :password, :email
end
