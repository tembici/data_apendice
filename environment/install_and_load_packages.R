##############################################
#########         PACOTES              #######
##############################################

# Este script em R verifica se os pacotes necessários para executar os códigos do projeto
# estão instalados. Caso contrário, faz a instalação dos mesmos (caso esteja executando o projeto). Se os pacotes já estão 
# instalados, o script apenas carrega-os. 

#######
####   PACOTES
#######

message(note("Verificando disponibilidade dos pacotes default para o projeto..."))

# Lista de pacotes necessários (do CRAN e do GitHub)
.packages <-
  c(
    "tidyverse",
    "DT",
    "highcharter",
    "htmltools",
    "kableExtra",
    "knitr",
    "bookdown",
    "timetk",
    "rmarkdown",
    "plotly",
    "dygraphs",
    "neuralnet"
  )

.devpackages <- NULL

#######
####   OPÇÃO PARA A INSTALAÇÃO
#######

# Não verificar diferenças entre as versões do binário e source dos pacotes
options(install.packages.check.source = "no")


#######
####   VERIFICAR E INSTALAR
#######

# Verificar quais dos pacotes necessários já estão instalados. Para isso, usa a função
# installed.packages() que retorna um dataframe com a lista dos pacotes instaldos no
# R em execução. Como resultado, temos um vetor do mesmo tamanho do vetor de pacotes
# de interesse com TRUE (pacote já instalado) ou FALSE (pacote não instalado)
.inst <- .packages %in% utils::installed.packages(lib.loc = private_library_dir)

# Se o vetor de pacotes não instalados (diferença entre os pacotes de interesse e os
# pacotes instalados) tiver tamanho maior que 0, instalar apenas os pacotes não instalados
if (base::length(.packages[!.inst]) > 0) {
  message(note("Instalando pacotes que você ainda não tem no seu ambiente...."))
  #utils::install.packages(.packages[!.inst], lib = private_library_dir, dependencies = TRUE, type = "binary") só para windows e MAC type binary
  utils::install.packages(.packages[!.inst], lib = private_library_dir, dependencies = TRUE)
  #renv::install(packages = .packages[!.inst], library = private_library_dir, rebuild = TRUE)
  # pak::pkg_install(pkg = .packages[!.inst], lib = private_library_dir, ask = FALSE)
  message(note("Pacotes instalados...."))
} else {
  message(note("Seu ambiente já tem os pacotes necessários...."))
}

# Verificar quais dos pacotes de repositórios já estão instalados. 

if (!is.null(.devpackages)) {
  # split da string do github para pesquisar se o pacote já está instalado
  .spl.pkg <- strsplit(.devpackages, split = "/")
  .dev.pkg <- unlist(lapply(1:length(.devpackages), function(x) .spl.pkg[[x]][2]))
  .inst.dev.pkg <- .dev.pkg %in% installed.packages(lib.loc = private_library_dir)
  
  
  if (base::length(.devpackages[!.inst.dev.pkg]) > 0) {
    message(note("Instalando pacotes de repositórios que você ainda não tem no seu ambiente ..."))
    #remotes::install_github(repo = .devpackages[!.inst.dev.pkg], lib = private_library_dir, dependencies = TRUE) só para windows e MAC type binary
    remotes::install_github(repo = .devpackages[!.inst.dev.pkg], lib = private_library_dir)
    message(note("Pacotes de repositórios instalados ..."))
    
  } else {
    message(note("Seu ambiente já tem os pacotes necessários...."))
  }
  
}
#######
####   CARREGAR PACOTES NO AMBIENTE 
#######


# Após confirmar que todos os pacotes estão instaldos, garantimos que eles estão disponíveis
# para uso fazendo a carga dos mesmos no R 
.total_packages <- c(.packages, if(!is.null(.devpackages)).dev.pkg)

for (package in 1:length(.total_packages)) {
  suppressWarnings(suppressMessages(require(.total_packages[package], character.only = TRUE, lib.loc = private_library_dir)))
}

message(note("Pacotes carregados para o projeto...."))
print(.total_packages)


