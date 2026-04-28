## This demo for the paper "Adaptive Scale Patch-Based Contrast Measure for Dim and Small Infrared Target Detection" published on IGRSL.

## If you use this code, please kindly cite our paper: 
@article{qiu2022adaptive,
  title={Adaptive scale patch-based contrast measure for dim and small infrared target detection},
  author={Qiu, Zhaobing and Ma, Yong and Fan, Fan and Huang, Jun and Wu, Minghui},
  journal={IEEE Geoscience and Remote Sensing Letters},
  volume={19},
  number={},
  pages={1-5},
  year={2022},
  publisher={IEEE}
}

This code is just the core implementation. For real applicaton, we highly suggest to contain effective preprocessing and postprocessing steps for better performance.
Additionally, a good parameter setting for the code discussed in our paper is also suggested to be carefully considered.

Please note that this code does not contain the segmentation step. If you want to get the locations of small targets, you need to further use some segmentation algorithm.

## How to use this code?
1.Configure the C++ compilation environment to execute the "Local_Max_6.mexw64" file. You can test this by typing "mex -setup" in Matlab.
2.run the file of *main.m* in matlab. Our matlab version for development is Matlab2016a. 

## Contact
If you have any questions, please contact:  
Author: Zhaobing Qiu  
Email: qiuzhaobing@whu.edu.cn  
Copyright: Wuhan University School of Electronics and Information Technology
## License
This code is only freely available for non-commercial research use.

If you find some help for you, star is a good reward ^_^. 
