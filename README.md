## Laboratorio 1 : Paradigma Declarativo Funcional con Scheme

### Enunciado

Se debe diseñar y desarrollar un software, simulando a GIMP ó Photoshop, Un software de edición o manipulación de imágenes digitales es aquel que permite a un usuario realizar distintas operaciones sobre éstas.

### Análisis del problema

El proyecto se trabaja en imágenes RGBD o RGB-D, esto es, imágenes que además de tener información en el espacio de colores (R)ed, (G)reen, (B)lue, contiene información de la profundidad (D)epth en un espacio tridimensional. 

Al incorporar la dimensión D (profundidad) capturada a través de una cámara especializada, sería posible saber más sobre los detalles del rostro, proyección de la nariz, sombrero, distancia del espejo en la parte posterior, etc. Incluso sería posible construir una representación tridimensional de un rostro.

Algunas definiciones

* bitmaps (para imágenes donde cada pixel o pixbit puede tomar el valor  o 1) 
* pixmaps (para imágenes donde cada pixel o pixrgb es una combinación de los valores para los canales R, G y B)
* hexmaps-d (donde cada pixel o pixhex expresa la información del color del pixel a través de un valor único hexadecimal de 6 valores) a las que se suma la dimensión D.
 

Por lo que podemos identificar algunas funcionalidades 

1. image (constructor)                             
2. bitmap? 
3. pixmap? 
4. hexmap? 
5. compressed? 
6. flipH   
7. flipV   
8. crop    
9. imgRGB->imgHex  
1. histogram   
11. rotate    
12. compress    
13. edit    
14. invertColorBit  
15. invertColorRGB  
16. adjustChannel   
17. image->string   
18. depthLayers 
19. decompress


### TDAs

Con el analisis del enenunciado se concluye que el juego Dobble contiene:

1. TDA image, contiene todas las caractericas de una imagen.
2. TDA pixbit
3. TDA pixhex
4. TDA pixrgb

### Documentación

Para usar este proyecto necesitas descargar el repositorio y asegurarte de que existen todos los archivos ubicados en la carpeta "./implementacion", los archivos requeridos son los siguientes:

1. utils/lista_19177246_CollaoCallpa.rkt 
2. pruebas_19177246_CollaoCallpa.rkt 
3. main_19177246_CollaoCallpa.rkt

Para poder utilizarlo necesitas abrir solo el archivo "main" en el interprete Dr. Racket, desde este archivo se cargaran todas los modulos. Una vez ejecutado se vera el funcionamiento de varios ejemplos para cada una de las funciones importantes. Recordar que para que todo funcione correctamente, necesitamos crear "image".


### Software

Para este proyecto es necesario utilizar el interprete Dr. Racket especificamente 8.4 o superior.
Todo el proyecto se basa en listas y funciones por lo que cada TDA utiliza esa estructura de dato.




 


 