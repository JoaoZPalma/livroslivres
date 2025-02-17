import { createRouter, createWebHistory } from "vue-router";
import Memorias from "@/views/Memorias.vue";
import EventoDetalhes from "@/views/EventoDetalhes.vue";
import Home from "@/views/Home.vue";

const routes = [
  { path: "/", name: 'Home', component: Home },
  { path: "/memorias", name: 'Memorias', component: Memorias },
  { path: "/memorias/:id", component: EventoDetalhes },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
