# karate-demo

A small [Karate](https://github.com/karatelabs/karate) project. No Maven, no Gradle, no Java code: just feature files, run by the Karate CLI or your IDE. Works on Windows, macOS and Linux.

| File | What it shows |
|---|---|
| `features/api/todos.feature` | An API test. It starts its own mock server (`todos-mock.feature`), so it needs no network. |
| `features/cart/cart.feature` | A cart invoice computed in JavaScript (`invoice.js`). Set a breakpoint in the `.js` file and debug. |
| `karate-pom.json` | Tells the CLI and the editors which folder holds the tests. |

## VS Code (start here)

Watch it first: [Karate for VS Code on Windows: write it, run it, debug it](https://youtu.be/FR57JlOlrbA) (2:16). Step by step: the [Windows Quick Start](https://docs.karatelabs.io/getting-started/vscode-windows).

1. Download this repo (**Code → Download ZIP**, then extract) or `git clone` it.
2. In VS Code: **File → Open Folder…**, pick the folder that holds `karate-pom.json`, and trust it. Windows' **Extract All** puts it one level down: `karate-demo-main\karate-demo-main`.
3. Install the recommended **Karate** extension when VS Code offers it.
4. **Karate Setup** opens: click **Install CLI**, then **Run Setup** (downloads Java and Karate, no admin rights needed), then **Refresh**.
5. Sign in from the License card. Open a `.feature` file and click ▶ in the gutter.

Running tests from the editor needs IDE Plus; debugging needs IDE Pro.

### Follow along with the video

The video debugs a failing test. To see the same failure, open `features/cart/invoice.js` and on line 3 change `item.price * item.qty` to `item.price`, then run `cart.feature`: the invoice match fails with a subtotal of 7 where 11 is expected. Set a breakpoint on line 4 and debug to see why; undo the change to go green again.

## IntelliJ IDEA (2026.1+)

1. Do steps 1 and 4 above once, or run `karate setup --all`, so Karate is in `~/.karate/dist` (`%USERPROFILE%\.karate\dist` on Windows).
2. Install the **Karate** plugin, sign in under **Settings → Languages & Frameworks → Karate**.
3. **File → Open** the folder. The project picks up Karate from `~/.karate/dist`; set a JDK 21 when IntelliJ asks.
4. Click ▶ in the gutter of a `.feature` file.

## Karate Xplorer

**Open**, and pick `karate-pom.json` in `karate-demo`. Running needs Xplorer Premium.

## Command line

Install the Karate CLI once (no admin rights needed); it downloads Java and Karate:

```
# Windows (PowerShell)
iex "& { $(irm https://karate.sh/install.ps1) } -All"

# macOS / Linux
curl -fsSL https://karate.sh/install.sh | sh -s -- --all
```

Then, in a new terminal:

```
karate run
```

Runs everything under `features/`. One file: `karate run features/cart/cart.feature`. The report is at `target/karate-reports/karate-summary.html`.

## License

MIT
