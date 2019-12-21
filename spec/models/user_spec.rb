require 'rails_helper'

describe User do
  it "名前、メアド、パスワードがあれば有効" do
      @user = User.new(username: "takahiro", email: "takahiro@takahiro.com",
                       password: "password", password_confirmation: "password")
      expect(@user).to be_valid
  end

  it "名前がなければ無効であること" do
    @user = User.new(username: "", email: "takahiro@takahiro.com",
                     password: "password", password_confirmation: "password")
    expect(@user.valid?).to eq(false)
    expect(@user.errors[:username]).to include("を入力してください")
  end

  it "メアドがなければ無効であること" do
    @user = User.new(username: "takahiro", email: "",
                     password: "password", password_confirmation: "password")
    expect(@user.valid?).to eq(false)
    expect(@user.errors[:email]).to include("を入力してください")
  end

  it "メアドが重複している場合は無効であること" do
    User.create(username: "takahiro", email: "takahiro@takahiro.com",
                password: "password", password_confirmation: "password")
    @user = User.new( username: "takahiro1", email: "takahiro@takahiro.com",
                      password: "password1", password_confirmation: "password1")
    @user.valid?
    expect(@user.valid?).to eq(false)
  end
end