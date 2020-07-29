module Mutations
  module Auth
    class SignOut < BaseMutation

      description "Signing out the user from the system"
    
      field :success, Boolean, null: false, description: "If operation was successful"
    
      def resolve
        authenticate_user
        {success: true}
      end
    end
  end
end