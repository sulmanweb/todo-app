module Queries
  module Lists
    class ListShow < BaseQuery
      description "Get the selected list"

      # Inputs
      argument :id, ID, required: true, description: "List Id"

      type Types::ListType, null: true

      def resolve(id:)
        authenticate_user
        context[:current_user].lists.find(id)
      rescue
        raise GraphQL::ExecutionError.new("List Not Found")
      end

    end
  end
end