class UpdateTeachers < ActiveRecord::Migration[5.2]
  def change
    rename_column :teachers, :subject_taught, :subj_taught
  end
end
