-- Essen & Gesund werden – Datenbank einrichten (einmal im Supabase SQL Editor ausführen)

create table if not exists public.days     (id text primary key, data jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());
create table if not exists public.shopping (id text primary key, data jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());
create table if not exists public.vorrat   (id text primary key, data jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());
create table if not exists public.custom   (id text primary key, data jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());

-- Nur angemeldete Nutzer (ihr beide) dürfen lesen und schreiben
alter table public.days enable row level security;
drop policy if exists "haushalt" on public.days;
create policy "haushalt" on public.days for all to authenticated using (true) with check (true);
alter table public.shopping enable row level security;
drop policy if exists "haushalt" on public.shopping;
create policy "haushalt" on public.shopping for all to authenticated using (true) with check (true);
alter table public.vorrat enable row level security;
drop policy if exists "haushalt" on public.vorrat;
create policy "haushalt" on public.vorrat for all to authenticated using (true) with check (true);
alter table public.custom enable row level security;
drop policy if exists "haushalt" on public.custom;
create policy "haushalt" on public.custom for all to authenticated using (true) with check (true);

-- Live-Aktualisierung zwischen beiden Handys
alter publication supabase_realtime add table public.days, public.shopping, public.vorrat, public.custom;

-- Startdaten (aktueller Stand)
insert into public.days (id, data) values
('2026-11-16', $j${"dish": "Porree-Schupfnudel-Pfanne", "edited": true, "kind": "hf", "protein": "lo", "tip": "Ein Glas Riesenbohnen oder Räuchertofu mitbraten."}$j$::jsonb),
('2026-11-17', $j${"dish": "Porree-Schupfnudel-Pfanne", "edited": true, "kind": "hf", "protein": "lo", "tip": "Ein Glas Riesenbohnen oder Räuchertofu mitbraten."}$j$::jsonb),
('2026-11-18', $j${"dish": "Spaghetti Avocado-Basilikum-Pesto", "edited": false, "kind": "hf", "protein": "lo", "tip": "Riesenbohnen oder Räuchertofu untermischen."}$j$::jsonb),
('2026-11-19', $j${"dish": "Spaghetti Avocado-Basilikum-Pesto", "edited": false, "kind": "hf", "protein": "lo", "tip": "Riesenbohnen oder Räuchertofu untermischen."}$j$::jsonb),
('2026-11-20', $j${"dish": "Brokkoli-Bohnen-Suppe mit Filetstücken", "edited": false, "kind": "hf", "protein": "hi", "tip": "Leicht und gut für den ersten Abend zu Hause."}$j$::jsonb),
('2026-11-21', $j${"dish": "Schawarma-Teller mit Tahini", "edited": false, "kind": "hf", "protein": "hi", "tip": "Hummus dazu."}$j$::jsonb),
('2026-11-22', $j${"dish": "Linseneintopf", "edited": false, "kind": "topf", "protein": "hi", "tip": "Angebratene Räuchertofu-Würfel dazu. Reicht bis Dienstag."}$j$::jsonb),
('2026-11-23', $j${"dish": "Linseneintopf", "edited": false, "kind": "topf", "protein": "hi", "tip": "Rest vom Sonntag."}$j$::jsonb),
('2026-11-24', $j${"dish": "Linseneintopf", "edited": false, "kind": "topf", "protein": "hi", "tip": "Rest vom Sonntag."}$j$::jsonb),
('2026-11-25', $j${"dish": "Bibimbap mit Gochujang-Tofu", "edited": false, "kind": "hf", "protein": "hi", "tip": "Gochujang getrennt servieren (Schärfe)."}$j$::jsonb),
('2026-11-26', $j${"dish": "Rote-Linsen-Dal", "edited": false, "kind": "topf", "protein": "hi", "tip": "Mit Reis und Spinat – mild und gut verträglich."}$j$::jsonb),
('2026-11-27', $j${"dish": "Rote-Linsen-Dal", "edited": false, "kind": "topf", "protein": "hi", "tip": "Rest vom Donnerstag."}$j$::jsonb),
('2026-11-28', $j${"dish": "Filetstücke in Orange-Sauce", "edited": false, "kind": "hf", "protein": "hi", "tip": ""}$j$::jsonb),
('2026-11-29', $j${"dish": "Döner-Teller mit Schawarma", "edited": false, "kind": "hf", "protein": "hi", "tip": ""}$j$::jsonb),
('2026-11-30', $j${"dish": "Chili sin Carne", "edited": false, "kind": "topf", "protein": "hi", "tip": "Sojagranulat mitbraten für extra Eiweiß. Mild kochen, Schärfe extra."}$j$::jsonb),
('2026-12-01', $j${"dish": "Chili sin Carne", "edited": false, "kind": "topf", "protein": "hi", "tip": "Rest vom Montag."}$j$::jsonb),
('2026-12-02', $j${"dish": "Kürbis-Kichererbsen-Curry", "edited": false, "kind": "hf", "protein": "hi", "tip": "Noch eine Dose Kichererbsen für Reste."}$j$::jsonb),
('2026-12-03', $j${"dish": "Riesenbohnen-Eintopf", "edited": false, "kind": "topf", "protein": "hi", "tip": "Vollkornbrot dazu."}$j$::jsonb),
('2026-12-04', $j${"dish": "Riesenbohnen-Eintopf", "edited": false, "kind": "topf", "protein": "hi", "tip": "Rest vom Donnerstag."}$j$::jsonb),
('2026-12-05', $j${"dish": "Schawarma auf buntem Salat", "edited": false, "kind": "hf", "protein": "mid", "tip": "Hummus und Vollkornbrot dazu."}$j$::jsonb),
('2026-12-06', $j${"dish": "Austernpilze in Sesam-Marinade", "edited": false, "kind": "hf", "protein": "lo", "tip": "Tofu oder Edamame dazu."}$j$::jsonb),
('2026-12-07', $j${"dish": "Linseneintopf", "edited": false, "kind": "topf", "protein": "hi", "tip": "Angebratene Räuchertofu-Würfel dazu."}$j$::jsonb),
('2026-12-08', $j${"dish": "Linseneintopf", "edited": false, "kind": "topf", "protein": "hi", "tip": "Rest vom Montag."}$j$::jsonb)
on conflict (id) do nothing;
insert into public.vorrat (id, data) values
('ananas', $j${"name": "Ananas Scheiben", "size": "", "count": 2, "mhd": ""}$j$::jsonb),
('apfelmus', $j${"name": "Apfelmus", "size": "710 g", "count": 2, "mhd": "2028-10-23"}$j$::jsonb),
('bakedbeans', $j${"name": "Baked Beans", "size": "410 g", "count": 1, "mhd": "2028-01-31"}$j$::jsonb),
('cornichons', $j${"name": "Cornichons", "size": "370 g", "count": 1, "mhd": "2028-12-31"}$j$::jsonb),
('erbsen-moehren', $j${"name": "Erbsen mit Möhren", "size": "800 g", "count": 2, "mhd": "2028-07-31"}$j$::jsonb),
('kichererbsen', $j${"name": "Kichererbsen", "size": "265 g", "count": 12, "mhd": "2028-11-30"}$j$::jsonb),
('letscho', $j${"name": "Letscho", "size": "", "count": 4, "mhd": "2027-09-23"}$j$::jsonb),
('linsen', $j${"name": "Braune Linsen mit Suppengrün", "size": "", "count": 6, "mhd": "2030-10-10"}$j$::jsonb),
('naturreis', $j${"name": "Naturreis", "size": "1000 g", "count": 2, "mhd": "2027-12-05"}$j$::jsonb),
('olivenoel', $j${"name": "Natives Olivenöl Extra", "size": "1 l", "count": 1, "mhd": ""}$j$::jsonb),
('paprika', $j${"name": "Rote Paprika", "size": "650 g", "count": 2, "mhd": "2028-08-22"}$j$::jsonb),
('pfefferonen', $j${"name": "Pfefferonen mild-pikant", "size": "315 g", "count": 1, "mhd": "2029-04-13"}$j$::jsonb),
('pinto', $j${"name": "Pinto-Chili-Bohnen", "size": "240 g", "count": 11, "mhd": "2028-01-10"}$j$::jsonb),
('rapsoel', $j${"name": "Rapsöl", "size": "1 l", "count": 1, "mhd": "2027-01-28"}$j$::jsonb),
('riesenbohnen', $j${"name": "Weiße Riesenbohnen", "size": "", "count": 12, "mhd": "2029-01-12"}$j$::jsonb),
('rotebete', $j${"name": "Rote Bete", "size": "430 g", "count": 2, "mhd": "2028-12-14"}$j$::jsonb),
('rotkohl', $j${"name": "Rotkohl", "size": "680 g", "count": 3, "mhd": "2028-12-31"}$j$::jsonb),
('sauerkraut', $j${"name": "Weinsauerkraut", "size": "810 g", "count": 3, "mhd": "2027-11-02"}$j$::jsonb),
('silberzwiebeln', $j${"name": "Silberzwiebeln", "size": "320 g", "count": 2, "mhd": "2028-12-31"}$j$::jsonb),
('tomatenmark-scharf', $j${"name": "Tomatenmark scharf", "size": "200 g", "count": 1, "mhd": "2028-07-15"}$j$::jsonb),
('tomatenmark-tube', $j${"name": "Tomatenmark (Tube)", "size": "200 g", "count": 1, "mhd": "2028-11-26"}$j$::jsonb),
('tortenpfirsiche', $j${"name": "Tortenpfirsiche", "size": "", "count": 1, "mhd": "2028-12-21"}$j$::jsonb),
('wasser', $j${"name": "Mineralwasser still", "size": "1,5 l", "count": 60, "mhd": "2026-08-28"}$j$::jsonb),
('zwieback', $j${"name": "Zwieback", "size": "225 g", "count": 3, "mhd": "2027-01-30"}$j$::jsonb)
on conflict (id) do nothing;
insert into public.shopping (id, data) values
('ywtu5q5u2f559g9amym2', $j${"text": "Sojajoghurt (2 Becher à 500 g)", "key": "Sojajoghurt", "done": false, "at": "2026-11-08T14:18:38.539Z"}$j$::jsonb),
('n9kdu98ncts0b0adwam1', $j${"text": "Haferflocken (2 Pck. à 500 g)", "key": "Haferflocken", "done": false, "at": "2026-11-08T14:18:38.774Z"}$j$::jsonb),
('q7bw5cggaep2osgw3cpi', $j${"text": "Kiwis (9 Stk.)", "key": "Kiwis", "done": false, "at": "2026-11-08T14:18:39.019Z"}$j$::jsonb),
('zta2ytc4ur724mztvz5n', $j${"text": "Wraps (1 Pck.)", "key": "Wraps", "done": false, "at": "2026-11-08T14:18:39.273Z"}$j$::jsonb),
('hiqabtjfju2d51f2jb6e', $j${"text": "Hummus (4 Becher à 200 g)", "key": "Hummus", "done": false, "at": "2026-11-08T14:18:39.581Z"}$j$::jsonb),
('15qjom8u3e4ndqbm8nhf', $j${"text": "Möhren (11 Stk.)", "key": "Möhren", "done": false, "at": "2026-11-08T14:18:39.802Z"}$j$::jsonb),
('20xu6l2630gtjq0qj608', $j${"text": "Gurke (3 Stk.)", "key": "Gurke", "done": false, "at": "2026-11-08T14:18:40.193Z"}$j$::jsonb),
('kgue959uwjumv2zm2697', $j${"text": "Vollkornbrot (2 Brot)", "key": "Vollkornbrot", "done": false, "at": "2026-11-08T14:18:40.410Z"}$j$::jsonb),
('q78s3zf1feuxgso1z84v', $j${"text": "Erdnussmus (1 Glas)", "key": "Erdnussmus", "done": false, "at": "2026-11-08T14:18:40.633Z"}$j$::jsonb),
('45m1s9s5cax7gvtbph2i', $j${"text": "Paprika (frisch) (2 Stk.)", "key": "Paprika (frisch)", "done": false, "at": "2026-11-08T14:18:40.868Z"}$j$::jsonb),
('5ocd6n3dn5r4xevyb6tj', $j${"text": "Sojamilch (2 l)", "key": "Sojamilch", "done": false, "at": "2026-11-08T14:18:41.076Z"}$j$::jsonb),
('ezueodvajbomvil1p3z8', $j${"text": "Nüsse (1 Pck. à 200 g)", "key": "Nüsse", "done": false, "at": "2026-11-08T14:18:41.426Z"}$j$::jsonb),
('04tjjcbt06v2vshusg5b', $j${"text": "Leinsamen (geschrotet) (1 Pck. à 250 g)", "key": "Leinsamen (geschrotet)", "done": false, "at": "2026-11-08T14:18:41.647Z"}$j$::jsonb),
('mufzatvzoc6j8r8qfedn', $j${"text": "Bananen (2 Stk.)", "key": "Bananen", "done": false, "at": "2026-11-08T14:18:41.882Z"}$j$::jsonb),
('pfgu1tyz2ci7f17ik0hq', $j${"text": "Zwiebeln (2 Stk.)", "key": "Zwiebeln", "done": false, "at": "2026-11-08T14:18:42.138Z"}$j$::jsonb),
('au63uzs3qgxtj1mdwk2n', $j${"text": "Pastinaken (2 Stk.)", "key": "Pastinaken", "done": false, "at": "2026-11-08T14:18:42.414Z"}$j$::jsonb),
('h6l8wl511dgiyv83zqmv', $j${"text": "Süßkartoffel (600 g)", "key": "Süßkartoffel", "done": false, "at": "2026-11-08T14:18:42.634Z"}$j$::jsonb),
('x8nyiizc9ukpuyu14r1h', $j${"text": "Lauch (2 Stk.)", "key": "Lauch", "done": false, "at": "2026-11-08T14:18:42.895Z"}$j$::jsonb),
('agpyg88ofdpkskhiv0q0', $j${"text": "vegane Würstchen (300 g)", "key": "vegane Würstchen", "done": false, "at": "2026-11-08T14:18:43.113Z"}$j$::jsonb),
('7izsgov8vgcrx806zgsw', $j${"text": "Petersilie (1 Bund)", "key": "Petersilie", "done": false, "at": "2026-11-08T14:18:43.465Z"}$j$::jsonb),
('pkbv9uicyq8ljiihq6b3', $j${"text": "Trockenpflaumen (200 g)", "key": "Trockenpflaumen", "done": false, "at": "2026-11-08T14:18:43.702Z"}$j$::jsonb),
('jai9zqh411vmww45lhzc', $j${"text": "Sojapudding (4 Becher)", "key": "Sojapudding", "done": false, "at": "2026-11-08T14:18:43.988Z"}$j$::jsonb)
on conflict (id) do nothing;
