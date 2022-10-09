# PATRÓN MVC con RPGLE

Se muestra un ejemplo de uso del patrón MVC con el lenguaje RPG ILE.

Se usa también un service program, binding directory y binding language.

Para realizar esta prueba se han creado los siguientes fuentes en estos contenedores.

## QDDSSRC

Se ha creado un fichero PF llamado mspm100.pf que contiene datos de un número de producto
Para informar datos se pueden ejecutar las siguientes consultas SQL:

```
  INSERT INTO MSPMP100 VALUES('AAAAAAA101');
  INSERT INTO MSPMP100 VALUES('AAAAAAA102');
  INSERT INTO MSPMP100 VALUES('AAAAAAA103');
  INSERT INTO MSPMP100 VALUES('AAAAAAA104');
```

## QDSPSRC

Se ha creado la pantalla dws0260fm.dspf para informar el número de producto y ver el mensaje.

Si no se encuentra el valor informado, por ejemplo AAAAAAA101, aparece un mensaje de error. Si se informa aparecerá el texto indicando que existe.

Si se pulsa F3 se sale del programa.

Si se pulsa F12 se inicializa la pantalla, es decir, se borra el número de producto informado y el mensaje.

Si se pulsa Intro se valida el número de producto informado.

## QSRVSRC

Se ha creado un fuente binding language llamado dws0260m1.bnd para realizar el enlace con el pgm.

Para crear un binding directory ejecutar el comando:

```
CRTBNDDIR BNDDIR(MyLib/BNDJOMUMA) TEXT('BINDING DIRECTORY FOR JOMUMA')
```

En este binding directory se añadirá el service program.

## QRPGLESRC

Se han creado tres programas, que corresponden al Modelo, Vista y Controlador.

1. Modelo (el service program)

   Es el fuente dws0260m1.rpgle. Es un service program para el que se ha usado también un fichero copy llamado dws0260pr.rpgle y se ha usado también un binding language (ver QSRVSRC)
   Para compilar, crear el programa y añadirlo al binding directory:

   ```
   CRTRPGMOD MODULE(MyLib/DWS0260M1) SRCFILE(MyLib/QRPGLESRC)
   CRTSRVPGM SRVPGM(MyLib/DWS0260M1) EXPORT(*SRCFILE) ACTGRP(*CALLER)
   ADDBNDDIRE BNDDIR(MyLib/BNDJOMUMA) OBJ((MyLib/DWS0260M1))
   ```

   Muy importante el uso de EXPORT(\*SRCFILE) para que se use el binding language.

2. Vista
   Es el fuente dws0260v1.rpgle.
   Se compila con 14.

3. Controlador
   Es el fuente dws0260c1.rpgle.
   Este programa es el que llama al modelo y a la vista.

   Para compilar (ver como se usa BNDDIR para indicar el binding directory):

   ```
   CRTRPGMOD MODULE(MyLib/DWS0260C1) DBGVIEW(*SOURCE) SRCFILE(MyLib/QRPGLESRC)
   CRTPGM PGM(MyLib/DWS0260C1) ACTGRP(*NEW) BNDDIR(MyLib/BNDJOMUMA)
   ```

Ejecutar el programa con el siguiente comando:

```
CALL DWS0260C1
```
