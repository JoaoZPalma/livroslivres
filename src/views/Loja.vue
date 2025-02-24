<script setup>
import { ref } from "vue";

const produtos = ref([]);

async function carregarProdutos() {
  const arquivos = import.meta.glob('@/produtosData/*.json');

  for (const path in arquivos) {
    const produto = await arquivos[path]();
    produtos.value.push(produto);
  }
  produtos.value.sort((a, b) => b.id - a.id);
}

// Carregar as memórias ao montar o componente
carregarProdutos();
</script>

<template>
  <div>
    <div class="p-6">
      <h1 class="text-center text-3xl font-bold mb-4">Produtos</h1>
      <div class="grid grid-cols-2 md:grid-cols-2 lg:grid-cols-6 gap-4">
        <router-link
          v-for="produto in produtos"
          :key="produto.id"
          :to="'/loja/produtos/' + produto.id"
          class="bg-[#F6EFBD] p-4 shadow rounded border-4 border-[#E9B86C] aspect-square flex flex-col items-center justify-between hover:shadow-lg transition-shadow"
        >
          <!-- Galeria de imagens -->
          <div class="relative flex items-center justify-center h-32 w-32 md:h-48 md:w-48 overflow-hidden z-30">
            <img
              v-for="(imagem, index) in produto.imagens.slice(0, 1)"
              :key="index"
              :src="imagem"
              alt="Imagem do produto"
              class="w-full h-48 object-cover rounded"
            />
          </div>

          <!-- Informações do Produto -->
          <h2 class="text-xl font-semibold mt-2">{{ produto.nome }}</h2>
          <p class="text-gray-600 md:h-12">{{ produto.preco }}€</p>

          <!-- Estado do produto -->
          <p
            :class="{
              'text-red-500': produto.estado === 0,
              'text-green-500': produto.estado === 1
            }"
            class="text-sm mt-1"
          >
            {{ produto.estado === 0 ? 'Fora de stock' : 'Em stock' }}
          </p>
        </router-link>
      </div>
    </div>
  </div>
</template>

<style scoped>
/* Ensure the product box is a perfect square */
.aspect-square {
  aspect-ratio: 1 / 1; /* Ensures a 1:1 aspect ratio */
  width: 100%; /* Takes full width of the grid column */
}

/* Optional: Adjust image size to fit inside the square */
.h-48 {
  height: 12rem; /* Adjust as needed */
}

.w-48 {
  width: 12rem; /* Adjust as needed */
}

/* Add hover effect to the card */
.hover\:shadow-lg:hover {
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}
</style>
