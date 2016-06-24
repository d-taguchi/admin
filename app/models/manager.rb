class Manager < ActiveRecord::Base
    has_secure_password

    # attr_accessor :id, :name, :email, :password

    # バリデーション
    # validates :id, :name, :group, :password, :email, :status,
    # presence: true
end
