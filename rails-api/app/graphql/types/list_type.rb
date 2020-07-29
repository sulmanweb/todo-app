module Types
  class ListType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB List id string"
    field :name, String, null: false, description: "Name of the List"
    field :user, Types::UserType, null: false, description: "User of the List"
    field :tasks, [Types::TaskType], null: true, description: "List Tasks"
  end
end
