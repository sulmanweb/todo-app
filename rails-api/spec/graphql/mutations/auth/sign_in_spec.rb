require 'rails_helper'

module Mutations
  module Auth
    RSpec.describe SignIn, type: :request do
      describe '.resolve' do
        it 'creates a user session' do
          user = FactoryBot.create(:user)
          query = <<~GQL
          mutation {
            signIn(input: {email: "#{user.email}", password: "abcd@1234"}) {
              token
              user {
                id
                email
              }
            }
          }
          GQL
          post '/graphql', params: {query: query}
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["signIn"]["token"]).not_to be_nil
        end
      end
    end
  end
end