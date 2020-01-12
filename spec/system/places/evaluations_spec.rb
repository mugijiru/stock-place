require "rails_helper"

RSpec.describe "Places::Evaluations", type: :system do
  describe '評価の登録' do
    context '入力が正しければ' do
      it '評価を登録できる' do
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

  describe '評価の修正' do
    context '入力が正しければ' do
      it '評価を修正できる' do
        place = create(:place, name: 'test_place')
        evaluation = create(:place_evaluation, place: place, visited_on: Date.yesterday, point: :no_good)
        visit "/places/#{place.id}"

        within('.p-place-show__evaluation:first-of-type') do
          click_on('修正する')
        end

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

  describe '評価の削除' do
    context '入力が正しければ' do
      it '評価を削除できる', js: true do
        place = create(:place, name: 'test_place')
        evaluation = create(:place_evaluation, place: place, visited_on: '2020/01/01', point: :good)
        visit "/places/#{place.id}"

        within('.p-place-show__evaluation:first-of-type') do
          accept_confirm('本当に削除しますか?') do
            click_on('削除する')
          end
        end

        expect(page).to have_content('訪問記録を削除しました')
        expect(page).to have_content('test_place')
        expect(page).not_to have_content('また行きたい')
        expect(page).not_to have_content('2020/01/01')
      end
    end
  end
end
