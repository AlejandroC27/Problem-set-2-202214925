#R version 4.3.1 (2023-06-16 ucrt)
#diego carrillo 202214925
require(pacman)
p_load(rio, data.table, tidyverse)

#2.1

location <- import("C:/Users/diego/Downloads/Problem-set-2-202214925/input/Módulo de sitio o ubicación.dta")
identification <- import("C:/Users/diego/Downloads/Problem-set-2-202214925/input/Módulo de identificación.dta")

#2.2

export(location, "C:/Users/diego/Downloads/Problem-set-2-202214925/output/location.rds")
export(identification, "C:/Users/diego/Downloads/Problem-set-2-202214925/output/identification.rds")

#3.1

identification = mutate_at(.tbl= identification , .vars = c("GRUPOS4"),.funs = as.numeric)
identification = mutate(identification, bussiness_type = case_when(GRUPOS4=="1" ~ "Agricultura",
                                                           GRUPOS4=="2" ~ "Industria manufacturera",
                                                           GRUPOS4=="3" ~ "Comercio",
                                                             GRUPOS4=="4" ~ "Servicios"))
#3.2

location = mutate(location, local = case_when(P3053=="6"~ "1",
                                              P3053 == "7" ~ "1") )
#4.1

identification_sub = filter(identification, identification$GRUPOS4 == "2")

#4.2

location_sub = select(location, c(1,2,3,9,11,13,15))

#4.3

identification_sub = select(identification_sub, c(1,2,3,7,8,11,12,13,14,15))

#5.1

location_identification_sub = inner_join(identification_sub,location_sub,by=c("DIRECTORIO","SECUENCIA_P","SECUENCIA_ENCUESTA"))