# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  validates :name, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: 'only allows letters' }
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum roll: { ':buyer': 0, ':admin': 1 }
end
