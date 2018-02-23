function displayplot2(PoC,nuc,tc,totalsamples,numBases,pname)
        figure('rend','painters','pos',[10 10 1100 700]);
        barFontSize = 10;
        for b = 1 : length(PoC)
            % Plot one single bar as a separate bar series.
            bardata(b) = bar(b, PoC(b), 'BarWidth', 0.9);
            % Apply the color to this bar series.
            if b <= 16
                set(bardata(b), 'FaceColor', [.2 .71 .3]);  % Green
            elseif b > 16 && b <= 32
                set(bardata(b), 'FaceColor', [.25 .55 .79]);  % Blue
            elseif b > 32 && b <= 48
                set(bardata(b), 'FaceColor', [.9 .1 .14]);  % Red
            elseif b > 48 && b <= 64
                set(bardata(b), 'FaceColor', [.9 .9 .14]);  % Yellow
            end
            % Place text atop the bar
            barTopper = sprintf('%.1f %%', PoC(b));
            barnumber = text(b-0.1, PoC(b)+0.2, barTopper, 'FontSize', barFontSize);
            set(barnumber,'Rotation',90);
            hold on;
        end

        set(gca,'XTickLabel',nuc,'XTickLabelRotation',90,'XTick',1:numel(nuc));
        title({['\fontsize{18} Frequency of ',pname],...
            ['\fontsize{12} Total input data = ',num2str(numBases),', Starting point = ',num2str(tc),', Total samples = ',num2str(totalsamples)]});
        xlabel('Codon');
        ylim([0 round(max(PoC)/2)*2+4]);
        ylabel('Percentage [%]');
        grid on;
        grid minor;
        
        % set(get(gca,'title'),'Position',[35 14.5 1.00011]);

end