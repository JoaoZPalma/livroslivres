<script setup>
import { ref } from "vue";
import CustomButton  from '@/components/CustomButton.vue';
import PrivacyPolicy  from '@/components/PrivacyPolicy.vue';
import Mapa from '@/components/Mapa.vue';

const activeSection = ref(null);
const enderecoEvento = ref("");
const showPrivacyPolicy = ref(false);

function handleEnderecoCarregado(endereco){
  enderecoEvento.value=endereco;
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

function openPrivacyPolicy(){
  showPrivacyPolicy.value = true;
  console.log("Ta andar?")
}

function closePrivacyPolicy(){
  showPrivacyPolicy.value = false;
}

</script>

<template>
  <div>
    <PrivacyPolicy :isOpen="showPrivacyPolicy" @close="closePrivacyPolicy" />
    <!-- First Section -->
    <div class="bg-[#F6EFBD] p-6 shadow border-t-4 border-b-4 border-[#E9B86C]">
      <div class="flex flex-col md:flex-row space-y-4 md:space-y-0 md:space-x-6">
        <!-- Text content -->
        <div class="flex-1 text-center md:text-left">
          <h2 class="font-bold text-xl md:text-3xl">Se quer entretenimento saudável e estimulante para os mais pequenos...</h2>
          <p class="md:text-xl md:mt-2">Descubra o mundo mágico dos livros que inspiram a imaginação e cultivam o amor pela leitura desde cedo!</p>
          <p class="hidden md:block md:text-xl md:mt-2">Damn bro este texto não aparece no mobile</p>

        </div>

        <!-- Image -->
        <div class="w-full max-w-xs mx-auto md:max-w-sm md:w-1/3">
          <img
          src="/iwantyoutobemineagainbaby.jpg"
          alt="Exposição da atividade"
          class="w-full h-auto object-cover rounded-lg border-4 border-[#E9B86C]"
        />
        </div>
      </div>

      <!-- Call to action -->
      <div class="flex flex-col items-center mt-4 space-y-2">
        <p class="font-light">Interessado?</p>
        <CustomButton @click.prevent="scrollToSection('contactos')">
          Veja como nos pode contactar!
        </CustomButton>
      </div>
    </div>

    <!-- Event Section -->
    <div class="bg-[#F6EFBD] p-6 shadow text-center border-t-4 border-b-4 border-[#E9B86C]">
      <div class="flex flex-col md:flex-row items-center gap-4 md:gap-12 justify-center">
        <div class="w-72 h-auto flex-shrink-0">
          <Mapa :idEvento=1 @endereco-carregado="handleEnderecoCarregado" />
        </div>
        <div class="text-center md:text-left">
          <h2 class="font-bold text-xl md:text-2xl">Próximo Evento, vem nos ver!</h2>
          <p v-if="enderecoEvento" class="mt-2">Localização:<br> {{ enderecoEvento }}</p>
        </div>

      </div>
    </div>

    <!-- About Section -->
    <div class="flex flex-col md:flex-row bg-[#F6EFBD] p-6 shadow text-center border-t-4 border-b-4 border-[#E9B86C]">
      <!-- Texto e Botão -->
      <div class="flex-1 md:text-left md:pr-6">
        <p class="mt-4 lg:mt-0">
          Somos uma organização sem fins lucrativos... Lorem Ipsum is simply dummy text of the printing and typesetting industry...
        </p>
      </div>

      <!-- Imagem -->
      <div class="w-max mx-auto md:ml-6 flex flex-col items-center mt-4">
        <img
        src="/icondaorganizacao.jpg"
        alt="Exposição da atividade"
        class="w-32 h-auto object-cover rounded-lg border-4 border-[#E9B86C]"
      />
        <CustomButton class="mt-4">
          Realizar doação
        </CustomButton>
      </div>
    </div>

<div class="bg-[#F6EFBD] p-6 shadow text-center border-t-4 border-b-4 border-[#E9B86C]">
  <div class="flex flex-col md:flex-row gap-6 md:gap-24 items-center justify-center">
    <div class="text-center md:text-left">
      <h2 class="font-bold text-xl md:text-3xl">Inscreve-te já na nossa Newsletter!</h2>
      <p class="mt-1">E recebe as mais novas novidades e avisos de futuros eventos!</p>
          <p class="mt-1 font-light">Sabe mais sobre a nossa
            <span class="underline cursor-pointer hover:font-normal" @click="openPrivacyPolicy">
              política de privacidade!
            </span>
          </p>
        </div>
        <div class="">
          <form target="_blank" action="https://formsubmit.co/pracadoslivroslivres@gmail.com" method="POST" class="space-y-4">
            <div class="flex flex-col md:flex-row gap-4">
              <input type="text" name="nome" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg" placeholder="Nome" required>
              <input type="text" name="apelido" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg" placeholder="Apelido" required>
            </div>
            <input type="email" name="email" class="w-full p-2 border-2 border-[#E9B86C] rounded-lg" placeholder="Endereço de Email" required>
            <input type="hidden" name="mensagem" value="Inscrição na Newsletter"></input>
            <div class="flex flex-col md:flex-row gap-y-2 md:gap-y-0 md:gap-x-2 items-center">
              <CustomButton type="submit">
                Inscrever-me!
              </CustomButton>
              <label class="flex items-center gap-2">
                <input
                  type="checkbox"
                  name="consent"
                  required
                  oninvalid="this.setCustomValidity('Para prosseguir, preencha a caixa a confirmar que concorda em receber emails com novidades!')"
                  oninput="this.setCustomValidity('')"
                >
                Concordo em receber e-mails com novidades.
              </label>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <div id="contactos" :class="['bg-[#F6EFBD] p-6 shadow flex flex-col md:flex-row items-center justify-around space-y-2 md:space-y-0 md:space-x-8 text-center border-t-4 border-b-4 border-[#E9B86C]', activeSection === 'contactos' ? 'pulse-effect' : '']">        <div class="flex items-center space-x-1">
      <svg class="w-6 h-6" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 18C15.3137 18 18 15.3137 18 12C18 8.68629 15.3137 6 12 6C8.68629 6 6 8.68629 6 12C6 15.3137 8.68629 18 12 18ZM12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16Z" fill="currentColor"></path>
        <path d="M18 5C17.4477 5 17 5.44772 17 6C17 6.55228 17.4477 7 18 7C18.5523 7 19 6.55228 19 6C19 5.44772 18.5523 5 18 5Z" fill="currentColor"></path>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M1.65396 4.27606C1 5.55953 1 7.23969 1 10.6V13.4C1 16.7603 1 18.4405 1.65396 19.7239C2.2292 20.8529 3.14708 21.7708 4.27606 22.346C5.55953 23 7.23969 23 10.6 23H13.4C16.7603 23 18.4405 23 19.7239 22.346C20.8529 21.7708 21.7708 20.8529 22.346 19.7239C23 18.4405 23 16.7603 23 13.4V10.6C23 7.23969 23 5.55953 22.346 4.27606C21.7708 3.14708 20.8529 2.2292 19.7239 1.65396C18.4405 1 16.7603 1 13.4 1H10.6C7.23969 1 5.55953 1 4.27606 1.65396C3.14708 2.2292 2.2292 3.14708 1.65396 4.27606ZM13.4 3H10.6C8.88684 3 7.72225 3.00156 6.82208 3.0751C5.94524 3.14674 5.49684 3.27659 5.18404 3.43597C4.43139 3.81947 3.81947 4.43139 3.43597 5.18404C3.27659 5.49684 3.14674 5.94524 3.0751 6.82208C3.00156 7.72225 3 8.88684 3 10.6V13.4C3 15.1132 3.00156 16.2777 3.0751 17.1779C3.14674 18.0548 3.27659 18.5032 3.43597 18.816C3.81947 19.5686 4.43139 20.1805 5.18404 20.564C5.49684 20.7234 5.94524 20.8533 6.82208 20.9249C7.72225 20.9984 8.88684 21 10.6 21H13.4C15.1132 21 16.2777 20.9984 17.1779 20.9249C18.0548 20.8533 18.5032 20.7234 18.816 20.564C19.5686 20.1805 20.1805 19.5686 20.564 18.816C20.7234 18.5032 20.8533 18.0548 20.9249 17.1779C20.9984 16.2777 21 15.1132 21 13.4V10.6C21 8.88684 20.9984 7.72225 20.9249 6.82208C20.8533 5.94524 20.7234 5.49684 20.564 5.18404C20.1805 4.43139 19.5686 3.81947 18.816 3.43597C18.5032 3.27659 18.0548 3.14674 17.1779 3.0751C16.2777 3.00156 15.1132 3 13.4 3Z" fill="currentColor"></path>
      </svg>
      <a href="https://www.instagram.com/pracadoslivroslivres" target="_blank"
        class="text-[#2E2E2E] hover:text-[#D17A22] underline">@pracadoslivroslivres</a>
    </div>
      <div class="flex items-center space-x-1">
        <svg class="w-6 h-6" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
          <path d="M6.62 10.79a15.91 15.91 0 006.58 6.58l2.2-2.2c.27-.27.66-.36 1.02-.24a10.05 10.05 0 003.16.51c.55 0 1 .45 1 1v3.34c0 .55-.45 1-1 1A19.91 19.91 0 012 4c0-.55.45-1 1-1h3.34c.55 0 1 .45 1 1 0 1.1.17 2.17.51 3.16.12.36.03.75-.24 1.02l-2.2 2.2z"/>
        </svg>
        <span>241031836</span>
      </div>
      <div class="flex items-center space-x-1">
        <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M21 8L17.4392 9.97822C15.454 11.0811 14.4614 11.6326 13.4102 11.8488C12.4798 12.0401 11.5202 12.0401 10.5898 11.8488C9.53864 11.6326 8.54603 11.0811 6.5608 9.97822L3 8M6.2 19H17.8C18.9201 19 19.4802 19 19.908 18.782C20.2843 18.5903 20.5903 18.2843 20.782 17.908C21 17.4802 21 16.9201 21 15.8V8.2C21 7.0799 21 6.51984 20.782 6.09202C20.5903 5.71569 20.2843 5.40973 19.908 5.21799C19.4802 5 18.9201 5 17.8 5H6.2C5.0799 5 4.51984 5 4.09202 5.21799C3.71569 5.40973 3.40973 5.71569 3.21799 6.09202C3 6.51984 3 7.07989 3 8.2V15.8C3 16.9201 3 17.4802 3.21799 17.908C3.40973 18.2843 3.71569 18.5903 4.09202 18.782C4.51984 19 5.07989 19 6.2 19Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
        <span>pracadoslivroslivres@gmail.com</span>
      </div>
      <div class="flex items-center space-x-1">
        <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M2 6C2 3.79086 3.79086 2 6 2H18C20.2091 2
            22 3.79086 22 6V18C22 20.2091 20.2091 22 18 22H6C3.79086 22 2 20.2091 2 18V6ZM6
            4C4.89543 4 4 4.89543 4 6V18C4 19.1046 4.89543 20 6 20H12V13H11C10.4477 13 10 12.5523 10
            12C10 11.4477 10.4477 11 11 11H12V9.5C12 7.567 13.567 6 15.5 6H16.1C16.6523 6 17.1
            6.44772 17.1 7C17.1 7.55228 16.6523 8 16.1 8H15.5C14.6716 8 14 8.67157 14
            9.5V11H16.1C16.6523 11 17.1 11.4477 17.1 12C17.1 12.5523 16.6523 13 16.1
            13H14V20H18C19.1046 20 20 19.1046 20 18V6C20 4.89543 19.1046 4 18 4H6Z"
            fill="currentColor"></path>
        </svg>
        <a href="https://www.facebook.com/pracadoslivroslivres" target="_blank"
          class="text-[#2E2E2E] hover:text-[#D17A22] underline">@pracadoslivroslivres</a>
      </div>
    </div>
  </div>
</template>

