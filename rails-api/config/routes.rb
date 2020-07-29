Rails.application.routes.draw do
  mount GraphqlPlayground::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
