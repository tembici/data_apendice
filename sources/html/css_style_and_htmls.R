#############################################################
#### ARQUIVOS PADRÃO DE ESTILO E HTML PARA OS RELATÓRIOS ####
#############################################################

####
## GERAL
####

# Defninir as análises em que se deseja replicar o CSS padrão
#   Aqui o código já faz isso automaticamente, mas é possível criar um vetor especificanco as análises desejadas, 
#   como c("gender_gap", "job_match", "turnover")
analysis_name <- basename(list.dirs(paste(project_root_path, project_name, sep = "/"), recursive = FALSE))


####
## CSS e LOGOS
####


# Definir o folder onde fica o CSS oficial do projeto
www.folder <- paste0(project_root_path,"/sources/html/www/")

# Indicar caminho dos novos diretórios onde os arquivos serão copiados
new.folder <- paste0(project_root_path, "/",project_name, "/", analysis_name,"/")

# Listar os arquivos a serem copiados
list.of.files <- list.files(www.folder)

# Copiar os arquivos para todos os folders das análises desejadas

lapply(new.folder, 
       function(y){
         if (!dir.exists(paste0(y,"www/"))) {
           dir.create(paste0(y,"www/"))
         }
         lapply(list.of.files, function(x){
           file.copy(paste0(www.folder, x), paste0(y,"www/"), overwrite = TRUE,  recursive = TRUE)
         })
       })


####
## NAVBAR, SITE.YML E FAVICON.HTM
####

# Definir o folder onde ficam os arquivos acessórios dos RMD's oficiais do projeto
rmd.folder <- paste0(project_root_path,"/sources/html/rmd/")

# Definir destino para onde serão copiados os arquivos
new.folder <- paste(project_root_path, project_name, analysis_name,"", sep = "/")

# Listar os arquivos a serem copiados
list.of.files <- list.files(rmd.folder)

# Copiar os arquivos para todos os folders das análises desejadas
lapply(new.folder, 
       function(y){
         lapply(list.of.files, function(x){
           file.copy(paste0(rmd.folder, x), y, overwrite = TRUE)
         })
       })


