**FREE

  //------------------------------------------------------------------------
  // DWS0260C1 - Controller Program
  //
  // CREATING THE MODULE:
  //    CRTRPGMOD MODULE(MyLib/DWS0260C1) DBGVIEW(*SOURCE) SRCFILE(MyLib/QRPGLESRC)
  // CREATING THE PROGRAM:
  //    CRTPGM PGM(MyLib/DWS0260C1) ACTGRP(*NEW) BNDDIR(MyLib/BNDJOMUMA)
  //------------------------------------------------------------------------
  dcl-f DWS0260FM workstn prefix(V1_) infds(workInfds);

  dcl-ds DWS0260R1 extname('DWS0260FM':'DWS026001') prefix(V1_) end-ds;

  dcl-ds workInfds;
    fKey char(1) pos(369);
  end-ds;

  dcl-pr DWS0260V1 extPgm('DWS0260V1');
    p_fKey char(1);
    p_DWS0260 likeDs(DWS0260R1);
    p_msg char(60);
  end-pr;

  dcl-s p_msg char(60);
  dcl-s p_fKey char(1);
  dcl-ds p_DWS0260 likeDs(DWS0260R1);

  dcl-c f03 const(X'33');
  dcl-c f12 const(X'3C');
  dcl-c enter const(X'F1');

  /copy QRPGLESRC,DWS0260PR

  //------------------------------------------------------------------------
  // MAIN PROCESS
  //------------------------------------------------------------------------
    p_fKey = *blanks;
    p_msg = *blanks;
    callP DWS0260V1(p_fKey : p_DWS0260 : p_msg);

    dow p_fKey <> f03;

      select;
        when p_fKey = f03;

        when p_fKey = f12;
          p_DWS0260.v1_f1NumP = *blanks;
          p_msg = *blanks;
          callP DWS0260V1(p_fKey : p_DWS0260 : p_msg);

        when p_fKey = enter;
          if Validate_Product(p_DWS0260.v1_f1NumP : p_msg) = 'N';
            p_msg = 'Product exists';
            p_DWS0260.v1_f1NumP = *blanks;
          endIf;

          callP DWS0260V1(p_fKey : p_DWS0260 : p_msg);

        other;

      endSl;

    enddo;

    *inLr = *on;
