class User < ActiveRecord::Base
  include BCrypt

  has_many :rounds
  has_many :guesses, :through => :rounds

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end 

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && user.password == password
    return false if user == nil || user.password != password
  end 
end
