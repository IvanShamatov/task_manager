# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            new: 'MyString',
                            create: 'MyString'
                          ))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'user[new]'

      assert_select 'input[name=?]', 'user[create]'
    end
  end
end
