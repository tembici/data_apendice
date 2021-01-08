########################################
#####     VARIÁVEIS/CONFIGS       ######
########################################

# Nome do seu projeto
project_name <- "apendices"

# Local onde o projeto foi salvo no seu computador
project_root_path <- getwd()

# Encoding genérico para renderizações
encoding <- "UTF-8"

# Criando objeto para receber listas, tabelas e gráficos auxiliares
aux <- list() 

# Cores default para o console e paleta de cores do cliente (gráficos)
source(paste0(project_root_path, "/sources/environment/envcolors.R"), encoding = encoding)

# Data do dia que as análises foram executadas
source(paste0(project_root_path, "/sources/environment/currentdate.R"), encoding = encoding)

########################################
#####          PACOTES            ######
########################################

# Inicializar biblioteca privada do projeto
initialize_project <- FALSE

# Verificar se o projeto já tem uma biblioteca privada ou criá-la
source(paste0(project_root_path, "/environment/initialize_project.R"), encoding = encoding)

# Adicionar ou atualizar a biblioteca privada do projeto além de carregar pacotes necessários
source(paste0(project_root_path, "/environment/renv_init.R"), encoding = encoding)


########################################
#####      RELATÓRIOS HTML        ######
########################################

# Aplicar padrão de estilo css, definir barra de navegação e logos (faz para todos os relatórios)
source(paste0(project_root_path, "/sources/html/css_style_and_htmls.R"), encoding = encoding)


####
## Index
####

analysis_name <- "index"

# Gerar relatório de index
rmarkdown::render(
  input =
    paste0(project_root_path,"/", project_name, "/", analysis_name,"/", analysis_name,".rmd"),
  encoding = encoding, clean = T,
  output_file =
    paste0(project_root_path,"/public/", analysis_name,".html")
)

####
## HIPÓTESES
####

analysis_name <- "hipoteses"

# Gerar relatório de hipoteses
rmarkdown::render(
  input =
    paste0(project_root_path,"/", project_name, "/", analysis_name,"/", analysis_name,".rmd"),
  encoding = encoding, clean = T,
  output_file =
    paste0(project_root_path,"/public/", analysis_name,".html")
)


####
## MACHINE LEARNING
####

analysis_name <- "ml"

# Gerar relatório de ml
rmarkdown::render(
  input =
    paste0(project_root_path,"/", project_name, "/", analysis_name,"/", analysis_name,".rmd"),
  encoding = encoding, clean = T,
  output_file =
    paste0(project_root_path,"/public/", analysis_name,".html")
)


####
## TEXT MINING
####

analysis_name <- "text_mining"

# Gerar relatório de text mining
rmarkdown::render(
  input =
    paste0(project_root_path,"/", project_name, "/", analysis_name,"/", analysis_name,".rmd"),
  encoding = encoding, clean = T,
  output_file =
    paste0(project_root_path,"/public/", analysis_name,".html")
)
