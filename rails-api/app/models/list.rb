class List
  include Mongoid::Document
  field :name, type: String
  belongs_to :user
  has_many :tasks

  validates :name, presence: true
end
