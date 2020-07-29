class Task
  include Mongoid::Document
  field :name, type: String
  belongs_to :list

  validates :name, presence: true
end
