require "rails_helper"

RSpec.describe 'Home', type: :system do
  it '「また行きたい」「たまになら」という評価の場所一覧が表示される' do
    visited_place = create(:visited_place, name: 'サイコーな場所')
    create(:visited_place_report, visited_place: visited_place, evaluation: :good)
    visited_place2 = create(:visited_place, name: 'まあまあな場所')
    create(:visited_place_report, visited_place: visited_place2, evaluation: :not_bad)

    visit '/'

    aggregate_failures do
      within('.p-home-section--2-columns .p-section-card:first-child') do
        expect(page).to have_text('サイコーな場所')
        expect(page).not_to have_text('まあまあな場所')
      end

      within('.p-home-section--2-columns .p-section-card:last-child') do
        expect(page).not_to have_text('サイコーな場所')
        expect(page).to have_text('まあまあな場所')
      end
    end
  end
end
