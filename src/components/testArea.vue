<template>
  <div style="background: black;width: 80%;margin: auto">
    <el-card class="box-card" style="float: left">
      <div v-for="o in 4" :key="o" class="text item">
        {{'列表内容 ' + o }}
      </div>
    </el-card>
    <el-carousel :interval="5000" arrow="always" height="500px">
      <el-carousel-item v-for="item in 4" :key="item" >
        <h3 >{{ item }}</h3>
      </el-carousel-item>
    </el-carousel>

  </div>
</template>

<script>/* eslint-disable indent */
export default {
  name: 'testArea',
  data() {
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
  .el-carousel__item h3 {
    color: #475669;
    font-size: 18px;
    opacity: 0.75;
    line-height: 500px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
  .text {
    font-size: 14px;
  }

  .item {
    padding: 18px 0;
  }

  .box-card {
    height: 500px;
    width: 480px;
  }
</style>
