import Vue from 'vue'
import Router from 'vue-router'
import login from '@/components/login'
import home from '../components/home'
import admin from '@/components/admin'
import signUp from '../components/signUp'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/login',
      name: 'login',
      component: login
    },
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path: '/poseidon/oauth/admin',
      name: 'admin',
      component: admin
    },
    {
      path: '/sign_up',
      name: 'signUp',
      component: signUp
    }
  ]
})
