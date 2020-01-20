# NokiaTest
Prueba Nokia Desarrollador iOS Jhonattan Solarte Martinez

Este proyecto incluye Strings de internaciónalización (Ingles, Español), splash, iconos, assets, autolayout, y persistencia con Realm. 
Al ingresar a la app carga el listado para preparar el pastel, todos estarán sin seleccionar inicialmente.
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


# Principio de responsabilidad única
SRP es uno de los 5 principios de la POO (SOLID)
El Principio de responsabilidad unica indica que una clase debe tener una responsabilidad bien definida y concreta (altamente cohesiva). A veces creamos metodos que no corresponden a la finalidad de las clases, por ejemplo, 
la clase Persona, tiene los metodos getEdad, getNombre. Un metodo que no corresponde a la clase sería: calcularAreaCasa.


# Código limpio
Para mi, un codigo limpio debe ser facil de leer y enteder, que realice funcionalidades concretas, altamente cohesivo y con bajo acoplamiento. 
Hace dos semanas inicie con la lectura de un libro que me recomendó un profesor de la maestría: Clean Code, en este libro hablan sobre algunos principios:
*Codigo enfocado: una función que escribamos, debe ser responsable de un único aspecto
*Codigo limpio y buena: No utilizar rutinas complejas, que enrreden más el problema
*DRY(Don't Repeat Yourself): Cuando debamos realizar modificaciónes en clases o rutinas, estos cambios, no deberían afectar a otros componentes que no estén realaciónados logicamente.
*KISS (Keep It Simple, Stupid): La lectura del codigo debe ser muy facil, evitando la complejidad innecesaria y enfocandonos en las cosas simples.
*Todo el codigo que escribamos, lo debemos hacer para otro desarrollador, más no para el compilador, no torturemos a los demás programadores :p
*Menor acoplamiento: entre menos dependencias, mejor.
*Entre mas pequeño, mejor: los metodos, y las clases preferiblemente deben ser cortas, entre menos lineas, mejor.
*Pruebas unitarias: un codigo sin pruebas unitarias o de aceptación, no sería codigo limpio.
*Código expresivo: Las varaiables, funciones, debe tener nombres significativos, que idiquen la intención. Esto ayuda a que el codigo sea autodocumentado. 


"No es el lenguaje lo que hace parecer simple a un problema, sino que es el desarrollador que hace que el lenguaje parezca simple" - Robert C. Martin
