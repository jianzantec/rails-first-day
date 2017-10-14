json.status "y"
json.msg "获取数据成功"
json.data do
  json.row @data
  json.grade @data.grade
end
