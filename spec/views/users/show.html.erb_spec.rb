# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            new: 'New',
                            create: 'Create'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/New/)
    expect(rendered).to match(/Create/)
  end
end
