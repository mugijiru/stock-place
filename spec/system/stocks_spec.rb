require 'rails_helper'

RSpec.describe 'Stocks', type: :system, js: true do
  describe '新しいストック' do
    context '入力が正しければ' do
      it 'Stock を投稿できる' do
        create(:place, name: 'M78星雲')

        visit '/'

        click_on 'Stock!'

        click_on 'M78星雲'

        # NOTE: Chrome が6桁西暦に対応しているので0埋めで調整
        fill_in 'place_evaluation_visited_on', with: '002020/01/01'
        choose 'また行きたい'

        click_on 'OK'

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
