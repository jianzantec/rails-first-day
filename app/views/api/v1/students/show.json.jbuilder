json.status "y"
json.msg "获取数据成功"
json.data do
  json.student @data
  json.grade @data.grade
  json.row @data.row
  json.col @data.col
end
