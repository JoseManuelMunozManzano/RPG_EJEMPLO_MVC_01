**FREE

  //------------------------------------------------------------------------
  // DWS0260M1 - Model Program
  //------------------------------------------------------------------------
  ctl-opt dftactgrp(*no) actgrp(*new);

  dcl-f MSPMP100 disk(*ext) keyed usage(*update:*output);

  dcl-pr DWS0260M1;
    in_product char(10);
    out_msg char(60);
    out_error_flag char(1);
  end-pr;

  dcl-pi DWS0260M1;
    in_product char(10);
    out_msg char(60);
    out_error_flag char(1);
  end-pi;

  //------------------------------------------------------------------------
  // MAIN PROCESS
  //------------------------------------------------------------------------
    chain(e) (in_product) MSPMP100;
    if not %found(MSPMP100);
      out_error_flag = 'Y';
      out_msg = 'This aint no valid product';
    else;
      out_error_flag = 'N';
      out_msg = *blanks;
    endIf;

    *inLr = *on;
