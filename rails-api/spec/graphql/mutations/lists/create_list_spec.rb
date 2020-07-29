require 'rails_helper'

module Mutations
  module Lists
    RSpec.describe CreateList, type: :request do
      describe '.resolve' do
        it 'creates a users list' do
          user = FactoryBot.create(:user)
          headers = sign_in_test_headers user
          query = <<~GQL
          mutation {
            createList(input: {name: "Test List"}) {
              list { 
                id
              }
            }
          }
          GQL
          post '/graphql', params: {query: query}, headers: headers
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["createList"]["list"]["id"]).not_to be_nil
        end
      end
    end
  end
end