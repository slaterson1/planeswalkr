class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true,
  		format: {
          with: /\A.+\@.+\..+\z/,
            message: "must have an @ symbol and a period"
  }

  validates_presence_of :full_name, :email
end
