<script setup>
import { ref, onMounted } from "vue";
import CustomButton from '@/components/CustomButton.vue';
import Section from '@/components/Section.vue';
import PrivacyPolicy from '@/components/PrivacyPolicy.vue';
import Mapa from '@/components/Mapa.vue';
import { useSeoMeta } from '@unhead/vue'

const sections = ref([]);
const activeSection = ref(null);
const enderecoEvento = ref("");
const showPrivacyPolicy = ref(false);
const showDonationForm = ref(false);

function handleEnderecoCarregado(endereco) {
  enderecoEvento.value = endereco;
}

const scrollToSection = (sectionId) => {
  const section = document.getElementById(sectionId);
  if (section) {
    section.scrollIntoView({ behavior: "smooth", block: "start" });

    activeSection.value = sectionId;

    setTimeout(() => {
      activeSection.value = null;
    }, 2000);
  }
};

function openPrivacyPolicy() {
  showPrivacyPolicy.value = true;
}

function closePrivacyPolicy() {
  showPrivacyPolicy.value = false;
}

const toggleDonationForm = () => {
  showDonationForm.value = !showDonationForm.value;
}


onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      }
    });
  }, {
    threshold: 0.2
  });

  sections.value = document.querySelectorAll('.fade-in');
  sections.value.forEach(section => {
    observer.observe(section);
  })
})

useSeoMeta({
  title: 'Início | Praça dos Livros Livres',
  description: 'Descobre a Praça dos Livros Livres em Tavira! Oferecemos festas temáticas, leituras interativas, oficinas criativas e eventos para escolas e famílias!',
  keywords: 'Tavira, Algarve, eventos para crianças, workshops criativos, sessões de leitura, sem fins lucrativos, praca dos livros livres',
  ogTitle: 'Início | Praça dos Livros Livres',
  ogDescription: 'Descobre a Praça dos Livros Livres, eventos para crianças em Tavira',
  ogImage: 'https://www.pracadoslivroslivres.org/favicon.ico'
})

</script>

<template>
  <div class="p-6">
    <PrivacyPolicy :isOpen="showPrivacyPolicy" @close="closePrivacyPolicy" />
    <!-- First Section -->
    <Section>
      <div class="flex flex-col md:flex-row space-y-6 md:space-y-0 md:space-x-8">
        <!-- Text content -->
        <div class="flex-1 text-center md:text-left space-y-4">
          <h2 class="font-bold text-2xl md:text-4xl">Se quer entretenimento saudável e estimulante para os mais
            pequenos...</h2>
          <p class="text-lg md:text-xl">Descubra o mundo mágico dos livros que inspiram a imaginação e cultivam o amor
            pela leitura desde cedo!</p>
          <div class="mt-6">
            <p class="text-lg md:text-xl font-semibold">Oferecemos experiências únicas e memoráveis para crianças e
              famílias:</p>
            <ul
              class="text-lg md:text-xl ml-2 md:list-disc list-inside space-y-3 mt-3 text-centertext-center  md:text-left">
              <li class="gap-2">🎉 Festas de aniversário temáticas</li>
              <li class="gap-2">📖 Sessões de leitura de contos interativas</li>
              <li class="gap-2">🎨 Oficinas criativas e educativas</li>
              <li class="gap-2">🌟 Eventos especiais para escolas e comunidades</li>
            </ul>
          </div>
        </div>

        <!-- Image -->
        <div class="w-full max-w-xs mx-auto md:max-w-sm md:w-1/3">
          <img src="/fotoEventoExemplo.jpg" alt="Exposição da atividade"
            class="w-full h-auto object-cover rounded-lg border-4 border-[#E9B86C] hover:scale-105 transition-transform duration-300" />
        </div>
      </div>

      <!-- Call to action -->
      <div class="flex flex-col items-center mt-6 space-y-3 text-center">
        <p class="font-light text-lg">Traga magia e diversão para o seu evento connosco!</p>
        <CustomButton @click="scrollToSection('contactos')" class="flex items-center gap-2">
          <span>Reserve já o seu evento!</span>
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path>
          </svg>
        </CustomButton>
      </div>
    </Section>

    <!-- Event Section -->
    <Section>
      <div class="flex flex-col md:flex-row items-center gap-4 md:gap-12 justify-center">
        <div class="w-72 h-auto flex-shrink-0">
          <Mapa :idEvento=1 @endereco-carregado="handleEnderecoCarregado" />
        </div>
        <div class="text-center md:text-left">
          <h2 class="font-bold text-xl md:text-2xl">Próximo Evento, esperamos por si!</h2>
          <p v-if="enderecoEvento" class="mt-2">Localização:<br> {{ enderecoEvento }}</p>
        </div>

      </div>
    </Section>

    <!-- About Section -->
    <Section class="flex flex-col md:flex-row text-center">
      <!-- Texto e Botão -->
      <div class="flex-1 md:text-left md:pr-6">
        <p class="mt-4 lg:mt-0">
          Somos uma organização sem fins lucrativos... Lorem Ipsum is simply dummy text of the printing and typesetting
          industry...
        </p>
      </div>

      <!-- Imagem -->
      <div class="w-max mx-auto md:ml-6 flex flex-col md:items-end items-center mt-4">
        <div class="flex flex-col items-center">
          <img src="/logo.jpg" alt="Exposição da atividade"
            class="w-32 h-auto object-cover rounded-lg border-4 border-[#E9B86C]" />
          <CustomButton @click="toggleDonationForm" :class="['mt-4 w-44',
            showDonationForm ? 'border-2 border-[#c49a5c]' : ' ']">
            {{ showDonationForm ? 'Cancelar' : 'Realizar doação' }}
          </CustomButton>
        </div>
        <div v-if="showDonationForm" class="w-max flex flex-col items-end">
          <form target="_blank" action="https://formsubmit.co/pracadoslivroslivres@gmail.com" method="POST"
            class="space-y-4">
            <input type="hidden" name="mensagem" value="Doação via website"></input>
            <!-- <input type="hidden" name="_next" value="https://yourdomain.co/thanks.html"> -->
            <input type="hidden" name="_subject" value="Doação via website">
            <input type="hidden" name="_template" value="table">
            <div class="flex flex-col md:flex-row gap-4">
              <input type="text" name="nome" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg" placeholder="Nome"
                required>
              <input type="text" name="apelido" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg"
                placeholder="Apelido" required>
            </div>

            <div class="flex flex-col md:flex-row gap-4">
              <!-- Input para o número de telemóvel -->
              <input type="text" name="telemovel" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg"
                placeholder="Número de Telemóvel" pattern="^(9\d{8}|2\d{8})$" title="Telemovel do estilo XXXXXXXXX"
                required />

              <!-- Contêiner para o input de valor com o símbolo de euro -->
              <div class="relative w-full">
                <input type="text" name="valor" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg pr-8"
                  placeholder="Valor (ex: 10,00)" required pattern="\d+(,\d{2})?"
                  title="Por favor, insira um valor monetário válido (ex: 10,00)" />
                <!-- Símbolo de euro -->
                <span class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">€</span>
              </div>
            </div>
            <CustomButton type="submit">
              Enviar pedido de doação
            </CustomButton>
          </form>
        </div>
      </div>
    </Section>

    <Section>
      <div class="flex flex-col md:flex-row gap-6 md:gap-24 items-center justify-center">
        <div class="text-center md:text-left">
          <h2 class="font-bold text-xl md:text-3xl">Inscreva-se já na nossa Newsletter!</h2>
          <p class="mt-1">E receba as mais novas novidades e avisos de futuros eventos!</p>
          <p class="mt-1 font-light">Sabe mais sobre a nossa
            <span class="underline cursor-pointer hover:font-normal" @click="openPrivacyPolicy">
              Política de Privacidade!
            </span>
          </p>
        </div>
        <div class="">
          <form target="_blank" action="https://formsubmit.co/pracadoslivroslivres@gmail.com" method="POST"
            class="space-y-4">
            <input type="hidden" name="mensagem" value="Inscrição na Newsletter"></input>
            <!-- <input type="hidden" name="_next" value="https://yourdomain.co/thanks.html"> -->
            <input type="hidden" name="_subject" value="Nova inscrição na Newsletter!">
            <input type="hidden" name="_template" value="table">
            <div class="flex flex-col md:flex-row gap-4">
              <input type="text" name="nome" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg" placeholder="Nome"
                required>
              <input type="text" name="apelido" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg"
                placeholder="Apelido" required>
            </div>
            <input type="email" name="email" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg"
              placeholder="Endereço de Email" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required>

            <div class="flex flex-col md:flex-row gap-y-2 md:gap-y-0 md:gap-x-2 items-center">
              <CustomButton type="submit">
                Inscrever-me!
              </CustomButton>
              <label class="flex items-center gap-2">
                <input type="checkbox" name="consent" required
                  oninvalid="this.setCustomValidity('Para prosseguir, preencha a caixa a confirmar que concorda em receber emails com novidades!')"
                  oninput="this.setCustomValidity('')">
                Concordo em receber e-mails com novidades.
              </label>
            </div>
          </form>
        </div>
      </div>
    </Section>

    <!-- Footer -->
    <Section id="contactos"
      :class="['fade-in bg-[#F6EFBD] p-6 shadow flex flex-col md:flex-row items-center justify-around space-y-2 md:space-y-0 md:space-x-8 text-center border-t-4 border-b-4 border-[#E9B86C]', activeSection === 'contactos' ? 'pulse-effect' : 'fade-in visible']">
      <div class="flex items-center space-x-1">
        <svg class="w-6 h-6" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd"
            d="M12 18C15.3137 18 18 15.3137 18 12C18 8.68629 15.3137 6 12 6C8.68629 6 6 8.68629 6 12C6 15.3137 8.68629 18 12 18ZM12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16Z"
            fill="currentColor"></path>
          <path
            d="M18 5C17.4477 5 17 5.44772 17 6C17 6.55228 17.4477 7 18 7C18.5523 7 19 6.55228 19 6C19 5.44772 18.5523 5 18 5Z"
            fill="currentColor"></path>
          <path fill-rule="evenodd" clip-rule="evenodd"
            d="M1.65396 4.27606C1 5.55953 1 7.23969 1 10.6V13.4C1 16.7603 1 18.4405 1.65396 19.7239C2.2292 20.8529 3.14708 21.7708 4.27606 22.346C5.55953 23 7.23969 23 10.6 23H13.4C16.7603 23 18.4405 23 19.7239 22.346C20.8529 21.7708 21.7708 20.8529 22.346 19.7239C23 18.4405 23 16.7603 23 13.4V10.6C23 7.23969 23 5.55953 22.346 4.27606C21.7708 3.14708 20.8529 2.2292 19.7239 1.65396C18.4405 1 16.7603 1 13.4 1H10.6C7.23969 1 5.55953 1 4.27606 1.65396C3.14708 2.2292 2.2292 3.14708 1.65396 4.27606ZM13.4 3H10.6C8.88684 3 7.72225 3.00156 6.82208 3.0751C5.94524 3.14674 5.49684 3.27659 5.18404 3.43597C4.43139 3.81947 3.81947 4.43139 3.43597 5.18404C3.27659 5.49684 3.14674 5.94524 3.0751 6.82208C3.00156 7.72225 3 8.88684 3 10.6V13.4C3 15.1132 3.00156 16.2777 3.0751 17.1779C3.14674 18.0548 3.27659 18.5032 3.43597 18.816C3.81947 19.5686 4.43139 20.1805 5.18404 20.564C5.49684 20.7234 5.94524 20.8533 6.82208 20.9249C7.72225 20.9984 8.88684 21 10.6 21H13.4C15.1132 21 16.2777 20.9984 17.1779 20.9249C18.0548 20.8533 18.5032 20.7234 18.816 20.564C19.5686 20.1805 20.1805 19.5686 20.564 18.816C20.7234 18.5032 20.8533 18.0548 20.9249 17.1779C20.9984 16.2777 21 15.1132 21 13.4V10.6C21 8.88684 20.9984 7.72225 20.9249 6.82208C20.8533 5.94524 20.7234 5.49684 20.564 5.18404C20.1805 4.43139 19.5686 3.81947 18.816 3.43597C18.5032 3.27659 18.0548 3.14674 17.1779 3.0751C16.2777 3.00156 15.1132 3 13.4 3Z"
            fill="currentColor"></path>
        </svg>
        <a href="https://www.instagram.com/pracadoslivroslivres" target="_blank"
          class="text-[#2E2E2E] hover:text-[#D17A22] underline">@pracadoslivroslivres</a>
      </div>
      <div class="flex items-center space-x-1">
        <svg class="w-6 h-6" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
          <path
            d="M6.62 10.79a15.91 15.91 0 006.58 6.58l2.2-2.2c.27-.27.66-.36 1.02-.24a10.05 10.05 0 003.16.51c.55 0 1 .45 1 1v3.34c0 .55-.45 1-1 1A19.91 19.91 0 012 4c0-.55.45-1 1-1h3.34c.55 0 1 .45 1 1 0 1.1.17 2.17.51 3.16.12.36.03.75-.24 1.02l-2.2 2.2z" />
        </svg>
        <a href="tel:936121122" class="hover:text-[#D17A22] underline">936121122</a>
      </div>
      <div class="flex items-center space-x-1">
        <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path
            d="M21 8L17.4392 9.97822C15.454 11.0811 14.4614 11.6326 13.4102 11.8488C12.4798 12.0401 11.5202 12.0401 10.5898 11.8488C9.53864 11.6326 8.54603 11.0811 6.5608 9.97822L3 8M6.2 19H17.8C18.9201 19 19.4802 19 19.908 18.782C20.2843 18.5903 20.5903 18.2843 20.782 17.908C21 17.4802 21 16.9201 21 15.8V8.2C21 7.0799 21 6.51984 20.782 6.09202C20.5903 5.71569 20.2843 5.40973 19.908 5.21799C19.4802 5 18.9201 5 17.8 5H6.2C5.0799 5 4.51984 5 4.09202 5.21799C3.71569 5.40973 3.40973 5.71569 3.21799 6.09202C3 6.51984 3 7.07989 3 8.2V15.8C3 16.9201 3 17.4802 3.21799 17.908C3.40973 18.2843 3.71569 18.5903 4.09202 18.782C4.51984 19 5.07989 19 6.2 19Z"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
        <a href="mailto:pracadoslivroslivres@gmail.com" class="hover:text-[#D17A22]
          underline">pracadoslivroslivres@gmail.com</a>
      </div>
      <div class="flex items-center space-x-1">
        <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M2 6C2 3.79086 3.79086 2 6 2H18C20.2091 2
            22 3.79086 22 6V18C22 20.2091 20.2091 22 18 22H6C3.79086 22 2 20.2091 2 18V6ZM6
            4C4.89543 4 4 4.89543 4 6V18C4 19.1046 4.89543 20 6 20H12V13H11C10.4477 13 10 12.5523 10
            12C10 11.4477 10.4477 11 11 11H12V9.5C12 7.567 13.567 6 15.5 6H16.1C16.6523 6 17.1
            6.44772 17.1 7C17.1 7.55228 16.6523 8 16.1 8H15.5C14.6716 8 14 8.67157 14
            9.5V11H16.1C16.6523 11 17.1 11.4477 17.1 12C17.1 12.5523 16.6523 13 16.1
            13H14V20H18C19.1046 20 20 19.1046 20 18V6C20 4.89543 19.1046 4 18 4H6Z" fill="currentColor"></path>
        </svg>
        <a href="https://www.facebook.com/people/Associa%C3%A7%C3%A3o-Pra%C3%A7a-dos-Livros-Livres/61558057513441/"
          target="_blank" class="text-[#2E2E2E] hover:text-[#D17A22] underline">@pracadoslivroslivres</a>
      </div>
    </Section>
  </div>
</template>


<style>
.fade-in {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}

.fade-in.visible {
  opacity: 1;
  transform: translateY(0);
}
</style>
