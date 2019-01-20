<template>
  <el-card class="box-card" style="margin: auto">
    <div slot="header" class="clearfix">
      <span>注册</span>
    </div>
    <table>
      <tr>
        <td>
          <el-tag>用户名</el-tag>
        </td>
        <td colspan="2">
          <el-input ></el-input>
        </td>
      </tr>
      <tr>
        <td>
          <el-tag>密码</el-tag>
        </td>
        <td colspan="2">
          <el-input ></el-input>
        </td>
      </tr><tr>
      <td>
        <el-tag>昵称</el-tag>
      </td>
      <td colspan="2">
        <el-input ></el-input>
      </td>
    </tr>
      <tr>
        <td>
          <el-tag>邮箱</el-tag>
        </td>
        <td colspan="2">
          <el-input ></el-input>
        </td>
      </tr>
      <tr>
        <td>
          <el-tag>手机</el-tag>
        </td>
        <td colspan="2">
          <el-input ></el-input>
        </td>
      </tr>
    </table>
  </el-card>
</template>

<script>
    export default {
        name: "signUp"
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
