class Api::V1::ColsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    order = 'id desc'
    page = 1
    unless params[:page].nil?
      page = params[:page]
    end
    @data = Col
    unless params[:grade_id].nil?
      @data = @data.where(" grade_id=#{params[:grade_id]} ")
    end
    @data = @data.order(order).page(page).per(10)
    @total_pages = @data.total_pages
    @current_page = @data.current_page
  end

  def show
    @data = Col.find(params[:id])
    #render_json("y","获取数据成功",@data)
  end

  def create
    data = Col.new params.permit(:name, :grade_id, :description)
    data.save
    render_common_json_render("y", "新增成功", "新增列信息成功")
  end

  def update
    data = Col.find(params[:id])
    attributes = params.permit(:name, :grade_id, :description)
    data.update_attributes attributes
    render_common_json_render("y", "修改成功", "修改列信息成功")
  end

  def destroy
    Col.destroy(params[:id])
    render_common_json_render("y", "删除成功", "删除列信息成功")
  end

end
