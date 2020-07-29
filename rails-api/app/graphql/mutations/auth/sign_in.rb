module Mutations
  module Auth
    class SignIn < BaseMutation
      require 'json_web_token'

      description "Signs In the user into the system"

      argument :input, Types::Inputs::SignInInput, required: true

      field :token, String, null: false, description: "User's Authorizations Token to be used in Authenticated mutations and queries"
      field :user, Types::UserType, null: false, description: "User output"

      def resolve(input: nil)
        user = User.find_by(email: input.email)
        if user && user.password == input.password
          token = JsonWebToken.encode({user_id: user.id})
          if token
            return {token: token, user: user}
          else
            raise GraphQL::ExecutionError.new("Server was unable to created token. Please try again later.")
          end
        else
          raise GraphQL::ExecutionError.new("Invalid Credentials Provided.")
        end
      end
    end
  end
end