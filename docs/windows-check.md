# Windows check

On a clean Windows 11 VM: no Java, no Maven, no `%USERPROFILE%\.karate`. Each step names what to see.

## VS Code

1. Download the ZIP, extract to `C:\Users\<you>\karate-demo-main`. Open the folder, trust it.
2. The toast recommends only **Karate**; install it. **Karate Setup** opens, badge *Not Installed*, no Maven banner.
3. **Install CLI** → `karate.exe` in `%LOCALAPPDATA%\Programs\Karate`. Click **Refresh**: the CLI Launcher card reads installed. If not, that folder is not on `PATH` (the extension does not add it).
4. **Run Setup** → the terminal runs `karate setup --all`; **Refresh** → *Ready*, JRE and JAR under `%USERPROFILE%\.karate`.
5. Sign in (Pro). Testing view lists `todos.feature`, `todos-mock.feature`, `cart.feature`.
6. ▶ on `cart.feature`: green. ▶ on `todos.feature`: 2 passed (the mock binds a free port; allow the firewall prompt if one appears).
7. Breakpoint on `invoice.js` line 4, Debug the scenario: pauses, Variables show `items`, `taxRate`, `subtotal 11`. Repeat with `java` absent from `PATH` and `JAVA_HOME` unset (the debugger looks for `bin\java`, not `java.exe`).
8. `git checkout video-ide-bug`, add `* match bill.subtotal == sub` after `* def bill = …`, Run: fails `7` vs `11`.
9. Line endings: `git config core.autocrlf true`, re-clone; `git status` stays clean.

## IntelliJ IDEA 2026.1+

1. After VS Code step 4 (or `karate setup --all`), **File → Open** the folder. Project Structure shows module `karate-demo` with library `karate` = `%USERPROFILE%\.karate\dist\karate-2.1.4.jar`.
2. Set a JDK 21 SDK when asked (Download JDK is fine).
3. Install the Karate plugin, sign in. ▶ on `cart.feature`: the test tree is green. Debug with a breakpoint in `invoice.js`: pauses.
4. Run `todos.feature`: 2 passed.

## Karate Xplorer

1. Install, **Open Karate project folder** → `karate-demo`. Tests view lists the three features; no *No karate-config.js* banner.
2. Premium: Run on the root → 3 passed (the mock is `@ignore`d); a report opens.
