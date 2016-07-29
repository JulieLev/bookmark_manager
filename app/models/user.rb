require 'bcrypt'
require 'dm-validations' #need this?

class User
  include DataMapper::Resource

  attr_writer :password_repeat

  property :id, Serial
  property :user_name, String
  property :email, String, required: true, unique: true
  property :password_digest, String, length: 60

  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email
  validates_confirmation_of :password, :confirm => :password_repeat

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  private

  attr_reader :password_repeat

end
