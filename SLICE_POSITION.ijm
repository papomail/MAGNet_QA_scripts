

close("*")
 


macro "SLICE_POSITION" {

////Use if you want to call the macro with arguments
//arguments=getArgument()
//arguments="hello, world";
//arg_array=split(arguments,",,");
//myfilename=arg_array[0];
//Results_dir=arg_array[0];


//Retrieve filenames and Results_dir path 
Results_dir = call("ij.Prefs.get", "myMacros.savedir", "defaultValue"); 
SLICE_POS = call("ij.Prefs.get", "myMacros.SLICE_POS", "defaultValue"); 



// run SIGNAL UNIFORMITY TEST for 3 slice orientations:
SLICE_POSITION_TEST(SLICE_POS,Results_dir);







//////////////////////////
/// Function definition:   GEOMETRIC_LINEARITY_TEST
function SLICE_POSITION_TEST(filename,results_dir) {



outdir=results_dir+File.separator+"SLICE_POSITION";
screenshot_dir=outdir+File.separator+"ScreenshotCheck";
//Create uniformity folder
if ( File.isDirectory(outdir)==0 ){
print("Creating folder "+ outdir);
File.makeDirectory(outdir);
}
//Create screenshot_dir folder
if ( File.isDirectory(screenshot_dir)==0 ){
print("Creating folder "+ screenshot_dir);
File.makeDirectory(screenshot_dir);
}

open(filename);
myimage=getTitle();
selectWindow(myimage);

FindRods(myimage,results_dir);
run("Clear Results");

saveAs("Results", outdir+File.separator+myimage+"_SLICE_POS.csv");


// Close all result images"
close("*Result*");
}

//////////////////////////
/// Function definition:   GEOMETRIC_LINEARITY_TEST
function FindRods(name,results_dir) {
selectWindow(name);	


run("Duplicate...", "duplicate");
rename("dup1");
run("Make Binary", "method=Minimum background=Dark calculate black");

run("Duplicate...", "duplicate");
rename("dup2");
run("Fill Holes", "stack");


	run("Calculator Plus", "i1=dup2 i2=dup1 operation=[Subtract: i2 = (i1-i2) x k1 + k2] k1=1 k2=0 create");
	close("dup*");
	selectWindow("Result");
run("Duplicate...", "duplicate");
rename("CandE");
	


//find edge rods
run("Z Project...", "projection=Median");
rename("Flat");

  
// particles	
selectWindow("Flat");	
run("Set Measurements...", "centroid shape stack display redirect=None decimal=2");
run("Analyze Particles...", "size=1-20 circularity=0.50-1.00 exclude clear");

xpos=newArray(4);
ypos=newArray(4);
posind=newArray(4);
for (i = 0; i < 4; i++) {
	xp=getResult("X", i);
	yp=getResult("Y", i);
	xpos[i]=xp;
	ypos[i]=yp;

	posind[i]=yp*10+xp;
}

sort_index=Array.rankPositions(posind);


Array.print(xpos);
Array.print(ypos);
Array.print(posind);
Array.print(sort_index);

xpos2=newArray(4);
ypos2=newArray(4);
for (i = 0; i < 4; i++) {
	xpos2[i]=xpos[sort_index[i]];
	ypos2[i]=ypos[sort_index[i]];
}
xpos=xpos2;
ypos=ypos2;
xpos_ypos_concat=Array.concat(xpos,ypos);


// rectangle
selectWindow("CandE");
roiManager("reset")

makePolygon(xpos[0]-5, ypos[0]-5, xpos[1]+5, ypos[1]-5,xpos[3]+5, ypos[3]+5, xpos[2]-5, ypos[2]+5);
roiManager("add");
roiManager("Select", 0);

run("Make Inverse");
run("Clear", "stack");
roiManager("Show All");

// create copies for centre and edge rods
run("Duplicate...", "duplicate");
rename("centreRods");
run("Duplicate...", "duplicate");
rename("edgeRods");

roiManager("reset")
makeOval(xpos[0]-15, ypos[0]-15, 30, 30);
roiManager("add");
makeOval(xpos[1]-15, ypos[1]-15, 30, 30);
roiManager("add");
makeOval(xpos[2]-15, ypos[2]-15, 30, 30);
roiManager("add");
makeOval(xpos[3]-15, ypos[3]-15, 30, 30);
roiManager("add");
roiManager("Select", newArray(0,1,2,3));
roiManager("Combine");
roiManager("Add");


roiManager("Select", 4);
run("Clear Outside", "stack");
//roiManager("Show All with labels");

selectWindow("centreRods");
roiManager("Select", 4);
run("Clear", "stack");


//Find all rods 
roiManager("reset")


for (i = 0; i < 27; i++) {
	selectWindow("CandE");

	//run("Previous Slice [<]");
	setSlice(i+1);
	//run("Duplicate...", "use");
	run("Analyze Particles...", "size=1-20 circularity=0.50-1.00 exclude summarize slice clear");
	counts = nResults(); 
	print(counts);

	if (counts == 6) {

		selectWindow("edgeRods");
		setSlice(i+1);
		run("Analyze Particles...", "size=1-20 circularity=0.50-1.00 exclude summarize slice clear");
		
	xpos=newArray(4);
	ypos=newArray(4);

	for (j = 0; j < 4; j++) {
	xp=getResult("X", j);
	yp=getResult("Y", j);
	xpos[j]=xp;
	ypos[j]=yp;
	}
	
	

	makeLine(xpos[0], ypos[0], xpos[1], ypos[1]);
	roiManager("add");
	makeLine(xpos[2], ypos[2], xpos[3], ypos[3]);
	roiManager("add");
	
	roiManager("update");



	selectWindow("centreRods");
		setSlice(i+1);
		run("Analyze Particles...", "size=1-20 circularity=0.50-1.00 exclude summarize slice clear");
		
	xpos=newArray(2);
	ypos=newArray(2);

	for (j = 0; j < 2; j++) {
	xp=getResult("X", j);
	yp=getResult("Y", j);
	xpos[j]=xp;
	ypos[j]=yp;
	}
	
	

	makeLine(xpos[0], ypos[0], xpos[1], ypos[1]);
	roiManager("add");
	kokokok
	
	roiManager("update");

   
		//setLocation(1,1,1028,1028);
		//wait(100);
		//myscreenshot=screenshot_dir+File.separator+myimage+"_sl"+(i+1)+".png";
		//exec("screencapture", myscreenshot);
		//setLocation(1,1,300,300);
	}
	
}


	roiManager("Deselect");
     roiManager("Measure");
LPLPLP
      setResult("control1", 1, getResult("Length",0));
      setResult("control2", 1, getResult("Length",1));

      updateResults;



return xpos_ypos_concat;

}



}
