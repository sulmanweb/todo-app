module Mutations
  module Lists
    class CreateList < BaseMutation
      description "Create List for the user"

      # Inputs
      argument :input, Types::Inputs::ListInput, required: true

      # Outputs
      field :list, Types::ListType, null: false

      def resolve(input: nil)
        authenticate_user
        list = context[:current_user].lists.build(input.to_h)
        if list.save
          {list: list}
        else
          raise GraphQL::ExecutionError.new(list.errors.full_messages.join(","))
        end
      end
    end
  end
end