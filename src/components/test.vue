<template>
  <div>
    <div  v-for="(item,index) in items">
      {{item}} {{index}}
    </div>
    <el-dropdown >
      <i class="el-icon-setting" style="margin-right: 15px"></i>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item style="font-size: 20px;font-family: kaiti;">查 看</el-dropdown-item>
        <el-dropdown-item style="font-size: 20px;font-family: kaiti">退 出</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
    <span style="font-size: 20px;">王小虎</span>
    <span style="font-size: 20px;">|</span>
    <span style="font-size: 20px;">留言（0）</span>
  </div>

</template>

<script>/* eslint-disable indent */
    export default {
        name: 'test',
      data () {
          return {
            items: ['a', 'b', 'c']
          }
      }
    }
</script>

<style scoped>

</style>
