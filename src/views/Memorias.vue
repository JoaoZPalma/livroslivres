<script setup>
import { ref } from "vue";

// Armazena as memórias
const memorias = ref([]);

// Carregar os ficheiros JSON dinamicamente
async function carregarMemorias() {
  const arquivos = import.meta.glob('@/memoriasData/*.json');

  for (const path in arquivos) {
    const memoria = await arquivos[path]();
    memorias.value.push(memoria);
  }
  memorias.value.sort((a,b) => b.id - a.id)
}

// Carregar as memórias ao montar o componente
carregarMemorias();
</script>

<template>
  <div>
    <div class="p-6">
      <h1 class="text-center text-3xl font-bold mb-4">Memórias</h1>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <div
          v-for="memoria in memorias"
          :key="memoria.id"
          class="bg-[#F6EFBD] p-4 shadow rounded border-4 border-[#E9B86C]"
        >
          <!-- Galeria de imagens -->
          <div class="relative flex items-center justify-center h-48 w-full overflow-hidden z-30">
            <img
              v-for="(imagem, index) in memoria.imagens.slice(0, 1)"
              :key="index"
              :src="imagem"
              alt="Imagem da memória"
              class="w-full h-48 object-cover rounded"
            />
          </div>

          <!-- Informações da Memória -->
          <h2 class="text-xl font-semibold mt-2">{{ memoria.titulo }}</h2>
          <p class="text-gray-600 md:h-12">{{ memoria.descricao }}</p>

          <!-- Botão para ver mais imagens -->
          <router-link
            :to="'/memorias/' + memoria.id"
            class="text-blue-500 hover:underline mt-2 block"
          >
            Ver mais imagens →
          </router-link>
          <p class="text-sm text-gray-400 mt-2">{{ memoria.data }}</p>
        </div>
      </div>
    </div>
  </div>
</template>
