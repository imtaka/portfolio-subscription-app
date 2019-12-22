require "rails_helper"

RSpec.feature "ユーザー作成" do

  scenario "ユーザーが新規登録する" do
    visit "/"
    click_link "新規登録"

    fill_in "ユーザーネーム", with: "takahiro"
    fill_in "メールアドレス", with: "takahiro@gmail.com"
    fill_in "パスワード", with: "password12345"
    fill_in "確認用パスワード", with: "password12345"
    click_button "新規登録"

    expect(page).to have_content("本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。")
    expect(page.current_path).to eq(root_path) 
  end
end