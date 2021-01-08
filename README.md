# **README**

O objetivo desta página é apresentar informações sobre as técnicas utilizadas e explicações acerca dos testes estatísticos, modelos de *machine learning* e processamento de linguagem natural utilizados nos projetos de análise de dados. Esta documentação está classificada por assunto abordado.

As urls das pãginas são:

**Index**: https://rsaviovieira.github.io/apendice_teste/public/

**Teste de Hipóteses**: https://rsaviovieira.github.io/apendice_teste/public/hipoteses.html

**_Machine Learning_**: https://rsaviovieira.github.io/apendice_teste/public/ml.html

**_Text Mining_**: https://rsaviovieira.github.io/apendice_teste/public/text_mining.html

---

Este projeto foi criado para que as páginas HTMLs utilize o GitHub Pages para a sua publicação.

Leia mais sobre GitLab Pages em https://pages.github.com/ e na documentação
oficial https://docs.github.com/pt/free-pro-team@latest/github/working-with-github-pages/about-github-pages.

---


## Estrtutura de diretórios

Abaixo a estrutura de diretórios e arquivos do projeto.

```
|   .gitignore                                                # Lista de arquivos e extensões que não devem ser enviadas ao Git.
|   .gitattributes                                            # Fornece atributos específicos para arquivos e diretórios dentro do repositório Git.
|   .RData                                                    # Arquivo oculto que pode ser utilizado para Salvar espaço de trabalho.
|   .Rhistory                                                 # Histórico de comandos (setas Para cima / Para baixo do console).
|   .Rprofile                                                 # Códigos para rodar assim que abrir o projeto.
|   pier_templates.Rproj                                      # Contém informações para a edição de projetos no RStudio.
|   README.md                                                 # Descrição e informações do projeto.
|   renv.lock                                                 # Informações das bibliotecas e versão utilizadas para o projeto
|   main.R                                                    # Script que executa todo o projeto.
|   pier_apendice.Rproj                                       # Contém informações para a edição de projetos no RStudio.
|   
+---apendices                                                 # Diretório onde ficam todas os apêndices.
|   +---hipoteses                                             # Diretório do apêndice do relatório de testes de hipóteses.
|   |   |   hipoteses.rmd                                     # Apêndice a ser gerado em html.
|   |   |   
|   |   \---www                                               # Diretório com arquivo de CSS e imagens para o estilo dos relatórios.
|   |           
|   +---  ml                                                  # Diretório do apêndice do relatório de machine learning.
|   |   |   ml.rmd                                            # Apêndice a ser gerado em html.                    
|   |   |   
|   |   +---images                                            # Diretório para armazenar as imagens do utilizadas no HTML.
|   |   |       
|   |   \---www                                               # Diretório com arquivo de CSS e imagens para o estilo dos relatórios.
|   |           
|   \---text_mining
|       |   text_mining.rmd                                   # Diretório do apêndice do relatório de turnover.
|       |   
|       +---images                                            # Diretório para armazenar as imagens do utilizadas no HTML.
|       |       
|       \---www                                               # Diretório com arquivo de CSS e imagens para o estilo dos relatórios.
|               
+---environment                                               # Diretório utilizado para arquivos e scripts para biblioteca privada do projeto.
|   |   .gitkeep                                              # Arquivo vazio criado para que Git preserve um diretório de projeto vazio.
|   |   initialize_project.R                                  # Script utilizado para iniciar o projeto, caso ainda não tenho sido criado rev.lock.
|   |   install_and_load_packages.R                           # Script com todas as bibliotecas necessárias para a execução do projeto.
|   |   renv_init.R                                           # Script para inicialização do renv.
|
+---public                                                    # Pasta que armazena os htmls dos apêndices
|       gender_gap.html                                       # hmtl do apêndice grander pay gap
|       job_match.html                                        # html do apêndice do job match
|       turnover.html                                         # html do apêndice do turnover                      
|
+---renv                                                      # Diretório utilizado pelo renv para criação da biblioteca privada do projeto.
|   |   .gitignore                                            # Git ignore utilizado pelo renv para não enviar para o git as pastas e arquivos das bibliotecas.
|   |   activate.R                                            # Script para criação da biblioteca privada do projeto.
|   |   settings.dcf                                          # Configurações e opções do renv.
|   |   
|   \---library                                               # Diretório para armazenamento das bibliotecas privadas do projeto.
|
\---sources                                                   # Diretório para scripts e configurações do ambiente.
    +---environment                                           # Diretório para armazenar scripts de configuração do ambiente.
    |       currentdate.R                                     # responsável por definir a data atual de cada sessão inicializada.
    |       envcolors.R                                       # Script de configurações das cores e mensagens da console.
    |       
    \---html                                                  # Diretório para scripts com configuração de estilo dos relatórios.
        |   css_style_and_htmls.R                             # Script para a configuração de estilo dos relatórios.
        |   
        +---rmd                                               # Diretório para arquivos de favicon, navbar e configuração do estilo dos relatórios.
        |       
        \---www                                               # Diretório com arquivo de CSS e imagens para o estilo dos relatórios.


```

## **Execução do Projeto**

Para a correta execução dos códigos na ordem foi criado o arquivo `main.R`.

## Publicação das páginas

Só serão publicadas as páginas HTMLs que estiverem disponiveis diretório `/public`, sendo que todas as vezes que ocorre uma publicação na **_branch gh-pages_** e somente nesta as páginas são atualizadas.



### Atualização Branch
 
Como nos outros projetos, existe uma configuração no `.gitlab-ci.yml` que utiliza o CI/CD do GitLab para realizar a atualização da branch master, baseado na dev. Portando todo o código que estiver em dev será disponiblizado na branch master, assim como as paginas htmls.

