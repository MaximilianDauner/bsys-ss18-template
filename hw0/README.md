# HW0

[TOC levels=2-3]: # "# Inhaltsangabe"

# Inhaltsangabe
- [Git Übung](#git-übung)
    - [Vorbereitung](#vorbereitung)
- [Rust Übung](#rust-übung)


## Git Übung
In der Übung, die Sie im Verzeichnis `gittask0/ finden, wird der Umgang mit **git** auf der Kommandozeile gelernt. Bevor Sie die Übung durchführen sind einige Vorbereitungsschritte nötig.

### Vorbereitung
Updates des Templates herunterladen und neue Feature-Branches für jeden Benutzer erstellen.

#### User A @ Container:
```bash
cd ~/src/htwg-syslab-bsys-ss18/bsys-ss18-grpN
git fetch --all
git checkout hw0
git push origin hw0
git checkout -b hw0-UserA
git push origin hw0-UserA
```

#### User B @ Container:
```bash
cd ~/src/htwg-syslab-bsys-ss18/bsys-ss18-grpN
```

Hole die neusten Informationen aller Remotes
```bash
git fetch --all
```

Verwende *origin/hw0* als Basis für die neue lokale *hw0* Branch
```bash
git checkout origin/hw0
git checkout -b hw0
```

Zweige von *hw0* ab nach *hw0-UserB* und push nach auf den Fork von UserA (origin)
```bash
git checkout -b hw0-UserB
git push origin hw0-UserB
```

## Rust Übung

In dieser Übung werden Sie zuerst Rust in Ihrem Container antesten und dann 4 [exercism.io][] Aufgaben in Rust lösen.

1. Jeder Benutzer Ihrer Gruppe hat bereits über die Vorbereitung Rust im Container installiert.

1. Testen Sie cargo, indem Sie
    - über cargo new ein Binary HelloWorld Projekt erstellen
    - das Projekt compilieren und ausführen

2. Lösen Sie mit Ihrer github ID nun die ersten 4 Aufgaben von [exercism.io][] in der Reihenfolge, wie [exercism.io][] Ihnen die Aufgaben präsentiert. Laden Sie Ihre Lösungen in [exercism.io][] hoch.

3. Für Ihre Abgabe erhalten Sie in den nächsten Tagen eine Einladung. Sobald Sie diese akzeptiert haben, können die Tutoren auf Ihre [exercism.io][] Lösungen zugreifen.

[exercism.io]: http://exercism.io
