ActiveRecord::Schema.define(:version => 1) do

  create_table :posts, :force => true do |t|    
    t.string :title
  end

  create_table :comments, :force => true do |t|
    t.string :body
  end

end
