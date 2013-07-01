class Project < ActiveRecord::Base

  has_many :accounts

  belongs_to :client
  delegate :name, :state, :to => :client

  def display_name
   "#{name_with_state_abbr} #{year}"
  end

  def name_with_state
    "#{name}, #{state.name}"
  end

  def name_with_state_abbr
    "#{name}, #{state.abbr}"
  end

end
