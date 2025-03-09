<template>
  <div v-if="isOpen" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
    <div class="bg-white p-6 rounded-lg shadow-lg max-w-2xl max-h-[80vh] overflow-y-auto">
      <h2 class="font-bold text-xl mb-4">Política de Privacidade</h2>

      <div class="text-sm space-y-4">
        <p>
          <strong>1. Responsável pelo Tratamento dos Dados</strong><br>
          O responsável pelo tratamento dos dados pessoais recolhidos através deste site é a
          Associação Praça dos Livros Livres, com sede em Tavira, e pode ser contactado através do
          e-mail pracadoslivroslivres@gmail.com.
        </p>

        <p>
          <strong>2. Finalidade do Tratamento de Dados</strong><br>
          Os dados pessoais recolhidos (nome, apelido e endereço de e-mail) serão utilizados
          exclusivamente para o envio da nossa newsletter, com informações sobre novidades, eventos,
          promoções e outras atualizações relevantes relacionadas com o nosso site.
          O número de telémovel não é guardado no sistema e é apenas necessário para realizar
          compras MBWAY.
        </p>

        <p>
          <strong>3. Base Legal para o Tratamento de Dados</strong><br>
          O tratamento dos seus dados é realizado com base no seu <strong>consentimento explícito</strong>, que é obtido no momento da inscrição na newsletter. Você pode retirar o seu consentimento a qualquer momento, através do link de descadastro presente em cada e-mail enviado.
        </p>

        <p>
          <strong>4. Conservação dos Dados</strong><br>
          Os seus dados pessoais serão conservados durante o tempo necessário para cumprir a finalidade para a qual foram recolhidos, ou até que solicite a sua eliminação. Caso decida cancelar a subscrição da newsletter, os seus dados serão eliminados das nossas listas de envio.
        </p>

        <p>
          <strong>5. Direitos dos Titulares dos Dados</strong><br>
          De acordo com o RGPD, tem os seguintes direitos relativamente aos seus dados pessoais:
          <ul class="list-disc pl-6 mt-2">
            <li><strong>Acesso</strong>: Pode solicitar uma cópia dos dados que possuímos sobre si.</li>
            <li><strong>Retificação</strong>: Pode solicitar a correção de dados inexatos ou incompletos.</li>
            <li><strong>Eliminação</strong>: Pode solicitar a eliminação dos seus dados pessoais.</li>
            <li><strong>Limitação do Tratamento</strong>: Pode solicitar a limitação do tratamento dos seus dados em determinadas circunstâncias.</li>
            <li><strong>Portabilidade</strong>: Pode solicitar a transferência dos seus dados para outro responsável pelo tratamento.</li>
            <li><strong>Oposição</strong>: Pode opor-se ao tratamento dos seus dados para fins de marketing direto.</li>
          </ul>
        </p>

        <p>
          <strong>6. Partilha de Dados com Terceiros</strong><br>
          Os seus dados pessoais não serão partilhados, vendidos ou cedidos a terceiros, exceto quando necessário para o cumprimento de obrigações legais ou com o seu consentimento explícito.
        </p>

        <p>
          <strong>7. Segurança dos Dados</strong><br>
          Implementamos medidas técnicas e organizativas adequadas para proteger os seus dados pessoais contra acesso não autorizado, alteração, divulgação ou destruição. Estas medidas incluem a utilização de sistemas seguros e a limitação do acesso aos dados apenas a pessoal autorizado.
        </p>

        <p>
          <strong>8. Contacto</strong><br>
          Se tiver alguma dúvida ou preocupação sobre o tratamento dos seus dados pessoais, pode contactar-nos através do e-mail pracadoslivroslivres@gmail.com.
        </p>

        <p>
          <strong>9. Alterações à Política de Privacidade</strong><br>
          Esta política de privacidade pode ser atualizada periodicamente para refletir mudanças nas nossas práticas de tratamento de dados. Recomendamos que reveja esta página regularmente para se manter informado.
        </p>
      </div>

      <!-- Botão para Fechar o Modal -->
      <button @click="close" class="mt-4 px-4 py-2 bg-[#E9B86C] rounded-lg hover:bg-[#D9A65C] transition-colors">
        Fechar
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PrivacyPolicy',
  props: {
    isOpen: {
      type: Boolean,
      required: true,
    },
  },
  methods: {
    close() {
      this.$emit('close'); // Emite um evento para fechar o modal
    },
  },
};
</script>

