class ChangeAccountNumberToString < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.change :number, :string
    end
  end
end
