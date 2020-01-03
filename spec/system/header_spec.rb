require 'rails_helper'

RSpec.describe 'Header', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'Stock 追加画面に遷移できる' do
    visit '/'
    click_on 'Stock!'
    expect(page).to have_text('New stock')
  end

  it 'Stock 一覧画面に遷移できる' do
    create(:place, name: 'test place')
    visit '/'
    click_on 'Stocks'
    expect(page).to have_text('test place')
  end
end