updated version of the compiler setting for VS Code:

```
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "SAMP Pawn Compiler Libray-normal",
      "type": "shell",
      "command": "${workspaceFolder}/pawno/pawncc.exe",
      "args": [
        "${file}",
        "-;+",
        "-(+",
        "-d3",
        "-i${workspaceFolder}/pawno/include",
        "-i${workspaceFolder}/gamemodes",
        "-i${workspaceFolder}/filterscripts"
      ],
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "isBackground": false,
      "presentation": {
        "reveal": "silent",
        "panel": "dedicated"
      },
      "problemMatcher": "$pawncc"
    }
  ]
}
```

This version includes the following changes:

- Removed the `--%` flag as it's not necessary.
- Added include paths for the `include`, `gamemodes`, and `filterscripts` directories.
- Removed the `-Dgamemodes` flag as it's not necessary and could potentially cause issues.
- Reordered the flags for consistency.

Note that you may need to adjust the paths based on your project's directory structure.
