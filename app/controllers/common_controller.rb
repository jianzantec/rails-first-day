class CommonController < ApplicationController
  # 上传图片
  def upload
    tmp = params[:file]
    t = Time.now.to_i
    str_tem_file_name = t+rand(100)
    str_file_type = tmp.original_filename.split('.').last
    str_file_name = str_tem_file_name.to_s+'.'+str_file_type

    file_path = File.join("public/uploads", Time.now.strftime("%Y%m%d")) # 以当前时间命名文件夹
    # 如果文件夹不存在那么创建
    unless Dir.exist?('public/uploads')
      Dir.mkdir 'public/uploads'
    end
    unless Dir.exist?(file_path)
      Dir.mkdir file_path
    end
    file = File.join(file_path, str_file_name)
    FileUtils.cp tmp.path, file

    # file_path = "#{file_path}/#{str_file_name}"

    render_common_json_render('y','上传图片成功',file.gsub('public',''))

  end
end
