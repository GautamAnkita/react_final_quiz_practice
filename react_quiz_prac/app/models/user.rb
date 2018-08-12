class User < ApplicationRecord
    has_secure_password

    has_many :questions, dependent: :nullify
    has_many :answers, dependent: :nullify

    validates :first_name, :last_name, presence: { message: 'must be present!' }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    #                   |          |@|
    #                   | steve    |@|codecore|.com
    #           INVALID | jim%bob  |a|b*zz    |,gov
  
    # The following validation will check that the email is present,
    # it's unique and it respects a certain format. To test the format,
    # we use a regular express. Regular expression often abbreviated
    # as Regex or Regexp is sort mini-programming for detecting patterns
    # in text. To learn more, check out https://regexone.com/
  
    validates(
      :email,
      presence: true,
      uniqueness: true,
      format: VALID_EMAIL_REGEX
    )

    def full_name
        first_name + " " + last_name
    end
end
