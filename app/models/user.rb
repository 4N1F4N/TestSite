class User < ApplicationRecord
    has_secure_password
    validates :login, presence: { message: 'blank'}
    validates :login, uniqueness: { message: 'exists'}
    validates :password, presence: { message: 'blank'}
end
