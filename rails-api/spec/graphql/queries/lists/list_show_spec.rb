require 'rails_helper'

module Queries
  module Lists
    RSpec.describe ListShow, type: :request do
      describe '.resolve' do
        it 'one list data of the current user' do
          user = FactoryBot.create(:user)
          list = FactoryBot.create(:list, user_id: user.id, name: "Show List 1")
          headers = sign_in_test_headers user
          query = <<~GQL
          query {
            showList(id: "#{list._id}") {
              id
              name
            }
          }
          GQL
          post '/graphql', params: {query: query}, headers: headers
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["showList"]["id"]).to eql list._id.to_s
        end
      end
    end
  end
end