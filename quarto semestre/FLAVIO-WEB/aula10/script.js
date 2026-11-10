document.addEventListener('DOMContentLoaded', function() {
    // 1. Seleciona o formulário e a área de status
    const form = document.getElementById('contato-form');
    const statusMessage = document.getElementById('status-message');

    // Se o formulário for encontrado, adiciona o "ouvinte" de evento
    if (form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault(); // IMPEDE o envio padrão e o recarregamento da página

            // 2. Captura os valores dos campos
            const nome = document.getElementById('nome').value.trim();
            const email = document.getElementById('email').value.trim();
            const telefone = document.getElementById('telefone').value.trim();
            const mensagem = document.getElementById('mensagem').value.trim();
            
            // Variável de controle
            let isValid = true; 
            
            // 3. Verifica a validação
            if (nome === '' || email === '' || telefone === '' || mensagem === '') {
                isValid = false;
            }

            // 4. Exibe a mensagem de acordo com a validação
            if (!isValid) {
                statusMessage.textContent = 'Erro: Por favor, preencha todos os campos obrigatórios.';
                statusMessage.style.color = 'red';
            } else {
                statusMessage.textContent = 'Mensagem enviada com sucesso! A Clínica Essencial agradece seu contato.';
                statusMessage.style.color = 'green';
                
                // Limpa o formulário após o sucesso
                form.reset(); 
            }
        });
    }

    // Código Opcional: Rolagem Suave (Smooth Scroll)
    document.querySelectorAll('nav a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            if(document.getElementById(targetId)) {
                document.getElementById(targetId).scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
});