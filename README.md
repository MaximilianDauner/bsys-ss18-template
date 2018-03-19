
[TOC levels=1-3]: # "# Inhaltsangabe"

# Inhaltsangabe
- [Laborzugang einrichten](#laborzugang-einrichten)
- [Aufgaben zum BSYS Labor](#aufgaben-zum-bsys-labor)
    - [Vorbereitung](#vorbereitung)
        - [User A and User B @ Github:](#user-a-and-user-b--github)
    - [Git and GitHub Preparations](#git-and-github-preparations)
        - [User A @ GitHub](#user-a--github)
        - [User A @ Container:](#user-a--container)
        - [User B @ Container:](#user-b--container)
- [Abgabe der Homeworks](#abgabe-der-homeworks)
    - [Schritte zum Pull-Request](#schritte-zum-pull-request)
    - [Travis-CI](#travis-ci)
    - [gitignore](#gitignore)
    - [Markdown](#markdown)
        - [template-answers.md](#template-answersmd)
        - [template-answers-output.md](#template-answers-outputmd)



# Laborzugang einrichten

1. Beachten Sie die Ankündigungen im Moodle Forum. Dort werden die Termine zur Anmeldung als 2er Gruppe sowie die Freischaltung Ihrer Workstation bekannt gegeben. Beachten Sie bitte unbedingt die Deadlines dazu!
1. Melden Sie sich beim Laborassistenten (Büro F029) zu den im Forum genannten Terminen zum Labor persönlich an. Sie bekommen für das Labor eine virtuelle 'Workstation' zugeteilt.
1. Testen Sie Ihre Anmeldung im Laborraum. Melden Sie sich dazu mit Ihrer Kennung auf der zugeteilten Workstation an.
1. Lesen Sie die HOWTOS unter [SYSLAB][].
1. Installieren Sie die Rust Toolchain inklusive **rustfmt** für jeden Benutzer auf Ihrer Workstation. Die Anleitung dazu finden Sie im entsprechenden HOWTO.


# Aufgaben zum BSYS Labor

In diesem Ordner werden die Aufgaben (Homework,`hw`) veröffentlicht, die bearbeitet werden müssen, um den Schein in BSYS zu bekommen.

Eine Homework besteht aus einer oder mehreren Tasks. Sie finden somit die zu einer Homework gehörenden Aufgaben in den `README.md`, Dateien der zughörigen `hwN/taskN/` Ordner. `N` steht als Platzhalter für die entsprechende Homework bzw. Tasknummer.

## Vorbereitung
Die folgenden Befehle demonstrieren den prinzipiellen technischen Ablauf um die Aufgaben vorzubereiten.
Nach der Vorbereitung haben beide Gruppenmitglieder eine lokale Kopie des Git-Repositories.

> Die Variable `N` wird im Folgenden verwendet um die Gruppennummer anzugeben.
> In den Beispielbefehlen wird hierfür 99 verwendet, diese ist aber bei jeder Gruppe unterschiedlich!
>
> UserA und UserB beziehen sich jeweils auf die Gruppenmitglieder.
> Wer UserA und UserB ist, ist nicht wichtig, darf aber während des gesamten Ablaufs nicht verändert werden!

### User A und User B @ Github:
* Auf den Link in der Einladung klicken, um der Gruppe _grp$N_ beizutreten.

## Git und GitHub Vorbereitungen

### User A @ GitHub
* *htwg-syslab-bsys-ss18/bsys-ss18-grp$N* -> fork -> *UserA/bsys-ss18-grp$N*
* _UserB_ als Mitarbeiter zum *UserA/bsys-ss18-grp$N*-Repository hinzufügen

### User A @ Container:

Zunächst muss ein Verzeichnis angelegt werden, in das das Git Repository geklont wird. Der Befehl `mkdir` erstellt ein neues, leeres Verzeichnis. Anschließend muss in das neu erstellte Verzeichnis gewechselt werden.
```bash
mkdir -p ~/src/htwg-syslab-bsys-ss18/
cd ~/src/htwg-syslab-bsys-ss18/
```

Mit dem Befehl `git clone` kann ein Repository auf den lokalen Rechner (bzw in den Container) heruntergeladen werden.
```bash
git clone git@github.com:UserA/bsys-ss18-grpN
```

Zuletzt müssen im lokalen Klon noch zusätzliche Remotes hinzugefügt werden. Ein Remote ist ein Repository auf einem anderen Computer, von dem Commits heruntergeladen bzw. auf das Commits hochgeladen werden können. [Weitere Informationen zu remotes](https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes).

Bei den zusätzlichen Remotes handelt es sich um folgende:
* Das *template* Remote zeigt auf das Basis Repository der Homeworks. Hier werden im weiteren Verlauf die neuen Homeworks eingepflegt und können von Ihnen abgeholt werden.
* Das *upstream* Remote zeigt auf das Repository von dem Ihr Fork ausgeht. Die lokale Master-Branch wird nach jeder erfolgreichen Abgabe vom *upstream* Repository aktualisiert.

Folgende Befehle fügen die Remotes hinzu:
```bash
git remote add template git@github.com:htwg-syslab-bsys-ss18/bsys-ss18-template.git
git remote add upstream git@github.com:htwg-syslab-bsys-ss18/bsys-ss18-grpN.git
```

### User B @ Container:

Selbes Vorgehen wie User A im vorherigen Abschnitt.

# Abgabe der Homeworks

Sobald Sie alle Tasks einer Homework bearbeitet haben, erstellen Sie einen sogenannten  *Pull Request* (PR) von Ihrem Branch, den Sie zum Review abgeben wollen. Der Ablauf wird hier erklärt, gleich zu Anfang in der hw0 geübt und sollte spätestens dabei klar werden.

Die Lösungen müssen in einer bestimmten Ordnerstruktur liegen, die wie folgt
aussieht:

```
...
hw1/
    README.md
    task1/
    task2/
    simu1/
hw2/
    README.md
    task1/
    task2/
    simu1/
...
```

In den `taskN`-Unterordnern muss Ihre Lösung für die entsprechende Programmieraufgabe
liegen. in den `simuN`-Unterordnern liegen Ihre Antworten zu den Simulationsaufgaben. Im jeweiligen **README.md** der Homeworks (`hwN`) finden Sie dazu die nötigen Informationen und Aufgaben.

## Schritte zum Pull-Request
1. Überprüfen Sie den Inhalt Ihres Repository. Achten Sie darauf, dass alle Dateien und die jeweiligen Versionen der Dateien die Sie abgeben wollen nicht nur lokal in Ihrem Home Verzeichnis liegen sondern auch in Ihrem Repository auf github.
1. Überprüfen Sie die Ausgabe Ihrer Programme. Stimmen die Ausgaben mit den geforderten Ausgaben überein?
1. Lassen Sie alle Tests laufen indem Sie im Wurzelverzeichnis des Repositories folgenden Befehl ausführen (nur Linux und Verwandte!):

   ```
   ./ci/run-all.sh
   ```

1. Sobald Sie alle Aufgaben bearbeitet haben, und zur Bewertung die Aufgabe abgeben wollen, erstellen Sie einen Branch für den Pull-Request.
1. Wählen Sie dann auf github diesen Branch aus und erstellen Sie einen Pull-Request auf diesen Branch. Bitte weisen Sie selbst keinen Reviewer Ihren Pull-Request zu. Adressieren Sie auch keinen Tutor in dem Kommentarfeld. Die Tutoren wählen selbst und eigenständig die PR's aus, welche sie auswerten.
1. Bei Ihrem Pull-Request laufen automatische Tests durch, die Ihr Programm testen. Dies sind nicht alle Tests von `ci/run-all.sh`, daher MÜSSEN Sie unbedingt selbst im lokalen Verzeichnis auf Ihrer Workstation den `ci/run-all.sh` Test ausführen!
1. Falls Ihnen ein Fehler unterlaufen ist, so können Sie auch nach dem Pull-Request noch Änderungen am Code vornehmen. Das sollte jedoch der Ausnahmefall bleiben. Überprüfen Sie daher VOR Ihrem Pull-Request, ob die nötigen Aufgaben bearbeitet wurden und ob die Tests alle durchlaufen.


## Travis-CI

Um das Arbeiten zu erleichtern, ist für alle Lösungsrepositories ein Continuous
Integration Service aufgesetzt worden. Jedes mal, wenn ein Pull Request (PR) erstellt oder aktualisiert wird, laufen eine Reihe von Tests für Ihre Programmieraufgaben durch, die den Codestil prüfen, alle Rust Dateien kompilieren und alle Unit-Tests ausführen.

Jeder PR hat also einen Status: *passed*, *failed* oder *pending*. Ihr PR zum Einreichen (Deadline) der Aufgaben muss den Status *passed* erreicht haben, also planen Sie genug Zeit zum Verbessern von kleinen Fehlern ein und erstellen Sie den PR nicht erst kurz vor der Deadline. Zur Verbesserung fügen Sie einfach weitere Commits zu dem Branch hinzu von dem aus der Pull-Request erstellt wurde. Dieser wird auf GitHub dann automatisch aktualisiert.

>Achtung: Damit das Testen in github nicht zu lange dauert, sind einige sehr lang laufende CI Tests deaktiviert. Bitte aktivieren Sie diese Tests NICHT für travis sondern führen Sie die Tests nur lokal aus. Github Classroom erlaubt nur immer eine laufende Instanz der Travis Tests. Erstellen Sie somit Ihren Pull-Request rechtzeitig, da ansonsten die Deadline aufgrund anderer laufender CI Tests von Ihnen u.U. nicht eingehalten werden kann.

## gitignore

Ebenfalls in Ihrem Repository ist bereits eine `.gitignore` Datei im Root Ordner, die nicht geändert werden darf. Damit werden von git gewisse Dateitypen und Directories in Ihren `hwN/` Verzeichnissen ignoriert, so dass Sie diese nicht Ihrem Repository hinzufügen. Achten Sie dennoch drauf, welche Dateien Sie in Ihr Repository hinzufügen, denn in `.gitignore` sind nicht alle Möglichkeiten abgefangen. Fügen Sie mit **git add** immer nur selektiv Dateien zu Ihrer `Staging Area` hinzu.

Sie können unabhängig davon in jedem Unterverzeichnis ein eigenes `.gitignore` führen.

## Markdown

Viele Texte, die Sie in diesem Labor anfertigen, müssen in der Markdown Syntax geschrieben werden. Es handelt sich um eine sehr einfache Syntax, die in wenigen Minuten gelernt werden kann. Informationen dazu finden Sie auch unter:

- [Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)


Alle Kommunikationsarten über github erlauben die Markdown-Sprache. Bitte nutzen Sie diese entsprechend!

### template-answers.md

Diese Datei soll Ihnen als Vorlage für Ihre Antworten zu den Fragen der Simulationsaufgaben dienen. Achten Sie bitte darauf, die vorgegeben Struktur einzuhalten. Bitte kopieren Sie NICHT die Fragen selbst mit in die Antwortdatei!

Bitte beantworten Sie Fragen auf Deutsch und überprüfen Sie vor Ihrer Abgabe die Grammatik und Rechtschreibung.

### template-answers-output.md

Wenn Sie zu den Antworten auf die Simulationsfragen noch Console Ausgaben von Ihrem Simulationsprogramm hinzufügen sollen oder wollen, so machen Sie dies bitte in dieser zusätzlichen extra Datei. Auch hier bitte die Struktur einhalten! Beachten Sie dazu die von github unterstützte collapsible markdown syntax.

[SYSLAB]: https://htwg-syslab.github.io
