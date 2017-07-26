class ApplicationController < ActionController::Base
  #protect_from_forgery
  include Response
  include ExceptionHandler
end
