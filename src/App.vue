<script setup>
import { ref } from 'vue';
import { RouterView } from 'vue-router';
import Navbar from './components/Navbar.vue';

const isNavbarOpen = ref(false);

</script>

<template>
  <Navbar class="z-50" @update:isOpen="(value) => (isNavbarOpen = value)" />
  <div :class="{'blur-sm' : isNavbarOpen}">
    <router-view class="min-h-screen bg-[#A2D2DF] text-[#2E2E2E] space-y-6"/>
  </div>
</template>
