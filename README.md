# Jhonattan Solarte Martinez

Este proyecto incluye Strings de internaciónalización (Ingles, Español), splash, iconos, assets, autolayout, y persistencia con Realm.Al ingresar a la app carga la información del pastel, y el listado de ingredientes desde el WS, y son almacenados  en base de datos, todos los cambios que se hagan (agregar, editar, eliminar) se verán reflejados inmediatamente en la base de datos.
Los ingredientes todos estarán sin seleccionar inicialmente. 
Los ingredientes pueden ser Batter o Toppings, los cuales se agregan mediante el boton '+'. 
La persistencia de datos se realiza con el Pod de Realm.


# Capas
**Model**: Contiene todas las entidades que representan las tablas de la base de datos.

**Controller**: Contiene todos los ViewController para gestionar las interfaces y la logica de negocio:
    IngredientsListViewController: Gestiona el controlador del listado de batters o toppings, incluye un buscador
    CakeListViewController: Gestiona el controlador de los ingredientes (batters, toppings) de la receta
    
**View**: Contiene los archivos de las interfaces (storyboard, launchScreen)

**Util**: Contiene las clases con los Enumeradores, Constantes, Acceso a WS, y Extensiones
    NetworkManager: Clase encargada de acceso a los WS
    ConnectionManager: Clase encargada de invocar los WS del Api, setteando los parametros adecuados
    Constants: Contiene las constantes para la aplicación: ApiUrl
    Extension: Incluye las extensiones a las clases para utilidades, tales como:
                     Mostrar mensaje Toast



![Jhonattan_Solarte_Martinez_4](https://user-images.githubusercontent.com/8276103/72776132-0bcdbd80-3bdf-11ea-8f7a-1b0b124c1397.gif)
![Jhonattan_Solarte_Martinez_3](https://user-images.githubusercontent.com/8276103/72776134-0bcdbd80-3bdf-11ea-9031-3a9218f8a36a.gif)
![Jhonattan_Solarte_Martinez_2](https://user-images.githubusercontent.com/8276103/72776135-0bcdbd80-3bdf-11ea-99cc-c49d3e73b3bd.gif)
![Jhonattan_Solarte_Martinez_1](https://user-images.githubusercontent.com/8276103/72776136-0bcdbd80-3bdf-11ea-9f38-178133aec0ad.gif)



Subject

 Usted deberá  consumir el siguiente servicio web http://www.mocky.io/v2/5ddbebf23400008e4feadfcc, en donde encontrará los ingredientes para preparar un pastel, estos ingredientes se mostrarán en una lista. que cumplirá  con las siguientes características:

    Se podrá agregar editar y eliminar cualquier item de la lista.
    Se podrá check en cualquier item de la lista
    los ingredientes deberán guardarse en una base de datos local.
    una vez ceckeados los  todos los items de la lista, mostrara un mensaje sencillo indicando que la preparación finalizó.

Recuerde subir el proyecto a un repositorio abierto, enviar el link y un video de la aplicación.
En esta prueba se evaluaran los siguientes aspectos:
    manejo de arquitectura (si se aplica).
    La forma en la que aborda el problema.
    Clean Code.
Desarrolle teniendo en cuenta sus habilidades y fortalezas.
