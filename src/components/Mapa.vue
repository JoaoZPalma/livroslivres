<script setup>
import { ref, onMounted, watch, onUnmounted } from "vue";
import markerIcon from '/img/marker-icon.png';
import markerIcon2x from '/img/marker-icon-2x.png';
import markerShadow from '/img/marker-shadow.png';

// Props and Emits
const props = defineProps({
  idEvento: { type: Number, required: true }
});
const emit = defineEmits(["endereco-carregado"]);

// Refs
const map = ref(null);
const mapContainer = ref(null);
let L = ref(null); // Store Leaflet dynamically

// Load Leaflet only on the client
const loadLeaflet = async () => {
  if (typeof window !== 'undefined') { // Check for client-side
    L = await import('leaflet');

    // Fix default icon paths
    delete L.Icon.Default.prototype._getIconUrl;
    L.Icon.Default.mergeOptions({
      iconUrl: markerIcon,
      iconRetinaUrl: markerIcon2x,
      shadowUrl: markerShadow,
    });

    // Initialize map
    map.value = L.map(mapContainer.value).setView([0, 0], 2);
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map.value);

    carregarLocalizacao();
  }
};

// Fetch event location
async function carregarLocalizacao() {
  if (!L || !map.value) return;

  try {
    const response = await fetch("/localizacoes.json");
    const dados = await response.json();
    const eventoSelecionado = dados.eventos.find(evento => evento.id === props.idEvento);

    if (eventoSelecionado) {
      map.value.setView([eventoSelecionado.lat, eventoSelecionado.lng], 15);
      L.marker([eventoSelecionado.lat, eventoSelecionado.lng], { alt: 'Map pin' })
        .addTo(map.value)
        .openPopup();
      emit("endereco-carregado", eventoSelecionado.endereco);
    }
  } catch (error) {
    console.error("Erro ao carregar localização:", error);
  }
}

// Lifecycle hooks
onMounted(() => {
  loadLeaflet();
});

onUnmounted(() => {
  if (map.value) map.value.remove(); // Cleanup
});

// Watch for prop changes
watch(() => props.idEvento, () => {
  carregarLocalizacao();
});
</script>

<template>
  <div ref="mapContainer" class="w-full h-64 border-2 border-[#E9B86C] rounded-lg z-30"></div>
</template>
