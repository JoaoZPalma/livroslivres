<script setup>
import { ref } from "vue";
import { useSeoMeta } from '@unhead/vue'

// Armazena as memórias
const memorias = ref([]);

// Carregar os ficheiros JSON dinamicamente
async function carregarMemorias() {
  const data = await import('@/data/memorias.json');
  memorias.value = data.default.sort((a, b) => b.id - a.id);
}

// Carregar as memórias ao montar o componente
carregarMemorias();

useSeoMeta({
  title: 'Memórias | Praça dos Livros Livres',
  description: 'Descobre as memórias que criamos juntos na Praça dos Livros Livres em Tavira!',
  keywords: 'Tavira, Algarve, sem fins lucrativos, praca dos livros livres, eventos para crianças, leitura',
  ogTitle: 'Memórias | Praça dos Livros Livres',
  ogDescription: 'Descobre as memórias que criamos juntos na Praça dos Livros Livres em Tavira!',
  ogImage: 'https://www.pracadoslivroslivres.org/favicon.ico'
})
</script>

<template>
  <div>
    <div class="p-6">
      <h1 class="text-center text-4xl md:text-5xl font-bold mb-4 md:mb-6">Memórias</h1>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <div v-for="memoria in memorias" :key="memoria.id"
          class="bg-[#F6EFBD] p-4 shadow rounded border-4 border-[#E9B86C]">
          <!-- Galeria de imagens -->
          <div class="relative flex items-center justify-center h-48 w-full overflow-hidden z-30">
            <img v-for="(imagem, index) in memoria.imagens.slice(0, 1)" :key="index" :src="imagem"
              alt="Imagem da memória" class="w-full h-48 object-cover rounded" />
          </div>

          <!-- Informações da Memória -->
          <h2 class="text-xl font-semibold mt-2">{{ memoria.titulo }}</h2>
          <p class="text-gray-600 md:h-12">{{ memoria.descricao }}</p>

          <!-- Botão para ver mais imagens -->
          <router-link :to="'/memorias/' + memoria.id" class="text-blue-500 hover:underline mt-2 block">
            Ver mais imagens →
          </router-link>
          <p class="text-sm text-gray-400 mt-2">{{ memoria.data }}</p>
        </div>
      </div>
    </div>
  </div>
</template>
