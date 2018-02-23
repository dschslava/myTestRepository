function [cont] = save4file(tc,newdata,saveoption,cont,datadir,pname)
    if saveoption == 1  % for excel file
        tc = str2num(tc);
        filelocation = ['/Users/power/Documents/DNA/',pname,'_result.xls'];
%         filelocation = [pname,'_result.xls'];
        checkforfile = exist(strcat(filelocation),'file');
        if checkforfile==0 % if not create new one
            header = {'Starting Point','DataDir','AAA', 'AAC', 'AAG', 'AAT', 'ACA', 'ACC', 'ACG', 'ACT', 'AGA',...
                'AGC', 'AGG', 'AGT', 'ATA', 'ATC',...
                'ATG', 'ATT', 'CAA', 'CAC', 'CAG', 'CAT', 'CCA', 'CCC', 'CCG',...
                'CCT', 'CGA', 'CGC', 'CGG', 'CGT',...
                'CTA', 'CTC', 'CTG', 'CTT', 'GAA', 'GAC', 'GAG', 'GAT', 'GCA',...
                'GCC', 'GCG', 'GCT', 'GGA', 'GGC',...
                'GGG', 'GGT', 'GTA', 'GTC', 'GTG', 'GTT', 'TAA', 'TAC', 'TAG',...
                'TAT', 'TCA', 'TCC', 'TCG', 'TCT',...
                'TGA', 'TGC', 'TGG', 'TGT', 'TTA', 'TTC', 'TTG', 'TTT','Totalsamples'};
            xlswrite(filelocation,header,'Sheetname','A1');
            N = 0;
            cont = 0;
        else % if yes, count the number of previous inputs
            N = size(xlsread(filelocation,'Sheetname'),1);
            if cont == 1
                header = {'Starting Point','DataDir','AAA', 'AAC', 'AAG', 'AAT', 'ACA', 'ACC', 'ACG', 'ACT', 'AGA',...
                    'AGC', 'AGG', 'AGT', 'ATA', 'ATC',...
                    'ATG', 'ATT', 'CAA', 'CAC', 'CAG', 'CAT', 'CCA', 'CCC', 'CCG',...
                    'CCT', 'CGA', 'CGC', 'CGG', 'CGT',...
                    'CTA', 'CTC', 'CTG', 'CTT', 'GAA', 'GAC', 'GAG', 'GAT', 'GCA',...
                    'GCC', 'GCG', 'GCT', 'GGA', 'GGC',...
                    'GGG', 'GGT', 'GTA', 'GTC', 'GTG', 'GTT', 'TAA', 'TAC', 'TAG',...
                    'TAT', 'TCA', 'TCC', 'TCG', 'TCT',...
                    'TGA', 'TGC', 'TGG', 'TGT', 'TTA', 'TTC', 'TTG', 'TTT','Totalsamples'};
                AAA=strcat('A',num2str(N+2));
                xlswrite(filelocation,header,'Sheetname',AAA);
                N = N+1;
                cont = 0;
            end
        end
         % add the new values (your input) to the end of Excel file
        AA=strcat('A',num2str(N+2));
        BB=strcat('B',num2str(N+2));
        xlswrite(filelocation,tc,'Sheetname',AA);
        xlswrite(filelocation,[datadir,newdata],'Sheetname',BB);
    elseif saveoption == 2  % for txt file
        filelocation = ['/Users/power/Documents/DNA/',pname,'_result.xls'];
%         filelocation = [pname,'_result.xls'];
        checkforfile = exist(strcat(filelocation),'file');
        fileID = fopen(filelocation,'at');  %'a' will append, where 'w' will discard existing contents.
        if checkforfile == 0 % if not create new one
            fprintf(fileID,'------------------------------------------------------------------------------------------------------------------------- \n');
            fprintf(fileID,'Cases    DataDir  TCT     TCG     TCC     TCA     CCC     CCA     CCT     ACC     GCC     GCT    Totalsamples \n');
            fprintf(fileID,'------------------------------------------------------------------------------------------------------------------------- \n');
            fprintf(fileID,'%s\t %d\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.0f\n',tc{1},datadir,newdata);
            cont = 0;
        else % if yes, count the number of previous inputs
            if cont == 1
                fprintf(fileID,'------------------------------------------------------------------------------------------------------------------------- \n');
                fprintf(fileID,'Cases    DataDir  TCT     TCG     TCC     TCA     CCC     CCA     CCT     ACC     GCC     GCT    Totalsamples \n');
                fprintf(fileID,'------------------------------------------------------------------------------------------------------------------------- \n');
                cont = 0;
            end
            fprintf(fileID,'%s\t %d\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.2f\t %5.0f\n',tc{1},datadir,newdata);
        end
        fclose('all');
    end

end

