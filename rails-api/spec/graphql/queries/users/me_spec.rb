require 'rails_helper'

module Queries
  module Users
    RSpec.describe Me, type: :request do
      describe '.resolve' do
        it 'data about me' do
          user = FactoryBot.create(:user)
          list = FactoryBot.create(:list, user_id: user.id)
          task = FactoryBot.create(:task, list_id: list.id)
          headers = sign_in_test_headers user
          query = <<~GQL
          query {
            me {
              id
              email
            }
          }
          GQL
          post '/graphql', params: {query: query}, headers: headers
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["me"]["id"]).to eql user._id.to_s
        end
      end
    end
  end
end