class User < ApplicationRecord
  validates :email, uniqueness: {scope: :email}
  validates_presence_of :password
end
