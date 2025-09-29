class LessonTopic < ApplicationRecord
  belongs_to :lesson
  belongs_to :topic

  has_many :topics
  has_many :lessons
end
