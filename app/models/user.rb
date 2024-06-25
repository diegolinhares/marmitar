class User < ::ApplicationRecord
  has_many :restaurants,
           dependent: :destroy

  has_secure_token :api_access_token, length: 42

  with_options presence: true do
    validates :email,
              format: {with: ::URI::MailTo::EMAIL_REGEXP},
              uniqueness: true
  end
end
