require 'rails_helper'

module Mutations
  module Tasks
    RSpec.describe ChangeTaskStatus, type: :request do
      describe '.resolve' do
        it 'changes a task status in user list' do
          user = FactoryBot.create(:user)
          list = FactoryBot.create(:list, user_id: user.id)
          task = FactoryBot.create(:task, list_id: list.id)
          headers = sign_in_test_headers user
          query = <<~GQL
          mutation {
            changeTaskStatus(id: "#{task.id}") {
              task { 
                done
              }
            }
          }
          GQL
          post '/graphql', params: {query: query}, headers: headers
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          expect(json["data"]["changeTaskStatus"]["task"]["done"]).to be_truthy
        end
      end
    end
  end
end