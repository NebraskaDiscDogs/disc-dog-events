module Users
	class SignupForm < ApplicationForm
		attribute :full_name, String
		attribute :password, String
		attribute :password_confirmation, String
		attribute :email, String
		attribute :username, String

		validates :email, presence: true, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\Z/i, message: "must be a valid email address" }
		validates :username, presence: true, format: { with: /\A[a-z][a-z0-9]+\Z/i, message: "can only contain letters and numbers and must start with a letter" }, length: { minimum: 6, maximum: 24 }
		validates :password, presence: true, length: { minimum: 10 }

		def submit!
			if invalid?
				M::Failure[:invalid, errors]
			else
				User.create(attributes)
			end
		end
	end
end
