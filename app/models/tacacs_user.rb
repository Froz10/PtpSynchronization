class TacacsUser < ApplicationRecord
  encrypts :password
  belongs_to :user
end
