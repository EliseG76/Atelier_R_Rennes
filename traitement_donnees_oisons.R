# Traitement des donnees oisons lors de l'atelier R a Rennes

# Import des packages necessaires

library(tidyverse,
        readr, 
        sf,
        "dplyr")

# lecture des donnees ----

oison_taxon <- readr :: read_csv("oison/oison_taxon.csv")

# selection des colonnes du tableau oison_taxon

oison_taxon %>% 
  dplyr :: select(nom_vernaculaire, 
                  nom_scientifique, 
                  date, 
                  nom)

# selection d'une plage de donnees

oison_taxon %>%
  dplyr:: select(observation_id : date) 

# exclusion de deux colonnes (heure et date)

oison_taxon %>%
  dplyr :: select(-heure, -date)

# selection puis exclusion d'une colonne (date)

oison_taxon %>%
  dplyr:: select(observation_id : date) %>%
  dplyr:: select(-date)

# exclusion d'une plage de colonne

oison_taxon %>%
  dplyr:: select(!(observation_id : date))

# exclusion de certaines colonnes 

oison_taxon %>%
  dplyr:: select(!c(nom_vernaculaire, nom_scientifique))

# selection avec une partie du nom des colonnes 

oison_taxon %>%
  dplyr:: select(starts_with("nom"))

# selection a partir d'une recherche de motif de caractère

oison_taxon %>%
  dplyr:: select(contains("recherche"))

# selection avec la fin d'un mot

oison_taxon %>%
  dplyr:: select(ends_with("id"))

# selection avec des operateurs :

oison_taxon %>%
  dplyr:: select(contains("recherche") | contains("obs"))

# selection via l'utilisation de la fonction any_of() (selectionne uniquement si la colonne existe, evite de faire planter si la colonne n'existe pas)

vecteur_nom_colonne <- c("nom_vernaculaire", "nom_PMCC", "date")

oison_taxon %>%
  dplyr:: select(any_of(vecteur_nom_colonne))



