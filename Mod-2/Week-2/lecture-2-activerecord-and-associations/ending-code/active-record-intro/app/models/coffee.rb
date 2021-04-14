class Coffee < ActiveRecord::Base

    belongs_to :student
    belongs_to :location

    # def my_student
    #     Student.all.find_by(id: self.student_id)
    # end

end