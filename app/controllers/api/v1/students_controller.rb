class Api::V1::StudentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    order = 'id desc'
    page = 1
    unless params[:page].nil?
      page = params[:page]
    end
    @data = Student
    unless params[:grade_id].nil?
      @data = @data.where(" grade_id=#{params[:grade_id]} ")
    end
    unless params[:col_id].nil?
      @data = @data.where(" grade_id=#{params[:col_id]} ")
    end
    unless params[:row_id].nil?
      @data = @data.where(" grade_id=#{params[:row_id]} ")
    end
    @data = @data.order(order).page(page).per(10)
    @total_pages = @data.total_pages
    @current_page = @data.current_page
  end

  def show
    @data = Student.find(params[:id])
    #render_json("y","获取数据成功",@data)
  end

  def create
    data = Student.new params.permit(:name, :grade_id, :row_id, :col_id, :gender, :mobile, :qq, :description,:avatars)
    data.save
    render_common_json_render("y", "新增成功", data)
  end

  def update
    data = Student.find(params[:id])
    attributes = params.permit(:name, :grade_id, :row_id, :col_id, :gender, :mobile, :qq, :description,:avatars)
    data.update_attributes attributes
    render_common_json_render("y", "修改成功", "修改学生信息成功")
  end

  def destroy
    Student.destroy(params[:id])
    render_common_json_render("y", "删除成功", "删除学生信息成功")
  end
end
