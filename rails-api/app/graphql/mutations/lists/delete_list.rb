module Mutations
  module Lists
    class DeleteList < BaseMutation
      description "Deleting a List from the user"

      # Inputs
      argument :id, ID, required: true

      # Outputs
      field :success, Boolean, null: false

      def resolve(id)
        authenticate_user
        list = context[:current_user].lists.find(id)
        if list && list.destroy
          {success: true}
        else
          raise GraphQL::ExecutionError.new("Error removing the list.")
        end
      end
    end
  end
end