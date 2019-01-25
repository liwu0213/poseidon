<template>
  <div style="background-image: url('../../static/a1.jpg');margin: 0px;padding: 0px;width: 100%; height: 100%;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;}; position: absolute;">
    <div style="background-color: #bbbbbb;width: 350px;padding: 15px ;margin:200px auto 0px">
      <div style="border-bottom: 2px solid #3aa4e6;margin: 15px 0px;padding-bottom: 10px ">注册</div>
      <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm" >
        <el-form-item label="用户名" prop="username" hide-required-asterisk=true>
          <el-input v-model="ruleForm2.username" placeholder="输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="昵称" prop="nickname" hide-required-asterisk=true>
          <el-input v-model="ruleForm2.nickname" placeholder="输入昵称"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="pass">
          <el-input type="password" v-model="ruleForm2.pass" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="checkPass" hide-required-asterisk=true>
          <el-input type="password" v-model="ruleForm2.checkPass" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="生日">
          <el-col :span="11">
            <el-date-picker type="date" placeholder="选择日期" v-model="ruleForm2.birthday"
                            style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item prop="email" label="邮箱"
                      :rules="[{ required: false},{ type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }]">
          <el-input v-model="ruleForm2.email"></el-input>
        </el-form-item>
        <el-form-item label="性别" style="width: 260px;margin-bottom: 30px">
          <el-radio-group v-model="ruleForm2.gender" size="medium">
            <el-radio border label="男"></el-radio>
            <el-radio border label="女"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm2')">提交</el-button>
          <el-button @click="resetForm('ruleForm2')">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>/* eslint-disable indent */
export default {
  name: 'signUp',
  data: function () {
    var checkAge = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('用户名不能为空'))
      }
      var uPattern = /^[a-zA-Z0-9_-]{4,16}$/
      if (!uPattern.test(value)) {
        callback(new Error('请输入4到16位（字母，数字，下划线，减号）'))
      } else {
        callback()
      }
    }
    var checkNike = (rule, value, callback) => {
      if (value.length < 3 || value.length > 16) {
        callback(new Error('请输入3到16位字符'))
      } else {
        callback()
      }
    }
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else {
        var uPattern = /^[a-zA-Z0-9_-]{6,16}$/
        if (!uPattern.test(value)) {
          callback(new Error('请输入6到16位（字母，数字，下划线，减号）'))
        }
        if (this.ruleForm2.checkPass !== '') {
          this.$refs.ruleForm2.validateField('checkPass')
        }
        callback()
      }
    }
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.ruleForm2.pass) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      ruleForm2: {
        username: '',
        pass: '',
        checkPass: '',
        birthday: '',
        email: '',
        gender: '',
        nickname: ''
      },
      rules2: {
        pass: [
          {required: true},
          {validator: validatePass, trigger: 'blur'}
        ],
        checkPass: [
          {required: true},
          {validator: validatePass2, trigger: 'blur'}
        ],
        username: [
          {required: true},
          {validator: checkAge, trigger: 'blur'}
        ],
        nickname: [
          {required: true},
          {validator: checkNike, trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    sign () {
      var genders = -1
      if (this.ruleForm2.gender === null) {
        genders = -1
      } else if (this.ruleForm2.gender === '男') {
        genders = 1
      } else {
        genders = 0
      }
      this.postRequest('/sign_up', {
        username: this.ruleForm2.username,
        email: this.ruleForm2.email,
        nickname: this.ruleForm2.nickname,
        password: this.ruleForm2.pass,
        birthday: this.ruleForm2.birthday,
        gender: genders
      }).then(res => {
        if (res.data.code === '200') {
          this.$router.push('/space')
        } else {
          alert(res.data.msg)
        }
        /* var obj = JSON.parse(data1)
        console.log(obj.code) */
      })
    },
    submitForm (formName) {
      this.sign()
    },
    resetForm (formName) {
      this.$refs[formName].resetFields()
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
