<template>
  <nav class="bg-[#A2D2DF] #4F9BAE shadow-lg">
    <div class="md:mx-8 px-4 py-4 flex justify-between items-center">
      <!-- Logo or Association Name -->
      <div class="text-left text-3xl font-medium text-[#2E2E2E]">Associação<br>Praça dos livros livres</div>

      <!-- Hamburger Menu for Mobile -->
      <button @click="toggleMenu" class="md:hidden text-[#2E2E2E] focus:outline-none">
        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
        </svg>
      </button>

      <!-- Navbar Links -->
      <div :class="{'hidden': !isOpen, 'flex': isOpen}" class="absolute md:relative top-24 md:top-0 left-0 w-full md:w-auto bg-[#A2D2DF] md:flex flex-col md:flex-row md:items-center space-y-4 md:space-y-0 md:space-x-6 p-4 md:p-0 shadow md:shadow-none">
        <router-link to="/" class="text-xl text-[#2E2E2E] hover:text-[#000000] hover:underline
          transition duration-300 py-2 border-b border-[#E9B86C] md:border-none">Inicio</router-link>
        <router-link to="/about-us" class="text-xl text-[#2E2E2E] hover:text-[#000] hover:underline
          transition duration-300 py-2 border-b border-[#E9B86C] md:border-none">Quem
          Somos?</router-link>
        <router-link to="loja" class="text-xl text-[#2E2E2E] hover:text-[#000000] hover:underline
          transition duration-300 py-2 border-b border-[#E9B86C] md:border-none">Loja</router-link>
        <router-link to="/memorias" class="text-xl text-[#2E2E2E] hover:text-[#000] hover:underline
          transition duration-300 py-2 border-b border-[#E9B86C] md:border-none">Memorias</router-link>
        <router-link to="/doar" class="text-xl font-medium text-[#2E2E2E] hover:text-[#000]
          hover:underline transition duration-300 py-2 md:py-0">Doar</router-link>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      isOpen: false
    };
  },
  methods: {
    toggleMenu() {
      this.isOpen = !this.isOpen;
    }
  }
};
</script>
