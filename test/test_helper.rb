ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
 fixtures :all
  
  # Возвращает true, если тестовый пользователь вошел.
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, params: {
        session: { 
          email: user.email,
          password: password,
          remember_me: remember_me 
        }
      }
    else
      session[:user_id] = user.id
    end
  end

  private
    # Возвращает true внутри интеграционного теста.
  def integration_test?
    defined?(post_via_redirect)
  end

end
