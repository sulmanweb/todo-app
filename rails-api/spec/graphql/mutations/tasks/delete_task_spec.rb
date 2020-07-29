require 'rails_helper'

module Mutations
  module Tasks
    RSpec.describe DeleteTask, type: :request do
      describe '.resolve' do
        it 'deletes a task in user list' do
          user = FactoryBot.create(:user)
          list = FactoryBot.create(:list, user_id: user.id)
          task = FactoryBot.create(:task, list_id: list.id)
          headers = sign_in_test_headers user
          query = <<~GQL
          mutation {
            deleteTask(id: "#{task.id}") {
              success
            }
          }
          GQL
          post '/graphql', params: {query: query}, headers: headers
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["deleteTask"]["success"]).to be_truthy
        end
      end
    end
  end
end