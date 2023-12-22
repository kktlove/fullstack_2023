<template>
  <div id="app">
    <Menu />
    <div id="content" class="content">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import Menu from './components/layout/Menu.vue'

export default {
  name: 'App',
  components: {
    Menu
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
