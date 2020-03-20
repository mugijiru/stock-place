module SigninHelper
  def signin_as_user
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).
      and_return(userinfo: { provider: 'auth0', info: { email: 'foo@example.com' }})
  end
end
