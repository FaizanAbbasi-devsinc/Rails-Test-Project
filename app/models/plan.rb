class Plan < ApplicationRecord
    has_many :features, inverse_of: :plan
    accepts_nested_attributes_for :features, allow_destroy: true, reject_if: :all_blank
    accepts_nested_attributes_for :features, reject_if: lambda {|attributes| attributes['code'].blank?}
end