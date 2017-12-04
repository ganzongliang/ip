% Script to test the real image interpolation 
% Zongliang gan  

clear all
close all
clc

p = pwd;
addpath(fullfile(p, '/common')); 
addpath(fullfile(p, '/func'));
addpath(fullfile(p, '/Result'));


% set the real world image data

%zoom = 2;
zoom = 4;

imset = 'Set10';

% mode
%chmode = 0; % gray
chmode = 1; % colour

switch imset

    case 'Set10'
        addpath(fullfile(p, '/Set10'));
        Dir = 'Set10';
        Suffix = '*.bmp'; 

    % here can add other image data
end

addpath(fullfile(p, '/Result')); 

[fn,fname] = glob(Dir, Suffix);

switch  zoom
    case 2    
    for i = 1:numel(fn)
       x = imread(fn{i});
       disp(['+++++++++++' fn{i} ' +++++++++'])
       imfn = fname(i).name(1:(end-4));
       % NN interpolation 
       disp(['NN doing.......'])
       Nsr = imresize(x,2,'nearest'); 
       imwrite(uint8(Nsr),['./Result/' imfn 'NNx2.bmp'])
    
       % bicubic interpolation
       disp(['Bicubic doing.......'])
       cubic = upcubic(x,2);
       imwrite(uint8(cubic),['./Result/' imfn 'cubicx2.bmp'])
       
       % offline interpolation
       disp(['Offline doing.......'])
       Hroff = impccdf(x,0);
       imwrite(uint8(Hroff),['./Result/' imfn 'Hroffx2.bmp'])

       %  online interpolation 
       disp(['Online doing.......'])
       Hroff = impccdf(x,1);
       imwrite(uint8(Hroff),['./Result/' imfn 'Hronx2.bmp'])
    end
    case 4
    for i = 1:numel(fn)
       x = imread(fn{i});
       disp(['+++++++++++' fn{i} ' +++++++++'])
       imfn = fname(i).name(1:(end-4));
       % NN interpolation 
       disp(['NN doing.......'])
       Nsr = imresize(x,4,'nearest'); 
       imwrite(uint8(Nsr),['./Result/' imfn 'NNx4.bmp'])
    
       % bicubic interpolation
       disp(['Bicubic doing.......'])
       cubic = upcubic(x,4);
       imwrite(uint8(cubic),['./Result/' imfn 'cubicx4.bmp'])
       
       % offline interpolation
       disp(['Offline doing.......'])
       Hroff = impccdf(x,0);
       Hroff = impccdf(Hroff,0);
       imwrite(uint8(Hroff),['./Result/' imfn 'Hroffx4.bmp'])

       %  online interpolation 
       disp(['Online doing.......'])
       Hroff = impccdf(x,1);
       Hroff = impccdf(Hroff,1);
       imwrite(uint8(Hroff),['./Result/' imfn 'Hronx4.bmp'])
    end
end
    
    
       




