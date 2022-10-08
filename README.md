# PATRÓN MVC con RPGLE

Se muestra un ejemplo de uso del patrón MVC con el lenguaje RPG ILE.
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

## QRPGLESRC

Se han creado tres programas, que corresponden al Modelo, Vista y Controlador.

1. Modelo
   Es el fuente dws0260m1.rpgle.
   Se compila con 14.

2. Vista
   Es el fuente dws0260v1.rpgle.
   Se compila con 14.

3. Controlador
   Es el fuente dws0260c1.rpgle.
   Este programa es el que llama al modelo y a la vista.

Ejecutar el programa con el siguiente comando:

```
CALL DWS0260C1
```
