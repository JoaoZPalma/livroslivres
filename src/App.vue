<script setup>
import { RouterView } from 'vue-router';
import Navbar from './components/Navbar.vue';
</script>

<template>
  <Navbar class="z-50"/>
  <router-view class="min-h-screen bg-gradient-to-b from-[#A2D2DF] to-[#D9EDF2] text-[#2E2E2E] space-y-6"/>
</template>
