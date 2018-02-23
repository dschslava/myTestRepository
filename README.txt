There are two program. The first program consists of five Objective C source code files: codon5.m, data extraction2.m, displayplot2.m, DNA10.m, and save4file.m. The program is used to calculate the codon frequency.

In order to use the first program, you have to go to the website(https://www.ncbi.nlm.nih.gov/) and copy paste the DNA data into an excel file and name the excel file whatever you want(maybe the name of the protein). Then you memorize the directory of where the excel file is stored(you will need that later). 

Suppose we have gone through the above procedures and created TP53_result.csv.

Then open the Matlab program and go the DNA10. In that code there will be a section where you write the name of the excel file (the details can be shown in the image "name"). The name you put between the '   ' must be the same as the name of the excel file (compare image "name" and "name2"). Then go to program called dataextraction2. You need to change that to the directory of where the excel file is stored(see "name3"). After that, go to the program called save4file. Then look at the image("name4" and "name5") and change the smaller oval with your directory(it is the same thing you did in dataextraction2). Also you must leave the '.xlsx' portion alone and you must have all 5 programs open for the code to function. After you make all the changes, go to the DNA10 code and click run. 

I circled the portions that you need to change into your directory. You can see it in name4 and name5. I also attached a sample spreadsheet("TP53") and the output. There are two types of output: spreadsheet and image. The spreadsheet will appear in the same directory as your DNA spreadsheet. The image will just pop up.

The second program is used to read in a MAF file and convert it to a format that the PMSignature web or R program can read. The second program is written is JAVA and is GUI based. Please uncompress and run the JAVA program in NetBeans. Once you have built the program, you can select a MAF file and specify a output file. Formatted data will be written to the output file. A sample MAF file and a sample output file is included in the GIT Repo.



