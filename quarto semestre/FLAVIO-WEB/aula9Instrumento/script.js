function displayCurrentDate() {
    // 1. Cria um novo objeto Date para pegar a data e hora atuais
    const today = new Date();
    
    // 2. Define o formato de exibição da data (dia da semana, dia, mês e ano)
    const options = { 
        weekday: 'long', // ex: "terça-feira"
        year: 'numeric', 
        month: 'long', // ex: "outubro"
        day: 'numeric' // ex: "1"
    };
    
    // 3. Formata a data para o português do Brasil (pt-BR)
    const formattedDate = today.toLocaleDateString('pt-BR', options);
    
    // 4. Encontra o elemento HTML pela ID
    const dateElement = document.getElementById('current-date-display');
    
    // 5. Insere a data formatada no HTML
    if (dateElement) {
        dateElement.innerHTML = `Hoje é: <strong>${formattedDate}</strong>`;
    }
}

// Chama a função para que ela execute assim que o JS carregar
displayCurrentDate();