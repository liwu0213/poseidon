<template>
  <div id="app" style="margin-top: 0px;padding-top: 0px">
      <div>{{userInfo.nickname}}</div>
    <img v-bind:src="userInfo.imgUrl"/>
    <router-view/>
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
      }
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
</style>
