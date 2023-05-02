require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Harry', photo: 'Camaro.png', bio: 'A stich in time saves nine', post_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be numeric' do
    subject.post_counter = ''
    expect(subject).to_not be_valid
  end

  it 'post_counter should be greater than or equal to zero' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  it 'most_recent_posts returns last three posts' do
    expect(subject.most_recent_posts.length).to_eq 3
  end
end
