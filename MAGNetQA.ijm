// RUNS MAGNetQA TESTS
close("*")
roiManager("reset");

// SNR measurements with the HEAD COIL
 HEAD_SNR_TRA_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_TRA_1";
 HEAD_SNR_COR_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_COR_1";
 HEAD_SNR_SAG_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_SAG_1";

 HEAD_SNR_TRA_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_TRA_2";
 HEAD_SNR_COR_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_COR_2";
 HEAD_SNR_SAG_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_HEAD_SNR_SAG_2";


// SNR measurements with the BODY COIL
BODY_SNR_TRA_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_TRA_1";
BODY_SNR_TRA_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_TRA_2";

BODY_SNR_COR_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_COR_1";
BODY_SNR_COR_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_COR_2";

BODY_SNR_SAG_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_SAG_1";
BODY_SNR_SAG_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SNR_SAG_2";


// GEOMETRIC_LINEARITY_TRA measurements
 GEOMETRY_TRA="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_GEOMETRIC_LINEARITY_TRA";
 GEOMETRY_COR="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_GEOMETRIC_LINEARITY_COR";
 GEOMETRY_SAG="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_GEOMETRIC_LINEARITY_SAG";

// GHOSTING measurements
 GHOSTING_1="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/MultiEchoSE_HEAD_GHOSTING_TRA_NSA1";
 GHOSTING_2="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/MultiEchoSE_HEAD_GHOSTING_TRA_NSA2";

// Slice Position measurements
SLICE_POS="/Users/papo/Documents/QA and Acceptance tests/PETMR_QA_20181029_Pat/hierarchixca/Annual_Qa_Mmr_Biograph/All_Physics_Marilena/SE_BODY_SLICE_POSITION_TRA";

 
// Output folder
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
call("ij.Prefs.set", "myMacros.GEOMETRY_TRA", GEOMETRY_TRA);
call("ij.Prefs.set", "myMacros.GEOMETRY_COR", GEOMETRY_COR);
call("ij.Prefs.set", "myMacros.GEOMETRY_SAG", GEOMETRY_SAG);

//Ghosting
call("ij.Prefs.set", "myMacros.GHOSTING_1", GHOSTING_1);
call("ij.Prefs.set", "myMacros.GHOSTING_2", GHOSTING_2);

//Slice Position
call("ij.Prefs.set", "myMacros.SLICE_POS", SLICE_POS);

//this will retrieve stored valeu of myMacros.savedir to myvalue
//myvalue = call("ij.Prefs.get", "myMacros.savedir", "defaultValue");



// RUN SNR:
// runMacro("/Users/papo/MagNET_QA_scripts/SNR.ijm") ;

// RUN SIGNAL UNIFORMITY:
// runMacro("/Users/papo/MagNET_QA_scripts/SIGNAL_UNIFORMITY.ijm") ;

// RUN GEOMETRIC_LINEARITY:
// runMacro("/Users/papo/MagNET_QA_scripts/GEOMETRIC_LINEARITY.ijm");


// RUN SLICE WIDTH:
// runMacro("/Users/papo/MagNET_QA_scripts/SLICE_WIDTH.ijm");


// RUN GHOSTING:
// runMacro("/Users/papo/MagNET_QA_scripts/GHOSTING.ijm");


// RUN SLICE_POS:
// NOT READY!!! 
runMacro("/Users/papo/MagNET_QA_scripts/SLICE_POSITION.ijm");



// close("*");

print("");
print("");
print("");
print("Done! Closing FIJI now... ");
//run("Quit");
