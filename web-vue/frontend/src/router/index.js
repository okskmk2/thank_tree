import Vue from 'vue'
import VueRouter from 'vue-router'
import StartPage from '../views/StartPage.vue'
import HomePage from '../views/HomePage.vue'
import SignUpPage from '../views/SignUpPage.vue'
import SignInPage from '../views/SignInPage.vue'
import OnBoarding from '../views/OnBoarding.vue'
import VaseDetailPage from '../views/VaseDetailPage.vue'

import LeafFormLobbyPage from '../views/leaf/LeafFormLobbyPage.vue'
import LeafForm from "../views/leaf/LeafForm.vue";
import LeafFormFinal from "../views/leaf/LeafFormFinal.vue";

import VaseGardenPage from '../views/VaseGardenPage.vue'
import VasePostOfficePage from '../views/VasePostOfficePage.vue'
import BottomNavLayout from '../layouts/BottomNavLayout.vue'

import VaseFormToPage from '../views/vase_form/VaseFormToPage.vue'
import VaseFormTitlePage from '../views/vase_form/VaseFormTitlePage.vue'
import VaseFormDueDatePage from '../views/vase_form/VaseFormDueDatePage.vue'
import VaseFormFinalAndInvitePage from '../views/vase_form/VaseFormFinalAndInvitePage.vue'


Vue.use(VueRouter);


const routes = [
  {
    path: '/',
    component: StartPage,
    alias: '/index.html'
  },
  {
    path: '/sign-up',
    component: SignUpPage
  },
  {
    path: '/sign-in',
    component: SignInPage
  },
  {
    path: '/onboarding',
    component: OnBoarding
  },
  {
    path: '/vase/:id',
    component: VaseDetailPage
  },
  {
    path: '/vase-form-to',
    component: VaseFormToPage,
    alias:'/vase-form'
  },
  {
    path: '/vase-form-title',
    component: VaseFormTitlePage
  },
  {
    path: '/vase-form-duedate',
    component: VaseFormDueDatePage
  },
  {
    path: '/vase-form-final-invite',
    component: VaseFormFinalAndInvitePage
  },
  {
    path: '/leaf-form/:id',
    component: LeafForm
  },
  {
    path: '/leaf-form-final',
    component: LeafFormFinal
  },
  {
    path: '',
    component: BottomNavLayout,
    children: [
      {
        path: 'home',
        component: HomePage
      },
      {
        path: 'leaf-form-lobby',
        component: LeafFormLobbyPage
      },
      {
        path: 'vase-garden',
        component: VaseGardenPage
      },
      {
        path: 'vase-post-office',
        component: VasePostOfficePage
      }
    ]
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
