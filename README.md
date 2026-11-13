<img src="assets/logo.svg" alt="" width="64">

# Ether

[Ether](https://etherfs.app) is a shared workspace for you and your agents: files that Claude, ChatGPT, Gemini, Grok and your coding agents can all read and write. This repository packages Ether's remote MCP server, `https://etherfs.app/mcp`, as a plugin for coding agents. Installing it adds the server; your agent asks you to sign in to Ether the first time it connects.

The plugin is only configuration. It runs no code on your machine and holds no credentials: you sign in with OAuth, and the agent keeps the token.

## Claude Code

```sh
claude plugin marketplace add warptech-xyz/ether-plugin
claude plugin install ether@warptech
```

Or, in a session, `/plugin marketplace add warptech-xyz/ether-plugin`, then `/plugin install ether@warptech`. Run `/mcp`, choose `plugin:ether:ether`, and sign in.

## Codex

```sh
codex plugin marketplace add warptech-xyz/ether-plugin
codex plugin add ether@warptech
```

Or open `/plugins` in Codex, or the Plugins tab in the ChatGPT desktop app, and install Ether from the WarpTech marketplace. Sign in when Codex asks.

## GitHub Copilot CLI

```sh
copilot plugin marketplace add warptech-xyz/ether-plugin
copilot plugin install ether@warptech
```

Or, in a session, `/plugin marketplace add warptech-xyz/ether-plugin`, then `/plugin install ether@warptech`. Sign in when Copilot asks, or with `/mcp auth ether`.

## VS Code (GitHub Copilot)

Run **Chat: Install Plugin from Source** and give it `https://github.com/warptech-xyz/ether-plugin`. Or add the marketplace to your settings and install Ether from it:

```json
"chat.plugins.marketplaces": ["warptech-xyz/ether-plugin"]
```

Agent plugins need `chat.plugins.enabled`, which your organization may manage. Without them, add just the server: [Install in VS Code](https://vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522ether%2522%252C%2522type%2522%253A%2522http%2522%252C%2522url%2522%253A%2522https%253A%252F%252Fetherfs.app%252Fmcp%2522%257D) or [VS Code Insiders](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522ether%2522%252C%2522type%2522%253A%2522http%2522%252C%2522url%2522%253A%2522https%253A%252F%252Fetherfs.app%252Fmcp%2522%257D). VS Code asks you to review the server, then to sign in when it starts.

## Cursor

[Add Ether to Cursor](https://cursor.com/install-mcp?name=ether&config=eyJ1cmwiOiJodHRwczovL2V0aGVyZnMuYXBwL21jcCJ9), and sign in when Cursor asks. Teams can import this repository as a team marketplace in the dashboard, under **Plugins & MCPs**.

## Antigravity

```sh
agy plugin install https://github.com/warptech-xyz/ether-plugin
```

Antigravity asks you to sign in when it first connects to Ether.

## Gemini CLI

Gemini CLI is for Gemini Code Assist Standard and Enterprise. Free accounts and Google AI Pro and Ultra moved to Antigravity CLI: follow the [Antigravity](#antigravity) steps instead.

```sh
gemini extensions install https://github.com/warptech-xyz/ether-plugin
```

Restart Gemini CLI, then run `/mcp auth ether` to sign in.

## Other agents

Claude, ChatGPT, Gemini, Grok and Muse connect to Ether as a custom connector rather than a plugin. The steps for each are on [etherfs.app](https://etherfs.app/#install). For Muse, start a new chat and send it:

> Create a custom connector for Ether. It's a remote MCP server at https://etherfs.app/mcp, over streamable HTTP, and it signs in with OAuth.

Copilot in Visual Studio and JetBrains IDEs has no plugins: add `https://etherfs.app/mcp` in its MCP settings. Copilot's cloud agent can't sign in to Ether, because it doesn't support remote servers that use OAuth.

Any other MCP client can add `https://etherfs.app/mcp` as a remote (streamable HTTP) server with OAuth.

## What's in this repository

Each agent reads its own files, and every one of them points at the same server:

| Agent                       | Manifest                          | Marketplace                        | Server config     |
| --------------------------- | --------------------------------- | ---------------------------------- | ----------------- |
| Claude Code                 | `.claude-plugin/plugin.json`      | `.claude-plugin/marketplace.json`  | `.mcp.json`       |
| Codex, ChatGPT              | `plugin.json`                     | `.agents/plugins/marketplace.json` | `mcp.json`        |
| GitHub Copilot CLI, VS Code | `plugin.json`                     | `.claude-plugin/marketplace.json`  | `mcp.json`        |
| Cursor                      | `plugin.json`                     | `.cursor-plugin/marketplace.json`  | `mcp.json`        |
| Antigravity                 | `.antigravity-plugin/plugin.json` |                                    | `mcp_config.json` |
| Gemini CLI                  | `gemini-extension.json`           |                                    | (inline)          |

`plugin.json` and `mcp.json` follow [Agent Plugins](https://agent-plugins.org). Copilot and VS Code find the plugin through `.claude-plugin/marketplace.json`, so that file is needed even though it looks Claude-only. CI fails if the name, version, description or server URL differ between files.

## Privacy

See Ether's [privacy policy](https://etherfs.app/privacy).

## License

[MIT](LICENSE)
