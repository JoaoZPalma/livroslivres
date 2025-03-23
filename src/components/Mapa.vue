<script setup>
import { ref, onMounted, watch } from "vue";
import L from "leaflet";
import markerIcon from '/img/marker-icon.png';
import markerIcon2x from '/img/marker-icon-2x.png';
import markerShadow from '/img/marker-shadow.png';

delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconUrl: markerIcon,
  iconRetinaUrl: markerIcon2x,
  shadowUrl: markerShadow,
});

const props = defineProps({
  idEvento: { type: Number, required: true } // O ID do evento a ser mostrado no mapa
});

const emit = defineEmits(["endereco-carregado"]); // Emitir o endereço para o componente pai

const map = ref(null);
const mapContainer = ref(null);

async function carregarLocalizacao() {
  try {
    const response = await fetch("/localizacoes.json"); // Carregar o JSON com eventos
    const dados = await response.json();

    // Encontra o evento correspondente ao ID passado
    const eventoSelecionado = dados.eventos.find(evento => evento.id === props.idEvento);

    if (map.value && eventoSelecionado) {
      // Se um evento for encontrado, reposiciona o mapa
      map.value.setView([eventoSelecionado.lat, eventoSelecionado.lng], 15);

      // Adiciona o marcador ao mapa
      L.marker([eventoSelecionado.lat, eventoSelecionado.lng], {alt: 'Mapa a localizar o evento com um pin'})
        .addTo(map.value)
        .openPopup();

      // Emitir o endereço para o componente pai
      emit("endereco-carregado", eventoSelecionado.endereco);
    }
  } catch (error) {
    console.error("Erro ao carregar localização:", error);
  }
}

onMounted(() => {
  map.value = L.map(mapContainer.value).setView([0, 0], 2); // Inicializa o mapa com um zoom global

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: '&copy; <a alt="Biblioteca de Javascript usada para mostrar o mapa" href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map.value);

  carregarLocalizacao();
});

// Observe a mudança no idEvento e recarregue a localização
watch(() => props.idEvento, (newId) => {
  carregarLocalizacao(); // Recarrega a localização quando o idEvento mudar
});
</script>

<template>
  <!-- Container do Mapa -->
  <div ref="mapContainer" class="w-full h-64 border-2 border-[#E9B86C] rounded-lg z-30"></div>
</template>
