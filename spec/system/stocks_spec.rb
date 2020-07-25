require 'rails_helper'

RSpec.describe 'Stocks', type: :system, js: true do
  before { log_in }

  describe '新しいストック' do
    context '新しい場所を利用する場合' do
      it '追加した場所を利用して Stock を投稿できる' do
        visit '/'

        click_on 'Stock!'

        click_on '新規登録'

        fill_in '名称', with: 'M78星雲'
        fill_in '住所', with: '宇宙の彼方'
        click_on '保存'

        click_on 'M78星雲'

        # NOTE: Chrome が6桁西暦に対応しているので0埋めで調整
        fill_in 'report_visited_on', with: '002020/01/01'
        choose 'また行きたい'

        click_on '保存'

        expect(page).to have_text('Stock')
        expect(page).to have_text('M78星雲')
      end
    end

    context '既存の場所を利用する場合' do
      it '検索で既存の場所を絞り込むことができる' do
        create(:visited_place, name: '火星')
        create(:visited_place, name: '天王星')

        visit '/'

        click_on 'Stock!'
        fill_in 'search-places-input', with: '王'
        find('#search-places-input').send_keys(:enter)

        expect(page).to have_text('天王星')
        expect(page).not_to have_text('火星')
      end

      context '入力が正しければ' do
        it 'Stock を投稿できる' do
          create(:visited_place, name: 'M78星雲')

          visit '/'

          click_on 'Stock!'

          click_on 'M78星雲'

          # NOTE: Chrome が6桁西暦に対応しているので0埋めで調整
          fill_in 'report_visited_on', with: '002020/01/01'
          choose 'また行きたい'

          click_on '保存'

          expect(page).to have_text('Stock')
          expect(page).to have_text('M78星雲')
        end
      end
    end
  end
end
