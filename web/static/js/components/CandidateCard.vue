<template>
  <div class="candidate-card">
    <el-card :body-style="{ padding: '10px' }">
      <div>
        <h5>John Doe</h5>
        <p>Awesome candidate with 5 years of Rails experience.</p>
      </div>
    </el-card>
  </div>
</template>

<script>
  import { Card } from 'element-ui'
  export default {
    components: {
      elCard: Card
    }
  }
</script>

<style scoped>
  .candidate-card {
    margin-bottom: 10px;
  }

  .el-card:hover {
    cursor: pointer;
    background-color: #f6f6f6;
  }
</style>
