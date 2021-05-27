new Float:Data; 
  Float:Data = 111.555555555;
  printf("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\", Data);
  printf("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\", Data);
  printf("[DEBUG FLOAT]: Format with .1f: [%.1f]", Data); 
  printf("[DEBUG FLOAT]: Format with 0.1f: [%0.1f]", Data);
  printf("[DEBUG FLOAT]: Format with 0.2f: [%0.2f]", Data);
  printf("[DEBUG FLOAT]: Format with 0.3f: [%0.3f]", Data);
  printf("[DEBUG FLOAT]: Format with 0.4f: [%0.4f]", Data);
  printf("[DEBUG FLOAT]: Format with basic float: [%f]", Data);

  printf("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\", Data);
  printf("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\", Data);
  return 1;
  
  
  /*
  ////// RESULT ///////////////
  
  \\\\\\\\\\\\\\\\\
\\\\\\\\\\\\\\\\\
[DEBUG FLOAT]: Format with .1f: [111.5]
[DEBUG FLOAT]: Format with 0.1f: [111.5]
[DEBUG FLOAT]: Format with 0.2f: [111.55]
[DEBUG FLOAT]: Format with 0.3f: [111.555]
[DEBUG FLOAT]: Format with 0.4f: [111.5555]
[DEBUG FLOAT]: Format with basic float: [111.555557]
\\\\\\\\\\\\\\\\\
\\\\\\\\\\\\\\\\\
  */
