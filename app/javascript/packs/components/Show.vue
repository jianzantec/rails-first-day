<template>
  <div class="show">
    <el-row>
      <el-col :span="20" :offset="2">
        <el-table :stripe="true" :bordered="true" style="width:100%;" :data="grade.table">
          <el-table-column v-for="item in grade.cols" :key="item.id">
            <template scope="scope">
              <p>{{scope.row.find(k=>k.c==item.id).c_name}}</p>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import { getGrade } from '../services/grade'
export default {
  data() {
    return {
      grade: {},
      // students: []
    }
  },
  methods: {
    getData() {
      getGrade()
        .then(res=>{
          console.log(res.data.data)
          this.grade = res.data.data
        })
    }
  },
  created() {
    this.getData()
  }
}
</script>
