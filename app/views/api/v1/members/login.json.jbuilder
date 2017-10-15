json.status 'y'
json.msg '登陆成功'
json.info do
  json.id @data.id
  json.user_name @data.user_name
  json.name @data.name
  json.mobile @data.mobile
  json.qq @data.qq
  json.description @data.description
  json.grades @data.grades
end
