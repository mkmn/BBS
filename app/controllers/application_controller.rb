class ApplicationController < ActionController::Base
  protect_from_forgery

  class Forbidden < StandardError; end
end
