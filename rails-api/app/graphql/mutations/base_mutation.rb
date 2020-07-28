module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    null false

    # The method authenticates the token
    def authenticate_user
      unless context[:current_user]
        raise GraphQL::ExecutionError.new("You must be logged in to perform this action")
      end
    end
  end
end
