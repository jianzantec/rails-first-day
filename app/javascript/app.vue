<template>
  <div id="app">
    <p>{{ message }}</p>
    <el-button type="danger">按钮</el-button>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue---!"
    }
  },
  created() {
    console.log(this.$route)
  }
}
</script>

