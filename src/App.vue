<template>
  <div id="app">
    <el-container>
      <el-header style="padding: 0px;">
        <el-menu
          class="el-menu-demo"
          mode="horizontal"
          background-color="#545c64"
          text-color="#fff"
          active-text-color="#ffd04b" router>
          <!--<el-menu-item v-for="(menu,index) in menus" index=index ">{{menu}}</el-menu-item>-->
          <el-menu-item index="/">首页</el-menu-item>
          <el-submenu index="2">
            <template slot="title">试验田</template>
            <el-menu-item index="/goods">商品展示</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
          </el-submenu>
          <el-menu-item index="3">盖楼</el-menu-item>
          <el-menu-item index="3">资源共享</el-menu-item>
          <el-menu-item index="/space">空间</el-menu-item>
          <el-menu-item index="/login" v-if="userInfo.nickname==null" style="float: right;">登录</el-menu-item>
          <el-menu-item index="/index" v-else style="float: right"><i class="el-icon-bell" ></i></el-menu-item>
          <el-submenu index="3" style="float: right" v-if="userInfo.nickname!=null">
            <template slot="title">{{userInfo.nickname}}</template>
            <el-menu-item index="/goods">编辑资料</el-menu-item>
            <el-menu-item index="/logout" >登出</el-menu-item>
          </el-submenu>
          <el-menu-item index="/sign_up" v-else style="float: right">注册</el-menu-item>
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
      messgae: 1
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
    line-height: 61px;
    text-align: center;
  }
  .item {
    margin-top: 10px;
    margin-right: 40px;
  }
  .el-menu-item {
  }
</style>
