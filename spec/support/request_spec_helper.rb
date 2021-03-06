module RequestSpecHelper
  def stub_current_user(user)
    allow_any_instance_of(ApplicationController).to receive(:require_login).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:set_current_user).and_return(user)
  end

  def login(user)
    post sessions_path, params: {
      email: user.email,
      password: user.password
    }
    request.session[:user_id] = user.id
  end

  def current_user
    User.find(request.session[:user_id])
  end
end
