##############################################
#######       CONFIG DE CORES          #######
##############################################

# Este script tem como objetivo definir as cores de mensagens tais como erro e warning bem como
# a paleta de cores da EY e do cliente. Abaixo, garantimos que o pacote necessário para configuar
# as cores está instalado no seu ambiente
if (!suppressWarnings(suppressMessages(require("crayon")))) install.packages("crayon")

#######
####   MENSAGENS
#######

error <- crayon::red$bold
warn  <- crayon::magenta$bold
note  <- crayon::cyan$bold
runtime  <- crayon::blue$bold
message(note("Definindo cores para mensagens ..."))

#######
####   PALETAS
#######

# EY
message(note("Definindo paleta de cores da Tembici e do cliente para uso nos gráficos do relatório ..."))
aux$bici_colors <- c("#f90083", "#0045dd", "#000e8f", "#93c3dd", "#ffcdd2", "#ffc864", "#c39687", "#4b917d","#79e76d", "#c3f0c8")
 #Rosa A, Azul A, Azul B, Azul C, Rosa B, Amarelo, Marrom, Verde A, Verde B, Verde C

# CLIENTE (seguindo manual de branding)
aux$client_colors <- aux$bici_colors 

message(note("Cores do ambiente configuradas..."))
