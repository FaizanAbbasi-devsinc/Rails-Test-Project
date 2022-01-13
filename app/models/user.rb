# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, format: { with: /\A[^0-9`!@#$%\^&*+_=]+\z/, message: 'only allows letters' }
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions
  has_many :transactions, dependent: :destroy
  enum role: { admin: 0, buyer: 1 }
end
