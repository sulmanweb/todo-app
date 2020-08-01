class Task
  include Mongoid::Document
  field :name, type: String
  field :done, type: Boolean, default: false
  belongs_to :list

  validates :name, presence: true
end
