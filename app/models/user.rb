class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token #set the session token

  validates :email, presence:true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :password, presence: { minimum: 6, allow_nil: true}

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password) #attempted password vs what's in the database
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)
    return nil if @user.nil?
    @user if is_password?(password)
  end

  private
    def ensure_session_token
      self.session_token ||= self.class.generate_session_token
    end


end
