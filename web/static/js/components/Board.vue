<template>
  <div>
    <h3>Candidates Pipeline</h3>
    <el-row :gutter="10">
      <el-col :span="8" v-for="stage in stages">
        <el-card :body-style="{ padding: '14px' }">
          <app-stage :stage="stage"></app-stage>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import Stage from './Stage.vue'
  import { Card, Row, Col } from 'element-ui'

  export default {
    props: ["candidates", "stages"],

    data () {
      return {
      }
    },

    components: {
      appStage: Stage,
      elCard: Card,
      elRow: Row,
      elCol: Col
    }
  }
</script>

<style scoped>
  .el-card {
    background-color: #e2e4e6;;
  }
</style>
