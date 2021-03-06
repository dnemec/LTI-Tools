# About
This is a MATLAB script for basic analysis of an LTI system up to the 5th order.  
Script is very readable so you may easily expand it and adjust to your liking.  
It features a command line input of symbolic transfer function or transfer function coefficients and GUI for choosing the plot type.  
After selection of plot type it automatically saves the high resolution .png plot image file in your MATLAB working directory.  
  
In Windows operating system is usually located in:  
```
C:/Users/username/My Documents/MATLAB
```
or in case of MacOS in:  
```
Macintosh/Users/username/Documents/MATLAB
```

## Features
* [Stability of a system](https://www.mathworks.com/help/control/ref/isstable.html)
* [Natural frequency and damping ratio](https://www.mathworks.com/help/control/ref/damp.html)
* [Impulse response](https://www.mathworks.com/help/control/ref/impulse.html)
* [Step response](https://www.mathworks.com/help/control/ref/step.html)
* [Bode plot with asymptotes](https://www.mathworks.com/matlabcentral/fileexchange/10183-bode-plot-with-asymptotes)
* [Amplitude-phase plot in abs unit](https://www.mathworks.com/help/control/ref/bode.html)
* [Amplitude-phase plot in dB unit](https://www.mathworks.com/help/control/ref/bode.html)
* [Phase-frequency plot](https://www.mathworks.com/help/control/ref/bode.html)
* [Margins](https://www.mathworks.com/help/control/ref/margin.html)
* [Pole-zero plot](https://www.mathworks.com/help/control/ref/pzmap.html)
* [Nyquist plot](https://www.mathworks.com/help/control/ref/nyquist.html)
* [Root locus](https://www.mathworks.com/help/control/ref/rlocus.html)

## Dependencies
This script requires the [Control Systems Toolbox](https://www.mathworks.com/help/control/index.html).  
I have tested it and it is fully working on MATLAB R2017A on MacOS with Control Systems Toolbox installed, i cannot guarantee full functionality for older versions.  
Unfortunately it doesn't work properly in GNU Octave because of missing equivalent functions in control package.
