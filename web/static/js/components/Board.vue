<template>
  <div>
    <h3>Candidates Pipeline</h3>
    <vue-nice-scrollbar classes="my-scrollbar" v-bind:speed=100 theme="dark">
      <div class="scroll-me">
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
    background-color: #e2e4e6;;
  }

  .my-scrollbar{
    width: 100%;
    min-width: 300px;
    max-height: 450px;
    margin: 0;
  }

  .scroll-me{
    min-width: 1000px;
  }

  .stage-column {
    width: 240px;
    float: left;
    margin-right: 10px;
  }
</style>
