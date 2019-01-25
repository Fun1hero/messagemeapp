class User < ApplicationRecord
  validates :username, presence: true, length: {minimun: 3, maximum: 25}, uniqueness: {case_sensitive: false}

  has_many :messages

  has_secure_password

  # color
  # OPTIONS = [['Email', 'email'], ['Text', 'text'], ['Email and Text', 'both']]
  #
  # validates_inclusion_of :field, :in => OPTIONS
  COLOR_OPTIONS = ['red', 'orange', 'yellow', 'olive', 'green', 'teal', 'blue', 'violet', 'purple', 'pink', 'brown', 'grey']
  validates_inclusion_of :color, :in => COLOR_OPTIONS
end
