json.status "y"
json.msg "获取数据成功"
json.data do
  json.list @data
  json.total_pages @total_pages
  json.current_page @current_page
end
