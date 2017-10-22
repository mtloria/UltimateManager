class AddTeamToUsersAndAdmins < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :team, foreign_key: true
    add_reference :admins, :team, foreign_key: true
  end
end
