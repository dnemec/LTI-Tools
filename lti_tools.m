clear all
clc

fprintf('----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('------------------------- LTI SYSTEM ANALYSIS ------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')

fprintf('\n----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('-------------------------- COEFFICIENT INPUT -------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')

fprintf('\n------------------------------ NUMERATOR -----------------------------------\n')
B5 = input('Input the coefficient that multiplies S^5 in NUMERATOR      = ');
B4 = input('Input the coefficient that multiplies S^4 in NUMERATOR      = ');
B3 = input('Input the coefficient that multiplies S^3 in NUMERATOR      = ');
B2 = input('Input the coefficient that multiplies S^2 in NUMERATOR      = ');
B1 = input('Input the coefficient that multiplies S in NUMERATOR        = ');
B0 = input('Input the coefficient that does not multiply S in NUMERATOR = ');

fprintf('\n------------------------------ DENOMINATOR ---------------------------------\n')
N5 = input('Input the coefficient that multiplies S^5 in DENOMINATOR      = ');
N4 = input('Input the coefficient that multiplies S^4 in DENOMINATOR      = ');
N3 = input('Input the coefficient that multiplies S^3 in DENOMINATOR      = ');
N2 = input('Input the coefficient that multiplies S^2 in DENOMINATOR      = ');
N1 = input('Input the coefficient that multiplies S in DENOMINATOR        = ');
N0 = input('Input the coefficient that does not multiply S in DENOMINATOR = ');

N = [N5, N4, N3, N2, N1, N0];
B = [B5, B4, B3, B2, B1, B0];

s = tf('s');
Gs = tf(N,B);

clc

fprintf('----------------------------------------------------------------------------\n');
fprintf('------------------------- LTI SYSTEM EQUATION ------------------------------\n');
fprintf('\n                %.0fS^5 + %.0fS^4 + %.0fS^3 + %.0fS^2 + %.0fS + %.0f\n', B5, B4, B3, B2, B1, B0);
fprintf('       G(s) = ------------------------------------------------\n');
fprintf('                  %.0fS^5 + %.0fS^4 + %.0fS^3 + %.0fS^2 + %.0fS + %.0f\n', N5, N4, N3, N2, N1, N0);
fprintf('\n----------------------------------------------------------------------------\n');

fprintf('\n--------------------- PROPERTIES OF THE SYSTEM ----------------------------\n');

fprintf('Order of the system is %.0f.\n', order(Gs));

if (isstable(Gs) == 1)
fprintf('System is stable.\n');
else
fprintf('System is unstable.\n');
end

fprintf('\nSystem has poles in these points:');
pole(Gs)
fprintf('----------------------------------------------------------------------------\n');

fprintf('Natural frequency of oscilations and damping factor are:');
damp(Gs)
fprintf('----------------------------------------------------------------------------\n');



choice = 0;

while choice < 10
    
    choice = menu('Select the plot','Impulse response','Step response','Amplitude-frequency plot in abs value','Amplitude-frequency plot in dB','Phase-frequency plot','Pole-zero plot','Margins', 'Nyquist', 'Root locus','All of the above','Close')
    
switch choice
    
    case 1
        disp(Gs);
        figure(1);
        impulse(Gs);
        title('Impulse response')
        ylabel('h(t)')
        xlabel('t(s)')
        imp = figure(1);
        saveas(imp, 'impulse.png')
        
    case 2
        disp(Gs);
        figure(2);
        step(Gs);
        title('Step response')
        xlabel('t(s)')
        step = figure(2);
        saveas(step, 'step.png')
        
    case 3
        disp(Gs);
        figure(3);
        opts = bodeoptions();
        opts.PhaseVisible= 'off';
        opts.XLimMode= {'manual'};
        opts.XLim= {[0.01 100]};
        opts.MagUnits= 'abs';
        bode(Gs,opts);
        title('Amplitude-frequency plot')
        ylabel('|T(jw)|')
        xlabel('w')
        afpabs = figure(3);
        saveas(afpabs, 'afpabs.png')
        
    case 4
        disp(Gs);
        figure(4);
        opts = bodeoptions();
        opts.PhaseVisible= 'off';
        opts.XLimMode= {'manual'};
        opts.XLim= {[0.000001 1000000]};
        opts.MagUnits= 'dB';
        bode(Gs,opts);
        title('Amplitude-frequency plot in dB')
        ylabel('|T(jw)|')
        xlabel('w')
        afpdb = figure(4);
        saveas(afpdb, 'afpdb.png')
        
    case 5
        disp(Gs);
        figure(5);
        opts = bodeoptions();
        opts.MagVisible= 'off';
        opts.XLimMode= {'manual'};
        opts.XLim= {[0.01 100]};
        opts.MagUnits= 'dB'
        bode(Gs,opts);
        title('Phase-frequency plot')
        ylabel('Phase shift')
        xlabel('w')
        pfp = figure(5);
        saveas(pfp, 'pfp.png')
        
    case 6
        disp(Gs);
        figure(6);
        pzmap(Gs);
        pz = figure(6);
        saveas(pz, 'pzmap.png')
        
    case 7
        disp(Gs);
        figure(7);
        margin(Gs);
        marg = figure(7);
        saveas(marg, 'margin.png')
        
    case 8
        disp(Gs);
        figure(8);
        nyquist(Gs);
        nyq = figure(8);
        saveas(nyq, 'nyquist.png')
        
    case 9
        disp(Gs);
        figure(9);
        rlocus(Gs)
        rlp = figure(9);
        saveas(rlp, 'rlocus.png')
       
    case 10
        disp(Gs);
        figure(1);
        impulse(Gs);
        title('Impulse response')
        ylabel('h(t)')
        xlabel('t(s)')
        imp = figure(1);
        saveas(imp, 'impulse.png')
        
        disp(Gs);
        figure(2);
        step(Gs);
        title('Step response')
        xlabel('t(s)')
        step = figure(2);
        saveas(step, 'step.png')
        
        disp(Gs);
        figure(3);
        opts = bodeoptions();
        opts.PhaseVisible= 'off';
        opts.XLimMode= {'manual'};
        opts.XLim= {[0.01 100]};
        opts.MagUnits= 'abs';
        bode(Gs,opts);
        title('Amplitude-frequency plot')
        ylabel('|T(jw)|')
        xlabel('w')
        afpabs = figure(3);
        saveas(afpabs, 'afpabs.png')
        
        disp(Gs);
        figure(4);
        opts = bodeoptions();
        opts.PhaseVisible= 'off';
        opts.XLimMode= {'manual'};
        opts.XLim= {[0.000001 1000000]};
        opts.MagUnits= 'dB';
        bode(Gs,opts);
        title('Amplitude-frequency plot in dB')
        ylabel('|T(jw)|')
        xlabel('w')
        afpdb = figure(4);
        saveas(afpdb, 'afpdb.png')
        
        disp(Gs);
        figure(5);
        opts = bodeoptions();
        opts.MagVisible= 'off';
        opts.XLimMode= {'manual'};
        opts.XLim= {[0.01 100]};
        opts.MagUnits= 'dB'
        bode(Gs,opts);
        title('Phase-frequency plot')
        ylabel('Phase shift')
        xlabel('w')
        pfp = figure(5);
        saveas(pfp, 'pfp.png')
        
        disp(Gs);
        figure(6);
        pzmap(Gs);
        pz = figure(6);
        saveas(pz, 'pzmap.png')
        
        disp(Gs);
        figure(7);
        margin(Gs);
        marg = figure(7);
        saveas(marg, 'margin.png')
        
        disp(Gs);
        figure(8);
        nyquist(Gs);
        nyq = figure(8);
        saveas(nyq, 'nyquist.png')
        
        disp(Gs);
        figure(9);
        rlocus(Gs)
        rlp = figure(9);
        saveas(rlp, 'rlocus.png')
end
end








