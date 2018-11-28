// RUNS MAGNetQA TESTS
close("*")
roiManager("reset");

//SNR measurements with the HEAD COIL 
 HEAD_SNR_TRA_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_TRA_1";
 HEAD_SNR_COR_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_COR_1";
 HEAD_SNR_SAG_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_SAG_1";

 HEAD_SNR_TRA_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_TRA_2";
 HEAD_SNR_COR_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_COR_2";
 HEAD_SNR_SAG_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_SAG_2";


//SNR measurements with the BODY COIL 
BODY_SNR_TRA_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_TRA_1";
BODY_SNR_TRA_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_TRA_2";

BODY_SNR_COR_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_COR_1";
BODY_SNR_COR_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_COR_2";

BODY_SNR_SAG_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_SAG_1";
BODY_SNR_SAG_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_SAG_2";


//GEOMETRIC_LINEARITY_TRA measurements
 GEOMETRIC_LINEARITY_TRA="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_GEOMETRIC_LINEARITY_TRA";
 GEOMETRIC_LINEARITY_COR="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_GEOMETRIC_LINEARITY_COR";
 GEOMETRIC_LINEARITY_SAG="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_GEOMETRIC_LINEARITY_SAG";

//GHOSTING measurements
 GHOSTING_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/MultiEchoSE_HEAD_GHOSTING_TRA_NSA1";
 GHOSTING_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/MultiEchoSE_HEAD_GHOSTING_TRA_NSA2";



 Results_dir="/Users/papo/Desktop/QAResults";


//Create Results_dir folder
if ( File.isDirectory(Results_dir)==0 ){
print("Creating folder "+ Results_dir);
File.makeDirectory(Results_dir);
}

 
//store results_dir path
call("ij.Prefs.set", "myMacros.savedir", Results_dir); 
//store filename paths 
//SNR Head coil
call("ij.Prefs.set", "myMacros.HEAD_SNR_TRA_1", HEAD_SNR_TRA_1);
call("ij.Prefs.set", "myMacros.HEAD_SNR_COR_1", HEAD_SNR_COR_1);
call("ij.Prefs.set", "myMacros.HEAD_SNR_SAG_1", HEAD_SNR_SAG_1);

call("ij.Prefs.set", "myMacros.HEAD_SNR_TRA_2", HEAD_SNR_TRA_2);
call("ij.Prefs.set", "myMacros.HEAD_SNR_COR_2", HEAD_SNR_COR_2);
call("ij.Prefs.set", "myMacros.HEAD_SNR_SAG_2", HEAD_SNR_SAG_2);

//SNR Body coil 
call("ij.Prefs.set", "myMacros.BODY_SNR_TRA_1", BODY_SNR_TRA_1);
call("ij.Prefs.set", "myMacros.BODY_SNR_COR_1", BODY_SNR_COR_1);
call("ij.Prefs.set", "myMacros.BODY_SNR_SAG_1", BODY_SNR_SAG_1);

call("ij.Prefs.set", "myMacros.BODY_SNR_TRA_2", BODY_SNR_TRA_2);
call("ij.Prefs.set", "myMacros.BODY_SNR_COR_2", BODY_SNR_COR_2);
call("ij.Prefs.set", "myMacros.BODY_SNR_SAG_2", BODY_SNR_SAG_2);


//Geometry
call("ij.Prefs.set", "myMacros.GEOMETRIC_LINEARITY_TRA", GEOMETRIC_LINEARITY_TRA);
call("ij.Prefs.set", "myMacros.GEOMETRIC_LINEARITY_COR", GEOMETRIC_LINEARITY_COR);
call("ij.Prefs.set", "myMacros.GEOMETRIC_LINEARITY_SAG", GEOMETRIC_LINEARITY_SAG);

//Ghosting
call("ij.Prefs.set", "myMacros.GHOSTING_1", GHOSTING_1);
call("ij.Prefs.set", "myMacros.GHOSTING_2", GHOSTING_2);


//this will retrieve stored valeu of myMacros.savedir to myvalue 
//myvalue = call("ij.Prefs.get", "myMacros.savedir", "defaultValue"); 



// RUN SNR: 
runMacro("/Users/papo/Documents/QA and Acceptance tests/NEW_MACROS/SNR.ijm") ;


// RUN SIGNAL UNIFORMITY: 
//runMacro("/Users/papo/Documents/QA and Acceptance tests/NEW_MACROS/SIGNAL_UNIFORMITY.ijm") ;

// RUN GEOMETRIC_LINEARITY:
//runMacro("/Users/papo/Documents/QA and Acceptance tests/NEW_MACROS/GEOMETRIC_LINEARITY.ijm");


// RUN SLICE WIDTH:
//runMacro("/Users/papo/Documents/QA and Acceptance tests/NEW_MACROS/SLICE_WIDTH.ijm");


// RUN GHOSTING:
//runMacro("/Users/papo/Documents/QA and Acceptance tests/NEW_MACROS/GHOSTING.ijm");

//close("*");


print("");
print("Done!");
print("");
print("");