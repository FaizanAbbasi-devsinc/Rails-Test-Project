# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  validates :name, presence: true
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum roll: [:buyer, :admin]
end
