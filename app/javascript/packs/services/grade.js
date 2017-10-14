import { get, post } from '../utils/request'

// 根据id获取班级信息
export function getGrade(id=13) {
  return get(`/api/v1/grades/${id}.json`)
}
