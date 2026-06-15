# MinimapButtonButton

A World of Warcraft addon for collecting minimap buttons.

Upstream: [syndenbock/MinimapButtonButton](https://github.com/syndenbock/MinimapButtonButton)

## WoW 3.3.5a compatible build

This package includes compatibility changes for **World of Warcraft 3.3.5a (Wrath of the Lich King)**.

What this means in practice:
- Client shims for older APIs that are missing on 3.3.5a.
- Compatibility handling for older `LibDBIcon-1.0` variants.
- Guards around missing UI/Settings APIs so the addon can load without retail-only globals.

## Installation

1. Copy `MinimapButtonButton` into your `Interface/AddOns` folder.
2. Make sure the TOC you use targets `## Interface: 30300` (Wrath).

## Usage

- Left click: show/hide the collected minimap buttons.
- Middle click drag or `ALT` + left click drag: move the main button.

On 3.3.5a, the options panel may be unavailable; use slash commands instead.

