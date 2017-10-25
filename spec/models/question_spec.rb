require 'rails_helper'
include RandomData

RSpec.describe Question, type: :model do
    let(:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false) }

    it 'should respond to title' do
    	expect(question).to respond_to(:title)
    	expect(question).to respond_to(:body)
    	expect(question).to respond_to(:resolved)
    end
end
