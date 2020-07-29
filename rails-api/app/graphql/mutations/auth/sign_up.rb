module Mutations
  module Auth
    class SignUp < BaseMutation
      require 'json_web_token'

      description "Sign Up the user into the system"

      argument :input, Types::Inputs::SignInInput, required: true

      field :token, String, null: false, description: "User's Authorizations Token to be used in Authenticated mutations and queries"
      field :user, Types::UserType, null: false, description: "User output"

      def resolve(input: nil)
        user = User.new(email: input.email, password: input.password)
        if user.save
          token = JsonWebToken.encode({user_id: user.id})
          if token
            return {token: token, user: user}
          else
            raise GraphQL::ExecutionError.new("Server was unable to created token. Please try again later.")
          end
        else
          raise GraphQL::ExecutionError.new(user.errors.full_messages.join(', '))
        end
      end
    end
  end
end