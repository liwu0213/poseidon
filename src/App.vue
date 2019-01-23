<template>
  <div id="app">
    <el-container>
      <el-header>
        <div style="display: inline-block; margin: auto">
          <span>sss</span>
          <span>sss</span>
          <span>sss</span>
          <span>sss</span>
        </div>
        <el-dropdown style="">
          <i class="el-icon-setting" style="margin-right: 15px"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item style="font-size: 20px;font-family: kaiti;">查 看</el-dropdown-item>
            <el-dropdown-item style="font-size: 20px;font-family: kaiti">退 出</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
        <span style="font-size: 20px;">王小虎</span>
        <span style="font-size: 20px;">|</span>
        <span style="font-size: 20px;">留言（0）</span>
      </el-header>
      <el-main style="padding: 0px">
        <router-view/>
      </el-main>
    </el-container>
    <el-footer style="margin: 0px;text-align: center">
    <span style="line-height: 50px">sss</span>
    <span>sss</span>
    <span>sss</span>
    <span>sss</span>
    </el-footer>
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
    margin-top: 0px;
    padding-top: 0px;
    font-family: kaiti
  }
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
    text-align: center;
    font-size: 12px;

  }
</style>
