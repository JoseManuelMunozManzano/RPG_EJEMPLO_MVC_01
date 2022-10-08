**FREE

  //------------------------------------------------------------------------
  // DWS0260V1 - View Program
  //------------------------------------------------------------------------
  ctl-opt dftactgrp(*no) actgrp(*new);

  dcl-f DWS0260FM workstn infds(workInfds);

  dcl-ds DWS0260R1 ext extname('DWS0260FM':'DWS026001') end-ds;

  dcl-ds workInfds;
    fKey char(1) pos(369);
  end-ds;

  dcl-pr DWS0260V1;
    in_out_fKey char(1);
    in_out_DWS0260 likeDs(DWS0260R1);
    in_msg char(60);
  end-pr;

  dcl-pi DWS0260V1;
    in_out_fKey char(1);
    in_out_DWS0260 likeDs(DWS0260R1);
    in_msg char(60);
  end-pi;

  //------------------------------------------------------------------------
  // MAIN PROCESS
  //------------------------------------------------------------------------
    f1Err = in_msg;
    DWS0260R1 = in_out_DWS0260;

    write DWS026001;
    read DWS026001;

    in_out_fKey = fKey;
    in_out_DWS0260 = DWS0260R1;

    *inLr = *on;
