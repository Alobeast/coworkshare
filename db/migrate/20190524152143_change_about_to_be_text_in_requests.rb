class ChangeAboutToBeTextInRequests < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :about, :text
  end
end
