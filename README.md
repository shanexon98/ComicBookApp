# comic_app

# Comic Book Application

Descripción del Proyecto
Esta aplicación de cómics está desarrollada en Flutter y consume la API de Comic Vine, la base de datos de cómics más grande en línea. La aplicación permite a los usuarios:

Ver una lista de los cómics más recientes.
Visualizar los detalles de un cómic seleccionado, incluyendo información sobre creadores, personajes, equipos, ubicaciones y conceptos.
Refrescar los detalles de un cómic mediante un gesto de "pull-to-refresh".
Almacenar en caché los detalles del cómic para optimizar el rendimiento y minimizar las llamadas a la API.
El proyecto está construido siguiendo las mejores prácticas de Flutter, utilizando el patrón de arquitectura BLoC (Business Logic Component) para la gestión de estados, asegurando la escalabilidad y mantenibilidad del código.

# Tecnologías Utilizadas

Flutter: SDK para la creación de aplicaciones nativas multiplataforma.
Dart: Lenguaje de programación utilizado por Flutter.
Flutter BLoC: Paquete para la gestión de estados siguiendo el patrón BLoC.
Dio: Cliente HTTP usado para realizar solicitudes a la API.
Hive: Base de datos ligera y rápida para almacenar datos en caché de manera local.
CachedNetworkImage: Paquete para manejar la carga de imágenes desde la red con almacenamiento en caché.

# Estructura del Proyecto

La estructura del proyecto está organizada para seguir una arquitectura limpia, facilitando la escalabilidad y el mantenimiento del código:

lib/:
blocs/: Contiene los blocs y eventos asociados, encargados de manejar la lógica de la aplicación.
models/: Contiene los modelos de datos que representan las entidades utilizadas en la aplicación, incluyendo la estructura de la caché.
repositories/: Contiene la lógica de interacción con la API, encargada de realizar las solicitudes y procesar las respuestas.
screens/: Contiene las pantallas de la aplicación, organizadas de manera que cada pantalla maneje una parte específica de la UI.
widgets/: Contiene widgets reutilizables para facilitar la creación de interfaces consistentes.
Configuración del Proyecto
Requisitos Previos
Tener Flutter instalado en tu máquina. Si no lo tienes, sigue las instrucciones en Flutter - Getting Started.
Tener un editor de código como Visual Studio Code o Android Studio configurado con las extensiones de Flutter y Dart.

# Instalación

Clonar el repositorio:

bash
Copiar código
git clone https://github.com/shanexon98/comic_book_app.git
cd comic_book_app
Instalar las dependencias:
Ejecuta el siguiente comando para instalar todas las dependencias requeridas por el proyecto:

bash
Copiar código
flutter pub get
Generar adaptadores de Hive:
Si se hicieron cambios en los modelos de Hive, necesitas generar los adaptadores correspondientes ejecutando:

bash
Copiar código
flutter packages pub run build_runner build
Ejecución del Proyecto
Ejecutar en un dispositivo físico o emulador:
Conecta un dispositivo o abre un emulador y ejecuta el proyecto usando el siguiente comando:

bash
Copiar código
flutter run
Ver la aplicación:
La aplicación se iniciará en el dispositivo conectado, mostrando la lista de los cómics más recientes.


# Funcionalidades

Pantalla de Lista de Cómics
Visualización de la lista: Muestra una lista de los cómics más recientes con la imagen de portada, nombre del cómic y número de edición.
Navegación a detalles: Al hacer clic en un cómic, el usuario es llevado a la pantalla de detalles de ese cómic.
Pantalla de Detalles del Cómic
Visualización de detalles: Muestra una descripción detallada del cómic, junto con información adicional sobre los creadores, personajes, equipos, ubicaciones y conceptos asociados.
Pull-to-Refresh: Los usuarios pueden refrescar los detalles del cómic deslizando hacia abajo, lo que actualizará la información con datos frescos de la API.
Caché de datos: Los detalles del cómic se almacenan en caché para mejorar la experiencia del usuario y reducir las llamadas repetitivas a la API.
Librerías Utilizadas
flutter_bloc: Manejo de estados siguiendo el patrón BLoC.
dio: Cliente HTTP para realizar peticiones a la API.
cached_network_image: Manejo de imágenes con almacenamiento en caché.
hive: Base de datos local ligera para almacenamiento en caché.
hive_flutter: Extensión de Hive para integrarlo con Flutter.
animate_do: Paquete para animaciones simples y elegantes en Flutter.


![Screenshot_1724204606](https://github.com/user-attachments/assets/7a612ddf-ee2d-498e-ba70-2de33a489c02)
![Screenshot_1724204685](https://github.com/user-attachments/assets/b07bc4e2-db91-4f3f-ad45-417be425cf5c)
