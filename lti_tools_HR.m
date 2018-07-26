clear all
clc

fprintf('----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('------------------------- ANALIZA LTI SUSTAVA ------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')

fprintf('\n----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('---------------------- UNOS KOEFICIJENATA SUSTAVA --------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')

fprintf('\n------------------------------ BROJNIK -------------------------------------\n')
B5 = input('Unesi vrijednost koeficijenta uz S^5 u BROJNIKU = ');
B4 = input('Unesi vrijednost koeficijenta uz S^4 u BROJNIKU = ');
B3 = input('Unesi vrijednost koeficijenta uz S^3 u BROJNIKU = ');
B2 = input('Unesi vrijednost koeficijenta uz S^2 u BROJNIKU = ');
B1 = input('Unesi vrijednost koeficijenta uz S^1 u BROJNIKU = ');
B0 = input('Unesi vrijednost koeficijenta bez S u BROJNIKU  = ');

fprintf('\n------------------------------ NAZIVNIK ------------------------------------\n')
N5 = input('Unesi vrijednost koeficijenta uz S^5 u NAZIVNIKU = ');
N4 = input('Unesi vrijednost koeficijenta uz S^4 u NAZIVNIKU = ');
N3 = input('Unesi vrijednost koeficijenta uz S^3 u NAZIVNIKU = ');
N2 = input('Unesi vrijednost koeficijenta uz S^2 u NAZIVNIKU = ');
N1 = input('Unesi vrijednost koeficijenta uz S^1 u NAZIVNIKU = ');
N0 = input('Unesi vrijednost koeficijenta bez S u NAZIVNIKU  = ');

N = [N5, N4, N3, N2, N1, N0];
B = [B5, B4, B3, B2, B1, B0];

s = tf('s');
Gs = tf(N,B);

clc

fprintf('----------------------------------------------------------------------------\n');
fprintf('------------------------- JEDNADZBA SUSTAVA --------------------------------\n');
fprintf('\n                %.0fS^5 + %.0fS^4 + %.0fS^3 + %.0fS^2 + %.0fS + %.0f\n', B5, B4, B3, B2, B1, B0);
fprintf('       G(s) = ------------------------------------------------\n');
fprintf('                  %.0fS^5 + %.0fS^4 + %.0fS^3 + %.0fS^2 + %.0fS + %.0f\n', N5, N4, N3, N2, N1, N0);
fprintf('\n----------------------------------------------------------------------------\n');

fprintf('\n---------------------------- OPIS SUSTAVA ----------------------------------\n');

fprintf('Sustav je %.0f reda.\n', order(Gs));

if (isstable(Gs) == 1)
fprintf('Sustav je stabilan.\n');
else
fprintf('Sustav nije stabilan.\n');
end

fprintf('\nSustav ima polove u sljedecim tockama:');
pole(Gs)
fprintf('----------------------------------------------------------------------------\n');

fprintf('Prirodna frekvencija oscilacija i faktor prigusenja su:\n');
damp(Gs)
fprintf('----------------------------------------------------------------------------\n');



choice = 0;

while choice < 10
    
    choice = menu('Odaberite graf','Impulsni odziv','Skokovni odziv','Amplitudno-frekvencijska karakteristika u abs','Amplitudno-frekvencijska karakteristika u dB','Fazno-frekvencijska karakteristika','Polovi i nule','Osiguranja', 'Nyquist', 'Root locus','Sve od navedenog','Zatvori')
    
switch choice
    
    case 1
        disp(Gs);
        figure(1);
        impulse(Gs);
        title('Impulsni odziv')
        ylabel('h(t)')
        xlabel('t(s)')
        imp = figure(1);
        saveas(imp, 'impulse.png')
        
    case 2
        disp(Gs);
        figure(2);
        step(Gs);
        title('Skokovni odziv')
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
        title('Amplitudno frekvencijska karakteristika')
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
        title('Amplitudna frekvencijska karakteristika u dB')
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
        title('Fazno frekvencijska karakteristika')
        ylabel('Fazni pomak')
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
        title('Impulsni odziv')
        ylabel('h(t)')
        xlabel('t(s)')
        imp = figure(1);
        saveas(imp, 'impulse.png')
        
        disp(Gs);
        figure(2);
        step(Gs);
        title('Skokovni odziv')
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
        title('Amplitudno frekvencijska karakteristika')
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
        title('Amplitudna frekvencijska karakteristika u dB')
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
        title('Fazno frekvencijska karakteristika')
        ylabel('Fazni pomak')
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








