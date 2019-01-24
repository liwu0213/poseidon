<template >
  <div id="login" style="background-image: url('../../static/background_login.jpg');margin: 0px;padding: 0px;width: 100%; height: 100%;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;}; position: absolute;">
    <el-tabs type="border-card" style="width: 350px;position: relative;margin: auto;top: 30%">
      <el-tab-pane label="账号登录">
          <el-card class="box-card" >
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
                    <canvas id="canvas" width="80" height="30px" @click="drawPic"></canvas>
                  </td>
                </tr>
                <tr>
                  <td colspan="3">
                    <el-button style="width: 80px; margin-top: 15px" type="primary" @click="login(0)">登录</el-button>
                  </td>
                </tr>
              </table>
            </div>
          </el-card>
      </el-tab-pane>
      <el-tab-pane label="邮箱登录"><el-card class="box-card" >
        <div slot="header" class="clearfix">
          <span>邮箱登录</span>
        </div>
        <div>
          <table>
            <tr>
              <td>
                <el-tag>邮箱</el-tag>
              </td>
              <td colspan="2">
                <el-input v-model="user.username" ></el-input>
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
                <el-button style="width: 80px; " type="primary" @click="getValidator(3)">发送验证码</el-button>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <el-button style="width: 80px; margin-top: 15px" type="primary" @click="login(1)">登录</el-button>
              </td>
            </tr>
          </table>
        </div>
      </el-card>
      </el-tab-pane>
      <el-tab-pane label="手机号登录">
        <el-card class="box-card" >
        <div slot="header" class="clearfix">
          <span>手机号登录</span>
        </div>
        <div>
          <table>
            <tr>
              <td>
                <el-tag>手机号</el-tag>
              </td>
              <td colspan="2">
                <el-input v-model="user.username" ></el-input>
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
                <el-button style="width: 80px; " type="primary" @click="getValidator(1)">发送验证码</el-button>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <el-button style="width: 80px; margin-top: 15px" type="primary" @click="login(2)">登录</el-button>
              </td>
            </tr>
          </table>
        </div>
      </el-card>
      </el-tab-pane>
      <el-tab-pane label="扣扣登录"><el-card class="box-card" >
        <div slot="header" class="clearfix">
          <span>扣扣登录</span>
        </div>
        <div>
          qq登录未申请到开发者权限
          敬请期待
        </div>
      </el-card></el-tab-pane>
    </el-tabs>
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
      },
      test: 0
    }
  },
  /* mounted: function () {
    this.drawPic()
  }, */
  methods: {
    login: function (value) {
      switch (value) {
        case 0:
          if (this.user.username === null || this.user.username === '') {
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
              this.test1 = 2
              location.reload()
              this.$router.push('/')
            } else {
              alert(res.data.msg)
            }
            /* var obj = JSON.parse(data1)
            console.log(obj.code) */
          })
              break
        case 1:
          if (this.user.username === null || this.user.username === '') {
            alert('请输入用户名')
            return
          }
          this.postRequestParm('/sign_in', {
            username: this.user.username,
            message: 'message',
            verification: this.user.verification
          }).then(res => {
            if (res.data.code === '200') {
              location.reload()
              this.$router.push('/')
            } else if (res.data.code === '401') {
              alert('该邮箱未绑定账号，请使用账号登录')
            } else {
              alert(res.data.msg)
            }
            /* var obj = JSON.parse(data1)
            console.log(obj.code) */
          })
           break
        default :
          alert('没有经费发短信')
      }
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
    },
    table (a) {
      this.test = a
    },
    getValidator (value) {
      if (value === 1) {
        alert('发短信要钱的，不做这个功能')
        return
      }
      if (value === 2) {
        this.postRequest('/public/verification', {
          phone: this.user.username,
          code: value
        })
      }
      if (value === 3) {
        if (this.user.username === null || this.user.username === '') {
          alert('请输入邮箱')
          return
        }
        var reg = new RegExp('^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$')
        if (!reg.test(this.user.username)) {
          alert('邮箱格式错误！')
          return
        }
        this.postRequest('/public/verification', {
          email: this.user.username,
          code: value
        }).then(res => {
          if (res.data.code != '200') {
            alert(res.data.msg)
          }
        })
      }
    }
  }
}
</script>

<style scoped>
  #login {
    text-align: center;
  }

  #canvas {
    cursor: pointer;
  }
</style>
