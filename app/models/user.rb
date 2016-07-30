require 'bcrypt'
require 'dm-validations' #need this?

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :user_name, String
  property :email, String, required: true, unique: true
  property :password_digest, Text

  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
