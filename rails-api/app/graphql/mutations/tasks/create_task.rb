module Mutations
  module Tasks
    class CreateTask < BaseMutation
      description "Create Task in user's list"

      argument :input, Types::Inputs::TaskInput, required: true

      field :task, Types::TaskType, null: false

      def resolve(input: nil)
        authenticate_user
        list = context[:current_user].lists.find(input.list_id)
        if list
          task = list.tasks.build(name: input.name)
          if task.save
            {task: task}
          else
            raise GraphQL::ExecutionError.new(task.errors.full_messages.join(', '))
          end
        else
          raise GraphQL::ExecutionError.new("List Not Found")
        end
      end
    end
  end
end