==============================================================================
         SISTEMA TÁTICO DE NAVEGAÇÃO E TRAJETÓRIA - MANUAL DO USUÁRIO
==============================================================================

1. VISÃO GERAL
--------------
Este projeto consiste em um sistema de mapeamento e navegação em matrizes 2D (grid)
desenvolvido em Python. O sistema implementa diversos algoritmos de busca (informada 
e não informada) para encontrar rotas entre pontos de origem e destino, contornando
obstáculos e lidando com custos de movimentação.

O projeto oferece tanto uma Interface Gráfica (GUI) em estilo radar militar quanto
interfaces em linha de comando (CLI).


2. REQUISITOS DE SOFTWARE E BIBLIOTECAS
---------------------------------------

2.1. Requisitos do Sistema:
  - Python 3.8 ou superior instalado.

2.2. Bibliotecas Necessárias:
  O projeto utiliza majoritariamente bibliotecas padrão do Python, além do NumPy
  para manipulação de matrizes nos utilitários.

  - tkinter (Geralmente incluído na instalação padrão do Python)
  - numpy

2.3. Instruções de Instalação:
  Para instalar a biblioteca externa necessária (NumPy), abra o terminal / prompt
  de comando e execute:

      pip install numpy

  Nota (Linux): Caso o tkinter não esteja disponível no seu ambiente Linux, 
  instale-o via gerenciador de pacotes da sua distribuição (ex: sudo apt install python3-tk).


3. ESTRUTURA DOS ARQUIVOS
-------------------------
- interface.py                 : Interface Gráfica principal (Tkinter) estilo HUD Tático.
- principalBuscaSemPesos.py   : Executável CLI para testes de buscas não informadas.
- principalBuscaComPesos.py    : Executável CLI para testes de buscas informadas (com custos).
- buscaNP.py                   : Motor contendo os algoritmos de busca não informados.
- BuscaP.py                    : Motor contendo os algoritmos de busca informados (pesos e heurísticas).
- Node.py / NodeP.py           : Estruturas de dados para os nós da árvore de busca.
- utils.py                     : Leitura de arquivos de mapa e utilitários auxiliares.
- mapa3.txt                    : Arquivo texto contendo a matriz do terreno.


4. COMO EXECUTAR O PROGRAMA
---------------------------

4.1. Executando a Interface Gráfica (Recomendado):
  Abra o terminal na pasta do projeto e execute:

      python interface.py

4.2. Executando as Interfaces via Linha de Comando (CLI):
  - Para testar buscas sem peso (Amplitude, Profundidade, etc.):
      python principalBuscaSemPesos.py

  - Para testar buscas com peso (Custo Uniforme, Greedy, A*, AIA*):
      python principalBuscaComPesos.py


5. FUNCIONAMENTO DA INTERFACE GRÁFICA (interface.py)
----------------------------------------------------

A interface gráfica foi desenhada simulando um radar tático CCOM. Abaixo estão suas
funcionalidades e como interagir com o radar:

5.1. Seleção de Pontos no Radar (Canvas):
  - Definir Ponto de Origem (Base/Verde): 
    Clique com o BOTÃO ESQUERDO do mouse em qualquer célula livre do grid.
  - Definir Ponto de Destino (Alvo/Vermelho): 
    Clique com o BOTÃO DIREITO do mouse em qualquer célula livre do grid.

5.2. Painel Lateral de Controle (Diretrizes da Missão):
  - Protocolo de Varredura:
    Selecione o algoritmo desejado na caixa de seleção (Amplitude, Profundidade,
    Profundidade Limitada, Aprofundamento Iterativo, Bidirecional, Custo Uniforme,
    Greedy, A-estrela, AIA-estrela).
  - Raio Máximo / Limite de Passos:
    Caso selecione "Profundidade Limitada" ou "Aprofundamento Iterativo", um campo
    adicional surgirá para definir o limite máximo de profundidade da busca.
  - Coordenadas de Partida/Alvo:
    Também é possível digitar as coordenadas [Linha, Coluna] manualmente nos campos
    correspondentes.
  - Botão "CALCULAR TRAJETÓRIA":
    Inicia o algoritmo selecionado a partir dos pontos definidos.

5.3. Telemetria e Visualização dos Resultados:
  - Trajetória Traçada:
    O caminho percorrido será destacado no grid com a cor AMARELA.
  - Painel de Telemetria:
    Exibe o relatório detalhado contendo a confirmação da missão, total de passos,
    desgaste operacional (custo acumulado de movimento) e o vetor completo de posições.

5.4. Legenda de Cores do Radar:
  - Verde  : Base / Ponto de Partida
  - Vermelho: Alvo / Destino
  - Escuro : Zona Hostil / Obstáculo (Valor 9 no arquivo do mapa)
  - Amarelo : Trajetória Segura Encontrada


6. DICAS DE SOLUÇÃO DE PROBLEMAS
--------------------------------
- Erro "FileNotFoundError: mapa3.txt":
  Certifique-se de executar o script Python no mesmo diretório em que o arquivo 
  `mapa3.txt` está localizado.
- Coordenadas Inválidas:
  Garantir que os pontos de origem e destino sejam selecionados em células com valor 0
  (não em cima de obstáculos/zonas hostil marcadas com 9).
==============================================================================