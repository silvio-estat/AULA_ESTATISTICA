# Plano do Curso — Estatística Básica Aplicada

> Disciplina integrante do **Curso de Inteligência Artificial Operacional**.
> 3 dias · 9 módulos · 1 notebook por módulo.

---

## 1. Objetivo da disciplina

Os alunos **não vão conduzir experimentos estatísticos**. Vão **ler, interpretar e questionar
resultados** — em relatórios, em artigos e, principalmente, em material sobre Inteligência
Artificial.

Portanto o curso é organizado em torno de uma pergunta única, repetida em todos os módulos:

> **"Esse número quer dizer o que eu acho que ele quer dizer?"**

Cada conceito entra no material porque responde a uma decisão concreta ou desarma uma
interpretação errada — nunca porque "faz parte da ementa".

**Critério de sucesso:** ao terminar, o aluno lê o resultado de um modelo de IA ou um gráfico de
artigo e sabe **que perguntas fazer** antes de acreditar no número.

---

## 2. Método

**Ciclo do aluno: ler → prever → rodar → interpretar → modificar.**

Ninguém escreve código do zero. O código já está pronto no notebook; o aluno **prevê o resultado
antes de executar**, roda, compara com o que previu e depois muda um parâmetro para ver o que
acontece. O erro de previsão é o momento de aprendizado — é ele que fixa o conceito.

**Convenções de todo módulo:**

| Elemento | Função |
|---|---|
| Seção **⓪** de abertura | um gancho que **quebra a intuição** em 1 célula (ex.: 4 companhias, dois números idênticos) |
| Seções **① ②** … | desenvolvimento, sempre partindo de uma pergunta prática |
| 💡 e ⚠️ | o detalhe honesto que ninguém conta / armadilha de Python que ele vai encontrar |
| **Decisão: o que reportar ao comando** | tabela "a pergunta real é… → reporte… → por quê" |
| **Três frases para levar** | o que sobra se o aluno esquecer todo o resto |
| **Resumo do módulo** | tabela ferramenta / para quê / cuidado |
| **Exercícios** | preveja antes de rodar · mude um parâmetro · conserte o erro conceitual · interprete |

**Contexto dos exemplos:** militar (TAF de pelotão, tempo de pista, logística de OM, manutenção
de viatura). Concreto sempre — nada de "variável X" e "variável Y".

**Fechamento de IA:** ao final de **cada dia**, uma seção curta (não um módulo) amarrando o que
foi visto naquele dia à leitura de IA. Coisa simples, só para fechar o dia — a ponte, não um
tratado.

---

## 3. Arco do curso

| Dia | Pergunta central | Do quê para quê |
|---|---|---|
| **1** | Como descrever **uma** variável? | do dado bruto ao resumo honesto |
| **2** | O que acontece com **duas ao mesmo tempo**? | de resumir para **relacionar** — e a armadilha da causa |
| **3** | **Quanto confiar** no número? | de descrever para **julgar evidência** — e ler IA |

A progressão é deliberada: só se pode duvidar de um número (dia 3) depois de saber o que ele
descreve (dia 1) e o que ele relaciona (dia 2).

---

## DIA 1 — Descrevendo uma variável ✅ *(pronto)*

### Módulo 1 — Medidas de Tendência Central
`ESTAT_BASICA/dia1/01_tendencia_central.ipynb`

- ⓪ O jogo do palpite único
- ① A propriedade **exclusiva** de cada medida — só a média conversa com o total; só a média se
  agrega entre grupos; só a mediana atravessa mudanças de escala; só a moda existe sem ordem
- ② Robustez tem preço — ponto de ruptura, curva de sensibilidade, eficiência
- ③ A família das médias — harmônica (patrulha), geométrica (efetivo), a regra que unifica
- ④ Quando o centro não existe — **o piloto médio de Daniels (USAF, 1950)**, bimodalidade, Cauchy
- ⑤ Decisão: o que reportar ao comando

### Módulo 2 — Variabilidade e Dispersão
`ESTAT_BASICA/dia1/02_variabilidade.ipynb`

- ① Por que a variância precisou ser inventada (a soma dos desvios é sempre zero)
- ② Por que o desvio padrão venceu — **variâncias se somam** → a **regra do √n**
- ③ Por que dividir por n − 1 — graus de liberdade, o viés que o `n−1` **não** corrige, `ddof`
- ④ Transformando dispersão em decisão — CV, Chebyshev × 68-95-99,7, **planejar pela cauda**
- ⑤ Desvio padrão **não** é erro padrão

### Módulo 3 — A Forma da Distribuição
`ESTAT_BASICA/dia1/03_forma_distribuicao.ipynb`

- ⓪ Quatro companhias, dois números idênticos
- ① Quantis: descrever sem assumir nada
- ② O boxplot por dentro — de onde vem o 1,5 e o que ele esconde
- ③ Assimetria e curtose
- ④ **Outlier é uma hipótese, não um veredito**
- ⑤ Transformar não é trapacear (log)
- ⑥ Por que a normal aparece tanto — e quando não aparece (soma × produto)

### 🔻 Fechamento do Dia 1 · *Por que isso importa para a IA* — **a fazer**
*(seção curta ao final do Módulo 3)*

Um modelo de IA é treinado sobre **dados** — e tudo do dia 1 descreve dados.

- A IA aprende a distribuição que você deu a ela. Se a base é **assimétrica** ou tem **dois
  grupos misturados**, o modelo herda isso — e o "desempenho médio" esconde para quem ele falha.
- **Outlier é hipótese**: o filtro automático que "limpa" a base antes do treino pode estar
  jogando fora justamente o caso raro que importa (a falha, a fraude, o alvo).
- Por que quase todo tutorial de IA **normaliza** ou aplica **log** nos dados antes de treinar:
  é o Módulo 3, com outro nome.
- E o **piloto médio de Daniels** é o resumo do dia: projetar para a média é projetar para
  ninguém — que é exatamente o que acontece quando se avalia um modelo por um número só.

---

## DIA 2 — Quando duas variáveis andam juntas ⬜ *(a fazer)*

> Ponte deixada pelo Dia 1: *"O passo seguinte é olhar duas ao mesmo tempo — e descobrir que duas
> variáveis podem andar juntas sem que uma cause a outra."*

### Módulo 4 — Correlação: o que ela vê e o que ela não vê
`ESTAT_BASICA/dia2/04_correlacao.ipynb`

- ⓪ **Gancho:** quatro conjuntos com a **mesma correlação** e gráficos irreconhecíveis
  (Anscombe / Datasaurus) — o eco direto das quatro companhias do Módulo 3
- ① De covariância para correlação: por que precisou padronizar (e por que r não tem unidade)
- ② O que **r não enxerga**: relação em U, restrição de amplitude, e **um único ponto** que cria
  ou destrói uma correlação
- ③ Pearson × Spearman — a mesma escolha robustez/eficiência do Módulo 1, agora entre duas variáveis
- ④ "r = 0,7 é forte?" — r², e o que "explica 49% da variância" **realmente** quer dizer
- ⑤ Decisão: o que reportar ao comando

### Módulo 5 — Regressão: a reta e o que ela promete
`ESTAT_BASICA/dia2/05_regressao.ipynb`

- ⓪ **Gancho:** prever o tempo de TAF pela idade — e o tamanho do erro de cada previsão
- ① Mínimos quadrados **é a régua do quadrado do Módulo 1** aplicada a uma reta (amarração forte:
  a média minimiza o erro quadrático; a regressão faz o mesmo com uma reta)
- ② Lendo um coeficiente: o que significa "mantendo o restante constante"
- ③ **Os resíduos são o diagnóstico** — o gráfico que decide se a reta tinha o direito de existir
- ④ Extrapolar: o que acontece ao prever fora da faixa observada
- ⑤ **Regressão à média** — por que "punir o pior pelotão funcionou" costuma ser ilusão de ótica
- ⑥ Decisão: prever **não** é explicar

### Módulo 6 — Correlação não é causalidade
`ESTAT_BASICA/dia2/06_causalidade.ipynb`

- ⓪ **Gancho:** duas séries com r = 0,95 e nenhuma relação concebível entre elas
- ① **Confundimento**: a terceira variável que explica as outras duas
- ② **Paradoxo de Simpson** — o agregado que inverte o sinal de **todos** os subgrupos
- ③ Viés de seleção: a correlação que **você mesmo criou** ao escolher quem entra na amostra
- ④ O que autoriza a falar em causa: aleatorização, grupo de controle, e por que dado
  observacional raramente basta
- ⑤ Decisão: as perguntas a fazer antes de aceitar uma relação causal

### 🔻 Fechamento do Dia 2 · *Por que isso importa para a IA*

- Um modelo de IA aprende **correlação** — nunca causa. Ele acerta a previsão e mesmo assim pode
  estar apoiado numa variável que não causa nada (a marca d'água na foto, e não o tumor).
- Por isso **"feature importance" não é lista de causas** — é lista do que ajudou a prever.
- **Simpson** é o motivo de um modelo com ótimo desempenho geral falhar num subgrupo específico.
- E prever bem ≠ explicar: um modelo que acerta não te autoriza a **intervir** na realidade
  mexendo naquela variável.

---

## DIA 3 — Quanto confiar no número ⬜ *(a fazer)*

### Módulo 7 — De onde vieram os dados: amostra e viés
`ESTAT_BASICA/dia3/07_amostragem.ipynb`

- ⓪ **Gancho:** os aviões que **voltaram** — Abraham Wald, 2ª Guerra, e o buraco de bala que
  ninguém via (viés do sobrevivente, exemplo militar e imediatamente palpável)
- ① População × amostra: o que se quer saber e o que se conseguiu medir
- ② Viés de seleção e não-resposta — quem **não** está na base
- ③ A lição contraintuitiva: **amostra enorme e enviesada é pior** que amostra pequena e honesta
  (n grande reduz a variância do erro, não o viés — ele fica firme no lugar errado)
- ④ O **erro padrão** do Dia 1 volta: o que "mais dados" resolve e o que não resolve
- ⑤ Decisão: as perguntas a fazer sobre a origem de qualquer base

### Módulo 8 — Incerteza: intervalo de confiança e p-valor
`ESTAT_BASICA/dia3/08_incerteza.ipynb`

- ⓪ **Gancho:** dois pelotões, médias diferentes — a diferença é real ou é sorte?
- ① Distribuição amostral e o Teorema Central do Limite (o **√n** do Dia 1 já preparou o terreno)
- ② **Intervalo de confiança** — o que ele significa e, sobretudo, o que ele **não** significa
- ③ **p-valor** — o que é, e por que não é "a probabilidade de a hipótese ser falsa"
- ④ **Significância estatística ≠ relevância prática**: com n gigante, tudo vira significativo
- ⑤ Comparações múltiplas: teste o suficiente e você acha qualquer coisa (p-hacking)
- ⑥ Decisão: como reportar incerteza sem enganar o comando

### Módulo 9 — Lendo resultados de IA com olhos de estatístico
`ESTAT_BASICA/dia3/09_lendo_ia.ipynb`

*O módulo de fechamento: aqui os três dias convergem.*

- ⓪ **Gancho:** um modelo com **99% de acurácia** que é completamente inútil (classe rara)
- ① A acurácia engana — matriz de confusão, precisão e recall, e qual erro custa caro **na sua
  operação** (alarme falso × ameaça não detectada)
- ② Treino, validação e teste — **overfitting é decorar o ruído**, e por que avaliar no dado de
  treino é se enganar sozinho
- ③ **O desempenho médio esconde subgrupos** — o piloto médio de Daniels reaparece, agora como
  avaliação desagregada de modelo
- ④ "91,2% × 90,8%": essa diferença existe? — o **erro padrão** decide (Dia 1 §5 + Dia 3 §8)
- ⑤ Deslocamento de distribuição: o modelo foi treinado numa realidade e opera em outra (Dia 1 M3)
- ⑥ **Checklist final:** as perguntas a fazer ao ler qualquer resultado de IA em um artigo

### 🔻 Fechamento do Curso

Uma página só, ligando as três perguntas:

> **O que esse número descreve? (Dia 1) · O que ele relaciona? (Dia 2) · Quanto ele merece
> confiança? (Dia 3)**

E a frase que fecha a disciplina: em IA, o modelo é a parte fácil de julgar — **a parte difícil
sempre foi a estatística dos dados e da avaliação.**

---

## 4. Estado atual

| Dia | Módulos | Situação |
|---|---|---|
| Dia 1 | M1, M2, M3 | ✅ prontos e revisados — falta só o **fechamento de IA** no M3 |
| Dia 2 | M4, M5, M6 | ⬜ a produzir |
| Dia 3 | M7, M8, M9 | ⬜ a produzir |

**Ambiente:** `setup_ambiente.sh` (Linux/macOS) ou `setup_ambiente.ps1` (Windows) criam a `.venv`,
instalam o `requirements.txt` e registram o kernel **"Python (ESTAT_BASICA)"**.
