class User < ActiveRecord::Base

	attr_accessor :password
    attr_accessor :confirm_password

    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    before_save :encrypt_password, if: -> {self.password.present? }
	validates :name, presence: true
	validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: true, length: { minimum: 6 }, on: :create
	validates :password, presence: true, length: { minimum: 6 }, on: :create

	has_many :watchlists, dependent: :destroy
	has_many :movies, through: :watchlists

	def self.authenticate(email, password)
		if email.present? && password.present?
			if user = User.find_by(email: email)
				if user.valid_password?(password)
					user									
				end									
			end					
		end		
	end

	def self.confirm_password
		password == confirm_password		
	end

	def valid_password?(password)
		self.encrypted_password == Digest::MD5.hexdigest(password)
	end

	def encrypt_password
		self.encrypted_password = Digest::MD5.hexdigest(password)
	end
end
