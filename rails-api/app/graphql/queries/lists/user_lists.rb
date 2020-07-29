module Queries
  module Lists
    class UserLists < BaseQuery
      description "Get the Cureent User Lists"

      type [Types::ListType], null: true

      def resolve
        authenticate_user
        context[:current_user].lists
      end

    end
  end
end