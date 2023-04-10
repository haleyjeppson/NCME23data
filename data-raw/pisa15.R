## code to prepare `pisa15` dataset
library(tidyverse)
pisa <- data.table::fread("../data/pisa2015.csv", na.strings = "")

country <- c("United States", "Canada", "Mexico", "B-S-J-G (China)", "Japan",
             "Korea", "Germany", "Italy", "France", "Brazil", "Colombia", "Uruguay",
             "Australia", "New Zealand", "Jordan", "Israel", "Lebanon")
pisas <- pisa %>%
  filter(CNT %in% country) %>%
  group_by(CNT) %>%
  slice_sample(n  = 500) %>%
  ungroup()
rm(pisa)

pisas$math <- rowMeans(pisas[, paste0("PV", 1:10, "MATH")])
pisas$reading <- rowMeans(pisas[, paste0("PV", 1:10, "READ")])
pisas$science <- rowMeans(pisas[, paste0("PV", 1:10, "SCIE")])


pisas <- pisas %>%
  dplyr::select(country = CNT, OECD, id = CNTSTUID, weight = W_FSTUWT, sex = ST004D01T, grade = ST001D01T,
                computer = ST011Q04TA, software = ST011Q05TA, internet = ST011Q06TA,
                addit_time_math = ST071Q02NA, addit_time_science = ST071Q01NA,
                parent_support = ST123Q02NA, parent_status = ST082Q01NA,
                want_best_grades = ST119Q01NA, want_best_student = ST119Q05NA,
                test_anxiety = ANXTEST, enjoy_cooperation = COOPERATE,
                sense_of_belonging = BELONG, parent_support_emotional = EMOSUPS,
                HOMESCH, ENTUSE, ICTHOME, ICTSCH,
                wealth = WEALTH, parent_edu = PARED, learning_mins = TMINS,
                escs_index = ESCS,
                teacher_support_science = TEACHSUP,
                teacher_direct_science = TDTEACH,
                inquiry_based_science = IBTEACH,
                science_self_efficacy = SCIEEFF,
                math, reading, science)




pisas <- pisas %>%
  mutate(grade = ifelse(grade %in% c("Grade 13", "Ungraded"), NA, grade),
         grade = parse_number(grade),
         # Total learning time as hours
         learning_hours = round(learning_mins/60, 0),
         # Regions for selected countries
         region = case_when(
           country %in% c("Canada", "United States", "Mexico") ~ "N. America",
           country %in% c("Colombia", "Brazil", "Uruguay") ~ "S. America",
           country %in% c("Japan", "B-S-J-G (China)", "Korea") ~ "Asia",
           country %in% c("Germany", "Italy", "France") ~ "Europe",
           country %in% c("Australia", "New Zealand") ~ "Australia",
           country %in% c("Israel", "Jordan", "Lebanon") ~ "Middle-East"),
         want_best_grades = fct_relevel(factor(want_best_grades), "Strongly agree",
                                        "Agree", "Disagree", "Strongly disagree"))

pisa15 <- pisas
# write_csv(pisas09_subset, "../../data/pisas09_subset.csv")
usethis::use_data(pisa15)


#----------------------------------
set.seed(1)
pisa_usa <- pisa15 %>%
  filter(country == "United States") %>%
  mutate(parent_edu = factor(parent_edu),
         internet = factor(internet, levels = c("Yes", "No"))) %>%
  slice_sample(n =100, weight_by = weight) %>%
  filter(!is.na(internet))

usethis::use_data(pisa_usa)

#----------------------------------
set.seed(1)
pisa_small <- pisa15 %>%
  mutate(parent_edu = factor(parent_edu),
         internet = factor(internet, levels = c("Yes", "No")),
         OECD = factor(internet, levels = c("Yes", "No")))  %>%
  filter(!is.na(internet)) %>%
  slice_sample(n = 1000, weight_by = weight)

usethis::use_data(pisa_small)


#----------------------------------
pisa_wide <- pisa_small %>%
  dplyr::select(region, country, sex, math, weight) %>%
  group_by(region, country, sex) %>%
  summarise(math = weighted.mean(math, weight, na.rm = TRUE)) %>%
  pivot_wider(names_from = sex, values_from = math)

usethis::use_data(pisa_wide)
