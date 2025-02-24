import { createRouter, createWebHistory } from "vue-router";
import Memorias from "@/views/Memorias.vue";
import EventoDetalhes from "@/views/EventoDetalhes.vue";
import Loja from "@/views/Loja.vue";
import ProdutoDetalhes from "@/views/ProdutoDetalhes.vue";
import Home from "@/views/Home.vue";

const routes = [
  { path: "/", name: 'Home', component: Home },
  { path: "/memorias", name: 'Memorias', component: Memorias },
  { path: "/memorias/:id", component: EventoDetalhes },
  { path: "/loja", name: 'Loja', component: Loja },
  { path: "/loja/produtos/:id", component: ProdutoDetalhes },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
