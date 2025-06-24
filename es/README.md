![Structurizr](assets/images/structurizr-banner.png)

# Structurizr DSL

Este repositorio de GitHub contiene una implementación de Structurizr DSL, una forma de crear modelos de arquitectura de software Structurizr basados en el [modelo C4](https://c4model.com) utilizando un lenguaje específico de dominio textual (DSL).

Ir a la url: https://structurizr.com/

## 

## Un ejemplo rápido

A modo de ejemplo, el siguiente texto se puede utilizar para crear un modelo de arquitectura de software ____ y
Una __vista asociada __ que describe a un usuario que utiliza un sistema de software.

```
workspace {

    model {
        user = person "User"
        softwareSystem = softwareSystem "Software System"

        user -> softwareSystem "Uses"
    }

    views {
        systemContext softwareSystem {
            include *
            autolayout lr
        }
    }
    
}
```

![Ejemplo de diagrama de contexto del sistema](assets/images/quick-example.png)

---

# Referencia lingüística

El DSL de Structurizr proporciona una forma de definir un modelo de arquitectura de software
(Sobre la base de la [C4](https://c4model.com)) como texto, utilizando un lenguaje específico de dominio (DSL).

## Tabla de contenidos

- [Structurizr DSL](#structurizr-dsl)
  - [](#)
  - [Un ejemplo rápido](#a-quick-example)
- [Referencia lingüística](#language-reference)
  - [Tabla de contenidos](#table-of-contents)
  - [Reglas generales](#general-rules)
  - [Comentarios](#comments)
  - [Identificadores](#identifiers)
  - [Gramática](#grammar)
    - [área de trabajo](#workspace)
    - [modelo](#model)
    - [grupo](#group)
    - [persona](#person)
    - [softwareSystem](#softwaresystem)
    - [contenedor](#container)
    - [componente](#component)
    - [deploymentEnvironment](#deploymentenvironment)
    - [deploymentGroup](#deploymentgroup)
    - [deploymentNode](#deploymentnode)
    - [infraestructuraNodo](#infrastructurenode)
    - [softwareSystemInstance](#softwaresysteminstance)
    - [containerInstance](#containerinstance)
    - [healthCheck](#healthcheck)
    - [elemento](#element)
    - [relación](#relationship)
    - [Etiquetas](#tags)
    - [descripción](#description)
    - [Tecnología](#technology)
    - [Instancias](#instances)
    - [URL](#url)
    - [Propiedades](#properties)
    - [Perspectivas](#perspectives)
    - [!Ref](#ref)
    - [Vistas](#views)
    - [systemVista horizontal](#systemlandscape-view)
    - [vista systemContext](#systemcontext-view)
    - [Vista de contenedor](#container-view)
    - [Vista de componentes](#component-view)
    - [Vista filtrada](#filtered-view)
    - [Vista dinámica](#dynamic-view)
    - [Vista de implementación](#deployment-view)
    - [Vista personalizada](#custom-view)
    - [Vista de imagen](#image-view)
    - [incluír](#include)
      - [Inclusión de elementos](#including-elements)
    - [excluir](#exclude)
      - [Elementos excluyentes](#excluding-elements)
      - [Exclusión de relaciones](#excluding-relationships)
    - [Diseño automático](#autolayout)
    - [predeterminado](#default)
    - [animación](#animation)
    - [título](#title)
    - [Estilos](#styles)
    - [Estilo de elemento](#element-style)
    - [Estilo de relación](#relationship-style)
    - [tema](#theme)
    - [Temas](#themes)
    - [branding](#branding)
    - [terminología](#terminology)
    - [configuración](#configuration)
    - [Usuarios](#users)

## Reglas generales

- Las palabras clave no distinguen entre mayúsculas y minúsculas (por ejemplo, puede usar `softwareSystem` o `softwaresystem`).


## Comentarios

Los comentarios se pueden definir de la siguiente manera:

```
/*
    multi-line comment
*/
```

```
/* single-line comment */
```

```
# single line comment
```

```
// single line comment
```

## Identificadores

De forma predeterminada, todos los elementos y relaciones son anónimos, en el sentido de que no se puede hacer referencia a ellos desde el DSL. Por ejemplo, las siguientes instrucciones crearán una persona y un sistema de software, pero no se puede hacer referencia a ninguno de ellos dentro del DSL.

```
person "User"
softwareSystem "Software System"
```

Para crear una relación entre los dos elementos, necesitamos poder hacer referencia a ellos. Podemos hacer esto definiendo un identificador, de la misma manera que definiría una variable en muchos lenguajes de programación.

```
p = person "User"
ss = softwareSystem "Software System"
```

Ahora podemos usar estos identificadores al crear relaciones, especificar qué elementos deben incluirse/excluirse de las vistas, etc.

```
p -> ss "Uses"
```

A las relaciones también se les puede asignar un identificador.

```
rel = p -> ss "Uses"
```

Los identificadores solo son necesarios cuando se planea hacer referencia al elemento o relación. Se pueden utilizar los siguientes caracteres al definir un identificador: `a-zA-Z_0-9`

## Gramática

A continuación se describe la gramática del lenguaje, con corchetes angulares (`<...>`) utilizados para mostrar las propiedades obligatorias y corchetes (`[...]`) utilizados para mostrar las propiedades opcionales.
La mayoría de las declaraciones son de la forma: `keyword <required properties> [optional properties]`

### área de trabajo

`workspace` es la construcción del lenguaje de nivel superior y el contenedor para el [modelo](#model) y  las [vistas](#views). Opcionalmente, a un espacio de trabajo se le puede dar un nombre y una descripción.

```
workspace [name] [description] {
    ...
}
```

Niños permitidos:

- nombre <name>
- descripción <description>
- [Propiedades](#properties)
- !Docs
- !adrs
- [!Identificadores](#identifier-scope)
- !relaciones implícitas
- [modelo](#model)
- [Vistas](#views)
- [configuración](#configuration)

### modelo

Cada espacio de trabajo debe contener un `model` bloque, dentro del cual se definen los elementos y las relaciones.

```
model {
    ...
}
```

Niños permitidos:

- [grupo](#group)
- [persona](#person)
- [softwareSystem](#softwareSystem)
- [deploymentEnvironment](#deploymentEnvironment)
- [elemento](#element)
- [-> (relación)](#relationship)

### grupo

La `group` palabra clave proporciona una manera de definir una agrupación de elementos con nombre, que se representará como un límite alrededor de esos elementos.

```
group <name> {
    ...
}
```

Los grupos solo se pueden usar para agrupar elementos del mismo tipo (es decir, del mismo nivel de abstracción), de la siguiente manera:

| Ubicación        | Elementos permitidos          |
|-----------------|-----------------------------|
| Modelo           | Personas y sistemas de software |
| Sistema de software | Recipientes                  |
| Contenedor       | Componentes                  |

Consulte [Structurizr - Ayuda - Notación](https://structurizr.com/help/notation) para obtener una descripción de los grupos que se muestran para un tipo de diagrama dado.

### persona

La `person` palabra clave define a una persona (por ejemplo, un usuario, un actor, un rol o una persona).

```
person <name> [description] [tags] {
    ...
}
```

Las siguientes etiquetas se agregan de forma predeterminada:

- `Element`
- `Person`

Niños permitidos:

- [descripción](#description)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)
- [-> (relación)](#relationship)

### softwareSystem

La `softwareSystem` palabra clave define un sistema de software.

```
softwareSystem <name> [description] [tags] {
    ...
}
```

Las siguientes etiquetas se agregan de forma predeterminada:

- `Element`
- `Software System`

Niños permitidos:

- !Docs
- !adrs
- [grupo](#group)
- [contenedor](#container)
- [descripción](#description)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)
- [-> (relación)](#relationship)

### contenedor

La `container` palabra clave define un contenedor, dentro de un sistema de software.

```
container <name> [description] [technology] [tags] {
    ...
}
```

Las siguientes etiquetas se agregan de forma predeterminada:

- `Element`
- `Container`

Niños permitidos:

- !Docs
- !adrs
- [grupo](#group)
- [componente](#component)
- [descripción](#description)
- [Tecnología](#technology)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)
- [-> (relación)](#relationship)

### componente

La `component` palabra clave define un componente, dentro de un contenedor.

```
component <name> [description] [technology] [tags] {
    ...
}
```

Las siguientes etiquetas se agregan de forma predeterminada:

- `Element`
- `Component`

Niños permitidos:

- !Docs
- !adrs
- [descripción](#description)
- [Tecnología](#technology)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)
- [-> (relación)](#relationship)

### deploymentEnvironment

La `deploymentEnvironment` palabra clave proporciona una forma de definir un entorno de implementación (por ejemplo, desarrollo, pruebas, ensayo, en vivo, etc.).

```
deploymentEnvironment <name> {
    ...
}
```

Niños permitidos:

- [grupo](#group)
- [deploymentGroup](#deploymentGroup)
- [deploymentNode](#deploymentNode)
- [-> (relación)](#relationship)

### deploymentGroup

La `deploymentGroup` palabra clave proporciona una manera de definir un grupo de implementación con nombre.

```
deploymentGroup <name>
```

Cuando se agregan instancias de contenedor/sistema de software a un entorno de implementación, todas las relaciones entre estos elementos se replican automáticamente entre *todas las* instancias. Los grupos de implementación proporcionan una manera de restringir el ámbito en el que se replican las relaciones.

### deploymentNode

La `deploymentNode` palabra clave se utiliza para definir un nodo de implementación.

```
deploymentNode <name> [description] [technology] [tags] [instances] {
    ...
}
```

Las siguientes etiquetas se agregan de forma predeterminada:

- `Element`
- `Deployment Node`

Niños permitidos:

- [grupo](#group)
- [deploymentNode](#deploymentNode) (los nodos de implementación se pueden anidar)
- [infraestructuraNodo](#infrastructureNode)
- [softwareSystemInstance](#softwareSystemInstance)
- [containerInstance](#containerInstance)
- [-> (relación)](#relationship)
- [descripción](#description)
- [Tecnología](#technology)
- [Instancias](#instances)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)

### infraestructuraNodo

La `infrastructureNode` palabra clave define un nodo de infraestructura, que suele ser algo así como un equilibrador de carga, un cortafuegos, un servicio DNS, etc.

```
infrastructureNode <name> [description] [technology] [tags] {
    ...
}
```

Las siguientes etiquetas se agregan de forma predeterminada:

- `Element`
- `Infrastructure Node`

Niños permitidos:

- [-> (relación)](#relationship)
- [descripción](#description)
- [Tecnología](#technology)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)

### softwareSystemInstance

La `softwareSystemInstance` palabra clave define una instancia del sistema de software especificado que se implementa en el nodo de implementación principal.

```
softwareSystemInstance <identifier> [deploymentGroups] [tags] {
    ...
}
```

Debe `identifier` representar un sistema de software. `deploymentGroups` es una lista separada por comas de identificadores que representan grupos de implementación.

Además de las etiquetas del sistema de software, se agregan las siguientes etiquetas de forma predeterminada:

- `Software System Instance`

Niños permitidos:

- [-> (relación)](#relationship)
- [descripción](#description)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)
- [healthCheck](#healthCheck)

### containerInstance

La `containerInstance` palabra clave define una instancia del contenedor especificado que se implementa en el nodo de implementación primario.

```
containerInstance <identifier> [deploymentGroups] [tags] {
    ...
}
```

El `identifier` debe representar un contenedor. `deploymentGroups` es una lista separada por comas de identificadores que representan grupos de implementación.

Además de las etiquetas del contenedor, se agregan las siguientes etiquetas de forma predeterminada:

- `Container Instance`

Niños permitidos:

- [-> (relación)](#relationship)
- [descripción](#description)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)
- [healthCheck](#healthCheck)

### healthCheck

La `healthCheck` palabra clave define una comprobación de estado HTTP para la instancia de contenedor/sistema de software principal.

```
healthCheck <name> <url> [interval] [timeout]
```

El intervalo es un número de segundos (valor predeterminado 60 s) y el tiempo de espera es un número de milisegundos (valor predeterminado 0 ms).

### elemento

La `element` palabra clave define un [elemento personalizado](https://structurizr.com/help/custom-elements) (esto solo está disponible en el servicio en la nube de Structurizr/instalación local/Lite).

```
element <name> [metadata] [description] [tags] {
    ...
}
```

Las siguientes etiquetas se agregan de forma predeterminada:

- `Element`

Niños permitidos:

- [descripción](#description)
- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)
- [-> (relación)](#relationship)

### relación

`->` se utiliza para definir una relación unidireccional entre dos elementos.

Hay dos maneras de definir las relaciones. La primera es explícitamente, donde se utiliza explícitamente un identificador de origen:

```
<identifier> -> <identifier> [description] [technology] [tags] {
    ...
}
```

Por ejemplo:

```
user -> softwareSystem "Uses"
```

Y la segunda es implícitamente, donde el origen de la relación es el elemento en el ámbito:

```
-> <identifier> [description] [technology] [tags]
```

Por ejemplo:

```
person user {
    -> softwareSystem "Uses"
}
```

Esto es equivalente a lo siguiente, donde se usa el identificador especial `this` para hacer referencia al elemento en el ámbito:

```
person user {
    this -> softwareSystem "Uses"
}
```

Las siguientes etiquetas se agregan a las relaciones de forma predeterminada:

- `Relationship`

Se pueden crear los siguientes tipos de relaciones mediante el DSL:

| Fuente  | Destino |
| ------------- | ------------- |
| Persona | Persona, Sistema de software, Contenedor, Componente |
| Sistema de software | Persona, Sistema de software, Contenedor, Componente |
| Contenedor | Persona, Sistema de software, Contenedor, Componente |
| Componente | Persona, Sistema de software, Contenedor, Componente |
| Nodo de implementación | Nodo de implementación |
| Nodo de infraestructura | Nodo de implementación, nodo de infraestructura, instancia de sistema de software, instancia de contenedor |
| Instancia del sistema de software | Nodo de infraestructura |
| Instancia de contenedor | Nodo de infraestructura |

Niños permitidos:

- [Etiquetas](#tags)
- [URL](#url)
- [Propiedades](#properties)
- [Perspectivas](#perspectives)

### Etiquetas

`tags` se utiliza para agregar etiquetas a un elemento o relación. Las etiquetas se pueden especificar separadas por comas o individualmente.

```
tags "Tag 1"
tags "Tag 1,Tag 2"
tags "Tag 1" "Tag 2"
```

### descripción

`description` se utiliza para establecer la descripción de un elemento o vista.

```
description "Description"
```

### Tecnología

`technology` se utiliza para establecer la tecnología en un contenedor, componente, nodo de implementación, nodo de infraestructura.

```
technology "Technology"
```

### Instancias

`instances` se utiliza para establecer el número de instancias de un nodo de implementación.
Puede ser un número estático o un rango (por ejemplo, 0..1, 1..3, 5..10, 0..N, 0..*, 1..N, 1..*, etc.).

```
instances "4"
```

```
instances "1..N"
```

### URL

`url` se utiliza para establecer una URL en un elemento o relación.

```
url https://example.com
```

### Propiedades

El `properties` bloque se utiliza para definir una o más propiedades de nombre/valor.

```
properties {
    <name> <value>
    ...
}
```

### Perspectivas

El `perspectives` bloque se utiliza para definir una o más perspectivas de nombre/descripción para un elemento o relación.
Consulte [Ayuda - Perspectivas](https://structurizr.com/help/perspectives) para saber cómo se utilizan.

```
perspectives {
    <name> <description>
    ...
}
```

### !Ref

La `!ref` palabra clave proporciona una forma de hacer referencia a un elemento o relación previamente definido y está diseñada para usarse con el espacio de trabajo `extends` o  las `!include` características. Se puede utilizar de un par de maneras.

El primer escenario de uso es hacer referencia a un elemento/relación existente que se ha definido a través del DSL. Esto le permite ampliar el elemento al que hace referencia el identificador dado.

```
!ref <identifier> {
  ...
}
```

### Vistas

Cada espacio de trabajo también puede contener una o más vistas, definidas con el `views` bloque.

```
views {
    ...
}
```

El `views` bloque puede contener lo siguiente:

- [systemLandscape](#systemLandscape-view)
- [systemContext](#systemContext-view)
- [contenedor](#container-view)
- [componente](#component-view)
- [Filtrada](#filtered-view)
- [dinámico](#dynamic-view)
- [despliegue](#deployment-view)
- [costumbre](#custom-view)
- [imagen](#image-view)
- [Estilos](#styles)
- [tema](#theme)
- [Temas](#themes)
- [branding](#branding)
- [terminología](#terminology)
- [Propiedades](#properties)

### systemVista horizontal

La `systemLandscape` palabra clave se utiliza para definir una [vista de paisaje del sistema](https://c4model.com/#SystemLandscapeDiagram).

```
systemLandscape [key] [description] {
    ...
}
```

Niños permitidos:

- [incluír](#include)
- [excluir](#exclude)
- [Diseño automático](#autoLayout)
- [predeterminado](#default)
- [animación](#animation)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

### vista systemContext

La `systemContext` palabra clave se utiliza para definir una [vista de contexto del sistema](https://c4model.com/#SystemContextDiagram) para el sistema de software especificado.

```
systemContext <software system identifier> [key] [description] {
    ...
}
```

Niños permitidos:

- [incluír](#include)
- [excluir](#exclude)
- [Diseño automático](#autoLayout)
- [predeterminado](#default)
- [animación](#animation)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

### Vista de contenedor

La `container` palabra clave se utiliza para definir una [vista de contenedor](https://c4model.com/#ContainerDiagram) para el sistema de software especificado.

```
container <software system identifier> [key] [description] {
    ...
}
```

Niños permitidos:

- [incluír](#include)
- [excluir](#exclude)
- [Diseño automático](#autoLayout)
- [predeterminado](#default)
- [animación](#animation)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

### Vista de componentes

La `component` palabra clave se utiliza para definir una [vista de componente](https://c4model.com/#ComponentDiagram) para el contenedor especificado.

```
component <container identifier> [key] [description] {
    ...
}
```

Niños permitidos:

- [incluír](#include)
- [excluir](#exclude)
- [Diseño automático](#autoLayout)
- [predeterminado](#default)
- [animación](#animation)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

### Vista filtrada

La `filtered` palabra clave se utiliza para definir una [vista filtrada](https://structurizr.com/help/filtered-views) sobre la vista especificada.

```
filtered <baseKey> <include|exclude> <tags> [key] [description] {
    ...
}
```

Especifica `baseKey` la clave de la vista Paisaje del sistema, Contexto del sistema, Contenedor o Componente en la que se debe basar esta vista filtrada. El modo (`include` o `exclude`) define si la vista debe incluir o excluir elementos/relaciones en función de lo `tags` proporcionado.

Tenga en cuenta que una vez que se define una vista filtrada para una "vista base" determinada, esa vista base ya no aparecerá en su lista de diagramas cuando utilice el renderizador Structurizr. Esto es así por diseño. Si también desea ver la vista base, simplemente cree otra vista filtrada para la misma vista base, que incluya las `Element` etiquetas  y `Relationship` .

Niños permitidos:

- [predeterminado](#default)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

```
filtered <baseKey> include "Element,Relationship" [key] [description]
```

### Vista dinámica

La `dynamic` palabra clave define una [vista dinámica](https://c4model.com/#DynamicDiagram) para el ámbito especificado.

```
dynamic <*|software system identifier|container identifier> [key] [description] {
    ...
}
```

La primera propiedad define el ámbito de la vista y, por lo tanto, lo que se puede agregar a la vista, de la siguiente manera:

- `*` Ámbito: Personas y sistemas de software.
- Ámbito del sistema de software: personas, otros sistemas de software y contenedores.
- Ámbito del contenedor: personas, otros sistemas de software, otros contenedores y componentes.

A diferencia de los otros tipos de diagrama, las vistas dinámicas se crean especificando las relaciones que se deben agregar a la vista, dentro del `dynamic` bloque, de la siguiente manera:

```
<element identifier> -> <element identifier> [description] [technology]
<relationship identifier> [description]
```

Niños permitidos:

- [Diseño automático](#autoLayout)
- [predeterminado](#default)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

### Vista de implementación

La `deployment` palabra clave define una [vista de implementación](https://c4model.com/#DeploymentDiagram) para el ámbito y el entorno de implementación especificados.

```
deployment <*|software system identifier> <environment> [key] [description] {
    ...
}
```

La primera propiedad define el ámbito de la vista y la segunda propiedad define el entorno de implementación (que puede ser un identificador o un nombre). La combinación de estas dos propiedades determina lo que se puede agregar a la vista, de la siguiente manera:

- `*` Ámbito: todos los nodos de implementación, nodos de infraestructura e instancias de contenedor dentro del entorno de implementación.
- Ámbito del sistema de software: todos los nodos de implementación y los nodos de infraestructura dentro del entorno de implementación. Instancias de contenedor dentro del entorno de implementación que pertenecen al sistema de software.

Niños permitidos:

- [incluír](#include)
- [excluir](#exclude)
- [Diseño automático](#autoLayout)
- [predeterminado](#default)
- [animación](#animation)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

### Vista personalizada

La `custom` palabra clave se utiliza para definir una [vista personalizada](https://structurizr.com/help/custom-diagrams) (esto solo está disponible en el servicio en la nube de Structurizr/instalación local/Lite).

```
custom [key] [title] [description] {
    ...
}
```

Niños permitidos:

- [incluír](#include)
- [excluir](#exclude)
- [Diseño automático](#autoLayout)
- [predeterminado](#default)
- [animación](#animation)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

### Vista de imagen

La `image` palabra clave se utiliza para definir una [vista de imagen](https://structurizr.com/help/image-views) (esto solo está disponible en el servicio en la nube de Structurizr/instalación local/Lite).

```
image <*|element identifier> [key] {
    ...
}
```

Dentro de este bloque se puede definir el origen de la imagen, utilizando una de las siguientes opciones:

- `plantuml <file|url>`
- `mermaid <file|url>`
- `kroki <format> <file|url>` (donde `format` es el identificador de formato incluido en la ruta de la URL; p. ej. `https://kroki.io/{format}/...`)
- `image <file|url>`

Deberá proporcionar una URL de PlantUML/Mermaid/Kroki y, opcionalmente, un formato (`png` o `svg`),
al utilizar estos servicios. Se pueden especificar como propiedades del conjunto de vistas:

```
views {
    properties {
        "plantuml.url" "http://localhost:7777"
        "plantuml.format" "svg"
        "mermaid.url" "http://localhost:8888"
        "mermaid.format" "svg"
        "kroki.url" "http://localhost:9999"
        "kroki.format" "svg"
    }
    
    ...
}
```

Niños permitidos:

- [predeterminado](#default)
- [título](#title)
- [descripción](#description)
- [Propiedades](#properties)

### incluír

La `include` palabra clave se puede utilizar para incluir elementos o relaciones.

#### Inclusión de elementos

Para incluir elementos en una vista, utilice una o más `include` instrucciones dentro del bloque que define la vista.

```
include <*|identifier|expression> [*|identifier|expression...]
```

Los elementos se pueden especificar mediante identificadores individuales, el identificador comodín (`*`) o una expresión de propiedad. Tenga en cuenta que la inclusión de elementos también incluirá las relaciones entre esos elementos.

El identificador comodín (`*`) funciona de forma diferente en función del tipo de diagrama, como se indica a continuación:

- Vista horizontal del sistema: incluye a todas las personas y sistemas de software.
- Vista de contexto del sistema: incluya el sistema de software en el ámbito; además de todas las personas y sistemas de software que están directamente conectados al sistema de software en el alcance.
- Vista de contenedor: incluya todos los contenedores dentro del sistema de software en el ámbito; además de todas las personas y sistemas de software que están conectados directamente a esos contenedores.
- Vista de componentes: incluya todos los componentes del contenedor en el ámbito; además de todas las personas, sistemas de software y contenedores (pertenecientes al sistema de software en el ámbito de aplicación) conectados directamente a ellos.
- Vista filtrada: (no aplicable)
- Vista dinámica: (no aplicable)
- Vista de implementación: incluya todos los nodos de implementación, los nodos de infraestructura y las instancias de contenedor definidos en el entorno de implementación y el sistema de software (opcional) en el ámbito.

### excluir

La `exclude` palabra clave se puede utilizar para excluir elementos o relaciones.

#### Elementos excluyentes

Para excluir elementos específicos, utilice una o más `exclude` instrucciones dentro del bloque que define la vista.

```
exclude <identifier|expression> [identifier|expression...]
```

#### Exclusión de relaciones

Para excluir una relación en una vista, puede especificar un identificador de relación individual o utilizar una expresión de propiedad:

```
exclude <identifier|expression> [identifier|expression...]
```

### Diseño automático

Para habilitar el modo de diseño automático para el diagrama, use la `autoLayout` instrucción dentro del bloque que define la vista.

```
autoLayout [tb|bt|lr|rl] [rankSeparation] [nodeSeparation]
```

La primera propiedad es la dirección del rango:

- `tb`: De arriba a abajo (predeterminado)
- `bt`: De abajo hacia arriba
- `lr`: De izquierda a derecha
- `rl`: De derecha a izquierda

La segunda propiedad es la separación de rangos en píxeles (por defecto: `300`), mientras que la tercera propiedad es la separación de nodos en el mismo rango en píxeles (por defecto: `300`).

### predeterminado

Establece la vista predeterminada que se mostrará.

```
default
```

### animación

La `animation` palabra clave define la animación de la vista especificada.
Cada paso de animación debe definirse en una línea separada, dentro del bloque, especificando los elementos que deben incluirse en ese paso.

```
animation {
    <identifier> [identifier...]
    <identifier> [identifier...]
}
```

### título

Reemplaza el título de la vista.

```
title <title>
```

### Estilos

`styles` es el contenedor para uno o más estilos de elemento/relación, que se utilizan al representar diagramas.

```
styles {
    ...
}
```

Niños permitidos:

- [elemento](#element-style)
- [relación](#relationship-style)

### Estilo de elemento

La `element` palabra clave se utiliza para definir el estilo de un elemento.
Todas las propiedades anidadas (`shape`, `icon`, etc.) son opcionales.

```
element <tag> {
    shape <Box|RoundedBox|Circle|Ellipse|Hexagon|Cylinder|Pipe|Person|Robot|Folder|WebBrowser|MobileDevicePortrait|MobileDeviceLandscape|Component>
    icon <file|url>
    width <integer>
    height <integer>
    background <#rrggbb|color name>
    color <#rrggbb|color name>
    colour <#rrggbb|color name>
    stroke <#rrggbb|color name>
    strokeWidth <integer: 1-10>
    fontSize <integer>
    border <solid|dashed|dotted>
    opacity <integer: 0-100>
    metadata <true|false>
    description <true|false>
    properties {
        name value
    }
}
```

Notas:

- Los colores se pueden especificar como un código hexadecimal (por ejemplo, `#ffff00`) o un color con nombre CSS/HTML (por ejemplo, `yellow`).
- Consulte [Ayuda - Iconos](https://structurizr.com/help/icons) para obtener información sobre HTTPS/CORS si está utilizando el servicio en la nube de Structurizr/instalación local/Lite y especifica un icono de estilo de elemento a través de una URL.
- Los estilos de elementos están diseñados para funcionar con el servicio en la nube Structurizr / instalación local / Lite, y es posible que no sean totalmente compatibles con los [formatos de exportación PlantUML, Mermaid, etc](https://github.com/structurizr/export).  (por ejemplo, formas e iconos).

### Estilo de relación

La `relationship` palabra clave se utiliza para definir un estilo de relación.
Todas las propiedades anidadas (`thickness`, `color`, etc.) son opcionales.

```
relationship <tag> {
    thickness <integer>
    color <#rrggbb|color name>
    colour <#rrggbb|color name>
    style <solid|dashed|dotted>
    routing <Direct|Orthogonal|Curved>
    fontSize <integer>
    width <integer>
    position <integer: 0-100>
    opacity <integer: 0-100>
    properties {
        name value
    }
}
```

Notas:

- Los colores se pueden especificar como un código hexadecimal (por ejemplo, `#ffff00`) o un color con nombre CSS/HTML (por ejemplo, `yellow`).
- Los estilos de relación están diseñados para funcionar con el servicio en la nube Structurizr / instalación local / Lite, y es posible que no sean totalmente compatibles con los [formatos de exportación PlantUML, Mermaid, etc. ](https://github.com/structurizr/export) (por ejemplo, colores de línea/flecha).

### tema

La `theme` palabra clave se puede utilizar para especificar un tema que se debe utilizar al representar diagramas. Consulte [Structurizr - Temas](https://structurizr.com/help/themes) para obtener más detalles.

```
theme <default|url>
```

`default` se puede utilizar como URL del tema, para incluir [el tema predeterminado de Structurizr](https://structurizr.com/help/theme?url=https://static.structurizr.com/themes/default/theme.json).

### Temas

La `themes` palabra clave se puede utilizar para especificar uno o varios temas que se deben utilizar al representar diagramas. Consulte [Structurizr - Temas](https://structurizr.com/help/themes) para obtener más detalles.

```
themes <url> [url] ... [url]
```

`default` se puede utilizar como URL del tema, para incluir [el tema predeterminado de Structurizr](https://structurizr.com/help/theme?url=https://static.structurizr.com/themes/default/theme.json).

### branding

La `branding` palabra clave permite definir alguna personalización de marca que se debe utilizar al representar diagramas y documentación. Consulte [Structurizr - Branding](https://structurizr.com/help/branding) para obtener más detalles.

```
branding {
    logo <file|url>
    font <name> [url]
}
```

Notas:

- Consulte [Ayuda - Iconos](https://structurizr.com/help/icons) para obtener información sobre HTTPS/CORS si está utilizando el servicio en la nube de Structurizr/instalación local/Lite y especifica un icono de marca a través de una URL.

### terminología

La `terminology` palabra clave permite invalidar la terminología utilizada al representar diagramas.

```
terminology {
    person <term>
    softwareSystem <term>
    container <term>
    component <term>
    deploymentNode <term>
    infrastructureNode <term>
    relationship <term>
}
```

### configuración

Por último, hay algunas opciones de configuración que se pueden especificar dentro del `configuration` bloque.

```
configuration {
    ...
}
```

Niños permitidos:

- [Usuarios](#users)
- [Propiedades](#properties)

### Usuarios

El `users` bloque se puede utilizar para especificar los usuarios que deben tener acceso de solo lectura o de lectura y escritura a un espacio de trabajo. Cada nombre de usuario (por ejemplo, dirección de correo electrónico) y par de roles debe especificarse en su propia línea. Los roles válidos son `read` (solo lectura) y `write` (lectura-escritura).

```
users {
    <username> <read|write>
}
```