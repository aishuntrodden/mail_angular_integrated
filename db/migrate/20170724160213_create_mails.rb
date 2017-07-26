class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :refresh_token
      t.string :oauth_token
      t.string :to
      t.string :body
      t.string :subject
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
