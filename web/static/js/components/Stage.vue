<template>
  <div>
    <div class="stage-title">
      <span>{{stage.name}}</h5>
    </div>
    <vue-nice-scrollbar classes="stage-scrollbar" :speed=100 theme="light">
      <div :style="styleStage">
        <div class="stage-column">
          <app-candidate-card></app-candidate-card>
          <app-candidate-card></app-candidate-card>
          <app-candidate-card></app-candidate-card>
          <app-candidate-card></app-candidate-card>
          <app-candidate-card></app-candidate-card>
          <app-candidate-card></app-candidate-card>
        </div>
      </div>
    </vue-nice-scrollbar>
  </div>
</template>

<script>
  import CandidateCard from './CandidateCard.vue'
  import { Card } from 'element-ui'
  import vueNiceScrollbar from './scroll/vue-nice-scrollbar.vue'

  export default {
    props: ["stage"],

    data () {
      return {
        styleStage: {
          overflow: 'hidden'
        }
      }
    },

    components: {
      elCard: Card,
      appCandidateCard: CandidateCard,
      vueNiceScrollbar
    }
  }
</script>

<style scoped>
  .stage-title {
    font-size: 18px;
    font-weight: 400;
    margin-bottom: 5px;
  }

  .stage-scrollbar {
    width: 100%;
    max-height: 400px;
    margin: 0;
  }

  .stage-column {
    min-height: 400px;
  }
</style>
