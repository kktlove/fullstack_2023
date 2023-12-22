import Vue from 'vue'
import App from './App.vue'
import router from './router'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import axios from "axios";
// Import Bootstrap an BootstrapVue CSS files (order is important)
// Define variable defaults

import './app.scss'

Vue.prototype.$axios = axios

Vue.config.productionTip = false

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)

export default 

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
