# require 'rails_helper'

# RSpec.describe 'ログイン', type: :system do

#   # before do
#   #   @user = FactoryBot.create(:user)
#   # end
 
#   context 'ログインができるとき' do
#     it '保存されているユーザーの情報と合致すればログインができる' do
#       # トップページに移動する
#       visit root_path
#       # トップページにログインページへ遷移するボタンがあることを確認する
#       # binding.pry
#       expect(page).to have_content('ログイン')
#       # トップページに新規登録ページへ遷移するボタンがあることを確認する
#       expect(page).to have_content('新規登録')
#       # ログインページへ遷移する
#       visit new_user_session_path
#       # 正しいユーザー情報を入力する
#       fill_in 'Email', with: @user.email
#       fill_in 'Password', with: @user.password
#       # ログインボタンを押す
#       click_on('ログイン')
#       # トップページへ遷移することを確認する
#       expect(current_path).to eq(root_path)
#       # カーソルを合わせるとログアウトボタンが表示されることを確認する
#       expect(
#         find('.user_nav').find('span').hover
#       ).to have_content('ログアウト')
#       # サインアップページへ遷移するボタンやログインページで遷移するボタンが表示されていないことを確認する
#       expect(page).to have_no_content('新規登録')
#       expect(page).to have_no_content('ログイン')
#     end
#   end
 
#   context 'ログインができないとき' do
#     it '保存されているユーザーの情報と合致しないとログインができない' do
#       # トップページに移動する
#       # トップページにログインページ遷移するボタンがあることを確認する
#       # ログインページへ遷移する
#       # ユーザー情報を入力する
#       # ログインボタンを押す
#       # ログインページへ戻されることを確認する
#     end
#   end
# end