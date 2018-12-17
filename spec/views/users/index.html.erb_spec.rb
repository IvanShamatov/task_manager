# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               new: 'New',
               create: 'Create'
             ),
             User.create!(
               new: 'New',
               create: 'Create'
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'New'.to_s, count: 2
    assert_select 'tr>td', text: 'Create'.to_s, count: 2
  end
end
