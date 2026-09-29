000 SYS   function                              1 byte
001 ALU   function, Ra, Rb, Rc, write, flag     2 bytes
010 MOV   Ra, Rb                                1 byte
011 LOAD  Rd, [Ra / addr]                       1 or 2 bytes
100 STORE Rs, [Ra / addr]                       1 or 2 bytes
101 BRI   condition, addr                       2 bytes
110 BR    condition, Ra                         1 byte
111 LDI   Rd, immediate                         2 bytes

