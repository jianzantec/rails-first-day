module Api::V1::GradesHelper
  # 生成座次信息
  def generate_table(grade)
    result = []
    grade.rows.each do |r|
      row = {}
      row[:id] = r.id
      row[:info] = []
      grade.cols.each do |c|
        tem = {}
        tem[:r] = r.id
        tem[:r_name] = r.name
        tem[:c] = c.id
        tem[:c_name] = c.name
        tem[:people] = []
        # p grade.students
        people = grade.students.select { |s| s.row_id==tem[:r] && s.col_id==tem[:c] }
        p people
        if people.length>0
          tem[:people] = people
        end
        row[:info]<<tem
      end
      result<<row
    end
    result
  end
end
