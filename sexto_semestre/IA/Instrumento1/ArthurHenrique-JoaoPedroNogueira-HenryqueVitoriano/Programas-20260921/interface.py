import tkinter as tk
from tkinter import ttk, messagebox
import utils as fa
from BuscaP import buscaP
from buscaNP import buscaNP

# Carregamento da malha tática a partir do arquivo
ARQUIVO_MAPA = "mapa3.txt"
try:
    mapa, dx, dy = fa.Gera_Problema_Grid_Fixo_P(ARQUIVO_MAPA)
except Exception as e:
    raise FileNotFoundError(f"Certifique-se de que {ARQUIVO_MAPA} está na mesma pasta. Erro: {e}")

# Instâncias dos motores de busca fornecidos
motor_p = buscaP()
motor_np = buscaNP()

class TacticalApp:
    def __init__(self, root):
        self.root = root
        self.root.title("CCOM // SISTEMA TÁTICO DE NAVEGAÇÃO E TRAJETÓRIA")
        self.root.geometry("1100x780")
        self.root.configure(bg="#0b0f0c")

        # Configurações de Cores Militares (Dark / Olive / HUD)
        self.COLOR_BG = "#0b0f0c"
        self.COLOR_PANEL = "#131a14"
        self.COLOR_BORDER = "#2d4230"
        self.COLOR_ACCENT = "#4ade80"
        self.COLOR_TEXT = "#dcfce7"
        self.COLOR_MUTED = "#86a789"
        
        self.COLOR_CELL_FREE = "#0d1510"
        self.COLOR_CELL_OBSTACLE = "#1c261e"
        self.COLOR_START = "#22c55e"
        self.COLOR_GOAL = "#ef4444"
        self.COLOR_PATH = "#eab308"

        self.cell_size = 48
        self.caminho_atual = []

        self.criar_layout()
        self.desenhar_grid()

    def criar_layout(self):
        # Header Tático
        header = tk.Frame(self.root, bg=self.COLOR_PANEL, bd=1, relief="solid", highlightbackground=self.COLOR_BORDER, highlightthickness=1)
        header.pack(fill="x", padx=16, pady=(16, 8))

        lbl_titulo = tk.Label(
            header,
            text="◈ CCOM // SISTEMA DE MAPEAMENTO E NAVEGAÇÃO TERRESTRE",
            font=("Consolas", 13, "bold"),
            fg=self.COLOR_ACCENT,
            bg=self.COLOR_PANEL
        )
        lbl_titulo.pack(side="left", padx=12, pady=10)

        lbl_status = tk.Label(
            header,
            text="ESTADO: VIGILÂNCIA ATIVA [PRONTO]",
            font=("Consolas", 9, "bold"),
            fg=self.COLOR_MUTED,
            bg=self.COLOR_PANEL
        )
        lbl_status.pack(side="right", padx=12)

        # Corpo Principal
        corpo = tk.Frame(self.root, bg=self.COLOR_BG)
        corpo.pack(fill="both", expand=True, padx=16, pady=8)

        # Painel Lateral Esquerdo (Controles e Log)
        sidebar = tk.Frame(corpo, bg=self.COLOR_PANEL, width=380, bd=1, relief="solid", highlightbackground=self.COLOR_BORDER, highlightthickness=1)
        sidebar.pack(side="left", fill="y", padx=(0, 12), pady=0)
        sidebar.pack_propagate(False)

        # Seção de Parâmetros
        lbl_sec1 = tk.Label(sidebar, text="DIRETRIZES DA MISSÃO", font=("Consolas", 10, "bold"), fg=self.COLOR_ACCENT, bg=self.COLOR_PANEL)
        lbl_sec1.pack(anchor="w", padx=12, pady=(12, 6))

        # Seletor de Método de Busca
        lbl_metodo = tk.Label(sidebar, text="PROTOCOLO DE VARREDURA:", font=("Consolas", 8), fg=self.COLOR_MUTED, bg=self.COLOR_PANEL)
        lbl_metodo.pack(anchor="w", padx=12, pady=(4, 2))

        self.metodos_disponiveis = [
            "Amplitude",
            "Profundidade",
            "Profundidade Limitada",
            "Aprofundamento Iterativo",
            "Bidirecional",
            "Custo Uniforme",
            "Greedy",
            "A-estrela",
            "AIA-estrela"
        ]
        self.var_metodo = tk.StringVar(value=self.metodos_disponiveis[0])
        self.combo_metodo = ttk.Combobox(sidebar, textvariable=self.var_metodo, values=self.metodos_disponiveis, state="readonly", font=("Consolas", 9))
        self.combo_metodo.pack(fill="x", padx=12, pady=4)
        self.combo_metodo.bind("<<ComboboxSelected>>", self.toggle_limite)

        # Campo Limite (para Profundidade Limitada e Aprofundamento Iterativo)
        self.frame_limite = tk.Frame(sidebar, bg=self.COLOR_PANEL)
        lbl_limite = tk.Label(self.frame_limite, text="RAIO MÁXIMO / LIMITE DE PASSOS:", font=("Consolas", 8), fg=self.COLOR_MUTED, bg=self.COLOR_PANEL)
        lbl_limite.pack(anchor="w")
        self.entry_limite = tk.Entry(self.frame_limite, font=("Consolas", 9), bg="#060907", fg=self.COLOR_TEXT, insertbackground=self.COLOR_ACCENT)
        self.entry_limite.insert(0, "15")
        self.entry_limite.pack(fill="x", pady=2)

        # Coordenadas Início
        lbl_inicio = tk.Label(sidebar, text="BASE / PARTIDA [LINHA, COLUNA]:", font=("Consolas", 8), fg=self.COLOR_MUTED, bg=self.COLOR_PANEL)
        lbl_inicio.pack(anchor="w", padx=12, pady=(8, 2))
        frame_inicio = tk.Frame(sidebar, bg=self.COLOR_PANEL)
        frame_inicio.pack(fill="x", padx=12)
        self.entry_sx = tk.Entry(frame_inicio, font=("Consolas", 9), width=8, bg="#060907", fg=self.COLOR_TEXT, insertbackground=self.COLOR_ACCENT)
        self.entry_sx.insert(0, "0")
        self.entry_sx.pack(side="left", padx=(0, 6))
        self.entry_sy = tk.Entry(frame_inicio, font=("Consolas", 9), width=8, bg="#060907", fg=self.COLOR_TEXT, insertbackground=self.COLOR_ACCENT)
        self.entry_sy.insert(0, "0")
        self.entry_sy.pack(side="left")

        # Coordenadas Destino
        lbl_fim = tk.Label(sidebar, text="ALVO / DESTINO [LINHA, COLUNA]:", font=("Consolas", 8), fg=self.COLOR_MUTED, bg=self.COLOR_PANEL)
        lbl_fim.pack(anchor="w", padx=12, pady=(8, 2))
        frame_fim = tk.Frame(sidebar, bg=self.COLOR_PANEL)
        frame_fim.pack(fill="x", padx=12)
        self.entry_gx = tk.Entry(frame_fim, font=("Consolas", 9), width=8, bg="#060907", fg=self.COLOR_TEXT, insertbackground=self.COLOR_ACCENT)
        self.entry_gx.insert(0, str(dx - 1))
        self.entry_gx.pack(side="left", padx=(0, 6))
        self.entry_gy = tk.Entry(frame_fim, font=("Consolas", 9), width=8, bg="#060907", fg=self.COLOR_TEXT, insertbackground=self.COLOR_ACCENT)
        self.entry_gy.insert(0, str(dy - 1))
        self.entry_gy.pack(side="left")

        # Botão de Execução
        btn_exec = tk.Button(
            sidebar,
            text="CALCULAR TRAJETÓRIA",
            font=("Consolas", 9, "bold"),
            bg="#1e3a24",
            fg=self.COLOR_ACCENT,
            activebackground=self.COLOR_ACCENT,
            activeforeground="#060907",
            bd=1,
            relief="ridge",
            cursor="hand2",
            command=self.executar_busca
        )
        btn_exec.pack(fill="x", padx=12, pady=16)

        # Seção Telemetria / Log de Resultados
        lbl_sec2 = tk.Label(sidebar, text="TELEMETRIA DA OPERAÇÃO", font=("Consolas", 10, "bold"), fg=self.COLOR_ACCENT, bg=self.COLOR_PANEL)
        lbl_sec2.pack(anchor="w", padx=12, pady=(6, 4))

        self.txt_telemetria = tk.Text(
            sidebar,
            bg="#060907",
            fg=self.COLOR_ACCENT,
            font=("Consolas", 8),
            bd=1,
            relief="solid",
            highlightbackground=self.COLOR_BORDER,
            highlightthickness=1,
            wrap="word"
        )
        self.txt_telemetria.pack(fill="both", expand=True, padx=12, pady=(0, 12))
        self.log("[SISTEMA PRONTO]\nClique em nós livres para definir Início (Botão Esquerdo) ou Destino (Shift + Botão Esquerdo ou Botão Direito).")

        # Painel Central Direito (Área do Radar / Canvas)
        stage = tk.Frame(corpo, bg=self.COLOR_PANEL, bd=1, relief="solid", highlightbackground=self.COLOR_BORDER, highlightthickness=1)
        stage.pack(side="right", fill="both", expand=True)

        lbl_radar = tk.Label(stage, text=f"RADAR TÁTICO DO TERRENO ({dx}x{dy})", font=("Consolas", 10, "bold"), fg=self.COLOR_ACCENT, bg=self.COLOR_PANEL)
        lbl_radar.pack(anchor="w", padx=16, pady=12)

        # Canvas do Grid
        canvas_width = dy * self.cell_size
        canvas_height = dx * self.cell_size
        self.canvas = tk.Canvas(stage, width=canvas_width, height=canvas_height, bg="#040604", bd=0, highlightthickness=1, highlightbackground=self.COLOR_BORDER)
        self.canvas.pack(padx=16, pady=4)
        self.canvas.bind("<Button-1>", self.on_canvas_click_left)
        self.canvas.bind("<Button-3>", self.on_canvas_click_right)

        # Legenda Inferior
        legenda = tk.Frame(stage, bg=self.COLOR_PANEL)
        legenda.pack(pady=12)
        self.criar_item_legenda(legenda, self.COLOR_START, "Base (Partida)")
        self.criar_item_legenda(legenda, self.COLOR_GOAL, "Alvo (Destino)")
        self.criar_item_legenda(legenda, self.COLOR_CELL_OBSTACLE, "Hostil / Obstáculo")
        self.criar_item_legenda(legenda, self.COLOR_PATH, "Trajetória Segura")

    def criar_item_legenda(self, parent, color, text):
        f = tk.Frame(parent, bg=self.COLOR_PANEL)
        f.pack(side="left", padx=8)
        box = tk.Label(f, bg=color, width=2, height=1, bd=1, relief="solid")
        box.pack(side="left", padx=(0, 4))
        lbl = tk.Label(f, text=text, font=("Consolas", 8), fg=self.COLOR_MUTED, bg=self.COLOR_PANEL)
        lbl.pack(side="left")

    def toggle_limite(self, event=None):
        if self.var_metodo.get() in ["Profundidade Limitada", "Aprofundamento Iterativo"]:
            self.frame_limite.pack(fill="x", padx=12, pady=4, after=self.combo_metodo)
        else:
            self.frame_limite.pack_forget()

    def log(self, text):
        self.txt_telemetria.delete("1.0", tk.END)
        self.txt_telemetria.insert(tk.END, text)

    def on_canvas_click_left(self, event):
        col = event.x // self.cell_size
        row = event.y // self.cell_size
        if 0 <= row < dx and 0 <= col < dy:
            if mapa[row][col] == 9:
                return
            self.entry_sx.delete(0, tk.END)
            self.entry_sx.insert(0, str(row))
            self.entry_sy.delete(0, tk.END)
            self.entry_sy.insert(0, str(col))
            self.desenhar_grid()

    def on_canvas_click_right(self, event):
        col = event.x // self.cell_size
        row = event.y // self.cell_size
        if 0 <= row < dx and 0 <= col < dy:
            if mapa[row][col] == 9:
                return
            self.entry_gx.delete(0, tk.END)
            self.entry_gx.insert(0, str(row))
            self.entry_gy.delete(0, tk.END)
            self.entry_gy.insert(0, str(col))
            self.desenhar_grid()

    def desenhar_grid(self):
        self.canvas.delete("all")
        try:
            sx, sy = int(self.entry_sx.get()), int(self.entry_sy.get())
            gx, gy = int(self.entry_gx.get()), int(self.entry_gy.get())
        except ValueError:
            sx, sy, gx, gy = -1, -1, -1, -1

        caminho_set = set(map(tuple, self.caminho_atual))

        for r in range(dx):
            for c in range(dy):
                x1 = c * self.cell_size
                y1 = r * self.cell_size
                x2 = x1 + self.cell_size
                y2 = y1 + self.cell_size

                # Cor de Preenchimento
                if mapa[r][c] == 9:
                    cor = self.COLOR_CELL_OBSTACLE
                    texto_cor = "#2d4230"
                elif (r, c) == (sx, sy):
                    cor = self.COLOR_START
                    texto_cor = "#000000"
                elif (r, c) == (gx, gy):
                    cor = self.COLOR_GOAL
                    texto_cor = "#ffffff"
                elif (r, c) in caminho_set:
                    cor = self.COLOR_PATH
                    texto_cor = "#000000"
                else:
                    cor = self.COLOR_CELL_FREE
                    texto_cor = "#334155"

                self.canvas.create_rectangle(x1, y1, x2, y2, fill=cor, outline=self.COLOR_BORDER, width=1)
                self.canvas.create_text((x1 + x2) // 2, (y1 + y2) // 2, text=f"{r},{c}", fill=texto_cor, font=("Consolas", 7))

    def calcular_custo_real(self, caminho):
        """Avalia o custo direcional usando os pesos de BuscaP.py (Abaixo=1, Direita/Cima=3, Esquerda=6)."""
        custo = 0
        for i in range(len(caminho) - 1):
            x1, y1 = caminho[i]
            x2, y2 = caminho[i + 1]
            if x2 == x1 and y2 == y1 + 1:      # Direita
                custo += 3
            elif x2 == x1 and y2 == y1 - 1:    # Esquerda
                custo += 6
            elif x2 == x1 - 1 and y2 == y1:    # Acima
                custo += 3
            elif x2 == x1 + 1 and y2 == y1:    # Abaixo
                custo += 1
        return custo

    def executar_busca(self):
        try:
            sx, sy = int(self.entry_sx.get()), int(self.entry_sy.get())
            gx, gy = int(self.entry_gx.get()), int(self.entry_gy.get())
        except ValueError:
            messagebox.showerror("Erro de Formato", "As coordenadas devem ser números inteiros.")
            return

        # Validação do ponto de origem e destino
        if not (0 <= sx < dx and 0 <= sy < dy and mapa[sx][sy] == 0):
            messagebox.showerror("Coordenada Inválida", "Origem inválida ou coincide com zona hostil/obstáculo.")
            return
        if not (0 <= gx < dx and 0 <= gy < dy and mapa[gx][gy] == 0):
            messagebox.showerror("Coordenada Inválida", "Destino inválido ou coincide com zona hostil/obstáculo.")
            return

        origem = (sx, sy)
        destino = (gx, gy)
        metodo = self.var_metodo.get()

        caminho = None
        custo = None

        # Chamadas diretas aos arquivos buscaNP e BuscaP
        if metodo == "Amplitude":
            caminho = motor_np.amplitude_grid(origem, destino, dx, dy, mapa)
        elif metodo == "Profundidade":
            caminho = motor_np.profundidade_grid(origem, destino, dx, dy, mapa)
        elif metodo == "Profundidade Limitada":
            try:
                lim = int(self.entry_limite.get())
            except ValueError:
                lim = 15
            caminho = motor_np.prof_limitada_grid(origem, destino, dx, dy, mapa, lim)
        elif metodo == "Aprofundamento Iterativo":
            try:
                lim_max = int(self.entry_limite.get())
            except ValueError:
                lim_max = 20
            caminho = motor_np.aprof_iterativo_grid(origem, destino, dx, dy, mapa, lim_max)
        elif metodo == "Bidirecional":
            caminho = motor_np.bidirecional_grid(origem, destino, dx, dy, mapa)
        elif metodo == "Custo Uniforme":
            res = motor_p.custo_uniforme_grid(origem, destino, mapa, dx, dy)
            if res:
                caminho, custo = res
        elif metodo == "Greedy":
            res = motor_p.greedy_grid(origem, destino, mapa, dx, dy)
            if res:
                caminho, custo = res
        elif metodo == "A-estrela":
            res = motor_p.a_estrela_grid(origem, destino, mapa, dx, dy)
            if res:
                caminho, custo = res
        elif metodo == "AIA-estrela":
            res = motor_p.aia_estrela_grid(origem, destino, mapa, dx, dy)
            if res:
                caminho, custo = res

        # Exibição do Resultado e Renderização
        if caminho:
            self.caminho_atual = [list(p) for p in caminho]
            if custo is None:
                custo = self.calcular_custo_real(self.caminho_atual)

            caminho_str = " -> ".join([f"[{p[0]},{p[1]}]" for p in self.caminho_atual])
            relatorio = (
                f"[ROTA TRAÇADA COM SUCESSO]\n"
                f"Protocolo: {metodo}\n"
                f"----------------------------------------\n"
                f"Total de Passos: {len(self.caminho_atual) - 1}\n"
                f"Desgaste Operacional (Custo): {custo}\n"
                f"----------------------------------------\n"
                f"Vetor de Deslocamento:\n{caminho_str}"
            )
            self.log(relatorio)
        else:
            self.caminho_atual = []
            self.log(f"[FALHA NA MISSÃO]\nProtocolo: {metodo}\nNenhuma trajetória viável encontrada para os estados selecionados.")

        self.desenhar_grid()

if __name__ == "__main__":
    janela = tk.Tk()
    app = TacticalApp(janela)
    janela.mainloop()