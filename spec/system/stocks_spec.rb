require 'rails_helper'

RSpec.describe 'Stocks', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe '新しいストック' do
    context '入力が正しければ' do
      it 'Stock を投稿できる' do
        visit '/'

        click_on 'Stock!'

        fill_in '名称', with: 'M78星雲'
        fill_in '住所', with: '宇宙の彼方'

        fill_in '訪問日', with: '2020/01/01'
        choose 'また行きたい'

        click_on '保存'

        expect(page).to have_text('successfully') # TODO: I18n
        expect(page).to have_text('Stock')
        expect(page).to have_text('M78星雲')
      end
    end

    context '入力が間違えていれば' do
      it 'Stock の投稿に失敗し投稿フォームが再表示される' do
        visit '/'

        click_on 'Stock!'

        fill_in '名称', with: ''
        fill_in '住所', with: '宇宙の彼方'

        fill_in '訪問日', with: '2020/01/01'
        choose 'また行きたい'

        click_on '保存'

        expect(page).not_to have_text('successfully') # TODO: I18n
        expect(page).to have_text('New stock')
        expect(page).to have_text('名称を入力してください')
        expect(page).to have_field('住所', with: '宇宙の彼方')
      end
    end
  end
end
