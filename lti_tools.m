clear all
close all
clc

fprintf('----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('------------------------- LTI SYSTEM ANALYSIS ------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')
fprintf('----------------------------------------------------------------------------\n')

syms s

in = 0;
while in < 2
    
    in = menu('Select input type', 'Symbolic input', 'Coefficient input', 'Exit');
                  
    switch in

        case 0
            return

        case 1
            tfun = input('Write the symbolic expression representing the LTI system...   ');
          
            tfun = simplifyFraction(tfun, 'Expand', true);
            [n, d] = numden(tfun);
            N = sym2poly(n);
            D = sym2poly(d);

            s = tf('s');

            fprintf('----------------------------------------------------------------------------\n');
            fprintf('------------------------- LTI SYSTEM EQUATION ------------------------------\n');
            Gs = tf(N,D)
            fprintf('\n----------------------------------------------------------------------------\n');
            
            in = 3;

        case 2

            fprintf('\n----------------------------------------------------------------------------\n')
            fprintf('----------------------------------------------------------------------------\n')
            fprintf('-------------------------- COEFFICIENT INPUT -------------------------------\n')
            fprintf('----------------------------------------------------------------------------\n')
            fprintf('----------------------------------------------------------------------------\n')

            fprintf('\n------------------------------ NUMERATOR -----------------------------------\n')
            N5 = input('Input the coefficient that multiplies S^5 in NUMERATOR      = ');
                if isempty(N5)
                    N5 = 0;
                end
            N4 = input('Input the coefficient that multiplies S^4 in NUMERATOR      = ');
                if isempty(N4)
                    N4 = 0;
                end
            N3 = input('Input the coefficient that multiplies S^3 in NUMERATOR      = ');
                  if isempty(N3)
                    N3 = 0;
                  end
            N2 = input('Input the coefficient that multiplies S^2 in NUMERATOR      = ');
                 if isempty(N2)
                    N2 = 0;
                 end
            N1 = input('Input the coefficient that multiplies S in NUMERATOR        = ');
                 if isempty(N1)
                    N1 = 0;
                 end
            N0 = input('Input the coefficient that does not multiply S in NUMERATOR = ');
                 if isempty(N0)
                    N0 = 0;
                 end

            fprintf('\n------------------------------ DENOMINATOR ---------------------------------\n')
            D5 = input('Input the coefficient that multiplies S^5 in DENOMINATOR      = ');
                 if isempty(D5)
                    D5 = 0;
                 end
            D4 = input('Input the coefficient that multiplies S^4 in DENOMINATOR      = ');
                 if isempty(D4)
                    D4 = 0;
                 end
            D3 = input('Input the coefficient that multiplies S^3 in DENOMINATOR      = ');
                 if isempty(D3)
                    D3 = 0;
                 end
            D2 = input('Input the coefficient that multiplies S^2 in DENOMINATOR      = ');
                 if isempty(D2)
                    D2 = 0;
                 end
            D1 = input('Input the coefficient that multiplies S in DENOMINATOR        = ');
                 if isempty(D1)
                    D1 = 0;
                 end
            D0 = input('Input the coefficient that does not multiply S in DENOMINATOR = ');
                 if isempty(D0)
                    D0 = 0;
                 end

            D = [D5, D4, D3, D2, D1, D0];
            N = [N5, N4, N3, N2, N1, N0];

            s = tf('s');
            Gs = tf(N,D);

            clc

            fprintf('----------------------------------------------------------------------------\n');
            fprintf('------------------------- LTI SYSTEM EQUATION ------------------------------\n');
            disp(Gs)
            fprintf('\n----------------------------------------------------------------------------\n');
            
            in = 3;
            
    end
end



fprintf('\n--------------------- PROPERTIES OF THE SYSTEM ----------------------------\n');
if (isstable(Gs) == 1)
fprintf('System is stable.\n');
else
fprintf('System is unstable.\n');
end
damp(Gs)
fprintf('----------------------------------------------------------------------------\n');



choice = 0;
while choice < 11
    
    choice = menu('Select the plot',  ...
                  'Impulse response', ...
                  'Step response',    ...
                  'Bode plot with asymptotes', ...
                  'Amplitude-frequency plot in abs value', ...
                  'Amplitude-frequency plot in dB',        ...
                  'Phase-frequency plot', ...
                  'Pole-zero plot',       ...
                  'Margins',              ...
                  'Nyquist',              ...
                  'Root locus',           ...
                  'All of the above',     ...
                  'Close');
    
    switch choice

        case 0
            return

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
            asymp(Gs);
            saveas(bodeasym, 'bodeasym.png')
            
        case 4
            disp(Gs);
            figure(4);
            opts = bodeoptions();
            opts.PhaseVisible= 'off';
            opts.XLimMode= {'manual'};
            opts.XLim= {[0.01 100]};
            opts.MagUnits= 'abs';
            bode(Gs,opts);
            title('Amplitude-frequency plot')
            ylabel('|T(jw)|')
            xlabel('w')
            afpabs = figure(4);
            saveas(afpabs, 'afpabs.png')

        case 5
            disp(Gs);
            figure(5);
            opts = bodeoptions();
            opts.PhaseVisible= 'off';
            opts.XLimMode= {'manual'};
            opts.XLim= {[0.000001 1000000]};
            opts.MagUnits= 'dB';
            bode(Gs,opts);
            title('Amplitude-frequency plot in dB')
            ylabel('|T(jw)|')
            xlabel('w')
            afpdb = figure(5);
            saveas(afpdb, 'afpdb.png')

        case 6
            disp(Gs);
            figure(6);
            opts = bodeoptions();
            opts.MagVisible= 'off';
            opts.XLimMode= {'manual'};
            opts.XLim= {[0.01 100]};
            opts.MagUnits= 'dB'
            bode(Gs,opts);
            title('Phase-frequency plot')
            ylabel('Phase shift')
            xlabel('w')
            pfp = figure(6);
            saveas(pfp, 'pfp.png')

        case 7
            disp(Gs);
            figure(7);
            pzmap(Gs);
            pz = figure(7);
            saveas(pz, 'pzmap.png')

        case 8
            disp(Gs);
            figure(8);
            margin(Gs);
            marg = figure(8);
            saveas(marg, 'margin.png')

        case 9
            disp(Gs);
            figure(9);
            nyquist(Gs);
            nyq = figure(9);
            saveas(nyq, 'nyquist.png')

        case 10
            disp(Gs);
            figure(10);
            rlocus(Gs)
            rlp = figure(10);
            saveas(rlp, 'rlocus.png')

        case 11
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
            asymp(Gs);
            saveas(bodeasym, 'bodeasym.png')

            disp(Gs);
            figure(4);
            opts = bodeoptions();
            opts.PhaseVisible= 'off';
            opts.XLimMode= {'manual'};
            opts.XLim= {[0.01 100]};
            opts.MagUnits= 'abs';
            bode(Gs,opts);
            title('Amplitude-frequency plot')
            ylabel('|T(jw)|')
            xlabel('w')
            afpabs = figure(4);
            saveas(afpabs, 'afpabs.png')

            disp(Gs);
            figure(5);
            opts = bodeoptions();
            opts.PhaseVisible= 'off';
            opts.XLimMode= {'manual'};
            opts.XLim= {[0.000001 1000000]};
            opts.MagUnits= 'dB';
            bode(Gs,opts);
            title('Amplitude-frequency plot in dB')
            ylabel('|T(jw)|')
            xlabel('w')
            afpdb = figure(5);
            saveas(afpdb, 'afpdb.png')

            disp(Gs);
            figure(6);
            opts = bodeoptions();
            opts.MagVisible= 'off';
            opts.XLimMode= {'manual'};
            opts.XLim= {[0.01 100]};
            opts.MagUnits= 'dB'
            bode(Gs,opts);
            title('Phase-frequency plot')
            ylabel('Phase shift')
            xlabel('w')
            pfp = figure(6);
            saveas(pfp, 'pfp.png')

            disp(Gs);
            figure(7);
            pzmap(Gs);
            pz = figure(7);
            saveas(pz, 'pzmap.png')

            disp(Gs);
            figure(8);
            margin(Gs);
            marg = figure(8);
            saveas(marg, 'margin.png')

            disp(Gs);
            figure(9);
            nyquist(Gs);
            nyq = figure(8);
            saveas(nyq, 'nyquist.png')

            disp(Gs);
            figure(10);
            rlocus(Gs)
            rlp = figure(10);
            saveas(rlp, 'rlocus.png')
    end
end
   
%Function for drawing the Bode plot with asymptotes
%Author: Trond Andresen
%Downloaded from Mathworks File Exchange
%Link: https://www.mathworks.com/matlabcentral/fileexchange/10183-bode-plot-with-asymptotes

%{
Copyright (c) 2017, Trond Andresen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution
* Neither the name of NTNU nor the names of its
  contributors may be used to endorse or promote products derived from this
  software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%}

function asymp(sys,wlow,whigh);

% The function asymp() corresponds to bode(), 
% but it also plots asymptotes for the magnitude 
% and phase graphs. Phase asymptotes are vertical. 
% asymp() only accepts monovariable transfer functions.
% 
% If the transfer function also has a time delay, the time delay is ignored
% for the phase asymptotes.
% 
% asymp() may be called in two ways only, asymp(h), 
% or asymp(h,wmin,wmax). 

if nargin == 3           
    bode(sys,{wlow,whigh});
elseif nargin == 1
    bode(sys);
else
    error('arguments must be either ''h'' -- or ''h,wmin,wmax''');
end
hold on;
           
[num,den] = tfdata(sys,'v');
if nargin == 3           
    [mag,phase,w] = bode(sys,{wlow,whigh});
elseif nargin == 1
    [mag,phase,w] = bode(sys);
end
mag=20.*log10(squeeze(mag));
phase=squeeze(phase);
if max(phase) > 170 & mean(phase) > 60
    phase =phase-360; 
    % bode( ) sometimes shifts a phase plot +360 degrees in a misleading way, so 
    % this is an attempt to rectify this. But the criteria are admittedly a bit arbitrary ;-)
end
plot(w,phase,'LineWidth',1.5);

% Order of denominator polynomial and
% number of pure integrators, if any, are found:
dendeg = length(den)-1;
k= dendeg+1;
while den(k) == 0 k=k-1; end
% Number of pure integrators, if any:
denintegr = dendeg+1-k;
% Order of denominator, and denominator itself, 
% that remains when integrators are ignored:
den=den(1:dendeg+1-denintegr);
dendeg=k-1;

% Removing possible higher order term zero 
% coefficients in nominator:
k=1;
while num(k) == 0 k=k+1; end
numdeg= length(num)-k;
num=num(k:k+numdeg);
% Order of remaining nominator polynomial, and
% number of pure derivators, if any, are found:
k= numdeg+1;
while num(k) == 0 k=k-1; end
numderiv = numdeg+1-k;
num=num(1:numdeg+1-numderiv);
numdeg=k-1;

% Total zero frequency gain ignoring
% integrators and derivators:
gain = num(length(num))/den(length(den)); 
% Negative gain, if any, is accounted for:
gainneg = gain < 0; gain=abs(gain);

% Finding left start points for amplitude and phase:
magstart= 20*log10(gain/w(1)^(denintegr-numderiv));
phastart=90*round(phase(1)/90);
% initial slope for magnitude:
magslopeaccum=-20*(denintegr-numderiv);

% Roots of remaining numerator and denominator:
zeroes=roots(num);
poles=roots(den);

% Putting all roots in one long row vector with zeroes first:
zerpoles=[zeroes',poles'];
% All changes in magnitude and 
% phase are found and stored in vectors 
% dmag and dph corresponding to zerpoles:
%
% Finding change in magnitude and phase due to each zero, if any:
if numdeg > 0
    dmag(1:numdeg)= 20*ones(1,numdeg);
    dph(1:numdeg)= 90*(round(2*((real(zeroes) < 0)-0.5)));
end
% Finding change in magnitude and phase due to each pole, if any:
dmag(numdeg+1:numdeg+dendeg)= -20*ones(1,dendeg);
dph(numdeg+1:numdeg+dendeg)= 90*(round(2*((real(poles) > 0)-0.5)));

% Finding break frequencies. They are sorted, but we keep
% track of original order of zerpoles, dmag and dph,
% A trick is employed to ensure sorting based on absolute value,
% even if poles may all be real:
[freqpoints,ord] = sort(abs(complex(real(zerpoles),imag(zerpoles))));
% adding first and last frequency point for plot:
freqpoints=[w(1),freqpoints,w(end)];
np=length(freqpoints);
% Allocating vectors for mag and phase plots.
% Phase points are many since the asymptote is vertical at each 
% break point and therefore two points are needed per break point:
magpoints=ones(1,np); 
phapoints=ones(1,2*(np-1));
% Initial points that are to be plotted later:
magpoints(1)= magstart;
phapoints(1)= phastart; phapoints(2)= phastart;
% Finding remaining points for mag and phase plots:
for k = 2:np
    if k > 2 
%       Accumulated slope is updated:        
        magslopeaccum=magslopeaccum+dmag(ord(k-2)); 
    end
%   Magnitude points are calculated:    
    magpoints(k)= magpoints(k-1)+ magslopeaccum*log10(freqpoints(k)/freqpoints(k-1));
%   Phase points are calculated:    
    if k < np
        phapoints(2*k-1)= phapoints(2*k-2)+dph(ord(k-1));
        phapoints(2*k)= phapoints(2*k-1);
    end
end

% Make the magintude axes current, and plot there:

h=get(findall(get(gcf,'Children'),'String','Magnitude (dB)'),'Parent');
axes(h);
yxlim=axis;
hold on;
grid;

plot(w,mag,'LineWidth',1.5);


magmax=max([magpoints,mag']); magmin=min([magpoints,mag']);
yspan = magmax-magmin;
for ydelta = [2 4 10 20 40]
    yhlp = yspan/ydelta;
    if yhlp < 8 
        break; 
    end
end
magmin=ydelta*floor(magmin/ydelta); magmax=ydelta*ceil(magmax/ydelta);
if magmin == magmax 
    magmin = magmin-2; magmax=magmax+2;
end
maglimitincr=(magmax-magmin)*0.02;
set(get(gcf, 'CurrentAxes'),'YTick',magmin:ydelta:magmax);
set(get(gcf, 'CurrentAxes'),'YLim',[magmin magmax]);
yscalemag = axis;
yscalemag(3) = magmin-maglimitincr; yscalemag(4) = magmax+maglimitincr;
axis(yscalemag);


% Magnitude asymptote plot on top of magnitude part of Bode diagram:
plot(freqpoints(2:np-1),magpoints(2:np-1),'r.-','MarkerSize',14,'LineWidth',1.3);
% No dots at start and end points:
plot(freqpoints(1:2),magpoints(1:2),'r-','LineWidth',1.3);
plot(freqpoints(np-1:np),magpoints(np-1:np),'r-','LineWidth',1.3);
hold off;

% Phase asymptote plot on top of phase part of Bode diagram. 
% First make the phase axes current, and plot grid:

h=get(findall(get(gcf,'Children'),'String','Phase (deg)'),'Parent');
axes(h);
hold on;
grid;

% Phase asymptotes may exceed current upper and lower limit
% values in phase diagram. Find max and min phase asymptote
% values, and re-scale phase diagram:

phmax=max([phapoints,phase']); phmin=min([phapoints,phase']);

yspan = phmax-phmin;
for ydelta = [10 15 30 45 90 180]
    yhlp = yspan/ydelta;
    if yhlp < 8 
        break; 
    end
end

phmin=ydelta*floor(phmin/ydelta); phmax=ydelta*ceil(phmax/ydelta);
if phmin == phmax 
    phmin = phmin-45; phmax=phmax+45;
end

phlimitincr=(phmax-phmin)*0.02;
set(get(gcf, 'CurrentAxes'),'YLim',[phmin phmax]);

yscaleph = axis;
yscaleph(3) = phmin-phlimitincr; yscaleph(4) = phmax+phlimitincr;
axis(yscaleph);
% Generate more frequency points to enable vertical lines
% at break frequencies:
freqpoints= sort([freqpoints(1:np-1),freqpoints(2:np)]);
np=length(freqpoints);
plot(freqpoints(2:np-1),phapoints(2:np-1),'r.-','MarkerSize',14,'LineWidth',1.3);
% No dots at start and end points:
plot(freqpoints(1:2),phapoints(1:2),'r-','LineWidth',1.3);
plot(freqpoints(np-1:np),phapoints(np-1:np),'r-','LineWidth',1.3);

set(get(gcf, 'CurrentAxes'),'YTick',phmin:ydelta:phmax);

% Converting frequency axis to decimal numbers:
x=get(gca, 'XTickLabel');

% x=str2num(x); x=10.^x; x=num2str(x);
x = strrep(x,'{',''); x = strrep(x,'}','');
for i=1:length(x), x{i} = num2str(str2num(x{i})); end
set(gca, 'XTickLabel',x);
grid;
hold off;
end
