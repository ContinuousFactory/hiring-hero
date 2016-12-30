<template>
  <div>
    <div class="stage-title">
      <span>{{stage.name}}</h5>
    </div>
    <app-candidate-card></app-candidate-card>
    <app-candidate-card></app-candidate-card>
    <app-candidate-card></app-candidate-card>
    <app-candidate-card></app-candidate-card>
    <app-candidate-card></app-candidate-card>
  </div>
</template>

<script>
  import CandidateCard from './CandidateCard.vue'
  import { Card } from 'element-ui'
  export default {
    props: ["stage"],

    data () {
      return {
      }
    },

    components: {
      elCard: Card,
      appCandidateCard: CandidateCard
    }
  }
</script>

<style scoped>
  .stage-title {
    font-size: 18px;
    font-weight: 400;
    margin-bottom: 5px;
  }
</style>
