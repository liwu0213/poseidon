<template>
  <div id="app">
    <el-container>
      <el-header>
        <el-menu
          :default-active="activeIndex2"
          class="el-menu-demo"
          mode="horizontal"
          background-color="#545c64"
          text-color="#fff"
          active-text-color="#ffd04b" router>
          <!--<el-menu-item v-for="(menu,index) in menus" index=index ">{{menu}}</el-menu-item>-->
          <el-menu-item index="/login" >处理中心</el-menu-item>
          <el-submenu index="2">
            <template slot="title">我的工作台</template>
            <el-menu-item index="2-1">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
            <el-submenu index="2-4">
              <template slot="title">选项4</template>
              <el-menu-item index="2-4-1">选项1</el-menu-item>
              <el-menu-item index="2-4-2">选项2</el-menu-item>
              <el-menu-item index="2-4-3">选项3</el-menu-item>
            </el-submenu>
          </el-submenu>
          <el-menu-item index="3" disabled>消息中心</el-menu-item>
          <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">订单管理</a></el-menu-item>
          <el-menu-item index="5" style="float: right" >消息中心</el-menu-item>
          <el-menu-item index="6" style="float: right" >test</el-menu-item>
        </el-menu>
      </el-header>
      <el-main style="padding: 0px">
        <router-view/>
      </el-main>
    </el-container>
    <el-footer style="margin: 0px;text-align: center;background-color: #8c939d">
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
  },
  test (index) {
    alert(index)
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
    line-height: 61px;
    text-align: center;
    padding: 0px;
  }
  .el-menu-item{
  }
</style>
