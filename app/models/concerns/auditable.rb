# frozen_string_literal: true

module Auditable
  extend ActiveSupport::Concern
  included do
    after_initialize :add_created_by_and_updated_by
    after_save :update_updated_by
  end

  private

  def add_created_by_and_updated_by
    self.created_by_id ||= User.current.id if User.current
    self.updated_by_id ||= User.current.id if User.current
  end

  def update_updated_by
    self.updated_by_id = User.current.id if User.cu rrent && !destroyed?
  end
end
