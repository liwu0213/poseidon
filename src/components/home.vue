<template>
  <div id="home">
    <h1
      style="background-image: url('../../static/test1.png' );height: 500px;padding-top: 300px;color: white; margin: 0px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
      泥猴！<br>这是一个毫无目的的网站<br>第一次建站，也不晓得整个啥子首页好，凑合着看<br>高价收购二手UI</h1>
    <h1
      style="background-image: url('../../static/timg3.jpg' );height: 500px;padding-top: 300px;color: black; margin: 0px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
      网站功能:<br>1.电商项目试验与展示<br>2.盖楼、留言<br>3.博客、文章分享<br>4.资源分享</h1>
    <h1
      style="background-image: url('../../static/timg2.jpg' );height: 500px;padding-top: 300px;color: white; margin: 0px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
      版主信息<br>扣扣：1977339740<br>加好友送个锤子</h1>
    <h1
      style="background-image: url('../../static/test5.jpg' ) ;height: 400px;color: white; margin: 0px;padding-top: 200px;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
      <el-button type="primary" round style="font-size: 25px">网站建议</el-button>
      <br><br>
      <el-button type="primary" round style="font-size: 25px" @click.stop="snake">玩蛇</el-button>
      <br><br>
      <a href="#a" style="color: white">去顶部</a></h1>
    <el-dialog title="贪吃蛇" :visible.sync="dialogTableVisible" center :append-to-body='true' :lock-scroll="false"
               width="30%">
      <my-snake></my-snake>
    </el-dialog>
    <!--<img src="../../static/test1.png"/>-->
  </div>
</template>

<script>/* eslint-disable indent */

import MySnake from './mySnake'

export default {
  components: {MySnake},
  name: 'home',
  data () {
    return {
      dialogTableVisible: false
    }
  },
  methods: {
    snake () {
      if (this.dialogTableVisible === true) {
        this.dialogTableVisible = false
      } else {
        this.dialogTableVisible = true
      }
    }
  }
}
</script>

<style scoped>

</style>
