<template>
  <div id="app" style="margin-top: 0px;padding-top: 0px">
    <el-row type="flex" class="row-bg" justify="center" style="margin-top: 0px;padding: 0px ;font-family: kaiti;font-size: 15px;background-color: #2c3e50">
      <el-col :span="3"><div v-bind:class="myStyleA" style="line-height: 38px" @mouseenter="goLoginA" @mouseleave="gllA">试 验 田</div></el-col>
      <el-col :span="3"><div v-bind:class="myStyleB" style="line-height: 38px" @mouseenter="goLoginB" @mouseleave="gllB">盖 楼</div></el-col>
      <el-col :span="3"><div v-bind:class="myStyleC" style="line-height: 38px" @mouseenter="goLoginC" @mouseleave="gllC">博 客</div></el-col>
      <el-col :span="3"><div v-bind:class="myStyleD" style="line-height: 38px" @mouseenter="goLoginD" @mouseleave="gllD">资 源 共 享</div></el-col>
      <el-col :span="3"><div v-bind:class="myStyleE" style="line-height: 38px" @mouseenter="goLoginE" @mouseleave="gllE">操 作 台</div></el-col>
      <el-col :span="1"><div v-bind:class="myStyleF" style="line-height: 38px" @mouseenter="goLoginF" @mouseleave="gllF" @click="login">登 陆</div></el-col>
      <el-col :span="1"><div v-bind:class="myStyleG" style="line-height: 38px" @mouseenter="goLoginG" @mouseleave="gllG" @click="signUp">注 册</div></el-col>
      <el-col :span="1"><div v-bind:class="myStyleH" style="line-height: 38px" @mouseenter="goLoginH" @mouseleave="gllH">留言(0)</div></el-col>
    </el-row>
    <router-view/>
  </div>
</template>

<script>/* eslint-disable indent */
export default {
  name: 'App',
  data () {
    return {
      myStyleA: 'grid-content bg-purple',
      myStyleB: 'grid-content bg-purple',
      myStyleC: 'grid-content bg-purple',
      myStyleD: 'grid-content bg-purple',
      myStyleE: 'grid-content bg-purple',
      myStyleF: 'grid-content bg-purple',
      myStyleG: 'grid-content bg-purple',
      myStyleH: 'grid-content bg-purple',
      myStyleI: 'grid-content bg-purple',
      myStyleJ: 'grid-content bg-purple'
    }
  },
  components: {},
  methods: {
    goLoginA () {
      this.myStyleA = 'grid-content bg-purple-light'
    },
    gllA () {
      this.myStyleA = 'grid-content bg-purple'
    },
    goLoginB () {
      this.myStyleB = 'grid-content bg-purple-light'
    },
    gllB () {
      this.myStyleB = 'grid-content bg-purple'
    },
    goLoginC () {
      this.myStyleC = 'grid-content bg-purple-light'
    },
    gllC () {
      this.myStyleC = 'grid-content bg-purple'
    },
    goLoginD () {
      this.myStyleD = 'grid-content bg-purple-light'
    },
    gllD () {
      this.myStyleD = 'grid-content bg-purple'
    },
    goLoginE () {
      this.myStyleE = 'grid-content bg-purple-light'
    },
    gllE () {
      this.myStyleE = 'grid-content bg-purple'
    },
    goLoginF () {
      this.myStyleF = 'grid-content bg-purple-light'
    },
    gllF () {
      this.myStyleF = 'grid-content bg-purple'
    },
    goLoginG () {
      this.myStyleG = 'grid-content bg-purple-light'
    },
    gllG () {
      this.myStyleG = 'grid-content bg-purple'
    },
    goLoginH () {
      this.myStyleH = 'grid-content bg-purple-light'
    },
    gllH () {
      this.myStyleH = 'grid-content bg-purple'
    },
    login(){
      this.$router.push('/login')
    },
    signUp(){
      this.$router.push('/sign_up')
    }
  }
}
</script>

<style>
  .el-row {
    margin-bottom: 20px;
  &:last-child {
     margin-bottom: 0;
   }
  }
  .el-col {
    margin: auto;
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: #99a9bf;
  }
  .bg-purple {
    color: white;
    background: black;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 36px;
  }
  .row-bg {
    background-color: white;
  }
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
</style>
