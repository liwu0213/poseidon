// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import './assets/theme/element/index.css'
import VueResource from 'vue-resource'
import {getRequest} from './utils/api'
import {postRequest} from './utils/api'

Vue.prototype.getRequest = getRequest
Vue.prototype.postRequest = postRequest
Vue.config.productionTip = false
Vue.use(VueResource)
Vue.use(ElementUI, {size: 'mini', zIndex: 3000})
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: {App},
  template: '<App/>'
})
