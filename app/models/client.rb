class Client < ActiveRecord::Base

  validates :name, :state, :presence => true
  validates :name, :uniqueness => {:scope => :state_abbr}

  has_many :projects, order: 'created_at DESC'
  has_many :accounts, through: :projects

  belongs_to :state, :foreign_key => :state_abbr
  
end
