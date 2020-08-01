module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB Tassk id string"
    field :name, String, null: true, description: "Task's name"
    field :done, Boolean, null: true, description: "Task's status"
    field :list, Types::ListType, null: true, description: "Task's List"
  end
end
