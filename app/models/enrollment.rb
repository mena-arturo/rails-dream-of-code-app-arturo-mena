class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student
  has_many :mentor_enrollment_assignments


  # Compare created_at with application_deadline (both dates).
  # It returns true if created_at is greater than application_deadline otherwise it returns false 
  def is_past_application_deadline

    return (self.created_at > self.course.trimester.application_deadline)

  end


end
