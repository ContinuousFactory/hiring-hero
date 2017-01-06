<template>
  <div>
    <h3>Candidates Pipeline</h3>
    <vue-nice-scrollbar classes="board-scrollbar" :speed=100 theme="light">
      <div :style="styleBoard">
        <div class="stage-column" v-for="stage in stages">
          <el-card :body-style="{ padding: '14px' }">
            <app-stage :stage="stage"></app-stage>
          </el-card>
        </div>
      </div>
    </vue-nice-scrollbar>
  </div>
</template>

<script>
  import Stage from './Stage.vue'
  import { Card, Row, Col } from 'element-ui'
  import vueNiceScrollbar from './scroll/vue-nice-scrollbar.vue'

  export default {
    props: ["candidates", "stages"],

    data () {
      return {
        styleBoard: {
          minWidth: this.stages.length * 240 + 40,
          overflow: 'hidden'
        }
      }
    },

    components: {
      appStage: Stage,
      elCard: Card,
      elRow: Row,
      elCol: Col,
      vueNiceScrollbar
    }
  }
</script>

<style scoped>
  .el-card {
    background-color: #e2e4e6;
  }

  .board-scrollbar{
    width: 100%;
    min-width: 300px;
    max-height: 500px;
    margin: 0;
  }

  .stage-column {
    width: 240px;
    height: 500px;
    float: left;
    margin-right: 10px;
  }
</style>
