# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    {
      'info' => 'alert alert-info', # Info! This alert box indicates a neutral informative change or action.
      'success' => 'alert alert-success', # Success! This alert box indicates a successful or positive action.
      'warning' => 'alert alert-warning', # Warning! This alert box indicates a warning that might need attention.
      'danger' => 'alert alert-danger' # Danger! This alert box indicates a dangerous or potentially negative action.
    } [level]
  end
end
