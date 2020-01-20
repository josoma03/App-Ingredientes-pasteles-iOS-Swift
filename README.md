# NokiaTest
Prueba Nokia Desarrollador iOS Jhonattan Solarte Martinez

Este proyecto incluye Strings de internaciónalización (Ingles, Español), splash, iconos, assets, autolayout, y persistencia con Realm.Al ingresar a la app carga el listado para preparar el pastel desde la URL y es almacenado den la base de datos, todos los cambios que se hagan (agregar, eliminar ingredientes) se verán reflejados inmediatamente en la base de datos.Los ingredientes todos estarán sin seleccionar inicialmente. 
Los ingredientes pueden ser Batter o Toppings, los cuales se agregan mediante el boton '+'. 
Al dar tap en el boton '+', se despliega un listado, del cual se puede seleccionar varios items para ser adicionados a la receta, pero estos no se pueden agregar mas de una vez. 
Este listado tambien cuenta con un buscador incremental. 
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



![Nokia_1](https://user-images.githubusercontent.com/8276103/72701156-576b6300-3b1c-11ea-9f6d-dd1eefaf1e60.gif)
![Nokia_2](https://user-images.githubusercontent.com/8276103/72701170-62be8e80-3b1c-11ea-978e-c601faf1f6e6.gif)
![Nokia_3](https://user-images.githubusercontent.com/8276103/72701171-62be8e80-3b1c-11ea-85da-65e35e84721b.gif)
