workspace "Trendy Youth" "This is an Diagram for Trendy Youth Service" {

    model {
    
    client = person "Client" "A client looking for clothes" "Client"
    user = person "Anonymous Client" "A client who only enters the application, without any association" "Client"
    
    trendyYouthSystem = softwareSystem "Trendy Youth System" "Allows customers to find the clothing that best matches their style" {
    
         mobileApp = container "Mobile App" "Provides a set of the Internet functionality to customers via their mobile device." "Kotlin - Android / Swift - iOS" "Mobile App"
         apiGateway = container "API Gateway" "Provides Internet functionality via a JSON/HTTPS API." "API Gateway" "API Gateway"
         database = container " Database" "Store, get, update and delete  photos ." "Oracle Database 21c - Enterprise Edition" "DataBase"
         
         
         
         loginBC = container "Login Bounded Context" "Api RESTful of Login" "Class / Java v17 / Spring v3" "LoginBC, BoundedContext"{
             
             group "RegistroUser"{
                RegistroUserEntity = component "RegistroUser Entity" "Class donde se registra los usuarios" "Class / Java v17 / Spring v3" "RegistroUserEntity,Entity"
                    RegistroUserRepository = component "RegistroUser Repository" "Repository Interface del registro Entity" "Interface / Java v17 / Spring v3" "RegistroUserRepository,Repository"
                    RegistroUserQuery = component "RegistroUser Query" "Query for read entvity registro" "Record" "RegistroUserQuery, Query"
                    RegistroUserCommand = component "RegistroUser Command" "Command for create, update and delete entity registro" "Record" "RegistroUserCommand, Command"
                    RegistroUserCommandService = component "RegistroUser CommandService" "Business Logic del registro de usuario" "Class / Java v17 / Spring v3" "RegistroUserCommandService,Service"
                    RegistroUserQueryService = component "RegistroUser QueryService" "Business Logic del query del registro" "Class / Java v17 / Spring v3" "RegistroUserQueryService,Service"
                 
             }
             group "Usuario" {
              UsuarioEntity = component "Usario Entity" "Class donde crean los usuarios" "Class / Java v17 / Spring v3" "UsuarioEntity,Entity"
                 UsuarioRepository = component "Usario Repository" "Repository Interface de usuario Entity" "Interface / Java v17 / Spring v3" "UsuarioRepository,Repository"
                    UsuarioQuery = component "Usario Query" "Query for read entity usuario" "Record" "CourseQuery, Query"
                    UsuarioCommand = component "Usario Command" "Command for create, update and delete entity usuario" "Record" "UsuarioCommand, Command"
                    UsuarioCommandService = component "Usario CommandService" "Business Logic de la clase usuario" "Class / Java v17 / Spring v3" "UsuarioCommandService,Service"
                    UsuarioQueryService = component "Usario QueryService" "Business Logic del query del usuario" "Class / Java v17 / Spring v3" "UsuarioQueryService,Service"
             }
             group "UserConfig" {
                UserConfigRepository = component "UserConfig Repository" "Repository Interface de configuración de usuario" "Class / Java v17 / Spring v3" "UserConfigRepository,Repository"
                   UserConfigQuery = component "UserConfig Query" "Query for read entity usuario" "Record" "UserConfigQuery, Query"
                    UserConfigCommand = component "UserConfig Command" "Command for create, update and delete configuración de usuario" "Record" "UserConfigCommand, Command"
                    UserConfigCommandService = component "UserConfig CommandService" "Business Logic de la configuración de usuario" "" "UserConfigCommandService,Service"
                    UserConfigQueryService = component "UserConfig QueryService" "Business Logic del query de configuración de usuario" "" "UserConfigQueryService,Service"
             }
             
              UserConfigController = component "UserConfig Controller" "Api RESTfull Controller class del Inventario" "Class / Java v17 / Spring v3" "RecomendacionController,Controller"
            UsuarioController = component  "Usuario Controller" "Api RESTfull Controller class del Perfil" "Class / Java v17 / Spring v3" "CarritoVirtualController,Controller"
            RegistroUserController = component  "RegistroUser Controller" "Api RESTfull Controller class del Perfil" "Class / Java v17 / Spring v3" "CarritoVirtualController,Controller"

             
             
         }
         personalManagementBC = container "Personal Inventory Management Bounded Context" "Api RESTful of personal inventory management" " " "PersonalManagementBC,BoundedContext"{
             group "clothing" {
                    clothingEntity = component "Clothing Entity" "Clase donde se registran las prendas" "Class/ Java v17 / Spring v3" "ClothingEntity,Entity"
                    clothingRepository = component "Clothing Repository" "Interfaz del repositorio de Clothing Entity" "Interface / Java v17 / Spring v3" "ClothingRepository,Repository"
                    clothingQuery = component "Clothing Query" "Consulta para leer entidad Clothing" "Record" "ClothingQuery, Query"
                    clothingCommand = component "Clothing Command" "Comando para crear, actualizar y eliminar entidad Clothing" "Record" "ClothingCommand, Command"
                    clothingCommandService = component "Clothing CommandService" "Lógica de negocio de la gestión de Clothing" "Class / Java v17 / Spring v3" "ClothingCommandService,Service"
                    clothingQueryService = component "Clothing QueryService" "Lógica de negocio de la consulta de Clothing" "Class / Java v17 / Spring v3" "ClothingQueryService,Service"
                }

                outfit1Entity = component "Outfit Entity" "Clase que contiene los conjuntos de ropa" "Class/ Java v17 / Spring v3" "OutfitEntity,Entity"
                combinationEntity = component "Combination Entity" "Clase que contiene las combinaciones de ropa" "Class / Java v17 / Spring v3" "CombinationEntity,Entity"
                
                outfit1Repository = component "Outfit Repository" "Interfaz del repositorio de Outfit Entity" "Interface / Java v17 / Spring v3" "OutfitRepository,Repository"
                combinationRepository = component "Combination Repository" "Interfaz del repositorio de Combination Entity" "Interface / Java v17 / Spring v3" "CombinationRepository,Repository"
                inventory1Repository = component "Inventory Repository" "Interfaz del repositorio de Inventario Entity" "Interface / Java v17 / Spring v3" "CombinationRepository,Repository"


                inventory1Service = component "Inventory Service" "Lógica de negocio de la gestión del inventario" "Class / Java v17 / Spring v3" "InventoryService,Service"
                outfit1Service = component "Outfit Service" "Lógica de negocio de la gestión de conjuntos" "Class / Java v17 / Spring v3" "OutfitService,Service"
                combinationService = component "Combination Service" "Lógica de negocio de la gestión de combinaciones" "Class / Java v17 / Spring v3" "CombinationService,Service"

                inventory1Controller = component "Inventory Controller" "Clase controlador de API RESTful del inventario" "Class / Java v17 / Spring v3" "InventoryController,Controller"
                outfit1Controller = component "Outfit Controller" "Clase controlador de API RESTful de conjuntos" "Class / Java v17 / Spring v3" "OutfitController,Controller"
                combinationController = component "Combination Controller" "Clase controlador de API RESTful de combinaciones" "Class / Java v17 / Spring v3" "CombinationController,Controller"


                apiGateway -> inventory1Controller "Solicitudes de endpoint - Inventario" "HTTP(S) / JSON"
                apiGateway -> outfit1Controller "Solicitudes de endpoint - Conjuntos" "HTTP(S) / JSON"
                apiGateway -> combinationController "Solicitudes de endpoint - Combinaciones" "HTTP(S) / JSON"

                inventory1Controller -> inventory1Service "Llamada a métodos" "POO"
                outfit1Controller -> outfit1Service "Llamada a métodos" "POO"
                combinationController -> combinationService "Llamada a métodos" "POO"
                   combinationController -> clothingQueryService "Llamada a métodos" "POO"
            combinationController -> clothingCommandService "llamada a métodos" "POO"

                inventory1Service -> inventory1Repository "Llamada a métodos" "POO"
                inventory1Service -> combinationRepository "Llamada a métodos" "POO"

                clothingRepository -> clothingEntity "Llamada a métodos" "POO"
                outfit1Repository -> outfit1Entity "Llamada a métodos" "POO"
                combinationRepository -> combinationEntity "Llamada a métodos" "POO"
                
                combinationService -> clothingRepository "Llamada a métodos" "POO"
                combinationService -> outfit1Repository "Llamada a métodos" "POO"
                combinationService -> combinationRepository "Llamada a métodos" "POO"
                
                outfit1Service -> clothingRepository "Llamada a métodos" "POO"
                outfit1Service -> outfit1Repository "Llamada a métodos" "POO"
                outfit1Service -> inventory1Repository "Llamada a métodos" "POO"
                
            clothingCommandService -> clothingCommand "Handle command"
            clothingCommandService -> clothingQuery "Call repository method"

            clothingQueryService -> clothingCommand "Handle query"
            clothingQueryService -> clothingQuery "Call repository method"
            
            combinationController -> clothingRepository "Llamada a métodos" "POO"
            combinationController -> combinationRepository "llamada a métodos" "POO"
            
             clothingQuery -> clothingEntity "Use Entity"
            clothingCommand -> clothingEntity "Use Entity" 

                clothingRepository -> database "Almacenar, actualizar, eliminar y recuperar registros - ropa" "Transacción de base de datos"
                outfit1Repository -> database "Almacenar, actualizar, eliminar y recuperar registros - conjuntos" "Transacción de base de datos"
                combinationRepository -> database "Almacenar, actualizar, eliminar y recuperar registros - combinaciones" "Transacción de base de datos"

         }    
   outfitManagementBC = container "Outfit Management Bounded Context" "Api RESTful of Outfit Management " " " "OutfitManagementBC,BoundedContext" {
             
             
             group "Outfit"{
                 
                 outfitController = component "Outfit Controller" "Api RESTfull Controller class del Outfit" "Class / Java v17 / Spring v3" "OutfitController,Controller"
                 outfitEntity =  component "Outfit Entity" "Class donde se almacena la combinacion" "Class / Java v17 / Spring v3" "OutfitEntity,Entity"
                 outfitRepository = component "Outfit Repository" "Repository Interface de Outfit Entity" "Interface / Java v17 / Spring v3" "OutfitRepository,Repository"
                 outfitQuery = component "Outfit Query" "Query for read entity Outfit" "Record " "OutfitQuery, Query"
                 outfitCommand = component "Outfit Command" "Command for create, update and delete entity Outfit" "Record / Java v17 / Spring v3" "OutfitCommand, Command"
                 outfitCommandService = component "Outfit CommandService" "Business Logic de la Gestion del Outfit" "Class/ Java v17 / Spring v3" "OutfitCommandService,Service"
                 outfitQueryService = component "Outfit QueryService" "Business Logic del query del Outfit" "Class / Java v17 / Spring v3" "OutfitQueryService,Service"
                 
             }

             group "Inventory"{
                 
                  inventoryEntity = component  "Inventory Entity" "Class donde se almacenan las combianciones" "Class / Java v17 / Spring v3" "InventoryEntity, Entity"
                  inventoryRepository = component "Inventory Repositary" "Repository Interface de Inventory Entity" "Interface / Java v17 / Spring v3" "InventoryRepsoitory, Repository"
                  inventoryCommand = component "Inventory Command" "Command for create, update and delete entity Inventory" "Record / Java v17 / Spring v3" "InventoryCommand, Command"
                  inventoryCommandService = component "Inventory CommandService" "Business Logic de la Gestion del Inventory" "Class / Java v17 / Spring v3" "InventoryCommandService,Service"
                  inventoryController = component "Inventory Controller" "Api RESTfull Controller class del Inventory" "Class / Java v17 / Spring v3" "InventoryController,Controller"
             }
             
             group "Management"{
                 
                  managementOutfitEntity = component "Management Outfit Entity" "Class donde se gestiona las diferentes combinaciones dentro del inventario" "Class / Java v17 / Spring v3" "ManagementOutfitEntity,Entity"
                  managementOutfitRepository = component "Management Outfit Repository" "Repository Interface de Management Outfit Entity" "Interface / Java v17 / Spring v3" "ManagementOutfitRepository,Repository"
             }
             
             outfitService = component "Outfit Service" "Business Logic de la Gestion de los Outfit" "Class" "OutfitService,Service"
             inventoryService = component "Inventory Service" "Business Logic de la Gestion de lo Inventory" "Class" "InventoryService,Service"
 
             
             
             apiGateway -> outfitController "Solicitud de endpoint Outfit" "POO"
             apiGateway -> inventoryController "Solicitud de endpoint Outfit" "POO"
             outfitController ->  outfitCommandService  "Methods Call"
             outfitController ->  outfitQueryService "Methods Call"
             
            outfitCommandService -> outfitCommand "Handle Command"
            outfitQueryService -> outfitQuery "Handle Query"
            
            outfitCommandService -> outfitRepository "Call Repository Method"
            outfitQueryService -> outfitRepository "Call Repository Method"
            
            outfitRepository -> outfitEntity "Methods Call"
            outfitService -> outfitEntity "Use Entity"
            outfitQuery -> outfitEntity "Use Entity"
            inventoryController -> inventoryCommandService "Call servide Method"
            
            outfitCommandService -> outfitEntity "Use Entity"
            outfitQueryService -> outfitEntity "Use Entity"
            
            inventoryCommandService -> inventoryEntity "Use Entity"
            
            outfitController -> outfitService "Methods Call"
            outfitService -> outfitRepository "Methods Call"
            inventoryRepository -> inventoryEntity "Methods Call"
            inventoryCommandService -> inventoryCommand "Methods Call"
            inventoryCommandService -> inventoryRepository "Call Repository Method"
             inventoryCommand -> inventoryEntity "Methods Call"
            inventoryController -> inventoryService "Call servide Method"
            inventoryService -> managementOutfitRepository "Methods Call"
            managementOutfitRepository -> managementOutfitEntity
            
            
            
         }
         
              
             outfitEntity -> database "Almacenar, actualizar, eliminar y recuperar registros de ropa"
             inventoryEntity -> database "Almacenar, actualizar, eliminar y recuperar registros de ropa"
             managementOutfitEntity -> database "Almacenar, actualizar, eliminar y recuperar registros de ropa"
              
         outfitGenerationBC = container "Outfit Generation Bounded Context" "Api RESTful of Outfit Generation " " " "OutfitGenerationBC,BoundedContext"{
              group "Inventario" {
                    InventarioEntity = component "Invetario Entity" "Clase donde se registra prendas" "InventarioEntity,Entity"
                    
                    InventarioRepository = component "Inventario Repository" "Repository Interface de Inventario Entity" "Interface / Java v17 / Spring v3" "InventarioRepository,Repository"
                    InventarioQuery = component "Inventario Query" "Query for read entity Inventario" "Record" "InventarioQuery, Query"
                    InventarioCommand = component "Inventario Command" "Command for create, update and delete entity Inventario" "Record" "InventarioCommand, Command"
                    InventarioCommandService = component "Inventario CommandService" "Business Logic de la Gestion del Inventario" "Class / Java v17 / Spring v3" "InventarioCommandService,Service"
                     InventarioQueryService = component "Inventario QueryService" "Business Logic del query del Inventario" "Class / Java v17 / Spring v3" "InventarioQueryService,Service"
                }
                group "IA" {
                      IAEntity = component "IA Entity" "Class que contiene los Algoritmos del outfit" "Class" "IAEntity,Entity"
                    IARepository = component "IARepository" "Repository Interface de IA Entity" "Interface / Java v17 / Spring v3" "IARepository,Repository"
                }
                group "PerfildeModa"{
                    PerfilEntity = component "PerfilModa Entity" "Entity for Perfil" "Class" "PerfilEntity, Entity"
                    PerfilRepository = component "PerfilModa Repository" "Abstract for reposity Perfil" "Interface" "PerfilRepository, Repository"
                    PerfilQuery = component "PerfilModa Query" "Query for read entity Perfil" "Record" "PerfilQuery, Query"
                    PerfilCommand = component "Perfil Command" "Command for create, update and delete entity Perfil" "Record" "PerfilCommand, Command"
                    PerfilCommandService = component "Perfil CommandService" "Business Login for create, update and delete entity Perfil" "Interface and Class" "PerfilCommandService, Service"
                    PerfilQueryService = component "Perfil QueryService" "Business Login for read entity Perfil" "Interface and Class" "PerfilQueryService, Service"
                }

                InventarioController = component "Inventario Controller" "Api RESTfull Controller class del Inventario" "Class / Java v17 / Spring v3" "InventarioController,Controller"
                PerfilController = component  "PerfilModa Controller" "Api RESTfull Controller class del Perfil" "Class / Java v17 / Spring v3" "PerfilController,Controller"
                 
       }
         suggestionsCombinationsBC = container "Buying suggestions for combinations Bounded Context" "Api RESTful of Buying suggestions for combinations " "Class / Java v17 / Spring v3" "SuggestionsCombinationsBC,BoundedContext"{
              group "buysuggestion"{
                    buysuggestionEntity = component "Buysuggestion Entity" "Class donde se registra los recomendación de compra" "Class / Java v17 / Spring v3" "BuysuggestionEntity,Entity"
                    buysuggestionRepository = component "Buysuggestion Repository" "Repository Interface de recomendación de compra Entity" "Interface / Java v17 / Spring v3" "BuysuggestionRepository,Repository"
                    buysuggestionQuery = component "Buysuggestion Query" "Query for read entity recomendación de compra" "Record" "BuysuggestionQuery, Query"
                    buysuggestionCommand = component "Buysuggestion Command" "Command for create, update and delete entity recomendación de compra" "Record" "BuysuggestionCommand, Command"
                    buysuggestionCommandService = component "Buysuggestion CommandService" "Business Logic de la Gestion de recomendación de compra" "Class / Java v17 / Spring v3" "BuysuggestionCommandService,Service"
                    buysuggestionQueryService = component "Buysuggestion QueryService" "Business Logic del query de la recomendación de compra" "Class / Java v17 / Spring v3" "BuysuggestionQueryService,Service"
             }
             
             group "fashionprofile"{
                    fashionprofileEntity = component "Fashionprofile Entity" "Class donde se registra los perfiles de moda" "Class / Java v17 / Spring v3" "FashionprofileEntity,Entity"
                    fashionprofileRepository = component "Fashionprofile Repository" "Repository Interface de Course perfil de moda" "Interface / Java v17 / Spring v3" "FashionprofileRepository,Repository"
                    fashionprofileQuery = component "Fashionprofile Query" "Query for read entity perfil de moda" "Record" "CourseQuery, Query"
                    fashionprofileCommand = component "Fashionprofile Command" "Command for create, update and delete entity perfil de moda" "Record" "FashionprofileCommand, Command"
                    fashionprofileCommandService = component "Fashionprofile CommandService" "Business Logic de la Gestion del perfil de moda" "Class / Java v17 / Spring v3" "FashionprofileCommandService,Service"
                    fashionprofileQueryService = component "Fashionprofile QueryService" "Business Logic del query del perfil de moda" "Class / Java v17 / Spring v3" "FashionprofileQueryService,Service"
             }
             
            fashionprofileController = component "Fashion profile  Controller" "Class que contiene los perfiles de moda" "Class/ Java v17 / Spring v3" "FashionprofileController,Controller"
            buysuggestionController = component "Buy suggestion Controller" "Api RESTfull Controller class de recomendación de prendas" "Class / Java v17 / Spring v3" "BuysuggstionController,Controller"
            apiGateway -> fashionprofileController "Endpoint request - SuggestionsCombinations" "HTTP(S) / JSON"
            apiGateway -> buysuggestionController "Endpoint request - SuggestionsCombinations" "HTTP(S) / JSON"
            
         }
            puncharsingProcessBC = container "Purchasing process Bounded Context" "Api RESTful of Purchasing process" "Class / Java v17 / Spring v3" "PuncharsingProcessBC,BoundedContext"{
            
            group "CarritoVirtual"{
                CarritoVirtualEntity = component "CarritoVirtual Entity" "Clase donde se agregan prendas" "CarritoVirtualEntity,Entity"
                CarritoVirtualRepository = component "CarritoVirtual Repository" "Repository Interface de CarritoVirtual Entity" "Interface / Java v17 / Spring v3" "CarritoVirtualRepository,Repository"
                CarritoVirtualQuery = component "CarritoVirtual Query" "Query for read entity CarritoVirtual" "Record" "CarritoVirtualQuery, Query"
                CarritoVirtualCommand = component "CarritoVirtual Command" "Command for create, update and delete entity CarritoVirtual" "Record" "CarritoVirtualCommand, Command"
                CarritoVirtualCommandService = component "CarritoVirtual CommandService" "Business Logic de la Gestion del CarritoVirtual" "Class / Java v17 / Spring v3" "CarritoVirtualCommandService,Service"
                CarritoVirtualQueryService = component "CarritoVirtual QueryService" "Business Logic del query del Recomendación" "Class / Java v17 / Spring v3" "CarritoVirtualQueryService,Service"
                
            }
            
            group "TiendasDisponibles"{
                TiendasDisponiblesEntity = component "TiendasDisponibles Entity" "Class que contiene las TiendasDisponibles del carrito de compra" "Class" "TiendasDisponiblesEntity,Entity"
                TiendasDisponiblesRepository = component "TiendasDisponibles Repository" "Repository Interface de TiendasDisponibles Entity" "Interface / JJava v17 / Spring v3" "TiendasDisponiblesRepository,Repository"
            }
            
            group "Correo"{
                CorreoEntity = component "Correo Entity" "Class que contiene los Correos enviados del carrito virtual" "Class" "CorreoEntity,Entity"
                CorreoRepository = component "Correo Repository" "Repository Interface de Correo Entity" "Interface / Java v17 / Spring v3" "CorreoRepository,Repository"
            }
            
            group "Recomendacion"{
                RecomendacionEntity = component "Recomendacion Entity" "Clase donde se recomienda prendas" "InventarioEntity,Entity"
                RecomendacionRepository = component "Recomendacion Repository" "Repository Interface de Recomendación Entity" "Interface / Java v17 / Spring v3" "RecomendacionRepository,Repository"
                RecomendacionQuery = component "Recomendacion Query" "Query for read entity Recomendación" "Record" "InventarioQuery, Query"
                RecomendacionCommand = component "Recomendacion Command" "Command for create, update and delete entity Recomendación" "Record" "RecomendacionCommand, Command"
                RecomendacionCommandService = component "Recomendacion CommandService" "Business Logic de la Gestion del Recomendación" "Class / Java v17 / Spring v3" "RecomendacionCommandService,Service"
                RecomendacionQueryService = component "Recomendacion QueryService" "Business Logic del query del Recomendación" "Class / Java v17 / Spring v3" "RecomendacionQueryService,Service"
                
            }
            group "IA_"{
                 IA_Entity = component "IA_ Entity" "Class que contiene las Prendas de la Recomendacion" "Class" "IA_Entity,Entity"
                 IA_Repository = component "IA_ Repository" "Repository Interface de Prenda Entity" "Interface / Java v17 / Spring v3" "IA_Repository,Repository"
            }
            
            
             RecomendacionController = component "Recomendacion Controller" "Api RESTfull Controller class del Inventario" "Class / Java v17 / Spring v3" "RecomendacionController,Controller"
             CarritoVirtualController = component  "CarritoVirtual Controller" "Api RESTfull Controller class del Perfil" "Class / Java v17 / Spring v3 "CarritoVirtualController,Controller"
         }
         //ERIC//    
    }
    
    cameraApp = softwareSystem "Camera App" "Application where the client uploads their clothes" "Camera App"
    galeryApp = softwareSystem "Galery App" "Application where the user searches for their clothes if they already have them saved" "Galery App"
    outlookApp = softwareSystem "Outlook App" "Application used to send messages via email" "Outlook App"

    yape = softwareSystem "Yape" "Method in which the user pays for the clothes they are going to buy." "Yape"
    niubiz = softwareSystem "Niubiz" "Method in which the user pays for the clothes they are going to buy." "Niubiz"
    culqui = softwareSystem "Culqui" "Method in which the user pays for the clothes they are going to buy." "Culqui"
    pagoEfectivo = softwareSystem "Pago Efectivo" "Method in which the user pays for the clothes they are going to buy." "Pago Efectivo"

    client -> trendyYouthSystem "Use the app to find the matching item"
    
    trendyYouthSystem -> cameraApp "Use the app to upload your clothes." 
    trendyYouthSystem -> galeryApp "Use the app to search for your clothes." 
    trendyYouthSystem -> yape "Use it to pay for the clothes he chose." 
    trendyYouthSystem -> niubiz "Use it to pay for the clothes he chose."
    trendyYouthSystem -> culqui "Use it to pay for the clothes he chose." 
    trendyYouthSystem -> pagoEfectivo "Use it to pay for the clothes he chose." 
    trendyYouthSystem -> outlookApp "Used to send messages by mail" 

    client -> mobileApp "Search for the garment through the application"
     user -> mobileApp "Uses the application to search for clothes without the need to buy anything "
    mobileApp -> apiGateway "Makes API calls to" " "
    
    apiGateway -> loginBC "Endpoint call"
    apiGateway -> personalManagementBC "Endpoint call"
    apiGateway -> outfitManagementBC "Endpoint call"
    apiGateway -> outfitGenerationBC "Endpoint call"
    apiGateway -> suggestionsCombinationsBC "Endpoint call"
    apiGateway -> puncharsingProcessBC "Endpoint call"
    
    loginBC -> database "Store, get, update and delete record" 
    personalManagementBC -> database "Store, get, update and delete record"
    outfitManagementBC -> database "Store, get, update and delete record"
    outfitGenerationBC -> database "Store, get, update and delete record"
    suggestionsCombinationsBC -> database "Store, get, update and delete record"
    puncharsingProcessBC -> database "Store, get, update and delete record"

    puncharsingProcessBC -> yape "Endpoint call" "JSON / HTTPS"
    puncharsingProcessBC -> niubiz "Endpoint call" "JSON / HTTPS "
    puncharsingProcessBC -> culqui "Endpoint call" "JSON / HTTPS "
    puncharsingProcessBC -> pagoEfectivo "Endpoint call" "JSON / HTTPS "
    personalManagementBC -> cameraApp "Endpoint call" "JSON / HTTPS"
    personalManagementBC -> galeryApp "Endpoint call" "JSON / HTTPS"
    loginBC -> outlookApp "Endpoint call" "JSON / HTTPS"
    
     apiGateway -> RegistroUserController "Endpoint request - RegistroUser" "HTTP(S) / JSON"
    apiGateway -> UserConfigController "Endpoint request - UserConfig" "HTTP(S) / JSON"
        apiGateway -> UsuarioController "Endpoint request - Usuario" "HTTP(S) / JSON"

     RegistroUserController -> RegistroUserCommandService "Call service method"
            RegistroUserController -> RegistroUserQueryService "Call service method"
            
            RegistroUserCommandService -> RegistroUserCommand "Handle command"
            RegistroUserCommandService -> RegistroUserRepository "Call repository method"
            RegistroUserCommandService -> RegistroUserEntity "Use entity"
            
            RegistroUserQueryService -> RegistroUserQuery "Handle query"
            RegistroUserQueryService -> RegistroUserRepository "Call repository method"
            RegistroUserQueryService -> RegistroUserEntity "Use entity"
            
           RegistroUserRepository -> RegistroUserEntity "Methods call" "POO"
            RegistroUserRepository -> database "Store, update, delete and fetch records - course" "Database Transaction"
            
            # Relationships Usuario group 
            UsuarioController -> UsuarioCommandService "Call service method"
            UsuarioController -> UsuarioQueryService "Call service method"
            
            UsuarioCommandService -> UsuarioCommand "Handle command"
            UsuarioCommandService -> UsuarioRepository "Call repository method"
            UsuarioCommandService -> UsuarioEntity "Use entity"
            
            UsuarioQueryService -> UsuarioCommand "Handle query"
            UsuarioQueryService -> UsuarioRepository "Call repository method"
            UsuarioQueryService -> UsuarioEntity "Use entity"
            UsuarioQueryService -> UsuarioQuery "Handle query"
            UsuarioRepository -> UsuarioEntity "Methods call" "POO"
            UsuarioRepository -> database "Store, update, delete and fetch records - Usuario" "Database Transaction"
    
             # Relationships UserConfig group 
           UserConfigController -> UserConfigCommandService "Call service method"
            UserConfigController -> UserConfigQueryService "Call service method"
            
            UserConfigCommandService -> UserConfigCommand "Handle command"
            UserConfigCommandService -> UserConfigRepository "Call repository method"

            UserConfigQueryService -> UserConfigQuery "Handle query"
            UserConfigQueryService -> UserConfigRepository "Call repository method"

            UserConfigRepository -> database "Store, update, delete and fetch records - syllabus" "Database Transaction"
                InventarioRepository -> InventarioEntity "Methods all" "POO"
    
    
    #Relaciones
     # Relationships buysuggestion group 
            buysuggestionController -> buysuggestionCommandService "Call service method"
            buysuggestionController -> buysuggestionQueryService "Call service method"
            
            buysuggestionCommandService -> buysuggestionCommand "Handle command"
            buysuggestionCommandService -> buysuggestionRepository "Call repository method"
            buysuggestionCommandService -> buysuggestionEntity "Use entity"
            
            buysuggestionQueryService -> buysuggestionQuery "Handle query"
            buysuggestionQueryService -> buysuggestionRepository "Call repository method"
            buysuggestionQueryService -> buysuggestionEntity "Use entity"
            
            buysuggestionRepository -> buysuggestionEntity "Methods call" "POO"
            buysuggestionRepository -> database "Store, update, delete and fetch records - course" "Database Transaction"
            
    # Relationships fhasionprofile group 
            fashionprofileController -> fashionprofileCommandService "Call service method"
            fashionprofileController -> fashionprofileQueryService "Call service method"
            
            fashionprofileCommandService -> fashionprofileCommand "Handle command"
            fashionprofileCommandService -> fashionprofileRepository "Call repository method"
            fashionprofileCommandService -> fashionprofileEntity "Use entity"
            
            fashionprofileQueryService -> fashionprofileQuery "Handle query"
            fashionprofileQueryService -> fashionprofileRepository "Call repository method"
            fashionprofileQueryService -> fashionprofileEntity "Use entity"
            
            fashionprofileRepository -> fashionprofileEntity "Methods call" "POO"
            fashionprofileRepository -> database "Store, update, delete and fetch records - syllabus" "Database Transaction"
    
         //ERIC//
    apiGateway -> RecomendacionController "Endpoint request - Inventario" "HTTP(S) / JSON"
    apiGateway -> CarritoVirtualController "Endpoint request - Inventario" "HTTP(S) / JSON"
        RecomendacionController -> RecomendacionCommandService "Call service method"
        RecomendacionController -> RecomendacionQueryService "Call service method"
        RecomendacionCommandService -> RecomendacionCommand "Handle command"
        RecomendacionCommandService -> RecomendacionRepository "Call repository method"
        RecomendacionCommandService -> RecomendacionEntity "Use entity"
        RecomendacionQueryService -> RecomendacionQuery "Handle query"
        RecomendacionQueryService -> RecomendacionRepository "Call repository method"
        RecomendacionQueryService -> RecomendacionEntity "Use entity"
        
        RecomendacionRepository -> RecomendacionEntity "Methods Call POO"
        
        RecomendacionCommandService -> IA_Repository "Call repository method"
        RecomendacionCommandService -> IA_Entity "Use entity"
        RecomendacionQueryService -> IA_Repository "Call repository method"
        RecomendacionQueryService -> IA_Entity "Use entity"
       IA_Repository -> IA_Entity "Methods call" "POO"
        IA_Repository -> database "Store, update, delete and fetch records - book" "Database Transaction"
        
        CarritoVirtualController -> CarritoVirtualCommandService "Call service method"
        CarritoVirtualController -> CarritoVirtualQueryService "Call service method"
        CarritoVirtualCommandService -> CarritoVirtualCommand "Handle command"
        CarritoVirtualCommandService -> CarritoVirtualRepository "Call repository method"
        CarritoVirtualCommandService -> CarritoVirtualEntity "Use entity"
        CarritoVirtualQueryService -> CarritoVirtualQuery "Handle query"
        CarritoVirtualQueryService -> CarritoVirtualRepository "Call repository method"
        CarritoVirtualQueryService -> CarritoVirtualEntity "Use entity"
        
        CarritoVirtualRepository -> CarritoVirtualEntity "Methods Call POO"
        
        CarritoVirtualCommandService -> TiendasDisponiblesRepository "Call repository method"
        CarritoVirtualCommandService -> TiendasDisponiblesEntity "Use entity"
        CarritoVirtualQueryService -> TiendasDisponiblesRepository "Call repository method"
        CarritoVirtualQueryService -> TiendasDisponiblesEntity "Use entity"
        CarritoVirtualRepository -> TiendasDisponiblesEntity "Methods call" "POO"
        CarritoVirtualRepository -> database "Store, update, delete and fetch records - book" "Database Transaction"
        TiendasDisponiblesRepository -> TiendasDisponiblesEntity "Methods call" "POO"
        TiendasDisponiblesRepository -> database "Store, update, delete and fetch records - book" "Database Transaction"
        
        CarritoVirtualCommandService -> CorreoRepository "Call repository method"
        CarritoVirtualCommandService -> CorreoEntity "Use entity"
        CarritoVirtualQueryService -> CorreoRepository "Call repository method"
        CarritoVirtualQueryService -> CorreoEntity "Use entity"
        CarritoVirtualRepository -> CorreoEntity "Methods call" "POO"
      
        CorreoRepository -> CorreoEntity "Methods call" "POO"
        CorreoRepository -> database "Store, update, delete and fetch records - book" "Database Transaction"
    //-------ERIC//
    
        
        apiGateway -> InventarioController "Endpoint request - Prenda" "HTTP(S) / JSON"
    apiGateway -> PerfilController "Endpoint request - Prenda" "HTTP(S) / JSON"
        InventarioController -> InventarioCommandService "Call service method"
        InventarioController -> InventarioQueryService "Call service method"
        InventarioCommandService -> InventarioCommand "Handle command"
        InventarioCommandService -> InventarioRepository "Call repository method"
        InventarioCommandService -> InventarioEntity "Use entity"
        InventarioQueryService -> InventarioQuery "Handle query"
        InventarioQueryService -> InventarioRepository "Call repository method"
        InventarioQueryService -> InventarioEntity "Use entity"
        
        PerfilController -> PerfilCommandService "Call service method"
            PerfilController -> PerfilQueryService "Call service method"
            
            PerfilCommandService -> PerfilCommand "Handle command"
            PerfilCommandService -> PerfilRepository "Call repository method"
            PerfilCommandService -> PerfilEntity "Use entity"
               PerfilQueryService -> PerfilQuery "Handle query"
            PerfilQueryService -> PerfilRepository "Call repository method"
            PerfilQueryService -> PerfilEntity "Use entity"
            
    
          PerfilRepository -> PerfilEntity "Use Entity"
          PerfilCommandService -> IARepository "Call repository method"
            PerfilCommandService -> IAEntity "Use entity"
            PerfilQueryService -> IARepository "Call repository method"
            PErfilQueryService -> IAEntity "Use entity"
            InventarioRepository -> IAEntity "Use entity"
            IARepository -> IAentity "Use entity"
        InventarioRepository -> database "Store, get, update and delete record""
        PerfilRepository -> database "Store, get, update and delete record""
    }

    views {
        systemContext trendyYouthSystem "TrendyYouthSystem" {
        include * 
        autoLayout tb
        }
        
        container trendyYouthSystem "Containers" {
        include *
        autoLayout tb
        }
        
        component suggestionsCombinationsBC "SuggestionsCombinationsBC"  {
        include *
        autoLayout tb
        }
        
        component outfitgenerationBC "oufitGenerationBC"  {
            include *
            autoLayout tb
        }
        
        component puncharsingProcessBC "puncharsingProcessBC"{
            include *
            autoLayout tb
        }
        
        component loginBC "loginBc" {
            include *
            autoLayout tb
        }
        
        component outfitManagementBC "Component" {
        include *
        autoLayout
        }
        component personalManagementBC "personalManagementBC" {
            include *
            autoLayout 
        }
                
                
      styles {
            element "Person" {
                shape Person
                background #5F04B4
                color #FFFFFF
            }
            element "Container" {
                background #002A8D
                color #FFFFFF
            }
            element "BoundedContext" {
                shape Component
            }
            element "MobileApp" {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element "ApiGateway" {
                shape Pipe
                background #884A39                
            }
            element "Database" {
                shape Cylinder
                background #CF0A0A
            }
            element "ComponentBC" {
                shape Component
                background #511991
                color #FFFFFF
            }
            element "Service" {
                shape Component
                background #169923
                color #FFFFFF
            }
            element "Repository" {
                shape Diamond
                background #F0EB0A
            }
            element "Command" {
                shape Circle
                background #C22777
                color #FFFFFF
            }
            element "Query" {
                shape Ellipse
                background #42B8C2
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