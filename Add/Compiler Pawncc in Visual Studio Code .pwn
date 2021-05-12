
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "SAMP Pawn Compiler Libray-normal",
      "type": "shell",
      "command": "${workspaceFolder}/pawno/pawncc.exe",
      "args": [
        "${file}",
        "--%",
        "-Dgamemodes",
        "-;+",
        "-(+",
        "-d3"
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
