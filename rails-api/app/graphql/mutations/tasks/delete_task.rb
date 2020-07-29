module Mutations
  module Tasks
    class DeleteTask < BaseMutation
      description "Deleting a Task from the user's list"

      # Inputs
      argument :id, ID, required: true

      # Outputs
      field :success, Boolean, null: false

      def resolve(id)
        authenticate_user
        task = Task.find(id)
        if task && task.list.user == context[:current_user] && task.destroy
          {success: true}
        else
          raise GraphQL::ExecutionError.new("Task could not be found in the system")
        end
      end
    end
  end
end