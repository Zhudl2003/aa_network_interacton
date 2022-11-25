library(readr)
library(dplyr)
library(igraph)
library(tidygraph)
library(tidyverse)

aa_table_1<-read_csv("charmm-gui-3136192901.csv")
int_1<-read_csv("charmm-gui-3136192901 (1).csv")
filter(int_1,persent_ring>0)
aa_table_2<-read_csv("charmm-gui-3136217149.csv")
int_2<-read_csv("charmm-gui-3136217149 (1).csv")
filter(int_2,persent_ring>0)

nodes<-aa_table_1 %>%
  rename(id=resno) %>%
  rename(label=resid)
nodes <- nodes %>%
  select(id, label)
head(nodes, 3)
edges<-int_1 %>%
  rename(weight = persent_ring)
aa_net <- tbl_graph(
  nodes = nodes, edges = edges, directed = TRUE)
summary(aa_net)

nodes_1<-aa_table_2 %>%
  rename(id=resno) %>%
  rename(label=resid)
nodes_1 <- nodes_1 %>%
  select(id, label)
head(nodes_1, 3)
edges_1<-int_2 %>%
  rename(weight = persent_ring)
aa_net_1 <- tbl_graph(
  nodes = nodes, edges = edges, directed = TRUE)
summary(aa_net)

