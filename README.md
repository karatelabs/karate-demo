# karate-demo

A small [Karate](https://github.com/karatelabs/karate) project. No Maven, no Gradle, no Java code: just feature files, run by the Karate CLI or your IDE. Works on Windows, macOS and Linux.

| File | What it shows |
|---|---|
| `features/api/todos.feature` | An API test. It starts its own mock server (`todos-mock.feature`), so it needs no network. |
| `features/cart/cart.feature` | A cart invoice computed in JavaScript (`invoice.js`). Set a breakpoint in the `.js` file and debug. |
| `karate-pom.json` | Tells the CLI and the editors which folder holds the tests. |

## VS Code (start here)

1. Download this repo (**Code → Download ZIP**, then extract) or `git clone` it.
2. In VS Code: **File → Open Folder…**, pick `karate-demo`, and trust it.
3. Install the recommended **Karate** extension when VS Code offers it.
4. **Karate Setup** opens: click **Install CLI**, then **Run Setup** (downloads Java and Karate, no admin rights needed), then **Refresh**.
5. Sign in from the License card. Open a `.feature` file and click ▶ in the gutter.

Running tests from the editor needs Karate Plus; debugging needs Pro.

## IntelliJ IDEA (2026.1+)

1. Do steps 1 and 4 above once, or run `karate setup --all`, so Karate is in `~/.karate/dist` (`%USERPROFILE%\.karate\dist` on Windows).
2. Install the **Karate** plugin, sign in under **Settings → Languages & Frameworks → Karate**.
3. **File → Open** the folder. The project picks up Karate from `~/.karate/dist`; set a JDK 21 when IntelliJ asks.
4. Click ▶ in the gutter of a `.feature` file.

## Karate Xplorer

**Open Karate project folder** and pick `karate-demo`. Running needs Xplorer Premium.

## Command line

```
karate run
```

Runs everything under `features/`. One file: `karate run features/cart/cart.feature`. The report is at `target/karate-reports/karate-summary.html`.

## License

MIT
