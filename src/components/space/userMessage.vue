<template>
  <el-row  type="flex" justify="space-around">
    <el-col :span="24"style="background-color: oldlace" >
      <div style=""><img src="../../../static/p_big3.jpg" width="100px" height="100px"/><span style="font-size: 30px">xiaoming </span></div>
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm" :size="small" label-position="top">
        <el-form-item label="昵称" prop="name" >
          <el-row  type="flex" justify="space-around">
          <el-col :span="11" >
          <el-input v-model="ruleForm.name"></el-input>
          </el-col>
          </el-row>
        </el-form-item>
        <el-form-item label="生日" required>
          <el-row  type="flex" justify="space-around">
          <el-col :span="11">
            <el-form-item prop="date1">
              <el-date-picker type="date" placeholder="选择日期" v-model="ruleForm.date1" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
          </el-row>
        </el-form-item>
        <el-form-item label="邮箱" prop="name" >
          <el-row  type="flex" justify="space-around">
            <el-col :span="11" >
              <el-input v-model="ruleForm.name"></el-input>
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item label="绑定邮箱" prop="delivery">
          <el-switch v-model="ruleForm.delivery"></el-switch>
        </el-form-item>
        <el-form-item label="手机号" prop="name" >
          <el-row  type="flex" justify="space-around">
            <el-col :span="11" >
              <el-input v-model="ruleForm.name"></el-input>
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item label="绑定手机号" prop="delivery">
          <el-switch v-model="ruleForm.delivery"></el-switch>
        </el-form-item>
        <el-form-item label="关注话题" prop="type">
          <el-checkbox-group v-model="ruleForm.type">
            <el-checkbox label="美食" name="type"></el-checkbox>
            <el-checkbox label="运动" name="type"></el-checkbox>
            <el-checkbox label="科技" name="type"></el-checkbox>
            <el-checkbox label="啥也不关注" name="type"></el-checkbox>
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
    </el-col>

    <el-col :span="4"style="background-color: oldlace" >
      ssssssssssss
    </el-col>
  </el-row>
</template>

<script>
  export default {
    name: "userMessage",
    data() {
      return {
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
      };
    },
    methods: {
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

</style>
