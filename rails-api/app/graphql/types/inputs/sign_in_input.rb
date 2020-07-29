module Types
  module Inputs
    class SignInInput < BaseInputObject
      argument :email, String, required: true, description: "User's Email"
      argument :password, String, required: true, description: "Password minimum 8 and maximum 72 characters long"
    end
  end
end