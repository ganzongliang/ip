# Efficient Image Interpolation via Content-Aware Clustering Fusion 
Dr.    Zongliang Gan  
the College of Telecommunications and Information Engineering, Nanjing University of Posts and Telecommunications

Prof.  Kaihua Zhang  
Jiangsu Key Laboratory of Big Data Analysis Technology, Nanjing University of Information Science and Technology

Please feel free to email Zongliang Gan (ganzl@njupt.edu.cn) 

## About this project
We present an efficient and effective subspace-learning based image interpolation framework that can accurately estimate the high-resolution (HR) pixels by fusing a set of learning-based  cubic interpolation results.

## About this Code
* This code is tested in Window 10(64), Matlab 2016a
* test_ip.m ---  Evaluation on the simulated image datasets
* test_offline_opt.m -- Evaluation on offline C++
* test_realworld_ip --- Evaluation on the real-world image dataset
* The main image interpolation function codec ---- func\impccdf.m  ---> hr = impccdf(lr, flag); 
  usage:  input lr: input_image_data mxnxd flag==0 -->offline flag==1 ---> online
* The offline optimization version ---> ccdf.exe  
  usage:  ccdf.exe  input_image_file out_put_image_file offline
  opencv_world310.dll is only used to read image file.
* set 5 set 14 imax : three classic image test sets
* urban 100 : image set used in
 Jia-Bin Huang, Abhishek Singh, and [Narendra Ahuja] (http://vision.ai.illinois.edu/ahuja.html), "Single Image Super-Resolution from   Transformed Self-Exemplars", CVPR 2015 PDF
* set 115 : 115 images of various scenes with size $512 \times 512$, named by Set 115, to further evaluate the image interpolation performance in various cases.
* set 10 : 10 images with JPEG compression from the Internet web  and crop them into the size $128 \times 128$ without resizing or other operations.

