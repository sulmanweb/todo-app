module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :me, resolver: Queries::Users::Me
    field :user_lists, resolver: Queries::Lists::UserLists
    field :show_list, resolver: Queries::Lists::ListShow
  end
end
