class StatusChange < ActiveRecord::Base

  belongs_to :account
  belongs_to :changed_by, class_name: 'User'

end
