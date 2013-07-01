class Account < ::ActiveRecord::Base

  belongs_to :project
# belongs_to :status,               foreign_key: :status_state,              primary_key: :name
# belongs_to :audit_flag,           foreign_key: :audit_flag_name,           primary_key: :name
# belongs_to :determination_reason, foreign_key: :determination_reason_name, primary_key: :name

# has_many :properties, :order => 'property_number', :dependent => :destroy, conditions: "property_number != 0"
# has_many :denials,    :order => 'year DESC',       :dependent => :destroy
# has_many :notes,      :order => 'created_at DESC', :dependent => :destroy
# has_many :attachments, as: :attachable, class_name: 'Document' # for creating
# has_many :documents,   as: :attachable                         # for updating

  has_many :status_changes, :autosave => true,       :dependent => :destroy
# Old version of status changes - keeping for historical data
# has_many :events,         :autosave => true,       :dependent => :destroy

# has_one :principal_residence, :class_name => 'Property', :conditions => {:property_number => 0}, :dependent => :destroy
# has_one :primary_pre_owner,   :through => :principal_residence
# has_one :secondary_pre_owner, :through => :principal_residence

  belongs_to :letter_sent_by,            :class_name => 'User', :foreign_key => 'letter_sent_by_id'
  belongs_to :questionnaire_received_by, :class_name => 'User', :foreign_key => 'questionnaire_received_by_id'
  belongs_to :mail_returned_by,          :class_name => 'User', :foreign_key => 'mail_returned_by_id'
  belongs_to :manager_reviewed_by,       :class_name => 'User', :foreign_key => 'manager_reviewed_by_id'
  belongs_to :finalized_by,              :class_name => 'User', :foreign_key => 'finalized_by_id'

end
