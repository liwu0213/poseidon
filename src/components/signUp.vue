<template>
  <div style="background-image: url('../../static/a1.jpg');margin: 0px;padding: 0px;width: 100%; height: 100%;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;}; position: absolute;">
    <div style="background-color: white;width: 500px;padding: 10px">
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item label="活动名称" prop="name">
        <el-input v-model="ruleForm.name"></el-input>
      </el-form-item>
      <el-form-item label="活动区域" prop="region">
        <el-select v-model="ruleForm.region" placeholder="请选择活动区域">
          <el-option label="区域一" value="shanghai"></el-option>
          <el-option label="区域二" value="beijing"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="活动时间" required>
        <el-col :span="11">
          <el-form-item prop="date1">
            <el-date-picker type="date" placeholder="选择日期" v-model="ruleForm.date1" style="width: 100%;"></el-date-picker>
          </el-form-item>
        </el-col>
        <el-col class="line" :span="2">-</el-col>
        <el-col :span="11">
          <el-form-item prop="date2">
            <el-time-picker type="fixed-time" placeholder="选择时间" v-model="ruleForm.date2" style="width: 100%;"></el-time-picker>
          </el-form-item>
        </el-col>
      </el-form-item>
      <el-form-item label="即时配送" prop="delivery">
        <el-switch v-model="ruleForm.delivery"></el-switch>
      </el-form-item>
      <el-form-item label="活动性质" prop="type">
        <el-checkbox-group v-model="ruleForm.type">
          <el-checkbox label="美食/餐厅线上活动" name="type"></el-checkbox>
          <el-checkbox label="地推活动" name="type"></el-checkbox>
          <el-checkbox label="线下主题活动" name="type"></el-checkbox>
          <el-checkbox label="单纯品牌曝光" name="type"></el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item label="特殊资源" prop="resource">
        <el-radio-group v-model="ruleForm.resource">
          <el-radio label="线上品牌商赞助"></el-radio>
          <el-radio label="线下场地免费"></el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="活动形式" prop="desc">
        <el-input type="textarea" v-model="ruleForm.desc"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item>
    </el-form>
    </div>
  </div>
</template>

<script>/* eslint-disable indent */
export default {
  name: 'signUp',
  data () {
    return {
      user: {
        username: null,
        email: null,
        verification: null,
        nickname: null,
        password: null,
        gender: null
      },
      test: 0,
      ruleForm: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      },
      rules: {
        name: [
          { required: true, message: '请输入活动名称', trigger: 'blur' },
          { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        region: [
          { required: true, message: '请选择活动区域', trigger: 'change' }
        ],
        date1: [
          { type: 'date', required: true, message: '请选择日期', trigger: 'change' }
        ],
        date2: [
          { type: 'date', required: true, message: '请选择时间', trigger: 'change' }
        ],
        type: [
          { type: 'array', required: true, message: '请至少选择一个活动性质', trigger: 'change' }
        ],
        resource: [
          { required: true, message: '请选择活动资源', trigger: 'change' }
        ],
        desc: [
          { required: true, message: '请填写活动形式', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
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
    sign () {
      if (this.user.username === null || this.user.password === null || this.user.nickname === null) {
        alert('请填写必填字段')
        return
      }
      var reg = new RegExp('^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$')
      if (this.user.email != '' && this.user.email != null && !reg.test(this.user.email)) {
        alert('邮箱格式错误！')
        return
      }
      this.postRequest('/sign_up?verification=' + this.user.verification, {
        username: this.user.username,
        email: this.user.email,
        nickname: this.user.nickname,
        password: this.user.password,
        gender: this.user.gender
      }).then(res => {
        if (res.data.code === '200') {
          this.test = 1
        } else {
          alert(res.data.msg)
        }
        /* var obj = JSON.parse(data1)
        console.log(obj.code) */
      })
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert('submit!');
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
}
</script>

<style scoped>
  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }

  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 480px;
  }
</style>
