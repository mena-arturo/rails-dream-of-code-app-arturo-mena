require 'rails_helper'

RSpec.describe "Mentors", type: :request do
  #To test mentors#index (display all mentors)
  describe "GET /mentors" do
    context 'mentors exist' do
      before do
        (1..2).each do |i|
          Mentor.create!(
            first_name: "Mentor#{i}",
            last_name: "Last#{i}",
            email: "mentor#{i}@email.com",
            max_concurrent_students: 4
          )
        end
      end

      it 'returns a page containing names of all mentors' do
        get '/mentors'
        expect(response.body).to include('Mentor1')
        expect(response.body).to include('Last1')
        expect(response.body).to include('mentor1@email.com')
        expect(response.body).to include('Mentor2')
        expect(response.body).to include('Last2')
        expect(response.body).to include('mentor2@email.com')
      end
    end

    context 'mentors do not exist' do
      it 'returns an empty page' do
        get '/mentors'
        expect(response.body).not_to include('Mentor1')
        expect(response.body).not_to include('Last1')
        expect(response.body).not_to include('mentor1@email.com')
        expect(response.body).not_to include('Mentor2')
        expect(response.body).not_to include('Last2')
        expect(response.body).not_to include('mentor2@email.com')
      end
    end

  end
  #To test mentors#show (display a specific mentor)
  describe "GET /mentors/:id" do
    let!(:mentor) {
      Mentor.create!(
            first_name: "Mentor1",
            last_name: "LastName1",
            email: "mentor1@email.com",
            max_concurrent_students: 4
        )
      }

      it 'returns a successful response' do
        get mentor_path(id: 1)
        expect(response).to have_http_status(:success)
      end
    end

  describe "GET /mentors/:id when mentor does not exist" do
      it 'returns a not found response' do
        get mentor_path(id: 1) # This id doesn't exists
        expect(response).to have_http_status(:not_found)
      end
    end
  
  end
