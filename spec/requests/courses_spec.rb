require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe 'GET /courses/:id' do

    before do
      #Define all the objects we need to test courses

      coding_class= CodingClass.create!(
        title: "My Coding class",
        description: "This is a test class"
      )

      coding_class2= CodingClass.create!(
        title: "My Coding class2",
        description: "This is a second test class"
      )

      
     current_trimester = Trimester.create!(
       term: 'Current term',
       year: Date.today.year.to_s,
       start_date: Date.today - 1.day,
       end_date: Date.today + 2.months,
       application_deadline: Date.today - 16.days
     )

     @course = Course.create!(
       coding_class_id: coding_class.id,
       trimester_id: current_trimester.id,
       max_enrollment: 25)

     @course2 = Course.create!(
       coding_class_id: coding_class2.id,
       trimester_id: current_trimester.id,
       max_enrollment: 25)
     
     @student = Student.create!(
            first_name: "Student1",
            last_name: "LastName1",
            email: "LastName1@email.com",
     )
     
      Enrollment.create!(
        course_id: @course.id,
        student_id: @student.id
      )
     
     end

      it 'returns a 200 OK status' do
        get "/courses/1"
        expect(response).to have_http_status(:ok)
      end

      it 'displays course\'s name' do
        get "/courses/1"
        expect(response.body).to include("#{@course.coding_class.title}")
      end

      it 'displays a student\'s list' do
        get "/courses/1"
        expect(response.body).to include("#{@student.first_name} #{@student.last_name}")
      end

      it 'displays an empty-list-message when there are no enrolled students for a class' do
        get "/courses/2"
        expect(response.body).to include("This class have no enrolled students at this time")
      end
      
    
    
  end
end
