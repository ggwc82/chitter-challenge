require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password

end
