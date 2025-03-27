import './assets/main.css';
import 'leaflet/dist/leaflet.css';
import { createHead } from '@unhead/vue/client';
import { ViteSSG } from 'vite-ssg';
import App from './App.vue';
import { routes } from './router'; // Import your routes
import './assets/tailwind.css';

// ViteSSG setup
export const createApp = ViteSSG(
  App,
  { routes }, // Pass your routes here
  ({ app, router }) => {
    const head = createHead();
    app.use(head); // Use @unhead/vue for head management

    router.options.scrollBehavior = (to, from, savedPosition) => {
      return { top: 0 };
    };
  }
);
