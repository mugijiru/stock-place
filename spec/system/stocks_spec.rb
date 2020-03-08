require 'rails_helper'

RSpec.describe 'Stocks', type: :system, js: true do
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
        fill_in 'place_evaluation_visited_on', with: '002020/01/01'
        choose 'また行きたい'

        click_on '保存'

        expect(page).to have_text('Stock')
        expect(page).to have_text('M78星雲')
      end
    end

    context '既存の場所を利用する場合' do
      context '入力が正しければ' do
        it 'Stock を投稿できる' do
          create(:visited_place, name: 'M78星雲')

          visit '/'

          click_on 'Stock!'

          click_on 'M78星雲'

          # NOTE: Chrome が6桁西暦に対応しているので0埋めで調整
          fill_in 'place_evaluation_visited_on', with: '002020/01/01'
          choose 'また行きたい'

          click_on '保存'

          expect(page).to have_text('Stock')
          expect(page).to have_text('M78星雲')
        end
      end

      context '入力が間違えていれば' do
        xit 'Stock の投稿に失敗し投稿フォームが再表示される' do
          visit '/'

          click_on 'Stock!'

          click_on 'M78星雲'
          # NOTE: Chrome が6桁西暦に対応しているので0埋めで調整
          fill_in 'place_evaluation_visited_on', with: '002020/01/01'
          choose 'また行きたい'

          click_on '保存'

          expect(page).to have_text('New stock')
          expect(page).to have_text('名称を入力してください')
          expect(page).to have_field('住所', with: '宇宙の彼方')
        end
      end
    end
  end
end
