import Vue from 'vue'
import Router from 'vue-router'
import login from '@/components/login'
import home from '../components/home'
import admin from '@/components/admin'
import signUp from '../components/signUp'
import test from '../components/test'
import goods from '../components/goods'
import logout from '../components/logout'
import space from '../components/space'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/space',
      name: 'space',
      component: space
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
      path: '/test',
      name: 'test',
      component: test
    }
  ]
})
