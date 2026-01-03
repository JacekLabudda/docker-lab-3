# Docker – multi-stage build (Python)

Repozytorium demonstracyjne do zajęć:

**Docker i konteneryzacja - od podstaw do środowisk produkcyjnych**

Celem projektu jest pokazanie **jak poprawnie budować obrazy Dockera**
z użyciem Dockerfile, cache i multi-stage buildów.

---

## Co znajduje się w repozytorium

```text
.
└── app
   └──  app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
└── README.md
```
- app.py - prosta aplikacja Python wypisująca logi
- requirements.txt - zależności aplikacji
- Dockerfile - multi-stage (base / dev / prod)
- .dockerignore - optymalizacja build contextu

## Czego uczy ten przykład
- czym jest Dockerfile
- jak działa cache Dockera
- czym jest build context
- jak działa multi-stage build
- dlaczego warto rozdzielać base / dev / prod
- jak zmniejszyć rozmiar obrazu

## Dockerfile - multi-stage
Dockerfile składa się z trzech etapów:
- base - Python + zależności
- dev - środowisko developerskie
- prod - minimalny obraz produkcyjny

Do finalnego obrazu trafia tylko to, co potrzebne do uruchomienia aplikacji.

## Jak uruchomić

### Zbuduj obraz:
```shell
  docker build -t docker-lab-3 .
```

### Uruchom kontener:
```shell
  docker run --rm docker-lab-3
```

## Porównanie etapów

Możesz zbudować poszczególne etapy:
```shell
   docker build --target base -t docker-lab-3:base .
```
```shell
   docker build --target dev -t docker-lab-3:dev .
```
```shell
   docker build --target prod -t docker-lab-3:prod .
```

## Sprawdź rozmiar obrazów:
```shell
   docker images
```