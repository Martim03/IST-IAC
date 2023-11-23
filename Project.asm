 
;Projeto IAC - Chuva de Meteoros

; **********************************************************************
; * CONSTANTES
; **********************************************************************

DISPLAYS        EQU 0A000H     ; endereço dos displays de 7 segmentos (periférico POUT-1)
TEC_LIN         EQU 0C000H     ; endereço das linhas do teclado (periférico POUT-2)
TEC_COL         EQU 0E000H     ; endereço das colunas do teclado (periférico PIN)
LINHA1          EQU 1          ; linha a testar (0001b)
LINHA2          EQU 2          ; linha a testar (0010b)
LINHA4          EQU 8          ; linha a testar (1000b)
MASCARA         EQU 0FH        ; para isolar os 4 bits de menor peso, ao ler as colunas do teclado

MENU            EQU 0          ; estado menu
PLAY            EQU 1          ; estado de jogabilidade
GM_OVER         EQU 2          ; estado de game over
PAUSE           EQU 3          ; estado de pausa

ENERGIA_IN      EQU 100        ; valor da energia

TEC_F           EQU 88H        ; valor da tecla F
TEC_D           EQU 82H        ; valor da tecla D
TEC_C           EQU 81H        ; valor da tecla C
TEC_4           EQU 21H        ; valor da tecla 4
TEC_3           EQU 18H        ; valor da tecla 3
TEC_2           EQU 14H        ; valor da tecla 2
TEC_1           EQU 12H        ; valor da tecla 1
TEC_0           EQU 11H        ; valor da tecla 0

SOM_MOVER       EQU 0          ; som de jogo (rover a mover)
FUNDO_MENU      EQU 1          ; fundo de menu
FUNDO_JOGO      EQU 2          ; fundo do jogo
FUNDO_PAUSA     EQU 3          ; fundo de pausa
FIM_TECLADO     EQU 4          ; Fundo de game over (pressionou tecla de fim de jogo)
SOM_DISPARO     EQU 5          ; som de jogo (disparo do missil)
SOM_EXPLOSAO    EQU 6          ; som de jogo (explosao)
MUSICA_JOGO     EQU 7          ; música do jogo
MUSICA_PAUSA    EQU 8          ; música da pausa
SOM_ENERGIA     EQU 9          ; som de jogo (energia)
MUSICA_MENU     EQU 10         ; música do menu
SOM_GAME_OVER   EQU 11         ; som de game over
BATEU_METEORO   EQU 12         ; Fundo de game over (bateu contra meteoro)
SEM_ENERGIA     EQU 13         ; Fundo de game over (ficou sem energia)

ATRASO          EQU 8000       ; valor do atraso do rover
ANTI_LOOP       EQU 200        ; clock do teclado

PRIMO           EQU 137        ; numero primo para gerar um numero random
FATOR           EQU 1000       ; fator para a conversão de hexa para decimal
CNST_DECIMAL    EQU 10         ; constante decimal

DEF_LINHA       EQU 600AH      ; endereço do comando para definir a linha
DEF_COLUNA      EQU 600CH      ; endereço do comando para definir a coluna
DEF_PIXEL       EQU 6012H      ; endereço do comando para escrever um pixel
APAGA_AVISO     EQU 6040H      ; endereço do comando para apagar o aviso de nenhum cenário selecionado
APAGA_ECRÃ      EQU 6002H      ; endereço do comando para apagar todos os pixels já desenhados
SEL_VID_FUNDO   EQU 605CH      ; endereço do comando para selecionar uma imagem de fundo
IMG_FRONTAL     EQU 6046H      ; endereco do comando para selecionar uma imagem frontal      

LINHA_IN        EQU  31        ; linha do boneco (a meio do ecrã))
COLUNA_IN       EQU  30        ; coluna do boneco (a meio do ecrã)

LINHA_MET0      EQU  0         ; linha do meteoro
COLUNA_MET0     EQU  42        ; coluna do meteoro 0
COLUNA_MET1     EQU  32        ; coluna do meteoro 1
COLUNA_MET2     EQU  52        ; coluna do meteoro 2
COLUNA_MET3     EQU  22        ; coluna do meteoro 3
MAX_LINHA       EQU  31        ; linha maxima
MAX_COLUNA_MET  EQU  58        ; coluna maximo dos meteoros
MIN_COLUNA_MET  EQU  5         ; coluna minima dos meteoros

MIN_COLUNA      EQU  0         ; número da coluna mais à esquerda que o objeto pode ocupar
MAX_COLUNA      EQU  63        ; número da coluna mais à direita que o objeto pode ocupar

EXPLOSAO        EQU  1         ; existe explosão
NAO_EXPLOSAO    EQU  0         ; não existe explosão
ESQUERDA        EQU  0         ; meteoro à esquerda
DIREITA         EQU  1         ; meteoro à direita
NAO_CRIADO      EQU  0         ; estado de criacao do missil
CRIADO          EQU  1         ; estado de criacao do missil
INATIVO         EQU  0         ; estado do clock do meteoro
ATIVO           EQU  1         ; estado do clock do meteoro
BOM_MET         EQU  0         ; meteoro bom
MAU_MET         EQU  1         ; meteoro mau
LARGURA         EQU  5         ; largura do boneco
ALTURA          EQU  4         ; altura do boneco
COR_PIXEL1      EQU  0FF00H    ; cor da nave (vermelho)
COR_PIXEL2      EQU  0FFFFH    ; cor do meteoro nivel 0
COR_PIXEL3      EQU  0F7FFH    ; cor do meteoro mau (azul)
COR_PIXEL4      EQU  0FFE0H    ; cor do meteoro bom
COR_PIXEL5      EQU  0FF0FH    ; cor do missil(roxo)
TOCA_SOM        EQU  605AH     ; endereço do comando para tocar um som
TOCA_MUSICA     EQU  605CH     ; endereço do comando para tocar música
PAUSA_SOM       EQU  605EH     ; endereço do comando para pausar um som

LARGURA_MET0    EQU  1         ; largura do meteoro nivel 0
ALTURA_MET0     EQU  1         ; altura do meteoro nivel 0
LARGURA_MET1    EQU  2         ; largura do meteoro nivel 1
ALTURA_MET1     EQU  2         ; altura do meteoro nivel 1
LARGURA_MET2    EQU  3         ; largura do meteoro nivel 2
ALTURA_MET2     EQU  3         ; altura do meteoro nivel 2
LARGURA_MET3    EQU  4         ; largura do meteoro nivel 3
ALTURA_MET3     EQU  4         ; altura do meteoro nivel 3
LARGURA_MET4    EQU  5         ; largura do meteoro nivel 4
ALTURA_MET4     EQU  5         ; altura do meteoro nivel 4

LARGURA_MISSIL  EQU  1         ; largura do missil
ALTURA_MISSIL   EQU  1         ; altura do missil
LINHA_MISSIL    EQU  28        ; linha inicial do missil
COL_MISSIL      EQU  0         ; coluna inicial do missil
LIMITE_LIN_MISSIL EQU 16       ; linha máxima do missil



; #######################################################################
; * ZONA DE DADOS 
; #######################################################################
PLACE       1000H

pilha:
    STACK 100H                 ; espaço reservado para a pilha 
                               
SP_inicial:                    



; tabela que define o boneco (cor, largura, pixels)
DEF_BONECO:
    WORD        LINHA_IN,
                COLUNA_IN
    WORD        LARGURA, ALTURA
    WORD        0, COR_PIXEL1, 0, COR_PIXEL1, 0,
                COR_PIXEL1, COR_PIXEL1, COR_PIXEL1, COR_PIXEL1, COR_PIXEL1,
                COR_PIXEL1, 0, COR_PIXEL1, 0, COR_PIXEL1,
                0, 0, COR_PIXEL1, 0, 0;

; tabela que define o missil
DEF_MISSIL:
    WORD        LINHA_MISSIL, COL_MISSIL
    WORD        LARGURA_MISSIL, ALTURA_MISSIL
    WORD        COR_PIXEL5

; tabela que define as coordenadas e o tipo do meteoro
COORDENADAS_METEORO:
    WORD        LINHA_MET0, COLUNA_MET0, MAU_MET,
                LINHA_MET0, COLUNA_MET1, MAU_MET,
                LINHA_MET0, COLUNA_MET2, MAU_MET,
                LINHA_MET0, COLUNA_MET3, MAU_MET;

;tabela que define o estilo do meteoro nivel 0
METEORO_0:
    WORD        LARGURA_MET0, ALTURA_MET0

    WORD        COR_PIXEL2;

;tabela que define o estilo do meteoro nivel 1
METEORO_1:
    WORD        LARGURA_MET1, ALTURA_MET1

    WORD        COR_PIXEL2,COR_PIXEL2,COR_PIXEL2,COR_PIXEL2;

;tabela que define o estilo do meteoro nivel 2 mau
METEORO_2_MAU:
    WORD        LARGURA_MET2, ALTURA_MET2

    WORD        COR_PIXEL3, 0,COR_PIXEL3, 0, COR_PIXEL3,
                0, COR_PIXEL3, 0 ,COR_PIXEL3;

;tabela que define o estilo do meteoro nivel 3 mau
METEORO_3_MAU:
    WORD       LARGURA_MET3, ALTURA_MET3

    WORD       COR_PIXEL3, 0, 0, COR_PIXEL3, 0, COR_PIXEL3,
               COR_PIXEL3, 0, COR_PIXEL3, 0, 0,
               COR_PIXEL3, COR_PIXEL3, 0, 0, COR_PIXEL3;


;tabela que define o estilo do meteoro nivel 4 mau
METEORO_4_MAU:
    WORD        LARGURA_MET4, ALTURA_MET4
    
    WORD        COR_PIXEL3, 0, 0, 0, COR_PIXEL3,
                COR_PIXEL3, 0, COR_PIXEL3, 0, COR_PIXEL3,
                0, COR_PIXEL3, COR_PIXEL3, COR_PIXEL3, 0,
                COR_PIXEL3, 0, COR_PIXEL3, 0, COR_PIXEL3,
                COR_PIXEL3, 0, 0, 0, COR_PIXEL3;

;tabela que define o estilo do meteoro nivel 2 bom
METEORO_2_BOM:
    WORD        LARGURA_MET2, ALTURA_MET2

    WORD        0, COR_PIXEL4, 0, COR_PIXEL4, COR_PIXEL4,
                COR_PIXEL4, 0, COR_PIXEL4,0;

;tabela que define o estilo do meteoro nivel 3 bom
METEORO_3_BOM:
    WORD         LARGURA_MET3, ALTURA_MET3

    WORD         0, COR_PIXEL4, COR_PIXEL4, 0, COR_PIXEL4,
                 COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, 
                 COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, 0, COR_PIXEL4, 
                 COR_PIXEL4, 0;
;tabela que define o estilo do meteoro nivel 4 bom
METEORO_4_BOM:
    WORD        LARGURA_MET4, ALTURA_MET4

    WORD        0, COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, 0,
                COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, COR_PIXEL4,
                COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, 
                COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, 
                COR_PIXEL4, COR_PIXEL4, COR_PIXEL4, 0,
                COR_PIXEL4, COR_PIXEL4, COR_PIXEL4,0;

; tabela que define o estilo da explosão de um meteoro
METEORO_EXPLOSAO:
    WORD        LARGURA_MET4, ALTURA_MET4

    WORD        0, COR_PIXEL1, 0, COR_PIXEL2, 0,
                COR_PIXEL3, 0, COR_PIXEL4, 0, COR_PIXEL1,
                0, COR_PIXEL5, 0, COR_PIXEL2, 0, COR_PIXEL4,
                0, COR_PIXEL2, 0, COR_PIXEL3, 0, COR_PIXEL2,
                0, COR_PIXEL5, 0;

; 
ENERGIA:
    WORD        ENERGIA_IN;

ESTADO:
    WORD        MENU;
     
tab:  
    WORD        rot_int_0; rotina do clock 0
    WORD        rot_int_1; rotina do clock 1
    WORD        rot_int_2; rotina do clock 2

clock_met:
    WORD        ATIVO; estado do clock do meteoro ativo por default  

clock_missil:
    WORD        INATIVO         ; inativo por default

clock_energia:
    WORD        INATIVO        ; estado do clock da energia (default)

estado_missil:
    WORD        NAO_CRIADO      ; estado do missil (nao criado por default)


;tabela para testar as colisoes
testa_colisoes:
    WORD        DIREITA, ESQUERDA;
;tabela que define as coordenadas e a existencia de explosoes
explosoes: 
    WORD        NAO_EXPLOSAO, LINHA_MET0, COLUNA_MET0 ;

; *********************************************************************************
; -.-.- CÓDIGO -.-.-
; *********************************************************************************
PLACE   0                       ; o código tem de começar em 0000H


; *********************************************************************************
; // CENÁRIO - Esta parte do código contém todas as labels e rotinas que controlam o cenário do jogo.
; *********************************************************************************

; // Inicializa o SP e desenha o menu
menu:
    MOV  SP, SP_inicial         ; inicializa SP para a palavra a seguir
                                ; à última da pilha
    MOV  [APAGA_AVISO], R1      ; apaga o aviso de nenhum cenário selecionado
    MOV  [APAGA_ECRÃ], R1       ; apaga todos os pixels já desenhados
    MOV  R1, FUNDO_MENU         ; cenário do menu
    MOV  [SEL_VID_FUNDO], R1    ; seleciona o cenário de fundo
    CALL estado_inicial         ; vai colocar acertar o estado do jogo
    JMP inicio_cenario          ;

; *********************************************************************************
; // estado_inicial - Espera que o jogador pressione qualquer tecla para mudar o estado e inicar o jogo.
;

estado_inicial:
    PUSH R1
    PUSH R4

    MOV  R1, MUSICA_MENU        ; guarda a música do menu
    MOV  [TOCA_MUSICA], R1      ; toca a música do menu
    MOV  R4, ESTADO             ; guarda o endereço do ESTADO
    CALL ciclo                  ; vai ler o teclado
    MOV  R1, PLAY               ; muda o valor do ESTADO
    MOV  [R4], R1               ; guarda o novo valor do ESTADO
    MOV  R1, MUSICA_MENU        ; guarda a música do menu
    MOV  [PAUSA_SOM], R1        ; pausa a música do menu
    MOV  R1, MUSICA_JOGO        ; guarda a música de jogo
    MOV  [TOCA_MUSICA], R1      ; toca a música do jogo

    POP R4
    POP R1
    RET

; // Inicializa o cenário de jogo.
inicio_cenario:
    MOV  R1, FUNDO_JOGO         ; cenário do jogo
    MOV  [SEL_VID_FUNDO], R1    ; seleciona o cenário de fundo
    CALL desenha_boneco         ;
    CALL loop_meteoro           ;
    CALL inicio_teclado         ;
    MOV  BTE, tab               ; inicializa o bte
    EI0                         ; da premissao a interrupcao do clock 0
    EI1                         ; da permissao a interrupcao do clock 1
    EI2                         ; da permissao a interrupcao do clock 2
    EI                          ; da permissao as interrupcoes em geral
    JMP main                    ;
;__________________________________________________________________________________     

; // Função Main que dá ordem ao código.
;::::::::::::::::::::::::::::::::::::::
main:                           ;    ::
    CALL desenha_boneco         ;    ::
    CALL desenha_missil         ;    ::
    CALL loop_meteoro           ;    ::
    CALL inicio_teclado         ;    ::
    CALL controlador_energia    ;    ::
    CALL limpa_explosao         ;    ::
    JMP  main                   ;    ::
;::::::::::::::::::::::::::::::::::::::


; *********************************************************************************
; // limpa_explosao - Esta rotina vai apagar uma explosão do ecrã se existir.
;

limpa_explosao:
    PUSH R1                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R9                     ;
    PUSH R10                    ;
    PUSH R11                    ;

    CALL atraso                 ; chama se o atraso para o sprite da explosao ficar durante mais tempo
    MOV  R4, explosoes          ; endereco da explosoes para saber se ha explosao ou nao 
    MOV  R11, [R4]              ; ve o estado da explosao
    MOV  R6, NAO_EXPLOSAO       ; guarda o estado nao explosao 
    CMP  R11, R6                ; se for nao explosao entao nao ha explosao e vai sair 
    JZ   sai_limpa_explosao     ;
    MOV  [R4], R6               ; atualiza o estado da explosao para nao haver explosao 
    ADD  R4, 2                  ; avanca o endereco para a linha onde esta a explosao
    MOV  R11, [R4]              ; guarda a linha da explosao
    ADD  R4, 2                  ; avanca o endereco para a coluna da explosao
    MOV  R6, [R4]               ; guarda a coluna da explosao
    MOV  R4, METEORO_EXPLOSAO   ; guarda o endereco do estilo da explosao
    MOV  R5, [R4]               ; guarda a largura da explosao
    MOV  R10, R5                ; copia a largua 
    ADD  R4, 2                  ; avanca para o endereco da altura da explosao
    MOV  R9, [R4]               ; guarda a altura da explosao
    MOV  R4, explosoes          ; volta para o endereco do estado da explosao
    ADD  R4, 4                  ; avanca para o endereco da coluna da explosao
    CALL apaga_pixels           ; apaga a explosao
    JMP  sai_limpa_explosao     ; 

sai_limpa_explosao:
    POP  R11                    ;
    POP  R10                    ;
    POP  R9                     ;
    POP  R6                     ;
    POP  R5                     ;
    POP  R4                     ;
    POP  R3                     ;
    POP  R1                     ;
    RET                         ;
    ;______________________________________________________________________________


; *********************************************************************************
; // loop_meteoro - Rotina que controla os 4 meteoros no ecrã indo sequencialmente 
;                   por cada um deles.
;    R0 - Endereço do ESTADO
;    R3 - Valor PLAY
;    R4 - VALOR GM_OVER
;    R11 - Valor INATIVO
;

loop_meteoro:
    PUSH R0                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R7                     ;
    PUSH R10                    ;
    PUSH R11                    ;

    MOV  R4, clock_met          ; endereco do clock do meteoro
    MOV  R11, [R4]              ; estado do clock do meteoro
    CMP  R11, INATIVO           ; ve qual e o estado
    JZ   estado_inativo         ; se for inativo sai da rotina
    MOV  R11, INATIVO           ; volta a colocar o estado como inativo
    MOV  [R4], R11              ; atualiza o estado
    MOV  R3, 4                  ; numero de meteoros no ecra 4 
    MOV  R4, COORDENADAS_METEORO; acede ao endereco das coordenadas dos meteoros
    JMP  loop                   ;

loop: 
    CALL controlo_meteoro       ; vai apagar, testar as colisoes e desenhar o meteoro 
    SUB  R3, 1                  ; menos um meteoro a tratar
    JZ   sair_loop              ; se ja nao houver meteoros a tratar sair 
    ADD  R4, 6                  ; avanca para o endereco das coordenadas do proximo meteoro a tratar
    JMP  loop                   ; volta a repetir 

sair_loop:
    MOV  R0, ESTADO             ; guarda endereco do estado do jogo (game over; menu; play; pausa)
    MOV  R3, [R0]               ; ve qual o estado atual do jogo
    MOV  R4, GM_OVER            ; guarda o estado game over
    CMP  R3, R4                 ; ve se o estado e game over
    JZ   acaba                  ; se for vai acabar o jogo
    JMP  estado_inativo         ; se nao sai do controlo dos meteoros

acaba:
    MOV  R9, BATEU_METEORO      ; guarda o fundo de game over correto
    CALL game_over              ; acaba o jogo 
    MOV  R0, ESTADO             ; guarda o endereco do estado do jogo
    MOV  R3, PLAY               ; guarda o estado play 
    MOV  [R0], R3               ; atualiza o estado do jogo para play
    JMP  estado_inativo         ; sai do controlo dos meteoros
;__________________________________________________________________________________


; *********************************************************************************
; // controlo_meteoro - Esta rotina vai guardar a informação do Meteoro em Registos 
;                       para poder ser desenhado (desenha_pixeis).
;    
;    ~> Retorna R0 (Altura do Meteoro)
;    ~> Retorna R4 (Endereço da Tabela do Meteoro)
;    ~> Retorna R5 (Largura do Meteoro)
;    ~> Retorna R7 (Linha do Meteoro)
;    ~> Retorna R11 (Coluna do Meteoro)

controlo_meteoro:
        PUSH R0                 ;
        PUSH R3                 ;
        PUSH R4                 ;
        PUSH R5                 ;
        PUSH R6                 ;
        PUSH R7                 ;
        PUSH R10                ;
        PUSH R11                ;

        CALL apaga_meteoro      ; vai apagar o meteoro
        CALL colisoes           ; vai testar as colisoes do meteoro com o missil e o com o boneco
        MOV  R11, [R4]          ; obtem a linha do meteoro
        MOV  R7, MAX_LINHA      ; guarda a linha maxima do ecra
        CMP  R11, R7            ; ve se a do meteoro e maior que a linha maxima do ecra
        JGT  max_linha          ; se for vai resetar o meteoro
        ADD  R11, 1             ; incrementa a linha para a proxima vez que o meteoro for desenhado
        MOV  [R4], R11          ; atualiza a coordenada
        SUB  R11, 1             ; volta ao valor original da linha 
        ADD  R4, 2              ; endereco da coluna
        MOV  R7, [R4]           ; obtem a coluna do meteoro
        MOV  R10, R7            ; faz uma copia da coluna
        CALL tipo_met           ; chama o tipo_met para ver qual e o nivel do meteoro        
        MOV  R5, [R4]           ; obtém a largura do meteoro
        MOV  R6, R5             ; copia a largura
        ADD  R4, 2              ; endereco da altura
        MOV  R0, [R4]           ; obtem a altura do meteoro
        ADD  R4, 2              ; endereço da cor do meteoro
        CALL desenha_pixels     ; vai desenhar o meteoro
        JMP estado_inativo      ; vai terminar a rotina

        
    estado_inativo:
        POP  R11                ;
        POP  R10                ;
        POP  R7                 ;   
        POP  R6                 ;
        POP  R5                 ;
        POP  R4                 ;
        POP  R3                 ;
        POP  R0                 ;
        RET                     ;

;__________________________________________________________________________________

max_linha:
    MOV  R11, 0                 ; linha inicial
    MOV  [R4], R11              ; atualiza as coordenadas
    CALL numeros_random         ; vai gerar 3 numeros random
    CALL calcula_coluna         ; vai calcular a coluna do proximo meteoro com os numeros random
    ADD  R4, 2                  ; endereco da coluna
    MOV  [R4], R3               ; atualiza as coordenadas
    CALL calcula_tipo           ; vai gerar um tipo de meteoro (mau ou bom)
    JMP  estado_inativo         ; sai do controlo meteoro

;// Sao gerados 3 numeros random lendo de um periferico e depois usando uma mascara para conter valores de 0-7
numeros_random:
    MOV  R0, TEC_COL            ; endereco do periferico
    MOVB R3, [R0]               ; le um valor random qualquer
    SHR  R3, 5                  ; mascara para ter valores de 0-7
    MOVB R5, [R0]               ; le um valor random qualquer
    SHR  R5, 5                  ; mascara para ter valores de 0-7
    MOVB R6, [R0]               ; le um valor random qualquer
    SHR  R6, 5                  ; mascara para ter valores de 0-7
    RET

;// E calculada uma coluna para o meteoro consoante os 3 numeros random gerados ( (x+y+z)*PRIMO mod MAX_COLUNA )
calcula_coluna:
    ADD  R3, R5                 ; adicona os 3 numeros random
    ADD  R3, R6                 ; adiciona os 3 numeros random 
    MOV  R7, PRIMO              ; guarda um numero primo grande (139)
    MUL  R3, R7                 ; multiplica se a soma dos 3 numeros random com o numero primo
    MOV  R0, MAX_COLUNA_MET     ; guarda se a coluna maxima em que um meteoro pode ser gerado(coluna maxima - largura maxima do meteoro)
    MOD  R3, R0                 ; resto de divisao com a coluna maxima para ter valores entre 0 e a coluna maxima
    MOV  R0, MIN_COLUNA_MET     ; guarda se a coluna minima em que o meteoro pode ser gerado (coluna minima + largura maxima do meteoro)
    CMP  R3, R0                 ; ve se a coluna gerada e menor ou igual com a coluna minima
    JLE  lim_min_met            ; se sim entao vamos incrementa la
    RET                         ; 


lim_min_met:
    ADD  R3, 5                  ; acrescenta 5 para estar dentro dos limites
    RET                         ;

;//Vamos gerar um tipo para o meteoro (bom ou mau) usando um numero random (25% bom; 75% mau)
calcula_tipo:
    PUSH R1                     ;
    ADD  R4, 2                  ; endereco do tipo
    MOV  R0, TEC_COL            ; endereco do periferico
    MOVB R3, [R0]               ; le um valor random
    SHR  R3, 5                  ; mascara para ter valores entre 0-7
    CMP  R3, 2                  ; se for menor que 3 e um meteoro bom (25% bom ; 75% mau)
    JLT  tipo_bom               ; 
    JMP  tipo_mau               ;

tipo_bom:
    MOV  R1, BOM_MET            ; guarda o tipo de meteoro
    MOV  [R4], R1               ; atualiza o tipo de meteoro
    POP  R1                     ;
    RET                         ;

tipo_mau:
    MOV  R1, MAU_MET            ; guarda o tipo de meteoro
    MOV  [R4], R1               ; atualiza o tipo de meteoro
    POP  R1                     ;
    RET                         ;
;__________________________________________________________________________________

; *********************************************************************************
; * // COLISÕES - Esta zona do código contém todas as rotinas que englobam colisões.
; *********************************************************************************

; *********************************************************************************
; //  colisoes - Verifica se o meteoro colidiu com um missil ou boneco.
;

colisoes:
    PUSH R0                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R7                     ;
    PUSH R8                     ;
    PUSH R9                     ;
    PUSH R10                    ;
    PUSH R11                    ;


    MOV  R11, [R4]              ; guarda a linha do meteoro
    SUB  R11 , 1                ; subtrai um para ter a linha do meteoro que aparece no ecra
    ADD  R4, 2                  ; avanca para o endereco da coluna do meteoro
    MOV  R3, DEF_BONECO         ; endereco do boneco
    MOV  R5, [R3]               ; guarda a linha do boneco
    ADD  R3, 6                  ; avanca para a altura do boneco
    MOV  R10, [R3]              ; guarda a altura do boneco
    SUB  R5, R10                ; coloca a linha do boneco no topo do boneco
    CMP  R11, R5                ; ve se a linha do meteoro esta a cima da linha do topo do boneco
    JGE   testa_boneco          ; se sim entao temos que testar colisoes entre o boneco
    MOV  R3, DEF_MISSIL         ; guarda o endereco do missil
    MOV  R5, [R3]               ; guarda a linha do missil
    CMP  R11, R5                ; ve se a linha do meteoro esta a cima da linha do missil
    JGE  testa_missil           ; se sim entao temos que testar colisoes entre o missil
    JMP sair_colisoes           ; 


;// Testa se o boneco avaliando o canto superior direito do boneco com o canto inferior esquerdo do meteoro e vice versa se o canto inferior esquerdo do meteoro estiver a direita do canto superior direito do boneco entao nao ha colisao se estiver a esquerda temos que testar o canto inferior esquerdo do boneco e o canto superior direito do meteoro se este ultimo estiver tambem estiver a esquerda do canto inferior esquerdo do boneco entao nao ha colisao caso contrario ha 
testa_boneco:
    MOV  R3, DEF_BONECO         ; guarda o endereco do boneco
    ADD  R3, 2                  ; avanca para o endereco da coluna do boneco
    MOV  R5, [R3]               ; guarda a coluna do boneco
    MOV  R8, R5                 ; guarda a coluna do boneco
    ADD  R3, 2                  ; avanca para o endereco da largura do boneco
    MOV  R6, [R3]               ; guarda a largura do boneco
    SUB  R6, 1                  ; ajusta se a largura para obter o valor preciso da coluna
    ADD  R5, R6                 ; coluna a direita do boneco
    CALL colisao_direita        ; testa se por colisoes com a coluna direita do boneco
    MOV  R9, testa_colisoes     ; guarda o endereco do testa_colisoes 
    MOV  R7, [R9]               ; guarda o valor do primeiro teste 
    MOV  R10, DIREITA           ; guarda o valor direita
    CMP  R7, R10                ; se o valor de teste for direita nao ha colisao
    JZ   sair_colisoes          ; se estiver a direita nao existe caso nenhum de colisao
    CALL colisao_esquerda       ; testa se por colisoes com a coluna esquerda do boneco
    MOV  R3, testa_colisoes     ; guarda o enderco do testa_colisoes
    ADD  R3, 2                  ; avanca para o valor do segundo teste
    MOV  R6, [R3]               ; guarda o valor do segundo teste
    MOV  R5, DIREITA            ; guarda o valor direita
    CMP  R6, R5                 ; se o valor do segundo teste for direta entao colidiu
    JZ   colidiu_boneco         ; se estiver a direita colidiu com o boneco
    JMP  sair_colisoes          ; se estiver a esquerda nao houve colisao 

;// Testa se o missil da mesma forma que o boneco mas neste caso o canto inferior esquerdo e superior direito do missil sao o mesmo ponto ja que este tem apenas um pixel
testa_missil:
    MOV  R3, DEF_MISSIL         ; guarda o endereco do missil
    ADD  R3, 2                  ; avanca para o endereco da coluna do missil
    MOV  R5, [R3]               ; guarda a coluna do missil
    MOV  R8, R5                 ; guarda a coluna do missil
    CALL colisao_direita        ; testa se por colisoes no canto inferior direito do missil
    MOV  R9, testa_colisoes     ; guarda o endereco de testa_colisoes
    MOV  R7, [R9]               ; guarda o valor do primeiro teste 
    MOV  R10, DIREITA           ; guarda o valor direita
    CMP  R7, R10                ; se o valor do primeiro teste for direita entai nao ha colisao
    JZ   sair_colisoes          ; se estiver a direita nao existe caso nenhum de colisao
    CALL colisao_esquerda       ; testa se por colisoes no canto inferior esquerdo do missil
    MOV  R3, testa_colisoes     ; guarda o valor do endereco testa_colisoes
    ADD  R3, 2                  ; avanca para o endereco do segundo teste
    MOV  R6, [R3]               ; guarda o valor do segundo teste
    MOV  R5, DIREITA            ; guarda o valor da direita
    CMP  R6, R5                 ; se o valor do segundo teste for direita entao ha colisao
    JZ   colidiu_missil         ; se estiver a direita colidiu com o missil 
    JMP  sair_colisoes          ; se estiver a esquerda nao houve colisao

colidiu_boneco:
    ADD  R4, 2                  ; avanca para o endereco do tipo do meteoro
    MOV  R3, BOM_MET            ; guarda o valor do tipo bom
    MOV  R5, [R4]               ; guarda o valor do tipo do meteoro
    CMP  R5, R3                 ; ve se e do tipo bom
    JZ   colidiu_boneco_bom     ;
    JMP  colidiu_boneco_mau     ;

colidiu_boneco_mau:
    MOV  R4, ESTADO             ; guarda o endereco do estado do jogo
    MOV  R3, GM_OVER            ; guarda o estado game over
    MOV  [R4], R3               ; atualiza o estado do jogo para game over
    JMP  sair_colisoes          ;

colidiu_boneco_bom:
    MOV  R0, SOM_ENERGIA        ; seleciona o som da energia
    MOV  [TOCA_SOM], R0         ; toca o som da energia
    SUB  R4, 4                  ; recua para o endereco da linha do meteoro
    MOV  R11, 32                ; guarda um valor maior que a MAX_LINHA para na proxima rotacao este meteoro ser visto como fora dos limites e ser resetado no topo do ecra
    MOV  [R4], R11              ; atualiza a linha do meteoro
    MOV  R3, 10                 ; guarda o valor 10 para incrementar 10 de energia por colidir com um boneco bom
    CALL altera_energia         ; altera a energia
    JMP  sair_colisoes          ;

colidiu_missil:
    MOV  R5, SOM_EXPLOSAO       ; guarda o som da explosão
    MOV  [TOCA_SOM], R5         ; toca o som da explosão
    MOV  R5, estado_missil      ; guarda o endereco do estado do missil
    MOV  R6, NAO_CRIADO         ; guarda o estado nao criado
    MOV  [R5], R6               ; atualiza o estado do missil para nao criado uma vez que ele atingiu um meteoro
    MOV  R5, DEF_MISSIL         ; guarda o endereco do missil
    MOV  R6, LINHA_MISSIL       ; guarda a linha original do missil
    MOV  [R5], R6               ; atualiza a linha antiga do missil para a original
    MOV  R7, [R4]               ; guarda a coluna do meteoro explodido
    MOV  R10, R7                ; faz uma copia da coluna do meteoro explodido
    MOV  R9, R4                 ; faz uma copia do enedereco das coordenadas do meteoro
    MOV  R4, METEORO_EXPLOSAO   ; guarda o endereco do estilo da explosao do meteoro
    MOV  R5, [R4]               ; guarda a largura da explosao
    MOV  R6, R5                 ; faz uma copia da largura da explosao
    ADD  R4, 2                  ; avanca para o endereco da altura da explosao
    MOV  R0, [R4]               ; guarda a altura da explosao
    ADD  R4, 2                  ; avanca para o endereco da cor da explosao
    MOV  R3, explosoes          ; guarda o endereco das explosoes do jogo
    MOV  R8 , EXPLOSAO          ; guarda o valor de haver explosao
    MOV  [R3], R8               ; atualiza o valor do estado das explosoes do jogo para explosao
    ADD  R3, 2                  ; avanca para o endereco da linha da explosao
    MOV  [R3], R11              ; atualiza a linha da explosao para a linha do meteoro explodido
    ADD  R3, 2                  ; avanca para o endereco da coluna da explosao
    MOV  [R3], R7               ; atualiza a coluna da explosao para a coluna do meteoro explodido
    CALL desenha_pixels         ; desenha a explosao
    MOV  R4, R9                 ; retoma ao endereco das coordenadas do meteoro
    SUB  R4, 2                  ; recua para o endereco da linha do meteoro
    MOV  R11, 32                ; da um valor maior que a MAX_LINHA para na proxima rotacao este meteoro ser visto como fora dos limites e ser resetado no topo do ecra
    MOV  [R4], R11              ; tualiza a linha do meteoro
    ADD  R4, 4                  ; avanca para o tipo do meteoro
    MOV  R3, MAU_MET            ; guarda o tipo mau
    MOV  R5, [R4]               ; guarda o tipo do meteoro explodido
    CMP  R5, R3                 ; ve se o tipo do meteoro explodido e mau ou bom
    JZ   colidiu_missil_mau     ; se for do tipo mau vai incrementar a energia
    JMP  sair_colisoes          ;

colidiu_missil_mau:
    MOV  R3, 5                  ; guarda o valor a incrementar a energia
    CALL altera_energia         ; incrementa a energia em 5
    JMP  sair_colisoes          ;

sair_colisoes:
    POP R11                     ;
    POP R10                     ;
    POP R9                      ;
    POP R8                      ;
    POP R7                      ;
    POP R6                      ;
    POP R5                      ;
    POP R4                      ;
    POP R3                      ;
    POP R0                      ;
    RET                         ;


colisao_direita:
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R9                     ;
    MOV  R9, testa_colisoes     ; guarda o endereco de testa_colisoes
    MOV  R6, [R4]               ; guarda da coluna do meteoro (esquerda)
    CMP  R6, R5                 ; ve se a coluna do meteoro esta a direita do objeto
    JGT  direita                ; se esta coloca o valor do primeiro teste como direita
    JMP  esquerda               ; se nao coloca o valor do primeiro teste como esquerda 

colisao_esquerda:
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R9                     ;
    MOV  R9, testa_colisoes     ; guarda o endereco de testa_colisoes
    ADD  R9, 2                  ; avanca para o endereco do segundo teste
    MOV  R6, [R4]               ; coluna do meteoro (esquerda)
    CALL tipo_met               ; vai dizer qual o tipo do meteoro e colocar o endereco da tabela de estilo no R4
    MOV  R3, [R4]               ; largura do meteoro 
    ADD  R6, R3                 ; coluna do meteoro (direita)
    CMP  R6, R8                 ; ve se a coluna esta a direita do objeto 
    JGT  direita                ; se esta coloca o valor do segundo teste como direita
    JMP  esquerda               ; se nao coloca o valor do segundo teste como esquerda 

direita:
    MOV R3, DIREITA             ; guarda o valor direita
    MOV [R9], R3                ; atualiza o valor do teste como direita
    POP R9                      ;
    POP R6                      ;
    POP R5                      ;
    POP R4                      ;
    POP R3                      ;
    RET                         ;

esquerda:
    MOV R3, ESQUERDA            ; guarda o valor esquerda 
    MOV [R9], R3                ; atualiza o valor do teste como esquerda
    POP R9                      ;
    POP R6                      ;
    POP R5                      ;
    POP R4                      ;
    POP R3                      ;   
    RET                         ;
;__________________________________________________________________________________


; *************************************************************************************************************
; // DESENHA/APAGA - Esta parte do código contém todas as rotinas que desenham e apagam os pixeis do ecrã.
; *************************************************************************************************************


; *********************************************************************************
; // desenha_boneco - Esta rotina vai guardar a informação da Nave em Registos para 
;                     poder ser desenhada (desenha_pixeis).
;    
;    R0 - Altura da Nave
;    R4 - Endereço da Tabela da Nave
;    R5 - Largura da Nave
;    R7 - Linha da Nave
;    R11 - Coluna da Nave

desenha_boneco:                 ;
        PUSH R0                 ;
        PUSH R3                 ;
        PUSH R4                 ;
        PUSH R5                 ;
        PUSH R6                 ;
        PUSH R7                 ;
        PUSH R10                ;
        PUSH R11                ;

        MOV  R4, DEF_BONECO     ; endereço da tabela que define o boneco
        MOV  R11, [R4]          ; obtem a linha da nave
        ADD  R4, 2              ; endereco da coluna
        MOV  R7, [R4]           ; obtem a coluna da nave
        MOV  R10, R7            ; faz uma copia da coluna
        ADD  R4, 2              ; endereco da largura        
        MOV  R5, [R4]           ; obtém a largura do boneco
        MOV  R6, R5             ; copia a largura
        ADD  R4, 2              ; endereco da altura
        MOV  R0, [R4]           ; obtem a altura do boneco
        ADD  R4, 2              ; endereço da cor do 1º pixel (2 porque a largura é uma word)
        CALL  desenha_pixels    ; vai desenhar a nave

        POP  R11                ;
        POP  R10                ;
        POP  R7                 ;
        POP  R6                 ;
        POP  R5                 ;
        POP  R4                 ;
        POP  R3                 ;
        POP  R0                 ;
        RET                     ;
;__________________________________________________________________________________

; *********************************************************************************
; // desenha_pixels - Recebe nos Registos as especificações do desenho e desenha 
;                     pixel a pixel (de baixo para cima).
;
;    R3 - Altera pixel
;    R7 - valor da coluna
;    R11 - valor da linha
;

desenha_pixels:
        MOV  R3, [R4]           ; obtém a cor do próximo pixel do boneco
        MOV  [DEF_LINHA], R11   ; seleciona a linha
        MOV  [DEF_COLUNA], R7   ; seleciona a coluna
        MOV  [DEF_PIXEL], R3    ; altera a cor do pixel na linha e coluna selecionadas
        ADD  R4, 2              ; endereço da cor do próximo pixel (2 porque cada cor de pixel é uma word)
        ADD  R7, 1              ; próxima coluna
        SUB  R5, 1              ; menos uma coluna para tratar
        JNZ  desenha_pixels     ; continua até percorrer toda a largura do objeto
        SUB  R0, 1              ; altera a quantidade de linhas que faltam desenhar 
        JNZ  muda_altura        ; vai preparar o "desenha_pixels"
        RET                     ;


; // Prepara o "desenha_pixels" para desenhar a próxima linha.
muda_altura:
    MOV  R5, R6                 ; copia de volta a largura do objeto
    SUB  R11, 1                 ;
    MOV  R7, R10                ; obtem a coluna original
    JMP  desenha_pixels         ;
;__________________________________________________________________________________


; *********************************************************************************
; // tipo_met - Vê qual e o tipo de meteoro consoante a linha onde ele esta.
;

tipo_met:
    PUSH R3                     ;
    PUSH R7                     ;
    MOV  R7, 2                  ; 
    CMP  R11, R7                ; ve se a linha e menor que 2
    JLE  nivel_0                ; se sim o meteoro esta no nivel 0 
    MOV  R7 , 5                 ;
    CMP  R11, R7                ; ve se a linha e menor que 5
    JLE  nivel_1                ; se sim o meteoro esta no nivel 1
    ADD  R4, 2                  ; endereco do tipo de meteoro(bom ou mau)
    MOV  R3, [R4]               ; guarda o tipo do meteoro 
    CMP  R3, MAU_MET            ; ve se e mau
    JLT  niveis_bom             ; se nao for vai avaliar os niveis de meteoro bom
    MOV  R7 , 8                 ;
    CMP  R11, R7                ; ve se a linha e menor que 8
    JLE  nivel_2_mau            ; se sim esta no nivel 2 mau
    MOV  R7, 11                 ;
    CMP  R11, R7                ; ve se a linha e menor que 11
    JLE  nivel_3_mau            ; se sim esta no nivel 3 mau
    JMP  nivel_4_mau            ; se nao esta no nivel 4 mau

nivel_0:
    MOV  R4, METEORO_0          ; coloca o meteoro no nivel 0
    JMP tipo_met_fim            ; vai terminar a rotina

nivel_1:
    MOV  R4, METEORO_1          ; coloca o meteoro no nivel 1
    JMP tipo_met_fim            ; vai terminar a rotina

nivel_2_mau:
    MOV  R4, METEORO_2_MAU      ; coloca o meteoro no nivel 2 mau
    JMP tipo_met_fim            ; vai terminar a rotina

nivel_3_mau:
    MOV  R4, METEORO_3_MAU      ; coloca o meteoro no nivel 3 mau
    JMP tipo_met_fim            ; vai terminar a rotina

nivel_4_mau:
    MOV  R4, METEORO_4_MAU      ; coloca o meteoro no nivel 4 mau
    JMP tipo_met_fim            ; vai terminar a rotina

niveis_bom:
    MOV  R7 , 8                 ;
    CMP  R11, R7                ; ve se a linha e menor que 8
    JLE  nivel_2_bom            ; se sim esta no nivel 2
    MOV  R7, 11                 ;
    CMP  R11, R7                ; ve se a linha e menor que 11
    JLE  nivel_3_bom            ; se sim esta no nivel 3 bom
    JMP  nivel_4_bom            ; se nao esta no nivel 4 bom

nivel_2_bom:
    MOV  R4, METEORO_2_BOM      ; coloca o meteoro no nivel 2 bom
    JMP tipo_met_fim            ; vai terminar a rotina

nivel_3_bom:
    MOV  R4, METEORO_3_BOM      ; coloca o meteoro no nivel 3 bom
    JMP tipo_met_fim            ; vai terminar a rotina

nivel_4_bom:
    MOV  R4, METEORO_4_BOM      ; coloca o meteoro no nivel 4 bom
    JMP tipo_met_fim            ; vai terminar a rotina

tipo_met_fim:
    POP  R7                     ;
    POP  R3                     ;
    RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // desenha_missil - Desenha o missil no ecrã.
;

desenha_missil:
    PUSH R0                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R7                     ;
    PUSH R10                    ;
    PUSH R11                    ;

    MOV  R11, NAO_CRIADO        ; guarda o valor NAO_CRIADO
    MOV  R4, estado_missil      ; guarda o endereço estado_missil
    MOV  R5, [R4]               ; guarda o valor do estado_missil
    CMP  R5, R11                ; verifica se o missil existe
    JZ   desativa_missil        ; se não existir vai ser desativado
    MOV  R11, INATIVO           ; guarda o valor do INATIVO
    MOV  R4, clock_missil       ; guarda o endereço clock_missil
    MOV  R5, [R4]               ; guarda o estado do clock_missil
    CMP  R11, R5                ; veririca se está ativo
    JZ   acaba_missil           ; se não estiver é terminada a rotina
    MOV  [R4], R11              ; atualiza o clock do missil
    MOV  R4, DEF_MISSIL         ; guarda o endereço da linha do missil
    CALL apaga_missil           ; vai apagar o missil
    MOV  R11, [R4]              ; guarda a linha do missil
    MOV  R0, LIMITE_LIN_MISSIL  ; guarda o valor minimo da linha do missil
    SUB  R11, R0                ; testa distancia do missil
    JN   desativa_missil        ; se o limite foi excedido o missil é desativado
    ADD  R11, R0                ; repõe a sua linha
    ADD  R4, 2                  ; guarda o endereço da coluna do missil
    MOV  R7, [R4]               ; guarda a coluna do missil
    MOV  R10, R7                ; copia a coluna
    ADD  R4, 2                  ; guarda o endereço da largura do missil
    MOV  R5, [R4]               ; guarda a largura do missil
    MOV  R6, R5                 ; copia a largura
    ADD  R4, 2                  ; guarda o endereço da altura do missil
    MOV  R0, [R4]               ; guarda a altura do missiç
    ADD  R4, 2                  ; guarda o endereço da cor do missil
    CALL desenha_pixels         ; vai desenhar o missil
    JMP acaba_missil            ; vai terminar a rotina

; // Coloca estado do missil a INATIVO.
desativa_missil:
    MOV  R4, estado_missil      ; guarda o endereço estado_missil
    MOV  R11, NAO_CRIADO        ; guarda o valor NAO_CRIADO
    MOV  [R4], R11              ; coloca o estado do missil a NAO_CRIADO
    MOV  R4, DEF_MISSIL         ; guarda o endereço da linha do missil
    MOV  R11, LINHA_MISSIL      ; guarda a linha inicial do missil
    MOV  [R4], R11              ; reseta a linha do missil
    JMP  acaba_missil           ; vai terminar a rotina

acaba_missil:
    POP R11                     ;
    POP R10                     ;
    POP R7                      ;
    POP R6                      ;
    POP R5                      ;
    POP R4                      ;
    POP R3                      ;
    POP R0                      ;
    RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // apaga_missil - Apaga no missil do ecrã.
;    

apaga_missil:
    PUSH R1                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R9                     ;
    PUSH R10                    ;
    PUSH R11                    ;

    MOV  R11, [R4]              ; obtem linha do missil
    SUB  R11, 1                 ; altera a linha do missil para a proxima vez que for desenhado
    MOV  [R4], R11              ; atualiza a tabela
    ADD  R11, 1                 ; obtem a linha atual do missil
    ADD  R4, 2                  ; obtem o endereco da coluna do missil
    MOV  R1, R4                 ; copia endereco da coluna do missil
    MOV  R6, [R4]               ; obtem coluna do missil
    ADD  R4, 2                  ; obtem endereco da largura do missil
    MOV  R5, [R4]               ; obtem largura do missil
    ADD  R4, 2                  ; obtem endereco da altura do missil
    MOV  R9, [R4]               ; obtem altura do missil
    MOV  R4, R1                 ; obtem endereco da coluna do missil
    CALL apaga_pixels           ; apaga o missil da posicao atual

    POP  R11                    ;
    POP  R10                    ;
    POP  R9                     ;
    POP  R6                     ;
    POP  R5                     ;
    POP  R4                     ;
    POP  R3                     ;
    POP  R1                     ;
    RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // apaga_meteoro - Esta rotina vai guardar a informação do Meteoro em Registos para poder ser apagada (apaga_pixels).
;    
;    R4 - Endereço da Tabela do Meteoro
;    R5 - Largura do Meteoro
;    R6 - Coluna do Meteoro
;    R7 - Valor da mudança de linha
;    R9 - Altura do Meteoro
;    R11 - Linha do Meteoro

apaga_meteoro:
    PUSH R1                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R9                     ;
    PUSH R10                    ;
    PUSH R11                    ;

    MOV  R11, [R4]              ; obtem a linha do meteoro
    ADD  R4, 2                  ; endereco da coluna
    MOV  R1, R4                 ; faz uma copia do endereco do meteoro
    MOV  R6, [R4]               ; obtem a coluna do meteoro
    CALL tipo_met               ; vai saber qual o tipo de meteoro    
    MOV  R5, [R4]               ; obtém a largura do meteoro
    MOV  R10, R5                ; copia a largura
    ADD  R4, 2                  ; endereco da altura
    MOV  R9, [R4]               ; obtem a altura do meteoro
    SUB  R11, 1                 ; subtrai se um a linha para ter com exitadao a linha do meteoro no ecra
    MOV  R4, R1                 ; volta a colocar o endereco do meteoro no R4
    CALL  apaga_pixels          ; vai apagar o meteoro

    POP  R11                    ;
    POP  R10                    ;
    POP  R9                     ;
    POP  R6                     ;
    POP  R5                     ;
    POP  R4                     ;
    POP  R3                     ;
    POP  R1                     ;
    RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // apaga_boneco - Esta rotina vai guardar a informação da Nave em Registos para poder ser apagada (apaga_pixels).
;    
;    R4 - Endereço da Tabela da Nave
;    R5 - Largura da Nave
;    R6 - Coluna da Nave
;    R8 - Valor da mudança de coluna
;    R9 - Altura da Nave
;    R11 - Linha da Nave
;
;    ~> Pode retornar R7 ou R8 resetados

apaga_boneco:                   ;
    PUSH R1                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R9                     ;
    PUSH R10                    ;
    PUSH R11                    ;
    
    MOV  R4, DEF_BONECO         ; endereço da tabela que define o boneco
    MOV  R11, [R4]              ; obtem a linha do boneco
    ADD  R4, 2                  ; endereco da coluna
    MOV  R6, [R4]               ; obtem a coluna do boneco
    ADD  R4, 2                  ; endereco da largura    
    MOV  R5, [R4]               ; obtém a largura do boneco
    MOV  R10, R5                ; copia a largura
    ADD  R4, 2                  ; endereco da altura
    MOV  R9, [R4]               ; obtem a altura do boneco
    ADD  R6, R8                 ; aumenta a coluna do boneco
    JN   limites_laterais       ; testa se esta no limite esquerdo
    MOV  R1, 64                 ; obtem o limite direito
    ADD  R6, R5                 ; 
    SUB  R6, R1                 ;
    JGT  limites_laterais       ; testa se esta no limite direito
    SUB  R4, 4                  ; endereco da coluna
    MOV  R6, [R4]               ; obtem a altura do boneco novamente
    CALL  apaga_pixels          ; vai apagar o pixel selecionado
    JMP  fim_apaga_pixels       ; vai terminar a rotina

    ; // Limites da Nave (esquerda e direita).
    limites_laterais:
        MOV  R8, 0                  ; reseta R8
        JMP  fim_apaga_pixels       ; vai terminar a rotina

    ; // Limites do Meteoro (cima e baixo).
    limites_verticais:
        MOV  R7, 0                  ; reseta R7
        JMP  fim_apaga_pixels       ; vai terminar a rotina
    
    fim_apaga_pixels:
        POP  R11                    ;
        POP  R10                    ;
        POP  R9                     ;
        POP  R6                     ;
        POP  R5                     ;
        POP  R4                     ;
        POP  R3                     ;
        POP  R1                     ;
        RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // apaga_pixels - Apaga os pixeis desenhados que foram selecionados.
;
;    R3 - Altera pixel
;    R6 - valor da coluna
;    R11 - valor da linha

apaga_pixels:                   ; desenha os pixels do boneco a partir da tabela
    MOV  R3, 0                  ; para apagar, a cor do pixel é sempre 0
    MOV  [DEF_LINHA], R11       ; seleciona a linha
    MOV  [DEF_COLUNA], R6       ; seleciona a coluna
    MOV  [DEF_PIXEL], R3        ; altera a cor do pixel na linha e coluna selecionadas
    ADD  R6, 1                  ; próxima coluna
    SUB  R5, 1                  ; menos uma coluna para tratar
    JNZ  apaga_pixels           ; continua até percorrer toda a largura do objeto
    SUB  R9, 1                  ; menos uma linha para tratar
    JNZ  muda_altura_apaga      ; vai preparar o "apaga_pixels"
    RET                         ;

; // Prepara o "apaga_pixels" para apagar a próxima linha.
muda_altura_apaga:
    MOV  R5, R10                ; copia de volta a largura do objeto
    SUB  R11, 1                 ;
    MOV  R6, [R4]               ; obtem a coluna original
    JMP  apaga_pixels           ;

;__________________________________________________________________________________


; **************************************************************************************************************
; // TECLADO - Esta parte do código contém todas as labels e rotinas que controlam e recebem inputs do teclado.
; **************************************************************************************************************


; *********************************************************************************
; // inicio_teclado - Função principal do teclado
;    
;    R2 - Endereço do periférico das linhas
;    R3 - Endereço do periférico das colunas
;    R4 - Endereço do periférico dos displays
;    R5 - Máscara
;    R6 - Endereço da energia
;    R7 - Valor da mudança de linha
;    R8 - Valor da mudança de coluna
;    R9 - Valor da energia
;    R10 - Valor do atraso

inicio_teclado:     
    PUSH R1                     ;
    PUSH R2                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R7                     ;
    PUSH R8                     ;
    PUSH R9                     ;
    PUSH R10                    ;
    PUSH R11                    ;

    MOV  R1, FUNDO_JOGO         ; guarda o fundo do jogo
    MOV  [SEL_VID_FUNDO], R1    ; seleciona o cenário de fundo
    MOV  R4, DISPLAYS           ; endereço do periférico dos displays

    MOV  R8, 0                  ; guarda o valor a que aumenta/decrementa a coluna
    MOV  R7, 0                  ; guarda o valor de mudanca da linha
    MOV  R10, ATRASO            ; guarda o valor do atraso
    MOV  R6, ENERGIA            ; guarda endereço da energia
    MOV  R9, [R6]               ; guarda o valor da energia
    CALL conversor              ; vai converter o valor da energia em decimal
    MOV  [R4], R9               ; escreve nos displays
    CALL ciclo                  ; chama o ciclo que recebe inputs to teclado
    
    POP  R11                    ;
    POP  R10                    ;
    POP  R9                     ;
    POP  R8                     ;
    POP  R7                     ;
    POP  R6                     ;
    POP  R5                     ;
    POP  R4                     ;
    POP  R3                     ;
    POP  R2                     ;
    POP  R1                     ;
    RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // conversor - Converte o valor da energia de hexadecimal para decimal.
;    
;    R9 - Valor da energia (hexadecimal)
;
;    ~> Retorna R9 (Valor da energia em decimal)

conversor:
    PUSH R0                     ;
    PUSH R1                     ;
    PUSH R2                     ;
    PUSH R3                     ;
    PUSH R4                     ;

    MOV  R0, FATOR              ; guarda o fator
    MOV  R1, CNST_DECIMAL       ; guarda a constante decimal
    MOV  R2, R9                 ; guarda o valor da energia 
    MOV  R9, 0                  ; coloca o valor final a 0
    JMP ciclo_cnv               ;

    ciclo_cnv:
        MOD R2, R0              ; obtem o resto
        DIV R0, R1              ; diminui o fator de divisão
        MOV R3, R2              ; faz uma copia do valor
        DIV R2, R0              ; obtem um digito
        MOV R4, R2              ; guarda o digito
        MOV R2, R3              ; retorna o valor
        SHL R9, 4               ; desloca para dar dar espaço ao novo digito
        OR  R9, R4              ; vai compondo o resultado
        CMP R0, 1               ; verifica se o fator é inferior a 10
        JNZ ciclo_cnv           ; se não vai continuar o ciclo
        JMP termina             ; vai terminar a rotina

    termina:
        POP  R4                 ;
        POP  R3                 ;
        POP  R2                 ;
        POP  R1                 ;
        POP  R0                 ;
        RET                     ;
;__________________________________________________________________________________


; *********************************************************************************
; // altera_coordenadas - Altera as coordenadas do objeto (Nave ou Meteoro).
;    
;    R1 - Endereço da Tabela (Nave ou Meteoro)
;    R7 - Valor a acrencentar à linha
;    R8 - Valor a acrescentar à coluna

altera_coordenadas:
    PUSH R1                     ;
    PUSH R7                     ;
    PUSH R8                     ;
    PUSH R11                    ;
    
    MOV  R1, DEF_BONECO         ; acede a tabela do boneco
    ADD  R1, 2                  ; obtem a coluna do boneco
    MOV  R11, [R1]              ;
    ADD  R11, R8                ; para desenhar objeto na coluna seguinte (direita ou esquerda)
    MOV  [R1], R11              ;
    MOV  R8, 0                  ; reinicia o input colunas do teclado
    MOV  R7, 0                  ; reinicia o input linhas do teclado
    
    POP R11                     ;
    POP R8                      ;
    POP R7                      ;
    POP R1                      ;
    RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // ciclo - Ciclo principal que recebe o input do teclado e chama as funções necessárias a atoar.
;    
;    R1 - Registo que guarda a linha do teclado corrente
;    R6 - Endereço da energia
;    R7 - Valor da mudança de linha
;    R8 - Valor da mudança de coluna
;    R9 - Registo que guarda a tecla corrente
;    R11 - Valor da energia
;
;    ~> Retorna os valores de R7 e R8.

ciclo:
    PUSH R0                     ;
    PUSH R1                     ;
    PUSH R2                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R6                     ;
    PUSH R9                     ;
    PUSH R10                    ;
    PUSH R11                    ;
    
    MOV  R2, TEC_LIN            ; endereço do periférico das linhas
    MOV  R3, TEC_COL            ; endereço do periférico das colunas
    MOV  R5, MASCARA            ; para isolar os 4 bits de menor peso, ao ler as colunas do teclado
    MOV  R6, ENERGIA            ; guarda o endereço da energia
    MOV  R11, [R6]              ; guarda o valor da energia
    MOV  R10, ANTI_LOOP         ;
    JMP  reseta                 ; inicia/reseta o teclado

auxiliar_teclado:
    POP  R11                    ;
    POP  R10                    ;
    POP  R9                     ;
    POP  R6                     ;
    POP  R5                     ;
    POP  R4                     ;
    POP  R3                     ;
    POP  R2                     ;
    POP  R1                     ;
    POP  R0                     ;
    RET                         ;
;__________________________________________________________________________________

; // Reseta as linhas do teclado.
reseta:
    MOV  R1, LINHA1             ; guarda o valor da linha
    JMP  espera_tecla           ; vai esperar que uma tecla seja premida

; // Faz um ciclo que espera até uma tecla ser premida.
espera_tecla:                   ; 
    MOVB [R2], R1               ; escrever no periférico de saída (linhas)
    MOVB R0, [R3]               ; ler do periférico de entrada (colunas)
    AND  R0, R5                 ; elimina bits para além dos bits 0-3
    CMP  R10, 0                 ;
    JZ   auxiliar_teclado       ;                  
    CMP  R0, 0                  ; há tecla premida?
    JZ   proxima_linha          ; se nenhuma tecla premida, passa para a próxima linha
                                ; vai mostrar a linha e a coluna da tecla
    SHL  R1, 4                  ; coloca linha no nibble high
    OR   R1, R0                 ; junta coluna (nibble low)
    

; *********************************************************************************
; -.-.- TESTA TECLADO -.-.-
; *********************************************************************************

    ; // TESTA MENU
    MOV  R0, ESTADO             ; guarda o endereço do ESTADO
    MOV  R9, [R0]               ; guarda o valor do ESTADO
    CMP  R9, MENU               ; verifica se o jogo está no menu inicial
    JZ  muda_estado             ; vai iniciar o jogo

    ; // TESTA GAME OVER
    MOV  R0, ESTADO             ; guarda o endereço do ESTADO
    MOV  R9, [R0]               ; guarda o valor do ESTADO
    CMP  R9, GM_OVER            ; verifica se o jogo está na tela de game over
    JZ  testa_tecla_D           ; vai verificar se a tecla D foi premida

    ; // TESTA PAUSE
    MOV  R0, ESTADO             ; guarda o endereço do ESTADO
    MOV  R9, [R0]               ; guarda o valor do ESTADO
    CMP  R9, PAUSE              ; verifica se o jogo esta pausado
    JZ testa_tecla_C            ; se sim vai ver se continua pausado ou resume
    
    testa_tecla_0:
        MOV  R9, TEC_0          ; guarda o valor da tecla 0
        CALL atraso             ; comeca a rotina de atraso
        CMP  R1, R9             ; verifica se a tecla premida foi 0
        JNZ  testa_tecla_1      ; se não vai testar a próxima tecla
        MOV  R0, -1             ; valor a adicionar à coluna do rover
        CALL muda_col           ; vai decrementar a coluna do rover
        JMP  auxiliar_teclado   ; 

    testa_tecla_1:
        MOV  R9, TEC_1          ; guarda o valor da tecla 1
        CALL atraso             ; comeca a rotina de atraso
        CMP  R1, R9             ; verifica se a tecla premida foi 1
        JNZ  testa_tecla_4      ; se não vai testar a próxima tecla
        MOV  R0, 1              ; valor a adicionar à coluna do rover
        CALL muda_col           ; vai decrementar a coluna do rover
        JZ  muda_col            ; vai aumentar a coluna do rover
        JMP  auxiliar_teclado   ;

    testa_tecla_4:
        MOV  R9, TEC_4          ; guarda o valor da tecla 4
        CMP  R1, R9             ; verifica se a tecla premida foi 4
        JNZ  testa_tecla_C      ; se não vai testar a próxima tecla
        CALL cria_missil        ; vai criar um missil
        JMP  ha_tecla           ;

    testa_tecla_C:
        MOV  R9, TEC_C          ; guarda o valor da tecla C
        CMP  R1, R9             ; verifica se a tecla premida foi C
        JNZ  testa_tecla_F      ; se não vai testar a próxima tecla
        CALL pausa              ; se sim vai para o menu de pausa
        JMP  ha_tecla           ; verifica se a tecla continua premida

    testa_tecla_D:
        MOV  R9, TEC_D          ; guarda o valor da tecla D
        CMP  R1, R9             ; verifica se a tecla D foi premida
        JNZ  reseta             ; se não vai resetar o teclado
        CALL reset_game         ; vai resetar o jogo
        MOV  R9, LINHA4         ; guardar a linha correta
        JMP  ha_tecla           ; verificar se a tecla continua premida

    testa_tecla_F:
        MOV  R9, TEC_F          ; guarda o valor da tecla F
        CMP  R1, R9             ; verifica se a tecla premida foi F
        JNZ  reseta             ; se não vai resetar o teclado
        MOV  R9, FIM_TECLADO    ; guarda o fundo de game over correto
        CALL game_over          ; vai terminaro jogo
        MOV  R9, LINHA4         ; guarda a linha correta
        JMP  ha_tecla           ; verificar se a tecla continua premida 
;__________________________________________________________________________________


; // Avança nas linhas do teclado.
proxima_linha:
    CALL clock_teclado          ; vai atualizar o relogio
    SHL  R1, 1                  ; salta para a proxima linha do teclado
    ADD  R1, -8                 ; verifica se esta dentro dos limites das linhas [1,8]                  
    JGT  reseta                 ; se estiver fora do limite de linhas reinincia
    SUB  R1, -8                 ; se estiver dentro dos limites volta ao valor original
    JMP  espera_tecla           ; se nenhuma tecla premida, repete

; // Auxiliar à mudança de estado do jogo.
muda_estado:
    MOV  R9, R1                 ;
    SHR  R9, 4                  ; vai guardar a linha correta
    JMP  ha_tecla               ; vai iniciar o jogo

; // Faz um ciclo que espera até nenhuma tecla estar premida.
ha_tecla:                       ; neste ciclo espera-se até NENHUMA tecla estar premida
    MOVB [R2], R9               ; escrever no periférico de saída (linhas)
    MOVB R1, [R3]               ; ler do periférico de entrada (colunas)
    AND  R1, R5                 ; elimina bits para além dos bits 0-3
    CMP  R1, 0                  ; há tecla premida?
    JNZ  ha_tecla               ; se ainda houver uma tecla premida, espera até não haver
    MOV  R9, ESTADO             ; guarda o endereço do ESTADO
    MOV  R4, [R9]               ; guarda o valor do ESTADO
    CMP  R4, PAUSE              ; verifica se o jogo está pausado
    JZ   reseta                 ; se sim vai voltar a ler o teclado
    JMP  auxiliar_teclado       ;

; *********************************************************************************
; // clock_teclado - Esta rotina subtrai 1 a um relógio permitindo ao jogo continuar 
;                    sem nenhuma tecla ser premida.
;    
;    R10 - Relógio
;
;    ~> Retorna R10 (relógio atualizado)

clock_teclado:
    PUSH R1                     ;
    PUSH R9                     ;

    MOV  R1, ESTADO             ; guarda o endereço do ESTADO
    MOV  R9, [R1]               ; guarda o valor do ESTADO
    CMP  R9, MENU               ; verifica se o jogo está no menu inicial
    JZ clock_aux                ; se sim termina esta rotina
    CMP  R9, GM_OVER            ; verifica se o jogo está na tela de game over
    JZ clock_aux                ; se sim termina esta rotina
    CMP  R9, PAUSE              ; verifica se o jogo esta pausado
    JZ clock_aux                ; se sim termina esta rotina
    SUB R10, 1                  ; subtrai 1 ao relógio
    JMP clock_aux               ; se sim termina esta rotina


; // Termina a rotina "clock_teclado".
clock_aux:
    POP R1                      ;
    POP R9                      ;
    RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // atraso - Esta rotina atrasa o programa reduzindo 1 a uma constante grande por 
;             cada iteração.
; 
;    R1 - Constante de atraso

atraso:
    PUSH R1                     ;
    MOV  R1, ATRASO             ; guarda o valor de atraso
    JMP ciclo_atraso            ;

; // Ciclo de atraso.
ciclo_atraso:
    SUB  R1 , 1                 ;
    JNZ  ciclo_atraso           ; faz um ciclo até o Registo chegar a 0
    POP  R1                     ;
    RET                         ;
;___________________________________________________________________________________


; *********************************************************************************
; // muda_col - Esta rotina altera a coluna do rover (+1 ou -1).
; 
;    R0 - Valor a adicionar à coluna
;
;    ~> Retorn R8 (valor da coluna atualizado)

muda_col:
    MOV  R8, R0                 ; muda a coluna
    MOV  R0, SOM_MOVER          ; escolhe o som
    MOV [TOCA_SOM], R0          ; toca o som
    CALL apaga_boneco           ; chama o ciclo que apaga o boneco
    CALL altera_coordenadas     ; chama o ciclo que altera as coordenadas dos objetos
    RET
;__________________________________________________________________________________


;****************************************************************
; // controlador_energia - Esta rotina decrementa a energia periodicamente.
;

controlador_energia:
    PUSH R0                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R9                     ;

    MOV R4, clock_energia       ; obtem a tabela do clock da energia
    MOV R0, ATIVO               ; obtem estado ativo
    MOV R5, [R4]                ; obtem o estado do clock da energia
    CMP R0, R5                  ; verifica se clock da energia esta ativo
    JZ  reduz_energia_periodica ; caso esteja, decrementa energia em 5
    JMP sai_energia             ;

reduz_energia_periodica:
    MOV  R0, INATIVO            ;
    MOV  [R4], R0               ;
    MOV  R3, -5                 ; para decrementar a energia em 5
    CALL altera_energia         ; altera a energia com o valor em R3
    MOV  R5, ENERGIA            ; obtem tabela da energia
    MOV  R9, [R5]               ; obtem energia
    CMP  R9, 0                  ; verifica se energia menor ou igual a 0
    JLE  acabou_energia         ; se sim, acabou a energia
    JMP  sai_energia            ;

acabou_energia:
    MOV  R9, SEM_ENERGIA        ; guarda o fundo de game over correto
    CALL game_over              ; termina o jogo
    JMP  sai_energia            ;


sai_energia:
    POP  R9                     ;
    POP  R5                     ;
    POP  R4                     ;
    POP  R3                     ;
    POP  R0                     ;
    RET                         ;
;__________________________________________________________________________________


; *******************************************************************************************************
; EXECUCÃO - Esta zona do código contém todas as rotinas que podem ser executadas ao premir uma tecla.
; *******************************************************************************************************


;****************************************************************
; // altera_energia - Esta rotina decrementa ou aumenta o valor da energia.
;
;    R3 - valor a decrementar/aumentar ao valor da energia

altera_energia:
    PUSH R4                     ;
    PUSH R5                     ;
    PUSH R9                     ;

    MOV R4, DISPLAYS            ; obtem endereco dos displays
    MOV R5, ENERGIA             ; obtem endereco da tabela da energia
    MOV R9, [R5]                ; obtem energia
    ADD R9, R3                  ; altera a energia consoante o valor requisitado
    MOV [R5], R9                ; atualiza a tabela da energia
    CALL conversor              ; converte o valor da energia para colocar nos displays
    MOV [R4], R9                ; coloca energia no display
    
    POP R9                      ;
    POP R5                      ;
    POP R4                      ;
    RET
;__________________________________________________________________________________



;**********************************************************************************
; // cria_missil - Rotina que chamas as instruções necessárias à criação de um missil.
;
;   R7 - Coluna do missil
;   R11 - linha do missil

cria_missil:
    PUSH R1                     ;
    PUSH R3                     ;
    PUSH R4                     ;
    PUSH R7                     ;
    PUSH R9                     ;
    PUSH R11                    ;

    MOV  R4, estado_missil      ; endereco da tabela do estado do missil
    MOV  R11, CRIADO            ; constante que representa o estado de criacao do missil
    MOV  R7, [R4]               ; obtem o estado de criacao do missil
    CMP  R7, R11                ; verifica se missil tem estado criado
    JZ   acabar_criar_missil    ; se criado, sai do cria missil
    MOV  R1, SOM_DISPARO        ; guarda o som do disparo
    MOV [TOCA_SOM], R1          ; toca o som do disparo
    MOV  [R4], R11              ; se nao, coloca estado criado na tabela do missil
    MOV  R3, -5                 ; coloca o valor de alteracao de energia
    CALL altera_energia         ; altera a energia com o valor colocado
    MOV  R4, ENERGIA            ;  obtem endereco da energia
    MOV  R9, [R4]               ; obtem energia
    CMP  R9, 0                  ; verifica se energia nao e menor ou igual a 0
    JLE  sem_energia_missil     ;
    MOV  R4, DEF_BONECO         ; obtem tabela do boneco
    ADD  R4, 2                  ; obtem endereco da coluna do boneco
    MOV  R7, [R4]               ; obtem coluna do boneco
    ADD  R7, 2                  ; adiciona 2 a coluna para centrar a coluna de disparo do missil
    MOV  R4, DEF_MISSIL         ; obtem a tabela do missil
    MOV  R11, LINHA_MISSIL      ; obtem a linha inicial do missil
    MOV  [R4], R11              ; coloca a linha inicial do missil no missil
    ADD  R4, 2                  ; obtem o endereco da coluna do missil
    MOV  [R4], R7               ; coloca a coluna do rover no endereco da coluna do missil
    JMP  acabar_criar_missil    ;

sem_energia_missil:
    MOV  R9, SEM_ENERGIA        ; guarda o fundo de game over correto
    CALL game_over              ; acaba o jogo
    JMP  acabar_criar_missil    ; acaba de criar o missil

acabar_criar_missil:
    POP  R11                    ;
    POP  R9                     ;
    POP  R7                     ;
    POP  R4                     ;
    POP  R3                     ;
    POP  R1                     ;
    RET
;__________________________________________________________________________________


;**********************************************************************************
; // pausa - Rotina que vai pausar o jogo.
;    
;    R1 - Endereço do ESTADO 
;
;    ~> Retorna R9 (Linha 4 do teclado)

pausa:
    PUSH R1                     ;
    PUSH R4                     ;
    PUSH R7                     ;
    PUSH R8                     ;

    MOV  R1, ESTADO             ; guarda o endereço do ESTADO
    MOV  R4, [R1]               ; guarda o valor do ESTADO
    CMP  R4, PAUSE              ; verifica se um jogo está pausado
    JZ   resumo                 ; se sim vai dar resumo ao jogo
    MOV  [APAGA_ECRÃ], R4       ; apaga todos os pixeis desenhados
    MOV  R4, FUNDO_PAUSA        ; escolhe o fundo de pausa
    MOV  [SEL_VID_FUNDO], R4    ; seleciona o fundo
    MOV  R8, MUSICA_JOGO        ; seleciona a música de jogo
    MOV  [PAUSA_SOM], R8        ; pausa a música do jogo
    MOV  R8, MUSICA_PAUSA       ; seleciona a música de pausa
    MOV  [TOCA_MUSICA], R8      ; toca a música de pausa
    MOV  R4, PAUSE              ; guarda o valor de PAUSE
    MOV  [R1], R4               ; altera o estado para PAUSE
    JMP fim_pausa               ; finaliza a rotina

    resumo:
        MOV  R8, MUSICA_PAUSA   ; seleciona a música de pausa
        MOV  [PAUSA_SOM], R8    ; pausa a música de pausa
        MOV  R8, MUSICA_JOGO    ; seleciona a música do jogo
        MOV  [TOCA_MUSICA], R8  ; toca a música do jogo
        MOV  R4, FUNDO_JOGO     ; escolhe o fundo de jogo
        MOV  [SEL_VID_FUNDO], R4; seleciona o cenário de fundo
        CALL desenha_boneco     ; volta a desenhar o boneco
        CALL loop_meteoro       ; volta a desenhar o meteoro
        MOV  R4, PLAY           ; guarda o valor de PLAY
        MOV  [R1], R4           ; altera o estado para PLAY
        JMP fim_pausa           ; finaliza a rotina

    fim_pausa:
        MOV R9, LINHA4          ; guardar o valor da linha
        POP  R8                 ;
        POP  R7                 ;
        POP  R4                 ;
        POP  R1                 ;
        RET                     ;
;___________________________________________________________________________________


; *********************************************************************************
; // game_over - Esta rotina coloca o cenário na tela de game over e espera que o jogador recomece o jogo.
;
;    R1 - Valor do ESTADO    
;    R4 - Endereço do ESTADO
;    R9 - Valor de fundo


game_over:
    PUSH R1                     ;
    PUSH R4                     ;

    cenario_fim:
        MOV  R4, MUSICA_JOGO    ; guarda a música do jogo
        MOV  [PAUSA_SOM], R4    ; pausa a música do jogo
        MOV  R4, MUSICA_PAUSA   ; guarda a música de pausa
        MOV  [PAUSA_SOM], R4    ; pausa a música de pausa
        MOV  R4, SOM_GAME_OVER  ; guarda o som de game over
        MOV  [TOCA_SOM], R4     ; toca o som de game over
        MOV  R1, 0              ;
        MOV  [APAGA_ECRÃ], R1   ; apaga todos os pixeis desenhados
        MOV  [SEL_VID_FUNDO], R9; seleciona o fundo
        MOV  R4, ESTADO         ; guarda o endereço do ESTADO
        MOV  R1, GM_OVER        ; muda o valor do ESTADO
        MOV  [R4], R1           ; guardo o valor do ESTADO
        CALL ciclo              ; vai ler o teclado
        MOV  R1, PLAY           ; muda o valor do ESTADO
        MOV  [R4], R1           ; guarda o novo valor do ESTADO

    POP  R4                     ;
    POP  R1                     ;
    RET                         ;
;__________________________________________________________________________________


; *********************************************************************************
; // reset_game - Reseta todas os valores do jogo (posição do rover/meteoros, energia, etc...).
;    

reset_game:
    PUSH R0                     ;
    PUSH R1                     ;
    PUSH R2                     ;
    PUSH R3                     ;

    
    ; // Reseta a música
    MOV  R0, SOM_GAME_OVER      ; guarda o som de game over
    MOV  [PAUSA_SOM], R0        ; pausa o som de game over
    MOV  R0, MUSICA_JOGO        ; guarda a música do jogo
    MOV  [TOCA_MUSICA], R0      ; toca a música do jogo

    ; // Reseta rover
    MOV  R0, DEF_BONECO         ; guarda o endereço da linha do rover
    MOV  R1, LINHA_IN           ; guarda a linha inicial do rover
    MOV  [R0], R1               ; reinicia a linha do rover
    ADD  R0, 2                  ; guarda o endereço da coluna do rover
    MOV  R2, COLUNA_IN          ; guarda a coluna inicial do rover
    MOV  [R0], R2               ; reinicia a coluna do rover

    ; // Reseta meteoros
    MOV  R0, COORDENADAS_METEORO; guarda o endereço da linha do meteoro 0
    MOV  R1, LINHA_MET0         ; guarda a linha inicial de todos os meteoros
    MOV  [R0], R1               ; reinicia a linha do meteoro 0
    ADD  R0, 2                  ; guarda o endereço da coluna do meteoro 0
    MOV  R2, COLUNA_MET0        ; guarda a coluna inicial do meteoro 0
    MOV  [R0], R2               ; reinicia a coluna do meteoro 0
    ADD  R0, 2                  ; guarda o endereço que define o tipo do meteoro 0
    MOV  R3, MAU_MET            ; guarda o tipo de todos os meteoros
    MOV  [R0], R3               ; torna o meteoro 0 num meteoro mau
    ADD  R0, 2                  ; guarda o endereço da linha do meteoro 1
    MOV  [R0], R1               ; reinicia a linha do meteoro 1
    ADD  R0, 2                  ; guarda o endereço da coluna do meteoro 1
    MOV  R2, COLUNA_MET1        ; guarda a coluna inicial do meteoro 0
    MOV  [R0], R2               ; reinicia a coluna do meteoro 1
    ADD  R0, 2                  ; guarda o endereço que define o tipo do meteoro 1
    MOV  [R0], R3               ; torna o meteoro 1 num meteoro mau
    ADD  R0, 2                  ; guarda o endereço da linha do meteoro 2
    MOV  [R0], R1               ; reinicia a linha do meteoro 2
    ADD  R0, 2                  ; guarda o endereço da coluna do meteoro 2
    MOV  R2, COLUNA_MET2        ; guarda a coluna inicial do meteoro 0
    MOV  [R0], R2               ; reinicia a coluna do meteoro 2
    ADD  R0, 2                  ; guarda o endereço que define o tipo do meteoro 2
    MOV  [R0], R3               ; torna o meteoro 2 num meteoro mau
    ADD  R0, 2                  ; guarda o endereço da linha do meteoro 3
    MOV  [R0], R1               ; reinicia a linha do meteoro 3
    ADD  R0, 2                  ; guarda o endereço da coluna do meteoro 3
    MOV  R2, COLUNA_MET3        ; guarda a coluna inicial do meteoro 0
    MOV  [R0], R2               ; reinicia a coluna do meteoro 3
    ADD  R0, 2                  ; guarda o endereço que define o tipo do meteoro 3
    MOV  [R0], R3               ; torna o meteoro 3 num meteoro mau

    ; // Reseta missil
    MOV R1, estado_missil       ; guarda o endereço do estado do missil
    MOV R2, NAO_CRIADO          ; guarda o estado NAO_CRIADO
    MOV [R1], R2                ; apaga o missil do ecra

    ; // Reseta o contador de energia
    MOV R1, ENERGIA             ; guarda o endereço do energia
    MOV R2, ENERGIA_IN          ; guarda o valor inicial da energia
    MOV [R1], R2                ; reinicia a energia

    fim_reset:
        POP  R3                 ;
        POP  R2                 ;
        POP  R1                 ;
        POP  R0                 ;
        RET                     ;
;__________________________________________________________________________________

; *********************************************************************************
; -.-.- ROTINAS DE INTERRUPÇÃO -.-.-
; *********************************************************************************

; // Rotina de interrupcao do clock 0 (meteoro)
rot_int_0:
    PUSH R0                     ;
    PUSH R1                     ;
    MOV  R0, ATIVO              ; estado ativo
    MOV  R1, clock_met          ; endereco do estado do clock meteoro
    MOV  [R1], R0               ; coloca no estado ativo
    POP  R1                     ;
    POP  R0                     ;
    RFE                         ;

; // Rotina de interrupcao do clock 1 (missil)
rot_int_1:
    PUSH R0                     ;
    PUSH R1                     ;
    MOV  R0, ATIVO              ; estado ativo
    MOV  R1, clock_missil       ; endereco do estado do clock do missil
    MOV  [R1], R0               ; coloca o estado do clock do missil a ativo
    POP  R1                     ;
    POP  R0                     ;
    RFE

; // Rotina de interrupcao do clock 2 (energia)
rot_int_2:
    PUSH R0                     ;
    PUSH R1                     ;
    MOV R0, ATIVO               ; estado ativo
    MOV R1, clock_energia       ; endereco do estado do clock da energia
    MOV [R1], R0                ; coloca o estado do clock da energia a ativo
    POP R1                      ;
    POP R0                      ;
    RFE

