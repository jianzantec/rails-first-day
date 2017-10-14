json.status "y"
json.msg "获取数据成功"
json.data do
  json.grade @data
  json.cols @data.cols
  json.rows @data.rows
  json.students @data.students
  json.table generate_table(@data)
end
