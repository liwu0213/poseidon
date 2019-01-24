<template>
  <div>
    <img src="../../static/p_big3.jpg" width="100%" height="100%"/>
  </div>
</template>

<script>/* eslint-disable indent */

export default {
  name: 'logout',
  mounted: function () {
    this.logout()
  },
  methods: {
    logout () {
      this.getRequest('/logout').then(res => {
        if (res.data.code === '200') {
          alert('登出成功')
        } else {
          alert(res.data.msg + ',请刷新试试')
        }
      })
    }
  }
}
</script>

<style scoped>

</style>
