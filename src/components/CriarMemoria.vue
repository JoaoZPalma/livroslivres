<template>
  <div>
    <h2>Criar Memória</h2>
    <form @submit.prevent="handleCriarMemoria">
      <input v-model="titulo" placeholder="Título" required />
      <textarea v-model="descricao" placeholder="Descrição" required></textarea>
      <button type="submit">Criar</button>
    </form>
    <p v-if="errorMessage">{{ errorMessage }}</p>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useMemoria } from "@/services/memoriaService.js";

const { criarMemoria } = useMemoria();

const titulo = ref("");
const descricao = ref("");
const errorMessage = ref("");

const handleCriarMemoria = async () => {
  try {
    await criarMemoria(titulo.value, descricao.value);
    errorMessage.value = "Memória criada com sucesso!";
  } catch (error) {
    errorMessage.value = error.message;
  }
};
</script>
