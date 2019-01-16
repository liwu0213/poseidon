<template>
<div id="home">
  <button @click="login">去登录</button>
  <h1>没错，这是一个首页</h1>
</div>
</template>

<script>/* eslint-disable indent */
  export default {
    name: 'home',
    data () {
      return {
        test: 'nihao'
      }
    },
    methods: {
      login: function () {
        this.$router.push('/login')
      }
    }
  }
</script>

<style scoped>

</style>
