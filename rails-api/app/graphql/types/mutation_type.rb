module Types
  class MutationType < Types::BaseObject
    # Auth
    field :sign_in, mutation: Mutations::Auth::SignIn
    field :sign_up, mutation: Mutations::Auth::SignUp

    # List
    field :create_list, mutation: Mutations::Lists::CreateList
    field :delete_list, mutation: Mutations::Lists::DeleteList

    # Task
    field :create_task, mutation: Mutations::Tasks::CreateTask
    field :delete_task, mutation: Mutations::Tasks::DeleteTask
    field :change_task_status, mutation: Mutations::Tasks::ChangeTaskStatus
  end
end
