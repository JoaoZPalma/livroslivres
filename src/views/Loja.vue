<script setup>
import { ref, computed, onMounted } from "vue";
import CustomButton from "@/components/CustomButton.vue";
const produtos = ref([]);
const selectedProducts = ref([]); // Armazena os produtos selecionados e suas quantidades
const mobileNumber = ref(""); // Armazena o número de telemóvel
const nome = ref(""); // Armazena o nome
const apelido = ref(""); // Armazena o apelido
const morada = ref(""); // Armazena a morada

// Carregar produtos
async function carregarProdutos() {
  const arquivos = import.meta.glob('@/produtosData/*.json');

  for (const path in arquivos) {
    const produto = await arquivos[path]();
    produtos.value.push(produto);
  }
  produtos.value.sort((a, b) => b.id - a.id);
}

// Inicializar selectedProducts com quantidades padrão (0)
function initializeSelectedProducts() {
  // Verificar se há dados salvos no sessionStorage
  const savedSelectedProducts = sessionStorage.getItem("selectedProducts");
  if (savedSelectedProducts) {
    selectedProducts.value = JSON.parse(savedSelectedProducts);
  } else {
    selectedProducts.value = produtos.value.map((produto) => ({
      id: produto.id,
      nome: produto.nome,
      preco: produto.preco,
      quantidade: 0, // Quantidade padrão
      estado: produto.estado,
    }));
  }
}

// Incrementar quantidade de um produto
function incrementQuantity(produtoId) {
  const selectedProduct = selectedProducts.value.find((p) => p.id === produtoId);
  if (selectedProduct) {
    selectedProduct.quantidade += 1;
    saveSelectedProducts(); // Salvar no sessionStorage
  }
}

// Decrementar quantidade de um produto
function decrementQuantity(produtoId) {
  const selectedProduct = selectedProducts.value.find((p) => p.id === produtoId);
  if (selectedProduct && selectedProduct.quantidade > 0) {
    selectedProduct.quantidade -= 1;
    saveSelectedProducts(); // Salvar no sessionStorage
  }
}

// Salvar selectedProducts no sessionStorage
function saveSelectedProducts() {
  sessionStorage.setItem("selectedProducts", JSON.stringify(selectedProducts.value));
}

// Calcular o preço total dos produtos selecionados
function calculateTotalPrice() {
  const total = selectedProducts.value.reduce((total, product) => {
    return total + product.preco * product.quantidade;
  }, 0);

  // Ensure the total has exactly 2 decimal places
  return parseFloat(total.toFixed(2));
}

function clearSelectedProducts() {
  sessionStorage.removeItem("selectedProducts");
  selectedProducts.value = produtos.value.map((produto) => ({
    id: produto.id,
    nome: produto.nome,
    preco: produto.preco,
    quantidade: 0, // Reset quantity to 0
    estado: produto.estado,
  }));
}

function safelyClearSelectedProducts() {
  if (!validateForm()){
    return;
  }
  clearSelectedProducts();
}

// Criar uma string com os produtos selecionados
const produtosSelecionadosString = computed(() => {
  return selectedProducts.value
    .filter((p) => p.quantidade > 0) // Filtra apenas produtos com quantidade > 0
    .map((p) => `${p.nome} (${p.quantidade} x ${p.preco}€)`) // Formata cada produto
    .join(", "); // Junta todos os produtos em uma única string
});

function validateForm() {
  if (!nome.value || !apelido.value || !morada.value || !mobileNumber.value) {
    alert("Por favor, preencha todos os campos do formulário para realizar essa ação!");
    return false;
  }
  return true;
}

// Carregar produtos e inicializar selectedProducts
carregarProdutos().then(() => {
  initializeSelectedProducts();
});
</script>

<template>
  <div>
    <!-- Seção de Produtos -->
    <div class="p-6">
      <h1 class="text-center text-3xl font-bold mb-4">Produtos</h1>
      <div class="grid grid-cols-2 md:grid-cols-2 lg:grid-cols-6 gap-4">
        <div
          v-for="produto in produtos"
          :key="produto.id"
          class="product-card"
          :class="{
            'bg-[#F6EFBD] border-4 border-[#E9B86C]': produto.estado === 1,
            'bg-[#e5e4dc] border-4 border-[#E9B86C]': produto.estado === 0
          }"
        >
          <router-link
            :to="'loja/produtos/' + produto.id"
            class="w-full h-full flex flex-col items-center justify-between"
          >
            <div class="relative flex items-center justify-center h-32 w-32 md:h-48 md:w-48 overflow-hidden">
              <img
              v-for="(imagem, index) in produto.imagens.slice(0, 1)"
              :key="index"
              :src="imagem"
              alt="Imagem do produto"
              class="w-full h-48 object-cover rounded"
            />
            </div>

            <h2 class="text-xl font-semibold text-center">{{ produto.nome }}</h2>
            <p class="text-gray-600 md:h-3 text-center">{{ produto.preco }}€</p>

            <p
              :class="{
                'text-red-500': produto.estado === 0,
                'text-green-500': produto.estado === 1
              }"
              class="text-sm text-center"
            >
              {{ produto.estado === 0 ? 'Fora de stock' : 'Em stock' }}
            </p>
          </router-link>

          <div v-if="produto.estado === 1" class="quantity-controls">
            <button
              @click.stop="decrementQuantity(produto.id)"
              class="px-2 py-1 bg-[#E9B86C] rounded hover:bg-[#D9A65C]"
              :disabled="selectedProducts.find((p) => p.id === produto.id)?.quantidade === 0"
            >
              -
            </button>
            <span class="flex items-center justify-center">{{ selectedProducts.find((p) => p.id === produto.id)?.quantidade || 0 }}</span>
            <button
              @click.stop="incrementQuantity(produto.id)"
              class="px-2 py-1 bg-[#E9B86C] rounded hover:bg-[#D9A65C]"
            >
              +
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Resumo da Compra -->
    <div class="p-6">
      <h2 class="text-2xl font-bold mb-4">Resumo da Compra</h2>
      <div v-if="selectedProducts.some((p) => p.quantidade > 0)">
        <div v-for="product in selectedProducts" :key="product.id">
          <div v-if="product.quantidade > 0" class="flex justify-between items-center mb-2">
            <span>{{ product.nome }} ({{ product.quantidade }} x {{ product.preco }}€)</span>
            <span>{{ ( product.quantidade * product.preco ).toFixed(2) }}€</span>
          </div>
        </div>
        <div class="mt-4 font-bold">
          Total: {{ calculateTotalPrice() }}€
        </div>
        <div class="flex justify-end w-full items-center">
          <CustomButton @click="clearSelectedProducts">
            Limpar carrinho
          </CustomButton>
        </div>
      </div>
      <div v-else>
        <p>Nenhum produto selecionado.</p>
      </div>
    </div>

    <!-- Formulário de Finalização da Compra -->
    <div class="p-6">
      <h2 class="text-2xl font-bold mb-4">Finalizar Compra</h2>
      <form
        target="_blank"
        action="https://formsubmit.co/pracadoslivroslivres@gmail.com"
        method="POST"
        class="space-y-4"
      >
        <!-- Campos Ocultos para Formsubmit -->
        <input type="hidden" name="mensagem" value="Novo pedido de compra!">
        <input type="hidden" name="_subject" value="Novo pedido de compra!">
        <input type="hidden" name="_next" value="http://192.168.1.64:5173/">
        <input type="hidden" name="_template" value="table">

        <!-- Nome e Apelido -->
        <div class="flex flex-col md:flex-row gap-4">
          <input
          v-model="nome"
          type="text"
          name="nome"
          class="w-full p-2 border-2 border-[#E9B86C] rounded-lg"
          placeholder="Nome"
          required
        />
          <input
          v-model="apelido"
          type="text"
          name="apelido"
          class="w-full p-2 border-2 border-[#E9B86C] rounded-lg"
          placeholder="Apelido"
          required
        />
        </div>

        <!-- Morada -->
        <input
        v-model="morada"
        type="text"
        name="morada"
        class="w-full p-2 border-2 border-[#E9B86C] rounded-lg"
        placeholder="Morada"
        required
      />

        <!-- Número de Telemóvel -->
        <input
        v-model="mobileNumber"
        type="tel"
        name="telemovel"
        class="w-full p-2 border-2 border-[#E9B86C] rounded-lg"
        placeholder="Número de Telemóvel"
        required
      />

        <!-- Produtos Selecionados (String Estática) -->
        <input
        type="hidden"
        name="produtos"
        :value="produtosSelecionadosString"
      />

        <!-- Total (Campo Estático) -->
        <input
        type="hidden"
        name="total"
        :value="calculateTotalPrice()"
      />

        <!-- Botão de Submissão -->
        <button
          type="submit"
          class="px-4 py-2 bg-[#E9B86C] font-semibold rounded-lg hover:bg-[#D9A65C]"
        >
          Realizar pedido!
        </button>
      </form>
    </div>
  </div>
</template>

<style scoped>
/* Estilos para o card */
.aspect-square {
  aspect-ratio: 1 / 1; /* Garante uma proporção 1:1 */
  width: 100%; /* Ocupa a largura total da coluna da grid */
}

.product-card {
  width: 100%; /* Ensure the card takes up the full width of the grid column */
  height: 100%; /* Ensure the card takes up the full height of the grid row */
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  padding: 1rem; /* Add padding to the cards */
}

/* Ensure images have the same size */
.product-card img {
  width: 100%; /* Ensure the image takes up the full width of the card */
  height: 150px; /* Set a fixed height for the images */
  object-fit: cover; /* Ensure the image covers the area without distortion */
}

/* Ensure the product name and price are aligned */
.product-card h2,
.product-card p {
  margin: 0.5rem 0; /* Add some margin for spacing */
}

/* Ensure the quantity buttons are aligned */
.quantity-controls {
  display: flex;
  gap: 0.5rem; /* Add some gap between the buttons */
}

/* Ajustar o tamanho da imagem para caber dentro do quadrado */
.h-48 {
  height: 12rem; /* Ajustar conforme necessário */
}

.w-48 {
  width: 12rem; /* Ajustar conforme necessário */
}

/* Posicionar os botões de + e - corretamente */
.relative {
  position: relative;
}

.flex.items-center.gap-2.mt-2 {
  position: absolute;
  bottom: 1rem;
  left: 50%;
  transform: translateX(-50%);
}
</style>
