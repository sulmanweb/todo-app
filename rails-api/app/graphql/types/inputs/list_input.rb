module Types
  module Inputs
    class ListInput < BaseInputObject
      argument :name, String, required: true, description: "List Name"
    end
  end
end