<script setup>
import { ref, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation, Pagination } from 'swiper/modules';
import CustomButton from '@/components/CustomButton.vue';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

const route = useRoute();
const router = useRouter();
const produto = ref(null);

async function carregarProduto() {
  try {
    const produtoData = await import(`@/produtosData/produto${route.params.id}.json`);
    produto.value = produtoData;
  } catch (error) {
    console.error("Produto não encontrado!", error);
  }
}

function goBack() {
  router.go(-1); // Navigate back in history
}

onMounted(carregarProduto);
</script>

<template>
  <div>
    <div class="mx-2 md:mx-8 border-8 border-[#E9B86C] text-[#2E2E2E] space-y-6 flex flex-col">
      <div v-if="produto" :class="
        {'custom-bg p-6 flex flex-col md:flex-row md:space-x-8': produto.estado === 1,
        'custom-nostock-bg p-6 flex flex-col md:flex-row md:space-x-8': produto.estado === 0}">
        <!-- Carrossel de Imagens (à direita no PC) -->
        <div class="md:w-1/2">
          <Swiper
            :modules="[Navigation, Pagination]"
            :spaceBetween="10"
            :slidesPerView="1"
            :navigation="true"
            :pagination="true"
            class="mt-2 w-full max-w-[70vh] mx-auto"
          >
            <SwiperSlide
              v-for="(imagem, index) in produto.imagens"
              :key="index"
              class="flex items-center justify-center"
            >
              <img
                :src="imagem"
                alt="Imagem do produto"
                class="w-full h-auto max-h-[70vh] object-contain rounded z-30"
              />
            </SwiperSlide>
          </Swiper>
        </div>

        <!-- Informações do Produto (à esquerda no PC) -->
        <div class="mt-6 md:w-1/2 md:mt-0">
          <h1 class="text-4xl font-bold md:mt-6">{{ produto.nome }}</h1>
          <p class="text-2xl font-semibold mt-2">{{ produto.preco }}€</p>
          <p class="text-sm mt-4">{{ produto.descricao }}</p>

          <!-- Botão "Voltar" -->
          <div class="mt-4">
            <CustomButton @click="goBack" class='w-full md:w-max md:h-max mt-4'
            >
              Voltar
            </CustomButton>
          </div>
        </div>
      </div>

      <p v-else class="text-center py-8">Carregando produto...</p>
    </div>
  </div>
</template>

<style>
/* Estilizando as setas do Swiper */
.swiper-button-prev,
.swiper-button-next {
  color: #2e2e2e; /* Cor das setas */
  background-color: rgba(246, 239, 189, 0.8); /* Fundo semi-transparente */
  border-radius: 50%; /* Botões redondos */
  width: 40px; /* Tamanho dos botões */
  height: 40px; /* Tamanho dos botões */
  display: flex;
  align-items: center;
  justify-content: center;
}

/* Efeito ao passar o mouse */
.swiper-button-prev:hover,
.swiper-button-next:hover {
  background-color: rgba(233, 184, 108, 0.8); /* Cor de fundo no hover */
}

/* Estilo da paginação */
.swiper-pagination-bullet {
  background-color: #F6EFBD; /* Cor das bolinhas da paginação */
  opacity: 0.5;
  border: 2px solid #2e2e2e;
}

.swiper-pagination-bullet-active {
  background-color: #E9B86C; /* Cor da bolinha ativa */
  opacity: 1;
}

.custom-bg {
  background-color: #F6EFBD !important; /* Fundo do container */
}

.custom-nostock-bg {
  background-color: #e5e4dc !important; /* Fundo do container */
}
</style>
