# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @transactions = if current_user.admin?
                      Transaction.all
                    else
                      current_user.transactions
                    end
  end
end
