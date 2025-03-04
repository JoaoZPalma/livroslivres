<template>
  <div class="min-h-screen p-6">
    <!-- Header -->
    <div class="text-center mt-2">
      <h1 class="font-bold text-4xl md:text-5xl text-[#2E2E2E]">Sobre Nós</h1>
      <p class="mt-4 text-lg md:text-xl text-[#2E2E2E]">Fica a conhecer a nossa história, a nossa
        equipa e a nossa missão!</p>
    </div>

    <!-- O Que Fazemos -->
    <div class="fade-in bg-white p-8 rounded-lg shadow-lg mb-12 border-4 border-[#E9B86C]">
      <h2 class="font-bold text-2xl md:text-3xl text-[#2E2E2E] mb-4">Não só contamos, como também
        temos história...</h2>
      <p class="text-[#2E2E2E]">
        Rebebebeu pardais ao ninho
      </p>
    </div>

    <!-- Porque o Fazemos -->
    <div class="fade-in bg-white p-8 rounded-lg shadow-lg mb-12 border-4 border-[#E9B86C]">
      <h2 class="font-bold text-2xl md:text-3xl text-[#2E2E2E] mb-4">Mas afinal fazemo-lo porquê?</h2>
      <p class="text-[#2E2E2E]">
        olha porque há que se fazer alguma coisa se não dá-se em doido e isto dos putos até é
        engraçado por mais que não seja fácil
      </p>
    </div>

    <!-- A Nossa Equipa -->
    <div class="fade-in bg-white p-8 rounded-lg shadow-lg mb-12 border-4 border-[#E9B86C]">
      <h2 class="font-bold text-2xl md:text-3xl text-[#2E2E2E] mb-8">Membros maravilhosos da nossa
        equipa!</h2>
      <!-- Carrossel de Membros -->
      <Swiper
        :modules="[Navigation, Pagination]"
        :spaceBetween="20"
        :slidesPerView="1"
        :navigation="true"
        :pagination="{ clickable: true }"
        :breakpoints="{
          320: { slidesPerView: 2 },
          768: { slidesPerView: 4 }
        }"
        class="mt-2"
      >
        <!-- Membro 1 -->
        <SwiperSlide>
          <div class="text-center">
            <img
              src="/equipa_fotos/ines_zarcos.jpg"
              alt="Maria Inês"
              class="w-32 h-32 mx-auto rounded-full border-4 border-[#E9B86C]"
            />
            <h3 class="font-bold text-xl mt-4 text-[#2E2E2E]">Maria Inês Zarcos</h3>
            <p class="text-[#2E2E2E]">Contadora de Histórias</p>
            <p class="text-[#2E2E2E] mt-1 font-light">
              Rapariga fenomenal pá.
            </p>
          </div>
        </SwiperSlide>

        <!-- Membro 2 -->
        <SwiperSlide>
          <div class="text-center">
            <img
              src="/equipa_fotos/ines_zarcos.jpg"
              alt="Nome do Membro"
              class="w-32 h-32 mx-auto rounded-full border-4 border-[#E9B86C]"
            />
            <h3 class="font-bold text-xl mt-4 text-[#2E2E2E]">Nome do Membro</h3>
            <p class="text-[#2E2E2E]">Cargo/Função</p>
            <p class="text-[#2E2E2E] mt-2">
              <!-- Breve descrição sobre o membro. -->
            </p>
          </div>
        </SwiperSlide>

        <!-- Adicionar mais membros -->
      </Swiper>
    </div>

    <!-- Parcerias e Apoios -->
    <div class="fade-in bg-white p-8 rounded-lg shadow-lg mb-12 border-4 border-[#E9B86C]">
      <h2 class="font-bold text-2xl md:text-3xl text-[#2E2E2E] mb-4">Parcerias e Apoios</h2>
      <p class="text-[#2E2E2E] mb-6">
        <!-- Adicione aqui o texto sobre as parcerias e apoios. -->
      </p>
      <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
        <!-- Logo 1 -->
        <div class="flex items-center justify-center">
          <img
            src="/icondaorganizacao.jpg"
            alt="Logo Parceiro"
            class="w-32 h-auto"
          />
        </div>

        <!-- Logo 2 -->
        <div class="flex items-center justify-center">
          <img
            src="/icondaorganizacao.jpg"
            alt="Logo Parceiro"
            class="w-32 h-auto"
          />
        </div>

        <!-- Adicione mais logos conforme necessário -->
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted } from "vue";
import { Swiper, SwiperSlide } from 'swiper/vue';
import { Navigation, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

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
</script>

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
