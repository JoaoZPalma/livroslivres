<script setup>
import { onMounted } from "vue";
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation, Pagination } from 'swiper/modules';
import Section  from '@/components/Section.vue';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import { useSeoMeta } from '@unhead/vue'

onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
      }
    });
  }, {
    threshold: 0.1,
  });

  const sections = document.querySelectorAll(".fade-in");
  sections.forEach((section) => {
    observer.observe(section);
  });
});

useSeoMeta({
  title: 'Quem Somos | Praça dos Livros Livres',
  description: 'Descobre mais sobre a nossa organização sem fins lucrativos Praça dos Livros Livres em Tavira!',
  keywords: 'Tavira, Algarve, sem fins lucrativos, praca dos livros livres, eventos para crianças, leitura, informações',
  ogTitle: 'Memórias | Praça dos Livros Livres',
  ogDescription: 'Descobre mais sobre a nossa organização sem fins lucrativos Praça dos Livros Livres em Tavira!',
  ogImage: 'https://pracadoslivroslivres.org/logo.jpg'
})
</script>


<template>
  <div class="min-h-screen p-6">
    <!-- Header -->
    <div class="text-center mt-2">
      <h1 class="font-bold text-4xl md:text-5xl text-[#2E2E2E]">Sobre Nós</h1>
      <p class="mt-4 text-lg md:text-xl text-[#2E2E2E]">Fica a conhecer a nossa história, a nossa
        equipa e a nossa missão!</p>
    </div>

    <!-- O Que Fazemos -->
    <Section>
      <h2 class="font-bold text-2xl md:text-3xl text-[#2E2E2E] mb-4">Não só contamos, como também
        temos história...</h2>
      <p class="text-[#2E2E2E]">
        Rebebebeu pardais ao ninho
      </p>
    </Section>

    <!-- Porque o Fazemos -->
    <Section>
      <h2 class="font-bold text-2xl md:text-3xl text-[#2E2E2E] mb-4">Mas afinal fazemo-lo porquê?</h2>
      <p class="text-[#2E2E2E]">
        olha porque há que se fazer alguma coisa se não dá-se em doido e isto dos putos até é
        engraçado por mais que não seja fácil
      </p>
    </Section>


    <!-- Parcerias e Apoios -->
    <Section class="invisible">
      <h2 class="font-bold text-2xl md:text-3xl text-[#2E2E2E] mb-4">Parcerias e Apoios:</h2>
      <p class="text-[#2E2E2E] mb-6">
        <!-- Adicione aqui o texto sobre as parcerias e apoios. -->
      </p>
      <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
        <!-- Logo 1 -->
        <div class="flex items-center justify-center">
          <img
            src="/logo.jpg"
            alt="Logo Parceiro"
            class="w-32 h-auto"
          />
        </div>

        <!-- Logo 2 -->
        <div class="flex items-center justify-center">
          <img
            src="/logo.jpg"
            alt="Logo Parceiro"
            class="w-32 h-auto"
          />
        </div>

        <!-- Adicione mais logos conforme necessário -->
      </div>
    </Section>
    </div>
</template>

<style scoped>
.fade-in {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}

.fade-in.visible {
  opacity: 1;
  transform: translateY(0);
}

/* Estilizando as setas do Swiper */
.swiper-button-prev, .swiper-button-next {
  color: #2e2e2e; /* Cor das setas */
  border-radius: 50%; /* Botões redondos */
  padding: 3vh; /* Espaçamento para tornar os botões maiores */
}

/* Efeito ao passar o mouse */
.swiper-button-prev:hover, .swiper-button-next:hover {
  color: #000; /* Cor branca das setas no hover */
}

/* Estilo da paginação */
.swiper-pagination-bullet {
  background-color: #F6EFBD; /* Cor das bolinhas da paginação */
  border-color: 2px solid #000;
  opacity: 0.5;
}

.swiper-pagination-bullet-active {
  background-color: #E9B86C; /* Cor da bolinha ativa */
  opacity: 1;
}
</style>
