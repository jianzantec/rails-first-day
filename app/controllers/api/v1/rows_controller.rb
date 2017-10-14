class Api::V1::RowsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    order = 'id desc'
    page = 1
    unless params[:page].nil?
      page = params[:page]
    end
    @data = Row
    unless params[:grade_id].nil?
      @data = @data.where(" grade_id=#{params[:grade_id]} ")
    end
    @data = @data.order(order).page(page).per(10)
    @total_pages = @data.total_pages
    @current_page = @data.current_page
  end

  def show
    @data = Row.find(params[:id])
    #render_json("y","获取数据成功",@data)
  end

  def create
    data = Row.new params.permit(:name, :grade_id, :description)
    data.save
    render_common_json_render("y", "新增成功", "新增行信息成功")
  end

  def update
    data = Row.find(params[:id])
    attributes = params.permit(:name, :grade_id, :description)
    data.update_attributes attributes
    render_common_json_render("y", "修改成功", "修改行信息成功")
  end

  def destroy
    Row.destroy(params[:id])
    render_common_json_render("y", "删除成功", "删除行信息成功")
  end
end
