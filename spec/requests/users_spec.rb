RSpec.describe 'POST /users', type: :request do
  context '全てのパラメータが揃っている場合' do
    it '200を返す' do
      post '/users', params: { username: 'takahiro', email: 'takahiro@gmail.com', password: 'takahiro', password_confirmation: 'takahiro' }
      expect(response).to have_http_status(200)
    end
  end
end