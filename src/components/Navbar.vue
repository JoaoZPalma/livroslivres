<template>
  <nav class="sticky top-0 left-0 w-full bg-[#A2D2DF] shadow-lg z-50">
    <div class="md:mx-8 px-4 py-4 flex justify-between items-center">
      <!-- Logo or Association Name -->
      <router-link to="/" @click="closeMenu" class="text-left text-3xl font-medium text-[#2E2E2E]">
        <h1>
          Associação<br>Praça dos Livros Livres
        </h1>      </router-link>

      <!-- Hamburger Menu for Mobile -->
      <button @click="toggleMenu" class="md:hidden text-[#2E2E2E] focus:outline-none">
        <!-- Transition Wrapper -->
        <transition name="fade" mode="out-in">
          <!-- Hamburger Icon -->
          <svg
            v-if="!isOpen"
            key="hamburger"
            class="w-8 h-8"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
          </svg>
          <!-- Cross Icon -->
          <svg
            v-else
            key="cross"
            class="w-8 h-8"
            fill="none"
            viewBox="0 0 24 24"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M20.7457 3.32851C20.3552 2.93798 19.722 2.93798 19.3315 3.32851L12.0371 10.6229L4.74275 3.32851C4.35223 2.93798 3.71906 2.93798 3.32854 3.32851C2.93801 3.71903 2.93801 4.3522 3.32854 4.74272L10.6229 12.0371L3.32856 19.3314C2.93803 19.722 2.93803 20.3551 3.32856 20.7457C3.71908 21.1362 4.35225 21.1362 4.74277 20.7457L12.0371 13.4513L19.3315 20.7457C19.722 21.1362 20.3552 21.1362 20.7457 20.7457C21.1362 20.3551 21.1362 19.722 20.7457 19.3315L13.4513 12.0371L20.7457 4.74272C21.1362 4.3522 21.1362 3.71903 20.7457 3.32851Z"
              fill="currentColor"
            ></path>
          </svg>
        </transition>
      </button>

      <!-- Navbar Links -->
      <div
        :class="{
          'hidden': !isOpen, // Hide on mobile when isOpen is false
          'flex': isOpen, // Show on mobile when isOpen is true
          'md:flex': true, // Always show on desktop
        }"
        class="md:border-none border-t-2 border-b-2 border-double border-[#2E2E2E] absolute md:relative top-24 md:top-0 left-0 w-full md:w-auto bg-[#A2D2DF] md:flex flex-col md:flex-row md:items-center space-y-4 md:space-y-0 md:space-x-6 p-4 md:p-0 shadow md:shadow-none z-50"
      >
        <router-link
          to="/quem-somos"
          @click="closeMenu"
          class="text-xl text-[#2E2E2E] hover:text-[#000] hover:underline transition duration-300 py-2 border-b-2 border-dashed border-[currentColor] md:border-none"
        >
          Quem Somos?
        </router-link>
        <router-link
          to="/loja"
          @click="closeMenu"
          class="text-xl text-[#2E2E2E] hover:text-[#000000] hover:underline transition duration-300 py-2 border-b-2 border-dashed border-[currentColor] md:border-none"
        >
          Loja
        </router-link>
        <router-link
          to="/memorias"
          @click="closeMenu"
          class="text-xl text-[#2E2E2E] hover:text-[#000] hover:underline transition duration-300 py-2 border-b-2 border-dashed border-[currentColor] md:border-none"
        >
          Memorias
        </router-link>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      isOpen: false,
    };
  },
  methods: {
    toggleMenu() {
      this.isOpen = !this.isOpen;
      this.$emit('update:isOpen', this.isOpen); // Emit the updated state
    },
    closeMenu() {
      this.isOpen = false;
      this.$emit('update:isOpen', this.isOpen); // Emit the updated state
    },
  },
};
</script>

<style scoped>
/* Fade transition for the hamburger/cross icons */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.25s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Slide transition for the navigation links */
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.3s ease, opacity 0.3s ease;
}

.slide-enter-from,
.slide-leave-to {
  transform: translateY(-20px);
  opacity: 0;
}
</style>
