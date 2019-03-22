ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
 fixtures :all
  # Возвращает true, если тестовый пользователь вошел.
  def is_logged_in?
    !session[:user_id].nil?
  end
end
