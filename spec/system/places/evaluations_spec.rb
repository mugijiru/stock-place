require "rails_helper"

RSpec.describe "Places::Evaluations", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe '評価の登録' do
    context '入力が正しければ' do
      it '評価が登録できる' do
        place = create(:place, name: 'test_place')
        visit "/places/#{place.id}"
        click_on('訪問記録を追加')
        fill_in '訪問日', with: '2020/01/01'
        choose 'また行きたい'
        click_on('Save')
        expect(page).to have_content('successfully')
        expect(page).to have_content('test_place')
        expect(page).to have_content('また行きたい')
        expect(page).to have_content('2020/01/01')
      end
    end
  end
end
