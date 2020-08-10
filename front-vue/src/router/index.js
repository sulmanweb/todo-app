import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: () => import(/* webpackChunkName: "home" */ "../views/Home.vue"),
  },
  {
    path: "/sign_up",
    name: "SignUp",
    component: () =>
      import(/* webpackChunkName: "signup" */ "../views/auth/signUp.vue"),
  },
  {
    path: "/sign_in",
    name: "SignIn",
    component: () =>
      import(/* webpackChunkName: "signin" */ "../views/auth/signIn.vue"),
  },
  {
    path: "/lists/:listId",
    name: "ListShow",
    component: () =>
      import(/* webpackChunkName: "listShow" */ "../views/listShow.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
