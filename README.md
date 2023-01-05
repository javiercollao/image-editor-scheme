## Challenge 1: Declarative Functional Paradigm with Scheme

### Statement

Software must be designed and developed, simulating GIMP or Photoshop. A digital image editing or manipulation software is one that allows a user to perform different operations on them.

### Problem Analysis

The project is worked on RGBD or RGB-D images, that is, images that in addition to having information in the color space (R)ed, (G)reen, (B)lue, contain depth (D) information in a three-dimensional space.

By incorporating the D dimension (depth) captured through a specialized camera, it would be possible to know more about the details of the face, projection of the nose, hat, distance of the mirror at the back, etc. It would even be possible to build a three-dimensional representation of a face.

Some definitions:

* Bitmaps (for images where each pixel or pixbit can take the value 0 or 1).

* Pixmaps (for images where each pixel or pixrgb is a combination of the values for the R, G and B channels, which take values from 0 to 255).

* Hexmaps (where each pixel or pixhex expresses the color information of the pixel through a single hexadecimal value of 6 values).

The x, y, z (depth) dimension must be taken into account.

So we can identify some functionalities:

1. Crop image.
2. Invert image horizontally.
3. Invert image vertically.
4. Compress image based on elimination of the most frequent color.
5. Convert RGB to hexadecimal.
6. Visualize the image.
7. Rotate image 90° to the right.
8. Histogram.
9. Resize image.
10. Decompress image based on restitution of the most frequent color.
11. Apply operations like the above to a selected area within the image.
12. Invert color image.
13. Edit an image by applying special functions to the pixels
14. Separate layers of a 3D image based on depth. In this way, from a 3D image a list of 2D images can be returned

![](https://miro.medium.com/max/1306/1*I0I0QKbcXrvyI2usu-si_Q.webp)


### TDAs

With the analysis of the statement it is concluded that the software contains:
1. TDA image, contains all the features and functionalities of an image. Functions that allow to apply image editing operations such as flipH, flipV, crop, histogram, compress, decompress among others.
2. TDA pixbit, contains all the features and functionalities of a bit type pixel.
3. TDA pixhex, contains all the features and functionalities of a hexadecimal type pixel.
4. TDA pixrgb, contains all the features and functionalities of a RGB type pixel. 


### Documentation

To use the program we need to load all the files to Dr. Racket IDE and use the "main" file.

We can generate three types of images with the image command, of type bit, rgb and
hexadecimal respectively.
```
(image 2 2 (pixbit-d 0 0 1 10)(pixbit-d 0 1 0 20)(pixbit-d 1 0 0 30)(pixbit-d 1 1 1
4))

(image 2 2 (pixrgb-d 0 0 10 10 10 10)(pixrgb-d 0 1 20 20 20 20)(pixrgb-d 1 0 30 30 30
30) (pixrgb-d 1 1 40 40 40 40))

(image 2 2 ((pixhex-d 0 0 "0A0A0A" 10) (pixhex-d 0 1 "141414" 20) (pixhex-d 1 0
"1E1E1E" 30) (pixhex-d 1 1 "282828" 40))
```
For each image we can use different functions such as flipH, flipV, crop, histogram, compress, decompress among others.

```
(flipH (image 2 2 (pixbit-d 0 0 1 10)(pixbit-d 0 1 0 20)(pixbit-d 1 0 0 30)(pixbit-d 1
1 1 4)))
```
```
(compress (image 2 2 (pixrgb-d 0 0 10 10 10 10)(pixrgb-d 0 1 20 20 20 20)(pixrgb-d 1 0
30 30 30 30) (pixrgb-d 1 1 40 40 40 40)))
```
```
(rotate90 (image 2 2 ((0 0 "0A0A0A" 10) (0 1 "141414" 20) (1 0 "1E1E1E" 30) (1 1
"282828" 40)))
```

### Software

For this project Dr. Racket was used, specifically version 8.4. The project is implemented only with basic Scheme functionalities.

### Book

 [SICP - Structure And Interpretation Of Computer Programs](https://www.amazon.com/-/es/Harold-Abelson/dp/0262510871)