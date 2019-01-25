import Vue from 'vue'
import Router from 'vue-router'
import login from '@/components/login'
import home from '../components/home'
import admin from '@/components/admin'
import signUp from '../components/signUp'
import test from '../components/test'
import goods from '../components/area/goods/goods'
import logout from '../components/logout'
import space from '../components/space/space'
import forum from '../components/forum/forum'
import mysource from '../components/mysource/mysource'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/space',
      name: 'space',
      component: space
    },
    {
      path: '/mysource',
      name: 'mysource',
      component: mysource
    },
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
    },
    {
      path: '/goods',
      name: 'goods',
      component: goods
    },
    {
      path: '/logout',
      name: 'logout',
      component: logout
    },
    {
      path: '/forum',
      name: 'forum',
      component: forum
    },
    {
      path: '/test',
      name: 'test',
      component: test
    }
  ]
})
