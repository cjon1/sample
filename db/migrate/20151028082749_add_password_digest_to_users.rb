class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    # line above says:- add a column called password digest (of type 
    # string, to the table users.
  end
end
