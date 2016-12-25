<template>
  <div>
    <h3>Candidates Pipeline {{this.counter}}</h3>
    <p>This is pretty amazing</p>
  </div>
</template>

<script>
export default {
  props: ["counter"],

  data () {
    return {
      title: 'Long Nguyen'
    }
  }
}
</script>

<style scoped>
  h3 {
    color: blue;
  }
</style>
