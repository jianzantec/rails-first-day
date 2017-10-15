class Api::V1::MembersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    order = 'id desc'
    page = 1
    unless params[:page].nil?
      page = params[:page]
    end
    @data = Member
    @data = @data.order(order).page(page).per(10)
    @total_pages = @data.total_pages
    @current_page = @data.current_page
  end

  def show
    @data = Member.find(params[:id])
    # render_json("y","获取数据成功",@data)
  end

  def create
    unless Member.find_by_user_name(params[:user_name]).blank?
      render_common_json_render("n", "注册失败,用户名已存在", '注册失败,用户名已存在')
      return
    end
    @data = Member.new params.permit(:user_name, :pwd, :name, :mobile, :qq, :description)
    if @data.save
      render 'login'
      # render_common_json_render("y", "注册成功", data)
    else
      render_common_json_render("n", "注册失败", '')
    end
  end

  def update
    data = Member.find(params[:id])
    attributes = params.permit(:name, :qq, :mobile , :description)
    data.update_attributes attributes
    render_common_json_render("y", "修改成功", "修改行信息成功")
  end

  def destroy
    Member.destroy(params[:id])
    render_common_json_render("y", "删除成功", "删除行信息成功")
  end

  def login
    user_name = params[:user_name]
    pwd = params[:pwd]
    m = Member.where('user_name=?', user_name).first
    if m.nil?
      render_common_json_render('n','用户信息不存在','用户不存在')
    else
      if m.is_encryption == 1
        pwd = Digest::MD5.hexdigest(pwd)
        if pwd == m.pwd
          # render_common_json_render('y','登陆成功',m)
          @data = m
        else
          render_common_json_render('n','密码错误','登陆密码输入错误')
        end
      end
    end
  end
end
