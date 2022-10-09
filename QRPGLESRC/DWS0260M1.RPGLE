**FREE

  //------------------------------------------------------------------------
  // DWS0260M1 - Model Program
  // A Service Program
  //
  // COMPILING THE SERVICE PROGRAM:
  //    CRTRPGMOD MODULE(MyLib/DWS0260M1) SRCFILE(MyLib/QRPGLESRC)
  // CREATING THE SERVICE PROGRAM:
  //     CRTSRVPGM SRVPGM(MyLib/DWS0260M1) EXPORT(*SRCFILE) ACTGRP(*CALLER)
  //
  // CREATE BNDDIR (only once):
  //    CRTBNDDIR BNDDIR(JOMUMA1/BNDJOMUMA) TEXT('BINDING DIRECTORY FOR JOMUMA')
  // ADDING TO BNDDIR:
  //     ADDBNDDIRE BNDDIR(JOMUMA1/BNDJOMUMA) OBJ((JOMUMA1/DWS0260M1))
  // REMOVE FROM BNDDIR (if necessary):
  //     RMVBNDDIRE BNDDIR(JOMUMA1/BNDJOMUMA) OBJ((JOMUMA1/DWS0260M1))
  //------------------------------------------------------------------------
  ctl-opt nomain;

  /copy QRPGLESRC,DWS0260PR

  //------------------------------------------------------------------------
  // PROCEDURES
  //------------------------------------------------------------------------
  dcl-proc Validate_Product export;

    dcl-pi *n char(1);
      in_product char(10);
      out_msg char(60);
    end-pi;

    dcl-f MSPMP100 disk(*ext) keyed usage(*update:*output);
    dcl-ds dsProduct likeRec(RMSPMP100);

    chain(e) (in_product) MSPMP100 dsProduct;
    if not %found(MSPMP100);
      out_msg = 'This aint no valid product';
      return 'Y';
    else;
      out_msg = *blanks;
      return 'N';
    endIf;

  end-proc;
