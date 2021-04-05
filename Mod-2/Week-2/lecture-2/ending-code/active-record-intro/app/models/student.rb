class Student < ActiveRecord::Base

    has_many :coffees
    has_many :locations, through: :coffees

    # def my_coffees
    #     Coffee.all.where(student_id: self.id)
    # end

end