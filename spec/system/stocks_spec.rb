require 'rails_helper'

RSpec.describe "Stocks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "Stock を投稿できる" do
    visit '/'

    click_on 'Stock!'

    fill_in '名称', with: 'M78星雲'
    fill_in '住所', with: '宇宙の彼方'

    fill_in '訪問日', with: '2020/01/01'
    choose 'あり'

    click_on 'Save' # TODO: I18n

    expect(page).to have_text('Successfly') # TODO: I18n
    expect(page).to have_text('Stock')
    expect(page).to have_text('M78星雲')
  end
end
