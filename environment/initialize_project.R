##############################################
#######       PRIVATE LIBRARY          #######
##############################################

# Este script tem como objetivo criar um ambiente que seja isolado, portável e reproduzível para o projeto. Isso é feito
# por meio do pacote renv que cria uma biblioteca privada de pacotes para o projeto. Basicamente, o processo é:
# 1: A função renv::init() inicializa um novo ambiente para o projeto com uma biblioteca privada
# 2: O time instala os pacotes iniciais que são necessários para o projeto 
# 3: A função renv::snapshot() escreve os pacotes e suas versões em um arquivo chamado renv.lock
# 4: O time continua trabalhando no projeto instalando, removendo e atualizando pacotes
#    - A função renv::snapshot() novamente atualiza o arquivo renv.lock
#    - Este arquivo é atualizado no git
#    - Membros do time pegam esse novo arquivo no pull/merge
#    - A função renv::restore() faz com que seu ambiente fique igual ao da última versão do arquivo renv.lock

# Quando o processo é finalizado, todos os pacotes são instalados na nova biblioteca localizada dentro de uma pasta do projeto
# É preciso reinicializar a sessão do R para que as alterações funcionem. 

# Arquivos do renv: 
#  - renv.lock: lista de pacotes do projeto com versões (satisfaz as dependências, inlcuindo dependências
# das dependências)
#  - renv/settings.dcf: opções específicas do renv (defaults ou definidas pelo nosso template)
#  - renv/activate.R: código que deve ser executado tova vez que uma nova sessão do projeto é inicializada
#  - renv/library: biblioteca privada de pacotes para o projeto
#  - .Rprofile: instruções que o R deve seguir toda vez que uma nova sessão do projeto é inicializada

##### 
##  OPÇÕES E PACOTES NECESSÁRIOS PARA INICIALIZAÇÃO
#####

if (initialize_project == TRUE) {
  
  message(note("Criando a biblioteca privada para o projeto...."))
  # Verificar se o pacotes necessários já estão instalados (para que o script funcione)
  if (!suppressWarnings(suppressMessages(require("remotes")))) install.packages("remotes")
  if (!suppressWarnings(suppressMessages(require("renv")))) remotes::install_github("rstudio/renv")
  if (!suppressWarnings(suppressMessages(require("devtools")))) install.packages("devtools")
  
  # Inicializar a biblioteca privada de pacotes com as seguintes opções:
  #   - project: o diretório do projeto
  #   - settings: uma lista com configurações a serem usadas (aqui elas são definidas antes de inicializar)
  #   - bare: o ambiente deve (sim) ou não ser inicializado instalando pacotes e suas dependências
  # são necessários. Estes serão os pacotes da biblioteca de pacotes específica do projeto
  #   - restart: reinicializar (sim) ou não a sessão do R após iniciar o ambiente
  
  
  # opções que serão usadas na inicialização do ambiente
  options(renv.settings = list(snapshot.type = "simple", auto.snapshot = FALSE))
  
  
  ##### 
  ##  INICIALIZAÇÃO
  #####
  
  # Este script é usado apenas quando estamos iniciando um projeto novo. Ele fica 
  # separado do scritp renv_init.R em função da necessidade de reinicializar
  # a sessão do R toda vez que este script é executado. Isso interrompe o 
  # souce prejudicando a continuação do mesmo (por isso fica fora)
  
  # Inicializar uma bilbioteca nova 
  renv::init(bare = TRUE)
  message(note("Biblioteca privada do projeto criada, mas sem pacotes ...."))
}

message(note("O projeto já tem uma biblioteca privada. Continue para adicionar ou atualizar a biblioteca ...."))
