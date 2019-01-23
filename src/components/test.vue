<template>
  <div>
    <div  v-for="(item,index) in items">
      {{item}} {{index}}
    </div>
  </div>

</template>

<script>/* eslint-disable indent */
    export default {
        name: 'test',
      data () {
          return {
            items: ['a', 'b', 'c']
          }
      }
    }
</script>

<style scoped>

</style>
