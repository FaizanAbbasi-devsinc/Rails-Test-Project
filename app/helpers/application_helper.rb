# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    {
      'notice' => 'alert alert-info',
      'success' => 'alert alert-success',
      'error' => 'alert alert-light',
      'alert' => 'alert alert-danger'
    } [level]
  end
end
