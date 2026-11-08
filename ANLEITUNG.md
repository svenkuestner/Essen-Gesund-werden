# Essen & Gesund werden – Einrichtung

Dauer: ca. 30–60 Minuten, am besten am Computer. Die Bezeichnungen in Supabase und GitHub können leicht abweichen, wenn die Seiten ihr Design ändern.

## 1. Datenbank bei Supabase anlegen

1. Auf **supabase.com** gehen und kostenlos registrieren (geht auch mit GitHub-Login).
2. **New project** anlegen: Name z. B. `essen-gesund`, ein Datenbank-Passwort vergeben (gut aufheben), Region **Frankfurt (eu-central-1)**. Warten, bis das Projekt bereit ist.
3. Links **SQL Editor** öffnen → **New query** → den kompletten Inhalt der Datei `setup.sql` einfügen → **Run**. Es sollte „Success“ erscheinen. Damit sind Tabellen, Zugriffsschutz und euer aktueller Plan, Vorrat und eure Einkaufsliste angelegt.
4. Links **Authentication → Users → Add user → Create new user**:
   - deine E-Mail + ein Passwort, Haken bei **Auto Confirm User**
   - dasselbe nochmal für deine Freundin
5. Unter **Authentication → Sign In / Providers** (bzw. Settings) **„Allow new users to sign up“ ausschalten**. Dann kann sich niemand Fremdes registrieren.
6. Unter **Project Settings → API** (bzw. „Data API“ / „API Keys“) zwei Werte kopieren:
   - **Project URL** (sieht aus wie `https://abcdefgh.supabase.co`)
   - **anon public** Key (heißt evtl. auch „publishable key“)

## 2. config.js ausfüllen

Die Datei `config.js` mit einem Texteditor öffnen und die zwei Werte eintragen:

```js
const SUPABASE_URL = "https://abcdefgh.supabase.co";
const SUPABASE_ANON_KEY = "eyJ...";
```

Der anon-Key darf öffentlich sein. Geschützt sind die Daten über eure Anmeldung.

## 3. App auf GitHub Pages veröffentlichen

1. Auf **github.com** kostenlos registrieren.
2. Oben rechts **+ → New repository**: Name z. B. `essen-gesund`, **Public**, **Create repository**.
3. Auf der neuen Seite auf **„uploading an existing file“** klicken und diese Dateien hineinziehen:
   `index.html`, `config.js`, `manifest.webmanifest`, `icon-180.png`, `icon-192.png`, `icon-512.png`
   → unten **Commit changes**.
   (`setup.sql`, `icon.svg` und diese Anleitung müssen nicht hoch.)
4. Im Repository **Settings → Pages**: Source **Deploy from a branch**, Branch **main**, Ordner **/ (root)** → **Save**.
5. Nach 1–2 Minuten steht oben die Adresse, z. B. `https://DEINNAME.github.io/essen-gesund/`.

## 4. Aufs Handy

1. Die Adresse in **Safari** öffnen.
2. **Teilen → Zum Home-Bildschirm** → Name „Essen & Gesund“ → Hinzufügen.
3. Die App **über das neue Icon** öffnen und dort anmelden. Die Anmeldung im Icon ist getrennt von Safari, deshalb dort einloggen. Danach bleibt man angemeldet.
4. Deiner Freundin schickst du die Adresse sowie ihre E-Mail und ihr Passwort.

## Gut zu wissen

- Änderungen sieht der andere sofort, ggf. App einmal schließen und neu öffnen.
- Kostenlose Supabase-Projekte werden nach einer Weile ohne Nutzung pausiert (soweit bekannt nach ca. 1 Woche). Bei täglicher Nutzung passiert das nicht. Falls doch: im Supabase-Dashboard auf „Restore“ klicken.
- Für spätere Änderungen an der App schickt Claude dir eine neue `index.html`, die du auf GitHub über „Add file → Upload files“ ersetzt.
