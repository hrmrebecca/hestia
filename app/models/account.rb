class Account < ::ActiveRecord::Base

  belongs_to :project

  has_many :status_changes

  belongs_to :letter_sent_by,            :class_name => 'User', :foreign_key => 'letter_sent_by_id'
  belongs_to :questionnaire_received_by, :class_name => 'User', :foreign_key => 'questionnaire_received_by_id'
  belongs_to :mail_returned_by,          :class_name => 'User', :foreign_key => 'mail_returned_by_id'
  belongs_to :manager_reviewed_by,       :class_name => 'User', :foreign_key => 'manager_reviewed_by_id'
  belongs_to :finalized_by,              :class_name => 'User', :foreign_key => 'finalized_by_id'

end
