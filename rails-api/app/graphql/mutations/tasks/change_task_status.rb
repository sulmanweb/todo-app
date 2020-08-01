module Mutations
  module Tasks
    class ChangeTaskStatus < BaseMutation
      description "Deleting a Task from the user's list"

      # Inputs
      argument :id, ID, required: true

      # Outputs
      field :task, Types::TaskType, null: false

      def resolve(id)
        authenticate_user
        task = Task.find(id)
        if task && task.list.user == context[:current_user] && task.update(done: !task.done)
          {task: task}
        else
          raise GraphQL::ExecutionError.new("Task could not be found in the system")
        end
      end
    end
  end
end