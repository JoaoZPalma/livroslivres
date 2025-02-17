
<!-- src/components/EventoCard.vue -->
<template>
  <div @click="irParaDetalhes" class="cursor-pointer bg-[#F6EFBD] p-4 rounded-lg shadow-lg border-4 border-[#E9B86C] transition hover:scale-105">
    <h2 class="text-xl font-bold text-[#2E2E2E] mb-2 text-center">{{ titulo }}</h2>

    <div class="grid grid-cols-3 gap-2">
      <img :src="imagemGrande" alt="Imagem principal" class="col-span-2 rounded-lg border-2 border-[#E9B86C] object-cover">
      <div class="flex flex-col space-y-2">
        <img :src="imagemPequena1" alt="Imagem 1" class="rounded-lg border-2 border-[#E9B86C] object-cover">
        <img :src="imagemPequena2" alt="Imagem 2" class="rounded-lg border-2 border-[#E9B86C] object-cover">
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';

const props = defineProps({
  id: Number,
  titulo: String,
  imagemGrande: String,
  imagemPequena1: String,
  imagemPequena2: String,
});

const router = useRouter();
const irParaDetalhes = () => {
  router.push(`/eventos/${props.id}`);
};
</script>
