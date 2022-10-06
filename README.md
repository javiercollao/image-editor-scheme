## Laboratorio 1 : Paradigma Declarativo Funcional con Scheme

### Enunciado

Se debe diseñar y desarrollar un software, simulando a GIMP ó Photoshop, Un software de edición o manipulación de imágenes digitales es aquel que permite a un usuario realizar distintas operaciones sobre éstas.

### Análisis del problema

El proyecto se trabaja en imágenes RGBD o RGB-D, esto es, imágenes que además de tener información en el espacio de colores (R)ed, (G)reen, (B)lue, contiene información de la profundidad (D)epth en un espacio tridimensional. 

Al incorporar la dimensión D (profundidad) capturada a través de una cámara especializada, sería posible saber más sobre los detalles del rostro, proyección de la nariz, sombrero, distancia del espejo en la parte posterior, etc. Incluso sería posible construir una representación tridimensional de un rostro.

Algunas definiciones

* bitmaps (para imágenes donde cada pixel o pixbit puede tomar el valor  0 o 1), A bitmap is a simple black and white image, stored as a 2D array of bits (ones and zeros).

* pixmaps (para imágenes donde cada pixel o pixrgb es una combinación de los valores para los canales R, G y B, que toman valores de 0 a 255)

* hexmaps-d (donde cada pixel o pixhex expresa la información del color del pixel a través de un valor único hexadecimal de 6 valores) 

Se debe considerar la dimensión x, y, z (depth).
 
Por lo que podemos identificar algunas funcionalidades 

1. Recortar imágen
2. Invertir una imágen horizontalmente
3. Invertir una imágen verticalmente
4. Comprimir imágen en base a eliminación del color con mayor frecuencia.
5. Convertir a hexadecimal
6. Visualizar la imagen
7. Rotar imágen en 90° a la derecha
8. Rotar imágen en 90° a la izquierda
9. Histograma
10. Descomprimir imagen en base a restitución del color con mayor frecuencia
11. Aplicar operaciones como las anteriores a un área seleccionada dentro de la imagen
12. Convertir imágen a blanco y negro
13. Convertir imágen a escala de grises
14. Editar una imágen a partir de la aplicación de funciones especiales sobre los pixeles
15. Separar capas de una imagen 3D en base a la profundidad. De esta forma desde una imagen 3D se puede devolver una lista de imágenes 2D
16. Redimensionar imágen


### TDAs

Con el analisis del enenunciado se concluye que el juego Dobble contiene:

1. TDA image, contiene todas las caractericas y funcionalidades de una imagen.
2. TDA pixbit, contiene todas las caractericas y funcionalidades de una pixel tipo bit.
3. TDA pixhex, contiene todas las caractericas y funcionalidades de una pixel tipo hexadecimal.
4. TDA pixrgb, contiene todas las caractericas y funcionalidades de una pixel tipo RGB.

### Documentación

Podemos generar tres tipos de imágenes con el comando image, de tipo bit, rgb y
hexadecimal respectivamente.
```
(image 2 2 (pixbit-d 0 0 1 10)(pixbit-d 0 1 0 20)(pixbit-d 1 0 0 30)(pixbit-d 1 1 1
4))

(image 2 2 (pixrgb-d 0 0 10 10 10 10)(pixrgb-d 0 1 20 20 20 20)(pixrgb-d 1 0 30 30 30
30) (pixrgb-d 1 1 40 40 40 40))

(image 2 2 ((pixhex-d 0 0 "0A0A0A" 10) (pixhex-d 0 1 "141414" 20) (pixhex-d 1 0
"1E1E1E" 30) (pixhex-d 1 1 "282828" 40))
```
Para cada imagen podemos utilizar diferentes funciones como flipH, flipV, crop, histogram, compress, decompress entre otras.

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

Para este proyecto se utilzó el interprete Dr. Racket especificamente la versión 8.4.
El proyecto esta basado en listas, como requerimiento se debía implementar funciones propias de un TDA Lista, por lo que se implementaron utilizando solo funcionalidades básicas de Scheme.




 


 