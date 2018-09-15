class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  include ::ActionController::Cookies
  include Response
  include ExceptionHandler
end
