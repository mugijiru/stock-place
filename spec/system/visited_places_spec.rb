require "rails_helper"

RSpec.describe "VisitedPlaces", type: :system do
  before do
    driven_by(:rack_test)
    signin_as_user
  end

  describe '場所情報の更新' do
    context '入力が正しければ' do
      it '場所情報が更新できる' do
        place = create(:visited_place, name: 'old_name', address: 'old_address')
        visit "/visited_places/#{place.id}"
        click_on('編集')
        fill_in('名称', with: 'new_name')
        fill_in('住所', with: 'new_address')
        click_on('保存')
        expect(page).to have_content('更新しました')
        expect(page).not_to have_content('old_name')
        expect(page).not_to have_content('old_address')
        expect(page).to have_content('new_name')
        expect(page).to have_content('new_address')
      end
    end
  end
end
