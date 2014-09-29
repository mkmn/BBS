class ApplicationController < ActionController::Base
  protect_from_forgery

  class Forbidden < StandardError; end
  class NotFound  < StandardError; end

  if Rails.env.production?
    rescue_from Exception,                      with: :rescue_500
    rescue_from ActionController::RoutingError, with: :rescue_404
    rescue_from ActiveRecord::RecordNotFound,   with: :rescue_404
  end

  rescue_from Forbidden,  with: :rescue_403
  rescue_from NotFound,   with: :rescue_404

  def rescue_403
    render "errors/forbidden", layout: "error", status: 403
  end

  def rescue_404
    render "errors/not_found", layout: "error", status: 404
  end

  def rescue_500
    render "errors/internal_server_error", layout: "error", status: 500
  end
end
