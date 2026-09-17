---
title: "Pourquoi je documente mes choix d'architecture"
description: "En route vers un rôle de CTO, écrire sur mes décisions techniques est devenu aussi important que les coder."
minRead: 4
date: 2026-09-13
image: "https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=1200&auto=format&fit=crop"
author:
  name: "Brice Jordan Tchuengwe Ndengwe"
  description: "Ingénieur Logiciel Full-Stack"
  to: "https://github.com/eulgen"
---

Quand j'ai commencé à construire **Find Me**, une plateforme d'adressage pour les
zones urbaines et périurbaines, j'ai pris une décision qui a fini par structurer
tout le reste du projet : documenter chaque choix d'architecture avant même
d'écrire la première ligne de code.

## Pourquoi ça compte

Un ingénieur qui vise un rôle de leadership technique ne se juge pas seulement
sur ce qu'il construit, mais sur sa capacité à expliquer *pourquoi* il l'a
construit ainsi. Sur Find Me comme sur mes autres projets, j'applique quelques
conventions que je retrouve maintenant systématiquement :

- des **clés primaires UUID** plutôt que des identifiants auto-incrémentés,
  pour éviter toute fuite d'information sur le volume de données et faciliter
  la fusion entre environnements ;
- **aucune clé étrangère physique entre microservices** — chaque service reste
  maître de ses propres données, les relations se vérifient au niveau
  applicatif ;
- **Flyway comme unique source de vérité du schéma**, pour que l'état de la
  base soit toujours reproductible et versionné comme le code ;
- une discipline stricte sur le **scope des transactions**, pour éviter les
  verrous inutiles et les effets de bord difficiles à tracer.

## Ce que ça change concrètement

Sur le backend de Find Me, ces choix se traduisent par une relation
one-to-many Utilisateur–Adresse gérée avec Spring Data JPA, une authentification
par session posée sur Spring Security, et une gestion centralisée des
exceptions documentée via Swagger UI. Rien de spectaculaire pris isolément —
mais l'ensemble forme une base cohérente, que je peux expliquer à n'importe
quel moment à quelqu'un qui rejoindrait le projet.

## La suite

Ce blog va rester un carnet de bord technique plutôt qu'une vitrine : j'y
documenterai les décisions prises sur Find Me et mes autres projets, ce qui a
fonctionné, ce qui a dû être revu, et pourquoi.
