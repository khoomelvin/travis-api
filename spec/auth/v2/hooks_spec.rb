describe 'Auth hooks', auth_helpers: true, site: :org, api_version: :v2, set_app: true do
  let(:user) { FactoryBot.create(:user) }
  let(:repo) { Repository.by_slug('svenfuchs/minimal').first }

  # before { p Permission.all }
  # before { Permission.create(user: user, repository: repo, admin: true) }

  # TODO put /hooks/:id

  describe 'in public', mode: :public do
    describe 'GET /hooks' do
      it(:with_permission)    { should auth status: 200, empty: false }
      it(:without_permission) { should auth status: 200, empty: true }
      it(:invalid_token)      { should auth status: 403 }
      it(:unauthenticated)    { should auth status: 401 }
    end
  end
end