require "active_record"

ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: ":slack_atcoder:",
)


ActiveRecord::Migration.create_table :users do |t|
  t.string  :user_screen_name
  t.timestamp :created_at, :null => false
end

class User < ActiveRecord::Base
end
