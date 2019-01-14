<template>
  <div id="login">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>登录</span>
      </div>
      <div>
        <table>
          <tr>
            <td>
              <el-tag>用户名</el-tag>
            </td>
            <td>
              <el-input v-model="user.username"></el-input>
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>密码</el-tag>
            </td>
            <td>
              <el-input type="password" v-model="user.password" placeholder="请输入密码"></el-input>
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>验证码</el-tag>
            </td>
            <td>
              <el-input v-model="user.verification"></el-input>
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>刷新</el-tag>
            </td>
            <td><img src="http://119.23.75.58/resources/admin.jpg" width="80px" height="20px"/></td>
          </tr>
          <tr>
            <td colspan="2">
              <el-button style="width: 80px; margin-top: 15px" type="primary" >注册</el-button>
              <el-button style="width: 80px; margin-top: 15px" type="primary" @click="login">登录</el-button>
            </td>
          </tr>
        </table>
      </div>
    </el-card>
  </div>
</template>

<script>/* eslint-disable indent */
export default {
  name: 'login',
  data () {
    return {
      user: {
        username: 'admin',
        password: 'muggle',
        verification: '1234'
      }
    }
  },
  methods: {
    login: function () {
      alert('ssss')
      this.postRequest('/public/verification', {
        username: this.user.username,
        code: 1
      }).then(res => {
        var volidataCode = res.data.data
        console.log(res.data.data)
        alert(volidataCode)
        /* var obj = JSON.parse(data1)
        console.log(obj.code) */
      })
    }
  }
}
</script>

<style scoped>
  #login {
    margin: auto;
    margin-top: 100px;
    text-align: center;
    width: 300px;
  }
</style>
