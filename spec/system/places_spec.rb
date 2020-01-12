require "rails_helper"

RSpec.describe "Places", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe '場所情報の更新' do
    context '入力が正しければ' do
      it '場所情報が更新できる' do
        place = create(:place, name: 'old_name', address: 'old_address')
        visit "/places/#{place.id}"
        click_on('編集')
        fill_in('名称', with: 'new_name')
        fill_in('住所', with: 'new_address')
        click_on('保存')
        expect(page).to have_content('successfully')
        expect(page).not_to have_content('old_name')
        expect(page).not_to have_content('old_address')
        expect(page).to have_content('new_name')
        expect(page).to have_content('new_address')
      end
    end
  end
end
