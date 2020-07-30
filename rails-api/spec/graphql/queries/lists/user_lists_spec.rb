require 'rails_helper'

module Queries
  module Lists
    RSpec.describe UserLists, type: :request do
      describe '.resolve' do
        it 'lists data of the current user' do
          user = FactoryBot.create(:user)
          list = FactoryBot.create(:list, user_id: user.id, name: "User List 1")
          headers = sign_in_test_headers user
          query = <<~GQL
          query {
            userLists {
              id
              name
            }
          }
          GQL
          post '/graphql', params: {query: query}, headers: headers
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["userLists"][0]["id"]).to eql list._id.to_s
        end
      end
    end
  end
end