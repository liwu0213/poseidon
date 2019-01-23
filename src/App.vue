<template>
  <div id="app" style="margin-top: 0px;padding-top: 0px">
    <el-container>
      <el-header style="text-align: right; font-size: 12px">
        <el-dropdown>
          <div style="margin: auto;background-color: black ;width: 100px;display: inline-block" >ssss</div>
          <i class="el-icon-setting" style="margin-right: 15px;"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>查看</el-dropdown-item>
            <el-dropdown-item>新增</el-dropdown-item>
            <el-dropdown-item>删除</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
        <span>王小虎</span>
      </el-header>
      <el-main style="padding: 0px">
        <router-view/>
      </el-main>
    </el-container>
  </div>
</template>

<script>/* eslint-disable indent */
export default {
  name: 'App',
  data: function () {
    return {
      userInfo: {
        id: null,
        nickname: null,
        gender: null,
        email: null,
        imgUrl: null
      },
      menus: ['试验田', '博客', '资源共享', '盖楼', '关于本站'],
      mini: ['登录', '注册', '消息']
    }
  },
  components: {},
  mounted: function () {
    this.getUserInfo()
  },
  methods: {
    getUserInfo () {
      var _this = this
      this.getRequest('/poseidon/user/my_info').then(res => {
        if (res.data.code === '200') {
          _this.userInfo = res.data.data
          console.log(_this.userInfo)
        } else {
        }
        /* var obj = JSON.parse(data1)
        console.log(obj.code) */
      })
    }
  }
}
</script>

<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
</style>
