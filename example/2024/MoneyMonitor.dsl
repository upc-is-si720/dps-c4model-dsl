workspace "MoneyMonitor" "Sistema para gestionar los gastos de un usuario." {

    model {
    
    usuario = person "Usuario" "Usuario de la aplicacion" "Usuario"
    admin = person "Admin" "Administrador de la aplicacion" "Admin" 
    
    
   banco = softwaresystem "APIBanco" "Banco sincronizado a la aplicacion" "Banco"
   google = softwaresystem "APIGoogle" "Base de datos sincronizado a la aplicacion" "Google"
   
   
   gestionSystem = softwaresystem "MoneyMonitor" "Sistema de gestion de gastos de un usuario" "GestionSystem" {
    
    mobileApp = container "Mobile App" "Mobile Application de MoneyMonitor" "Swift v5.10." "MobileApp"

      apiGateway = container "Api Gateway" "Enrutamiento de la solicitud de los Fronts UI" "api gateway" "ApiGateway" 

      database = container "Base de Datos" "Guarda información de las transacciones" "MongoDB v7.0" "Database"
      
        gastosBC = container "Bounded Context Gestion de Gastos" "API RESTful de gestion de analisis" "JavaScript  / vue.js" "InformesBC,BoundedContext"{
          
            categoriaEntity = component "Categoria Entity" "Class donde se registra las categorias" "Class" "CategoriaEntity,Entity"
            categoriaRepository = component "Categoria Repository" "Repository Interface de Categoria Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "CategoriaRepository,Repository"
            
            group presupuesto {
            presupuestoEntity = component "Presupuesto Entity" "Class donde se registra los presupuestos" "Class" "PresupuestoEntity,Entity"
            presupuestoRepository = component "Presupuesto Repository" "Repository Interface de Presupuesto Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "PresupuestoRepository,Repository"
            presupuestoCommand = component "Presupuesto Command" "Command for create, update and delete entity presupuesto" "Record" "PresupuestoCommand, Command"
            presupuestoCommandService = component "Presupuesto CommandService" "Business Logic de la Gestion de presupuesto" "Record" "PresupuestoCommand, Service"
            presupuestoQuery = component "Presupuesto Query" "Query for read entity presupuesto" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "PresupuestoQuery, Query"
            presupuestoQueryService = component "Presupuesto QueryService" "Business Logic del Query de los presupuestos" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "PresupuestoQueryService,Service"
            }
            
            group gastos {
            gastosEntity = component "Gastos Entity" "Class donde se registra los gastos" "Class" "GastosEntity,Entity"
            gastosRepository = component "Gastos Repository" "Repository Interface de Gastos Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastoRepository,Repository"
            gastosCommand = component "Gastos Command" "Command for create, update and delete entity gastos" "Record" "GastosCommand, Command"
            gastosCommandService = component "Gastos CommandService" "Business Logic de la Gestion de gastos" "Record" "GastosCommand, Service"
            gastosQuery = component "Gastos Query" "Query for read entity gastos" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosQuery, Query"
            gastosQueryService = component "Gastos QueryService" "Business Logic del Query de los gastos" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosQueryService,Service"
            }
            
            categoriaCommand = component "Categoria Command" "Command for create, update and delete entity categoria" "Record" "CategoriaCommand, Command"
            categoriaCommandService = component "Categoria CommandService" "Business Logic de la Gestion de categoria" "Record" "CategoriaCommand, Service"
            categoriaQuery = component "Categoria Query" "Query for read entity categoria" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "CategoriaQuery, Query"
            categoriaQueryService = component "Categoria QueryService" "Business Logic del Query de categoria" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "CategoriaQueryService,Service"
            
            presupuestoController = component "Presupuesto Controller" "Api RESTfull Controller class de presupuesto" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "PresupuestoController,Controller"
            gastosController = component "Gastos Controller" "Api RESTfull Controller class de gastos" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosController,Controller"
            
            apiGateway -> gastosController "Endpoint request - Gastos" "HTTP(S) / JSON" 
            apiGateway -> presupuestoController "Endpoint request - Gastos" "HTTP(S) / JSON" 
            
            gastosRepository -> gastosEntity "Methods call" "POO"
            categoriaRepository -> categoriaEntity "Methods call" "POO"
            presupuestoRepository -> presupuestoEntity "Methods call" "POO"
            
            gastosRepository -> database "Store, update, delete and fetch records - gastos" "Database Transaction"
            categoriaRepository -> database "Store, update, delete and fetch records - categoria" "Database Transaction"
            presupuestoRepository -> database "Store, update, delete and fetch records - presupuesto" "Database Transaction"
            
            presupuestoController -> presupuestoCommandService "Call service method"
            presupuestoController -> presupuestoQueryService "Call service method"
            
            presupuestoQueryService -> presupuestoQuery "Handle Query"
            presupuestoQueryService -> presupuestoRepository "Call repository method"
            presupuestoQueryService -> presupuestoEntity "Use entity"
            
            presupuestoCommandService -> presupuestoRepository "Call repository method"
            presupuestoCommandService -> presupuestoCommand "Handle Command"
            presupuestoCommandService -> presupuestoEntity "Use entity"
            
            gastosController -> gastosCommandService "Call service method"
            gastosController -> gastosQueryService "Call service method"
            
            gastosQueryService -> gastosQuery "Handle Query"
            gastosQueryService -> gastosRepository "Call repository method"
            gastosQueryService -> gastosEntity "Use entity"
            
            gastosCommandService -> gastosRepository "Call repository method"
            gastosCommandService -> gastosCommand "Handle Command"
            gastosCommandService -> gastosEntity "Use entity"
            
            presupuestoController -> categoriaCommandService "Call service method"
            presupuestoController -> categoriaQueryService "Call service method"
            
            categoriaQueryService -> categoriaQuery "Handle Query"
            categoriaQueryService -> categoriaRepository "Call repository method"
            categoriaQueryService -> categoriaEntity "Use entity"
            
            categoriaCommandService -> categoriaRepository "Call repository method"
            categoriaCommandService -> categoriaCommand "Handle Command"
            categoriaCommandService -> categoriaEntity "Use entity"
      }
      
        categorizacionBC = container "Bounded Context Gestion de Categorizacion de Gastos" "API RESTful de gestion de categorizacion de gastos" "JavaScript  / vue.js" "CategorizacionBC,BoundedContext" {
            
            group gasto {
            gastoEntity = component "Gastos Entity" "Class donde se registra los gastos" "Class" "GastosEntity,Entity"
            gastoRepository = component "Gastos Repository" "Repository Interface de Gastos Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosRepository,Repository"
            gastoCommand = component "Gastos Command" "Command for create, update and delete entity gastos" "Record" "GastosCommand, Command"
            gastoCommandService = component "Gastos CommandService" "Business Logic de la Gestion de gastos" "Record" "GastosCommand, Service"
            gastoQuery = component "Gastos Query" "Query for read entity gastos" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosQuery, Query"
            gastoQueryService = component "Gastos QueryService" "Business Logic del Query de gastos" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosQueryService,Service"
            }
            
            kategoriaController = component "Categoria Controller" "Api RESTfull Controller class de categoria" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "CategoriaController,Controller"
            kategoriaEntity = component "Categoria Entity" "Class donde se registra los categoria" "Class" "CategoriaEntity,Entity"
            kategoriaRepository = component "Categoria Repository" "Repository Interface de Categoria Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "CategoriaRepository,Repository"
            kategoriaCommand = component "Categoria Command" "Command for create, update and delete entity categoria" "Record" "CategoriaCommand, Command"
            kategoriaCommandService = component "Categoria CommandService" "Business Logic de la Gestion de categoria" "Record" "CategoriaCommand, Service"
            kategoriaQuery = component "Categoria Query" "Query for read entity categoria" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "CategoriaQuery, Query"
            kategoriaQueryService = component "Categoria QueryService" "Business Logic del Query de categoria" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "CategoriaQueryService,Service"
            
            ppresupuestoRepository = component "Presupuesto Repository" "Repository Interface de Presupuesto Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "PresupuestoRepository,Repository"
            ppresupuestoEntity = component "Presupuesto Entity" "Class donde se registra los presupuestos" "Class" "PresupuestoEntity,Entity"
            
            gastoRepository -> gastoEntity "Methods call" "POO"
            kategoriaRepository -> kategoriaEntity "Methods call" "POO"
            ppresupuestoRepository -> ppresupuestoEntity "Methods call" "POO"
            
            kategoriaRepository -> database "Store, update, delete and fetch records - categoria" "Database Transaction"
            gastoRepository -> database "Store, update, delete and fetch records - gasto" "Database Transaction"
            ppresupuestoRepository -> database "Store, update, delete and fetch records - presupuesto" "Database Transaction"
            
            kategoriaController -> kategoriaCommandService "Call service method"
            kategoriaController -> kategoriaQueryService "Call service method"
            
            kategoriaQueryService -> kategoriaQuery "Handle Query"
            kategoriaQueryService -> kategoriaRepository "Call repository method"
            kategoriaQueryService -> kategoriaEntity "Use entity"
            kategoriaQueryService -> ppresupuestoRepository "Call repository method"
            
            kategoriaCommandService -> kategoriaRepository "Call repository method"
            kategoriaCommandService -> kategoriaCommand "Handle Command"
            kategoriaCommandService -> kategoriaEntity "Use entity"
            
            kategoriaController -> gastoCommandService "Call service method"
            kategoriaController -> gastoQueryService "Call service method"
            
            gastoQueryService -> gastoQuery "Handle Query"
            gastoQueryService -> gastoRepository "Call repository method"
            gastoQueryService -> gastoEntity "Use entity"
            gastoQueryService -> banco "Categorizar el gasto por tarjeta"
            
            gastoCommandService -> gastoRepository "Call repository method"
            gastoCommandService -> gastoCommand "Handle Command"
            gastoCommandService -> gastoEntity "Use entity"
            
            apiGateway -> kategoriaController "Endpoint request - Gastos" "HTTP(S) / JSON"
            
      }
      

        informesBC = container "Bounded Context Seguimiento y Análisis de Gastos" "API RESTful de gestion de gastos" "JavaScript  / vue.js" "GastosBC,BoundedContext"{
        
            jastoEntity = component "Gastos Entity" "Class donde se registra los gastos" "Class" "GastoEntity,Entity"
            jastoRepository = component "Gastos Repository" "Repository Interface de Gasto Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastoRepository,Repository"
            
            informeController = component "Informe Controller" "Api RESTfull Controller class de informe" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "InformeController,Controller"
            
            group informe {
            informeEntity = component "Informe Entity" "Class donde se registra los informe" "Class" "InformeEntity,Entity"
            informeRepository = component "Informe Repository" "Repository Interface de Informe Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "InformeRepository,Repository"
            informeQuery = component "Informe Query" "Query for read entity informe" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "InformeQuery, Query"
            informeQueryService = component "Informe QueryService" "Business Logic del Query del informe" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "InformeQueryService,Service"
            informeCommand = component "Informe Command" "Command for create, update and delete entity informe" "Record" "InformeCommand, Command"
            informeCommandService = component "Informe CommandService" "Business Logic de la Gestion del informe" "Record" "InformeCommand, Service"
            }
            
            jastoRepository -> jastoEntity "Methods call" "POO"
            informeRepository -> informeEntity "Methods call" "POO"
            
            informeRepository -> database "Store, update, delete and fetch records - informe" "Database Transaction"
            jastoRepository -> database "Store, update, delete and fetch records - gastos" "Database Transaction"
            
            informeController -> informeCommandService "Call service method"
            informeController -> informeQueryService "Call service method"
            
            informeQueryService -> informeQuery "Handle Query"
            informeQueryService -> informeRepository "Call repository method"
            informeQueryService -> jastoRepository "Call repository method"
            informeQueryService -> informeEntity "Use entity"
            
            informeCommandService -> informeRepository "Call repository method"
            informeCommandService -> informeCommand "Handle Command"
            informeCommandService -> informeEntity "Use entity"
            
            apiGateway -> informeController "Endpoint request - Gastos" "HTTP(S) / JSON"
      }

        usuarioBC = container "Bounded Context Gestion de Usuarios" "API RESTful de gestion de usuarios" "JavaScript  / vue.js" "UsuarioBC,BoundedContext"{
          
            usuarioEntity = component "Usuario Entity" "Class donde se registra los usuarios" "Class" "UsuarioEntity,Entity"
            
            usuarioRepository = component "Usuario Repository" "Repository Interface de Usuario Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "UsuarioRepository,Repository"
            
            usuarioQuery = component "Usuario Query" "Query for read entity usuario" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "UsuarioQuery, Query"
            usuarioQueryService = component "Usuario QueryService" "Business Logic del Query del usuario" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "UsuarioQueryService,Service"
            usuarioCommand = component "Usuario Command" "Command for create, update and delete entity usuario" "Record" "UsuarioCommand, Command"
            usuarioCommandService = component "Usuario CommandService" "Business Logic de la Gestion de usuario" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "UsuarioCommandService,Service"
            usuarioController = component "Usuario Controller" "Api RESTfull Controller class de usuario" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "UsuarioController,Controller"
            
            apiGateway -> usuarioController "Endpoint request - Usuario" "HTTP(S) / JSON"

            usuarioRepository -> usuarioEntity "Methods call" "POO"
            usuarioRepository -> database "Store, update, delete and fetch records - usuario" "Database Transaction"
            
            usuarioController -> usuarioQueryService "Call service method"
            usuarioController -> usuarioCommandService "Call service method"
                
            usuarioQueryService -> usuarioQuery "Handle Query"
            usuarioQueryService -> usuarioRepository "Call Repository Method"
            usuarioQueryService -> usuarioEntity "Use entity"
            usuarioQueryService -> google "Iniciar sesion con cuenta google"
                
            usuarioCommandService -> usuarioCommand "Handle Command"
            usuarioCommandService -> usuarioRepository "Call Repository Method"
            usuarioCommandService -> usuarioEntity "Use entity"
        
      }
      
        cuentaBC = container "Bounded Context Gestion de Cuentas Bancarias" "API RESTful de gestion de cuentas bancarias" "JavaScript  / vue.js" "CuentaBC,BoundedContext"{
                
            tarjetaEntity = component "Tarjeta Entity" "Class donde se registra las tarjetas" "Class" "TarjetaEntity,Entity"
            bancoEntity = component "Banco Entity" "Class donde se registra los bancos" "Class" "BancoEntity,Entity"
                
            tarjetaRepository = component "Tarjeta Repository" "Repository Interface de Tarjeta Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "TarjetaRepository,Repository"
            bancoRepository = component "Banco Repository" "Repository Interface de Banco Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "BancoRepository,Repository"
            
            group gastoss {
            gastossRepository = component "Gasto Repository" "Repository Interface de Gastos Entity" "Interface / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosRepository,Repository"
            gastossEntity = component "Gasto Entity" "Class donde se registra los gastos" "Class" "GastosEntity,Entity"
            gastossQuery = component "Gastos Query" "Query for read entity gasto" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosQuery, Query"    
            gastossQueryService = component "Gastos QueryService" "Business Logic de la Gestion del gasto" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosQueryService,Service"
            gastossCommand = component "Gastos Command" "Command for create, update and delete entity gasto" "Record" "GastosCommand, Command"
            gastossCommandService = component "Gastos CommandService" "Business Logic de la Gestion de gasto" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "GastosCommandService,Service"
            }
            
            tarjetaQuery = component "Tarjeta Query" "Query for read entity tarjeta" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "TarjetaQuery, Query"    
            tarjetaQueryService = component "Tarjeta QueryService" "Business Logic de la Gestion de la tarjeta" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "TarjetaQueryService,Service"
            tarjetaCommand = component "Tarjeta Command" "Command for create, update and delete entity tarjeta" "Record" "TarjetaCommand, Command"
            tarjetaCommandService = component "Tarjeta CommandService" "Business Logic de la Gestion de tarjeta" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "TarjetaCommandService,Service"
            tarjetaController = component "Tarjeta Controller" "Api RESTfull Controller class de tarjeta" "Class / Java v21 / SpringBoot v3.3.0 / Spring v6.1.8" "TarjetaController,Controller"
            
            apiGateway -> tarjetaController "Endpoint request - Tarjeta" "HTTP(S) / JSON"
            
            tarjetaController -> tarjetaCommandService "Call service method"
            tarjetaController -> tarjetaQueryService "Call service method"
            tarjetaController -> gastossCommandService "Call service method"
            tarjetaController -> gastossQueryService "Call service method"
            
            tarjetaCommandService -> tarjetaCommand "Handle Command"
            tarjetaCommandService -> tarjetaRepository "Call repository method"
            tarjetaCommandService -> tarjetaEntity "Use entity"
            
            tarjetaQueryService -> tarjetaRepository "Handle Command"
            tarjetaQueryService -> tarjetaQuery "Handle Query"
            tarjetaQueryService -> bancoRepository "Call repository method"
            tarjetaQueryService -> banco "Verificar tarjeta"
            tarjetaQueryService -> tarjetaEntity "Use entity"
            
            gastossCommandService -> gastossCommand "Handle Command"
            gastossCommandService -> gastossRepository "Call repository method"
            gastossCommandService -> gastossEntity "Use entity"
            
            gastossQueryService -> gastossRepository "Call repository method"
            gastossQueryService -> gastossQuery "Handle Query"
            gastossQueryService -> gastossEntity "Use entity"
            
            tarjetaRepository -> tarjetaEntity "Methods call" "POO"
            bancoRepository -> bancoEntity "Methods call" "POO"
            gastossRepository -> gastossEntity "Methods call" "POO"
            
            tarjetaRepository -> database "Store, update, delete and fetch records - tarjeta" "Database Transaction"
            bancoRepository -> database "Store, update, delete and fetch records - banco" "Database Transaction"
            gastossRepository -> database "Store, update, delete and fetch records - gastos" "Database Transaction"
            
      }
   
      usuario -> mobileApp "Pedido"
      admin -> mobileApp "Administra el Software"
      mobileApp -> apiGateway 
       
      }
    usuario -> gestionSystem "Usa la aplicacion"
    admin -> gestionSystem "Administra la aplicacion"

    }
    views {
    
    systemContext gestionSystem "SystemContextMoneyMonitor"   {
    include *
    autolayout 
    }
    
    container gestionSystem "RestauranteContainer" "Diagrama de Contenedores" {
     include *
     autoLayout tb

    }
    
    component informesBC "InformesComponent" "Diagrama de Componentes" {
    include *
    autoLayout tb

    }
    
    component categorizacionBC "CategorizacionComponent" "Diagrama de Componentes" {
    include *
    autoLayout tb

    }
    
    component gastosBC "GastosComponent" "Diagrama de Componentes" {
    include *
    autoLayout tb

    }
    
    component usuarioBC "UsuariosComponent" "Diagrama de Componentes" {
    include *
    autoLayout tb

    }

    component cuentaBC "CuentaComponent" "Diagrama de Componentes" {
    include *
    autoLayout tb

    }
    styles {
            element "Usuario" {
                shape Person
                background #9C6EF1
            }
            element "Admin" {
                shape Person
                background #9C6EF1
            }
            element "GestionSystem" {
                background #4C6EF6
            }
            element  "Banco" {
                background #3FF40D
            }
            element  "Google" {
                background #3FF40D
            }
            element  "MobileApp" {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element "ApiGateway" {
                shape Pipe
                background #884A39                
            }
            element "Container" {
                background #002A8D
                color #FFFFFF
            }
            element "Database" {
                shape Cylinder
                background #CF0A0A
            }
            element "Entity" {
                shape Box
                background #7D08BC
                color #FFFFFF
            }
            element "Query" {
                shape Ellipse
                background #42B8C2
                color #FFFFFF
            }
            element "Command" {
                shape Circle
                background #C22777
                color #FFFFFF
            }
            element "Repository" {
                shape Diamond
                background #F0EB0A
            }
            element "Service" {
                shape Component
                background #169923
                color #FFFFFF
            }
            element "Controller" {
                shape RoundedBox
                background #1D75F0
                color #FFFFFF
            }
        }
    }
}
