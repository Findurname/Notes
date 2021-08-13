#Dark2Caffe

## 0. Summary

codes| master|version | compile|convert| test | train | ristretto
---- | ---- | ---- | ---- | ---- | ---- | ---- | ----
quhezhang | |v2 |yes | yes | yes |  | no
karta0807913|caffe-yolo-9000| v2 |
glkz1982 | |

    
    
    
##1. [marvis/pytorch-caffe-darknet-convert](https://github.com/marvis/pytorch-caffe-darknet-convert)
* darknet2caffe.py ValueError: invalid literal for int() with base 10: '-1,-4'
>Doesn't support YOLOv2 and reorg Layers

##2. [ysh329/darknet2caffe](https://github.com/ysh329/darknet2caffe) 
>Solved the problems of marvis's codes.
**Doesn't not support YOLOv3.cfg and YOLOv3.weights**

```
git clone https://github.com/ysh329/darknet2caffe.git
    # Convert darknet model to caffe's
python darknet2caffe.py DARKNET_CFG DARKNET_WEIGHTS

    #Next is conversion from caffe to InferXLite:
python caffe2inferx.py CAFFE_PROTOTXT CAFFE_CAFFEMODEL
```

##3. [ysh329/deep-learning-model-convertor](https://github.com/ysh329/deep-learning-model-convertor) 
>Sumarry of DL Model Convertros

##4. [quhezheng/caffe_yolo_v2](https://github.com/quhezheng/caffe_yolo_v2) 
* Forked from BVLC/caffe
* Has a wonderful demo
* **Provides a Dark2caffe convertor for yolov2**
###Add DetectionOutput or Region layer to do prediction
>Open the created yolo.prototxt and append the following layer code to the end, save it as yolo_deploy.prototxt

```
layer {
    bottom: "layer31-conv"
    top: "Output"
    name: "Output"
    type: "DetectionOutput"
    detection_output_param {
        classes: 80
        confidence_threshold: 0.2
        nms_threshold: 0.45
        biases: 0.57273
        biases: 0.677385
        biases: 1.87446
        biases: 2.06253
        biases: 3.33843
        biases: 5.47434
        biases: 7.88282
        biases: 3.52778
        biases: 9.77052
        biases: 9.16828
    }
}

layer {
  name: "region1"
  type: "Region"
  bottom: "layer31-conv"
  top: "region1"
  region_param {
    classes: 80
    coords: 4
    boxes_of_each_grid: 5
    softmax: true
  }
}
```





###Detection Using A Pre-Trained VOC Model

```
git clone https://github.com/quhezheng/caffe_yolo_v2
cd caffe_yolo_v2
mkdir build
cd build
cmake ..
make
  
##Demo 
cd ..  #back to project root folder
cd examples/yolo
mkdir model_voc
cp DOWNLOAD/PATH/OF/yolo_voc_iter_120000.caffemodel model_voc
python detect.py
```
###Train the VOC data

```
##Datasets
cd [YOUR_LOCAL_REPOSITORY_PATH]/data/yolo
wget http://pjreddie.com/media/files/VOCtrainval_06-Nov-2007.tar
wget http://pjreddie.com/media/files/VOCtest_06-Nov-2007.tar
wget http://pjreddie.com/media/files/VOCtrainval_11-May-2012.tar
wget http://pjreddie.com/media/files/VOC2012test.tar
tar -xvf VOCtest_06-Nov-2007.tar
tar -xvf VOCtrainval_06-Nov-2007.tar
tar -xvf VOCtrainval_11-May-2012.tar
tar -xvf VOC2012test.tar

##Create lmdb index *.txt files
python get_list.py

##Create lmdb
./convert.sh

##Download the pre-trained model darknet19_448.conv.23.caffemodel from Baidu disk

cd ../../examples/yolo
cp DOWNLOAD/PATH/OF/darknet19_448.conv.23.caffemodel ./
mkdir model_voc
./train_voc.sh


```
##5. [gklz1982/caffe-yolov2](https://github.com/gklz1982/caffe-yolov2) 

>Provide caffe source code with Ristretto and YOLO
>But the compilation with GPU doesn't work by now

```
git clone git@github.com:gklz1982/caffe-yolov2.git
```

###Reference
>YOLO9000: Better, Faster, Stronger

>http://pjreddie.com/yolo9000/

>https://github.com/yeahkun/caffe-yolo

>https://github.com/hustzxd/z0

>https://github.com/hustzxd/z1

>https://github.com/weiliu89/caffe.git

###modifications

* add reorg_layer

* convert yolo weights to caffemodel

* add detection output layer

* add detection evaluate layer
###convert model

```
cd examples/indoor/convert

##convert yolo.cfg to yolo.prototxt
##convert yolo weights to caffemodel

python convert_weights_to_caffemodel.py yolo.prototxt yolo.weights yolo.caffemodel
```


##6. [xingwangsfu/caffe-yolo](https://github.com/xingwangsfu/caffe-yolo) 
>Only Yolov1
>Prototxt may be as a reference







