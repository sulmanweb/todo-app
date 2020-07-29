require 'rails_helper'

module Mutations
  module Tasks
    RSpec.describe CreateTask, type: :request do
      describe '.resolve' do
        it 'creates a task in list' do
          user = FactoryBot.create(:user)
          list = FactoryBot.create(:list, user_id: user.id)
          headers = sign_in_test_headers user
          query = <<~GQL
          mutation {
            createTask(input: {name: "Test List", listId: "#{list.id}"}) {
              task { 
                id
              }
            }
          }
          GQL
          post '/graphql', params: {query: query}, headers: headers
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["createTask"]["task"]["id"]).not_to be_nil
        end
      end
    end
  end
end