class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions

  rescue_from ActiveRecord::RecordNotFound do
    head 404
  end

  rescue_from CanCan::AccessDenied do
    response = {errors: ["You are not authorized to perform this action."]}
    render json: response, status: :unauthorized
  end
end
