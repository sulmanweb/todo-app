require 'rails_helper'

module Mutations
  module Lists
    RSpec.describe DeleteList, type: :request do
      describe '.resolve' do
        it 'deletes a users list' do
          user = FactoryBot.create(:user)
          list = FactoryBot.create(:list, user_id: user.id)
          headers = sign_in_test_headers user
          query = <<~GQL
          mutation {
            deleteList(id: "#{list.id}") {
              success
            }
          }
          GQL
          post '/graphql', params: {query: query}, headers: headers
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["deleteList"]["success"]).to be_truthy
        end
      end
    end
  end
end