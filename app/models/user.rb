# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,  :registerable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable
         
  enum user: [:admin, :buyer]

  has_many :subscriptions
  has_many :plans, through: :subscriptions
  has_many :transactions
end
