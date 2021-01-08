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


message(note("Configurando renv para incializar a biblioteca privada do projeto ...."))
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



# A inicializção do ambiente depende do momento que o projeto está (já foi criado ou iniciando do zero)


# Se já tem a pasta renv e tem uma versão da biblioteca privada
if (dir.exists(paste0(project_root_path, "/renv/library")) & initialize_project == FALSE) {
  
  # Local da biblioteca privada do projeto
  private_library_dir <- paste0(project_root_path, "/renv/library/",
                                dir(path = paste0(project_root_path, "/renv/library/"), pattern = "R"),
                                "/", list.files(path = paste0(project_root_path, "/renv/library/",
                                                              dir(paste0(project_root_path, "/renv/library/"), pattern = "R"))))
  
  message(note("Restaurando a biblioteca privada usando o arquivo renv.lock do projeto ...."))
  # Restaurar ambiente usando o arquivo renv.lock
  # Se tiver pacotes desnecessários, eles serão excluídos 
  renv::restore(library = private_library_dir, confirm = FALSE, clean = TRUE)
  
  message(note("Instalar ou carregar pacotes necessários ...."))
  # Carregar/instalar pacotes (se necessário)
  source(paste0(project_root_path, "/environment/install_and_load_packages.R"), encoding = encoding)
  
  message(note("Atualizando o arquivo renv.lock do projeto ...."))
  # Caso novos pacotes tenham sido instalados ou excluídos, atualizar o arquivo renv.lock (vai para o gitlab)
  renv::snapshot(library = private_library_dir, confirm = FALSE)
  
  # Se já tem apenas a pasta renv  
} else if (dir.exists(paste0(project_root_path, "/renv")) & initialize_project == FALSE) {
  
  
  message(note("Criando uma biblioteca privada para o projeto ...."))
  # Inicializar ambiente já criado anteriormente (adicionar o local onde a biblioteca privada ficará)
  renv::init(restart = FALSE)
  
  
  # Local da biblioteca privada do projeto
  private_library_dir <- paste0(project_root_path, "/renv/library/",
                                dir(path = paste0(project_root_path, "/renv/library/"), pattern = "R"),
                                "/", list.files(path = paste0(project_root_path, "/renv/library/",
                                                              dir(paste0(project_root_path, "/renv/library/"), pattern = "R"))))
  
  message(note("Restaurando a biblioteca privada usando o arquivo renv.lock do projeto ...."))
  # Restaurar ambiente usando o arquivo renv.lock
  renv::restore(confirm = FALSE, clean = TRUE, library = private_library_dir)
  
  message(note("Instalar ou carregar pacotes necessários ...."))
  # Carregar/instalar pacotes (se necessário) 
  source(paste0(project_root_path, "/environment/install_and_load_packages.R"), encoding = encoding)
  # Caso novos pacotes tenham sido instalados ou exlcuídos, atualizar o arquivo renv.lock (vai para o gitlab)
  
  message(note("Atualizando o arquivo renv.lock do projeto ...."))
  renv::snapshot(library = private_library_dir, confirm = FALSE)
  
  # Se quero limpar e criar a biblioteca privada novamente ou inicializar o ambiente pela primeira vez
} else if (initialize_project == TRUE) {
  
  
  # Local da biblioteca privada do projeto
  private_library_dir <- paste0(project_root_path, "/renv/library/",
                                dir(path = paste0(project_root_path, "/renv/library/"), pattern = "R"),
                                "/", list.files(path = paste0(project_root_path, "/renv/library/",
                                                              dir(paste0(project_root_path, "/renv/library/"), pattern = "R"))))
  message(note("Instalando pacotes necessários para o projeto ...."))
  # Carregar/instalar os pacotes declarados pelo time
  source(paste0(project_root_path, "/environment/install_and_load_packages.R"), encoding = encoding)
  
  message(note("Criando o arquivo renv.lock que armazenará os pacotes e respectivas versões para a biblioteca privada do projeto...."))
  # Gravar o arquivo renv.lock pela primeira vez com as versões dos pacotes 
  renv::snapshot(library = private_library_dir, confirm = FALSE)
  
}
