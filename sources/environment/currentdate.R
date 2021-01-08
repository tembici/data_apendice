##############################################
#########      CURRENT DATE            #######
##############################################

# Responsável por definir uma data para cada sessão iniciada no R.
# Tal data pode ser usada como atributo no momento de salvar um
# aquivo processado pela sessão e facilitar a manutenção. Por exemplo,
# write_csv(file, path = paste0("/pathtosave/", "filename", date, ".csv"))

date <- as.Date(Sys.Date(), format = "%d.%m.%y")
# date <- gsub("-", "", date)
message(note("Hoje é", date, "e esta será a data usada nas análises!"))
