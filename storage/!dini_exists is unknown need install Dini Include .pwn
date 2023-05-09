Please download the Dini include first.

The "!dini_exists is unknown" notification usually indicates that the compiler is not recognizing the Dini library. 

To fix this issue, make sure that you have added the Dini library to your project and included it in your script using the `#include` statement. 

Here is an example of how to include the Dini library in your script:

```pawn
#include <dini>
```

If you have already added the Dini library and are still getting the notification, make sure that you have specified the correct path to the Dini include file in your compiler settings. 

You can do this by adding the include directory to the "args" section of your VS Code task, like this:

```json
"args": [
  "${file}",
  "-i${workspaceFolder}/pawno/include",
  "--%",
  "-Dgamemodes",
  "-;+",
  "-(+",
  "-d3"
],
```

In this example, the include directory is specified using the `-i` flag and the `${workspaceFolder}/pawno/include` path. Adjust this path to match the actual location of your Dini include file.
