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

## Cursor

Install Ether from Cursor's marketplace, under **Customize**. Teams can also import this repository in the dashboard, under **Plugins & MCPs**.

## Antigravity

```sh
agy plugin install https://github.com/warptech-xyz/ether-plugin
```

Antigravity asks you to sign in when it first connects to Ether.

## Gemini CLI

```sh
gemini extensions install https://github.com/warptech-xyz/ether-plugin
```

Restart Gemini CLI, then run `/mcp auth ether` to sign in.

## Other agents

Claude, ChatGPT, Gemini, Grok and Muse connect to Ether as a custom connector rather than a plugin. The steps for each are on [etherfs.app](https://etherfs.app/#install). For Muse, start a new chat and send it:

> Create a custom connector for Ether. It's a remote MCP server at https://etherfs.app/mcp, over streamable HTTP, and it signs in with OAuth.

Any other MCP client can add `https://etherfs.app/mcp` as a remote (streamable HTTP) server with OAuth.

## What's in this repository

Each agent reads its own manifest, and every one of them points at the same server:

| Agent                 | Manifest                                                     | Server config     |
| --------------------- | ------------------------------------------------------------ | ----------------- |
| Claude Code           | `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` | `.mcp.json`       |
| Codex, ChatGPT, Cursor | `plugin.json` ([Agent Plugins](https://agent-plugins.org)), `.agents/plugins/marketplace.json` | `mcp.json`        |
| Antigravity           | `.antigravity-plugin/plugin.json`                            | `mcp_config.json` |
| Gemini CLI            | `gemini-extension.json`                                      | (inline)          |

## Privacy

See Ether's [privacy policy](https://etherfs.app/privacy).

## License

[MIT](LICENSE)
