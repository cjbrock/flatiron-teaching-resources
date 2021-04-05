class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do | t |
      t.string :name
      t.integer :tech_score
      t.integer :age
      t.integer :grade
      t.string :fav_subj
      t.integer :teacher_id
    end
  end
end
