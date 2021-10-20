class EmailValidator < ActiveModel::EachValidator
  def validate_each(user, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      user.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end


class User < ApplicationRecord
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true 


end
