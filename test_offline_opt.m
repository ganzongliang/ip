% Script to test the image interpolation method Performance
% Zongliang gan  

clear all
close all
clc
k = 2;
p = pwd;
addpath(fullfile(p, '/common')); 
addpath(fullfile(p, '/test'));
addpath(fullfile(p, '/func'));



% set the image data

%imset = 'set5';
%imset = 'set14';
%imset = 'imax';
%imset = 'urban';
imset = 'set115';
%imset = 'test';

% mode
%chmode = 0; % gray
chmode = 1; % color

switch imset
    case 'imax'
        addpath(fullfile(p, '/imax'));
        Dir = 'imax';
        Suffix = '*.bmp'; 
    case 'set5'
        addpath(fullfile(p, '/Set5'));
        Dir = 'Set5';
        Suffix = '*.bmp'; 
    case 'set14'
        addpath(fullfile(p, '/Set14'));
        Dir = 'Set14';
        Suffix = '*.bmp'; 
    case 'urban'
        addpath(fullfile(p, '/urban'));
        Dir = 'urban';
        Suffix = '*.png'; 
    case 'set115'
        addpath(fullfile(p, '/set115'));
        Dir = 'set115';
        Suffix = '*.tif'; 
    case 'test'
        addpath(fullfile(p, '/lset'));
        Dir = 'test';
        Suffix = '*.jpg'; 
    % here can add other image data
end

addpath(fullfile(p, '/Result')); 

[fn,fname] = glob(Dir, Suffix);


for i = 1:numel(fn)
    x = imread(fn{i});
    disp(['+++++++++++' fn{i} ' +++++++++'])
    [m,n,d]=size(x);
    if chmode == 0
        if d==3
            x = rgb2gray(x);
        end
    end
    x = cropim(x,k);
    Lr = downs(x,k);
    flr =['./Lrimage/l' fname(i).name];
    flr(end-3:end)='.bmp';
    imwrite(Lr,flr);
    
    % bicubic interpolation
    cubic = upcubic(Lr,k);
    cubicpnsr(i) = GetPsnr(x,cubic);
    disp(['The cubic result is ' num2str(cubicpnsr(i)) ' .'])
    cubicssim(i)  =  GetSsim( x, cubic);
    disp(['The cubic SSIM result is ' num2str(cubicssim(i)) ' .'])
    
    %  offline mode with opt 
    fno= ['./Result/onlineopt' fname(i).name];
    system(['ccdf.exe ' flr ' ' fno '  offline']);
    Hrof = imread(fno);
    
    offpsnr(i) = GetPsnr(x,uint8(Hrof));
    disp(['The offline PSNR result is  ' num2str(offpsnr(i)) ' .'])
    offssim(i)  =  GetSsim( x, Hrof);
    disp(['The offline SSIM result is ' num2str(offssim(i)) ' .'])
    

end

disp(['++++++++++++++++++++++++++++++++++++ ' ])
disp(['The bicubic totoal PSNR ' num2str(mean(cubicpnsr))])
disp(['The offline totoal PSNR ' num2str(mean(offpsnr))])


disp(['The bicubic totoal ssim ' num2str(mean(cubicssim))])
disp(['The offline totoal ssim ' num2str(mean( offssim))])%


