import './assets/main.css';
import 'leaflet/dist/leaflet.css';

import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import './assets/tailwind.css';
import { createHead } from '@unhead/vue/client';

const app = createApp(App);
const head = createHead();

app.use(router);
app.use(head);

// Mount the app
app.mount('#app');
