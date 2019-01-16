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
            <td colspan="2">
              <el-input v-model="user.username" @blur="drawPic"></el-input>
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>密码</el-tag>
            </td>
            <td colspan="2">
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
            <td>
              <canvas id="canvas" width="80" height="30px" @click="drawPic" @onload="drawPic"></canvas>
            </td>
          </tr>
          <tr>
            <td colspan="3">
              <el-button style="width: 80px; margin-top: 15px" type="primary">注册</el-button>
              <el-button style="width: 80px; margin-top: 15px" type="primary" @click="login">登录</el-button>
            </td>
          </tr>
        </table>
      </div>
    </el-card>
    <div style="margin-top: 20px">
      <a href="http://www.baidu.com" style="color: coral;text-decoration : none;font-family: KaiTi;font-size: 20px">手机号登录
        &nbsp;</a>
      <a href="http://www.baidu.com" style="color: coral;text-decoration : none;font-family: KaiTi;font-size: 20px">&nbsp;邮箱登录</a>
    </div>
  </div>
</template>

<script>/* eslint-disable indent */
export default {
  name: 'login',
  data () {
    return {
      user: {
        username: null,
        password: null,
        verification: null
      }
    }
  },
  /* mounted: function () {
    this.drawPic()
  }, */
  methods: {
    login: function () {
      if (this.user.username === null) {
        alert('请输入用户名')
        return
      } else if (this.user.password === null) {
        alert('请输入密码')
        return
      } else if (this.user.verification === null) {
        alert('请输入验证码')
        return
      }
      this.postRequestParm('/sign_in', {
        username: this.user.username,
        password: this.user.password,
        verification: this.user.verification
      }).then(res => {
        if (res.data.code === '200') {
          this.$router.push('/home')
        } else {
          alert(res.data.msg)
        }
        /* var obj = JSON.parse(data1)
        console.log(obj.code) */
      })
    },
    randomNum: function (min, max) {
      return Math.floor(Math.random() * (max - min) + min)
    },
    // 生成随机颜色RGB分量
    randomColor: function (min, max) {
      var _r = this.randomNum(min, max)
      var _g = this.randomNum(min, max)
      var _b = this.randomNum(min, max)
      return 'rgb(' + _r + ',' + _g + ',' + _b + ')'
    },
    drawPic: function () {
      if (this.user.username === null || this.user.username === '') {
        alert('请输入用户名')
        return
      }
      // 获取到元素canvas
      var $canvas = document.getElementById('canvas')
      // var _picTxt = document.getElementById('canvas').innerHTML// 随机数
      var value = null
      this.postRequest('/public/verification', {
        username: this.user.username,
        code: 1
      }).then(res => {
        value = res.data.data
        var _num = 4// 4个随机数字
        var _width = $canvas.width
        var _height = $canvas.height
        var ctx = $canvas.getContext('2d')// 获取 context 对象
        ctx.textBaseline = 'bottom'// 文字上下对齐方式--底部对齐
        ctx.fillStyle = this.randomColor(180, 240)// 填充画布颜色
        ctx.fillRect(0, 0, _width, _height)// 填充矩形--画画
        for (var i = 0; i < _num; i++) {
          var number = value.charAt(i)
          var x = (_width - 10) / _num * i + 10
          var y = _height - 6
          var deg = this.randomNum(-30, 30)
          ctx.fillStyle = this.randomColor(10, 100)// 填充随机颜色
          ctx.font = this.randomNum(20, 30) + 'px SimHei'// 设置随机数大小，字体为SimHei
          ctx.translate(x, y)// 将当前xy坐标作为原始坐标
          ctx.rotate(deg * Math.PI / 180)// 旋转随机角度
          ctx.fillText(number, 0, 0)// 绘制填色的文本
          ctx.rotate(-deg * Math.PI / 180)
          ctx.translate(-x, -y)
        }
        for (var i = 0; i < _num; i++) {
          // 定义笔触颜色
          ctx.strokeStyle = this.randomColor(90, 180)
          ctx.beginPath()
          // 随机划线--4条路径
          ctx.moveTo(this.randomNum(0, _width), this.randomNum(0, _height))
          ctx.lineTo(this.randomNum(0, _width), this.randomNum(0, _height))
          ctx.stroke()
        }
        for (var i = 0; i < _num * 10; i++) {
          ctx.fillStyle = this.randomColor(0, 255)
          ctx.beginPath()
          // 随机画原，填充颜色
          ctx.arc(this.randomNum(0, _width), this.randomNum(0, _height), 1, 0, 2 * Math.PI)
          ctx.fill()
        }
        return value// 返回随机数字符串
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

  #canvas {
    cursor: pointer;
  }
</style>
