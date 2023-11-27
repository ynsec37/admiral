data eris_convert_dtc_input;
    infile datalines dsd truncover;
    input MHSTDTC:$19.;
    label ;
datalines;
"2019-07-18T15:25:40"
"2019-07-18T15:25"
"2019-07-18"
"2019-02"
"2019"
"2019---07"
""
;;;;
run;

data eris_convert_dtc_output;
    set eris_convert_dtc_input;
    %eris_convert_dtc(
        data_in                    = eris_convert_dtc_input
        ,date_in_name              = MHSTDTC
        ,date_time_out_name        = ASTDTM 
        ,date_out_name             = ASTDT
        ,time_out_name             = ASTTM  
        ,right_truncated_time_part = sec    
        );
run;

/* output the datasets */
libname out "&W_ROOT./ZZZ_R/admiral/tests/testthat/eris/data";

proc copy in=work out=out;
    select eris_convert_dtc_:;
run;    