<template>
  <div >
    <el-container >
    <el-aside  style="background-color: rgb(238, 241, 246);" :width="value">
    <el-menu :default-openeds="[]" :collapse="test" style="background-color: rgb(238, 241, 246)">
      <el-submenu index="1">
        <template slot="title"><i class="el-icon-message"></i> 导航一</template>
        <el-menu-item-group>
          <!--<template slot="title">分组一</template>-->
          <el-menu-item index="1-1" @click="test">好友</el-menu-item>
          <el-menu-item index="1-2">选项2</el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group title="分组2">
          <el-menu-item index="1-3">选项3</el-menu-item>
        </el-menu-item-group>
        <el-submenu index="1-4">
          <template slot="title">选项4</template>
          <el-menu-item index="1-4-1">选项4-1</el-menu-item>
        </el-submenu>
      </el-submenu>
      <el-submenu index="2">
        <template slot="title"><i class="el-icon-menu"></i> 导航二</template>
        <el-menu-item-group>
          <template slot="title">分组一</template>
          <el-menu-item index="2-1">选项1</el-menu-item>
          <el-menu-item index="2-2">选项2</el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group title="分组2">
          <el-menu-item index="2-3">选项3</el-menu-item>
        </el-menu-item-group>
        <el-submenu index="2-4">
          <template slot="title">选项4</template>
          <el-menu-item index="2-4-1">选项4-1</el-menu-item>
        </el-submenu>
      </el-submenu>
      <el-submenu index="3">
        <template slot="title"><i class="el-icon-setting"></i> 导航三</template>
        <el-menu-item-group>
          <template slot="title">分组一</template>
          <el-menu-item index="3-1">选项1</el-menu-item>
          <el-menu-item index="3-2">选项2</el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group title="分组2">
          <el-menu-item index="3-3">选项3</el-menu-item>
        </el-menu-item-group>
        <el-submenu index="3-4">
          <template slot="title">选项4</template>
          <el-menu-item index="3-4-1">选项4-1</el-menu-item>
        </el-submenu>
      </el-submenu>
    </el-menu>
  </el-aside>
      <el-main>
        <user-message v-show="test===1" ref="userMessage"/>
      </el-main>
    </el-container>
    <!--<div style="clear: both"></div>-->
  </div>
</template>

<script>/* eslint-disable indent */
import userMessage from './userMessage'
export default {
  name: 'space',
  components: {
    userMessage
  },
  data () {
    return {
      test: 1,
      open: false,
      value: '300px'
    }
  },
  mounted: function () {
    let w = document.documentElement.offsetWidth || document.body.offsetWidth
    if (w < 1000) {
      this.value = '50px'
      this.open = true
    }
    this.getUserInfo()
  },
  methods: {
  }
}
</script>

<style scoped>

</style>
