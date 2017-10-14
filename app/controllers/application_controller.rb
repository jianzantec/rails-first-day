class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  ####render通用json
  def render_common_json_render(status, msg, info)
    render json: {status: status, msg: msg, info: info}
  end

  def render_json(status, msg, data)
    render json: {status: status, msg: msg, data: data}
  end

end
