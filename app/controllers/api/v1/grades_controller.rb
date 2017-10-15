class Api::V1::GradesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    order = 'id desc'
    page = 1
    unless params[:page].nil?
      page = params[:page]
    end
    @data = Grade.order(order).page(page).per(10)
    @total_pages = @data.total_pages
    @current_page = @data.current_page
  end

  def show
    @data = Grade.find(params[:id])
    #render_json("y","获取数据成功",@data)
  end

  def create
    # p params[:rows]
    # p params[:cols]
    data = Grade.new params.permit(:name, :teacher, :master, :description, :member_id)
    data.save
    # 创建列
    unless params[:cols].blank?
      (1..params[:cols].to_i).to_a.each do |c|
        data.cols.create({name: "第#{c}列", description: ''})
      end
    end
    unless params[:rows].blank?
      (1..params[:rows].to_i).to_a.each do |r|
        data.rows.create({name: "第#{r}行", description: ''})
      end
    end
    render_common_json_render("y", "新增成功", data.id)
  end

  def update
    data = Grade.find(params[:id])
    attributes = params.permit(:name, :teacher, :master, :description)
    data.update_attributes attributes
    render_common_json_render("y", "修改成功", "修改班级信息成功")
  end

  def destroy
    Grade.destroy(params[:id])
    render_common_json_render("y", "删除成功", "删除班级信息成功")
  end

end
