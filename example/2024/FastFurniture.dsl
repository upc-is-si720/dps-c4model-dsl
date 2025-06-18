workspace "FastFurniture" "Aplicación de compra de muebles y complementos para el hogar" {

    model {
        comprador = person "Comprador Comun" "Persona quien compra los muebles de manera común" "Comprador"
        compradorGrande = person "Comprador por mayor" "Persona quien compra los muebles para su distribución" "CompradorGrande"
           
        programa = softwareSystem "Fast Furniture" "Sistema de compra de muebles y complementos para el hogar" "Programa" {
            
            mobileApp = container "MobileApp" "Mobile App para Compras" "Android / Kotlin v2.0.0" "MobileApp"
            webApp = container "Web Application" "Simple-Page Application para compras" "React v18.2.0 / ECMAScript 2020" "WebApp"
            apiGateway = container "api Gateway" "Gestiona las peticiones HTTP" "Azure API Management" "ApiGateway"    
            
            dimesionesSugerenciasBC = container "Dimensiones de Sugerencia Bounded Context" "Permite registrar las dimensiones de los muebles" "Laravel v10 / PHP v8.2.24" "DimensionesSugerenciasBC,BoundedContext"{
            medidacontroller = component "Medida Controller" "RESTful API Controller class del Medidas" "Laravel v10 / PHP v8.2.24" "MedidaController,Controller"
             group "Medida" {
                 MedidaRepository = component "medida Repository" "Repository interface de medida" "Interface / Laravel v10 / PHP v8.2.24" "MedidaRepository,Repository"
                  MedidaQuery = component "medida Query" "Query for read Medida" "Record" "MedidaQuery, Query"
                   MedidaCommand = component "medida Command" "Command for create, update and delete medida" "Record" "MedidaCommand, Command"
                    MedidaCommandService = component "medida CommandService" "Business Logic del Command del medida" "Class / Laravel v10 / PHP v8.2.24" "MedidaCommandService,Service"
                    MedidaQueryService = component "Medida QueryService" "Business Logic del query de la Medida" "Class / Laravel v10 / PHP v8.2.24" "MedidaQueryService,Service"
                               MedidaEntity = component "Medida Entity" "Container class for Medida" "Class" "Entity"
                             }
                             
                             group "Avanzada"{
                  AvanzadaRepository = component "OpcionesAvanzadas Repository" "Repository Interface Opciones Avanzadas Entity" "Interface" "comando1"
                    AvanzadaEntity = component "Opciones Avanzadas Entity" "Container class for OpcionesAvanzadas " "Class" "Entity"
              } 
                   group "inboundservices"{
                VerificarContextFacade = component "Verificar ContextFacade " "Facade Bussines Logic de Dimensiones Sugerencias"  "Class / Laravel v10 / PHP v8.2.24" "VerificarContextFacade,ContextFacade"
            }
             group "outboundservices" {
                    GaleriaExternalService = component "galeria ExternalService" "External Business Logic de Calculo de medidas" "Class / Laravel v10 / PHP v8.2.24" "GaleriaApiExternalService,ExternalService"
                  CamaraExternalService = component "Camara Api ExternalService" "External Business Logic de Calculo de medidas manual" "Class / Laravel v10 / PHP v8.2.24" "CamaraApiExternalService,ExternalService"
                }
                 
      
                             
                }
            generacionSugerenciasBC = container "Generación de Sugerencia Bounded Context" "Gnera las sugerencias de los productos para el usuario" "Laravel v10 / PHP v8.2.24" "GeneracionSugerenciasBC,BoundedContext" {
              Recomendacioncontroller = component "Recomendacion Controller" "RESTful API Controller class de Recomendacion" "Laravel v10 / PHP v8.2.24" "RecomendacionController,Controller"
                    group "outboundservices" {
                    BlenderExternalService = component "BlenderApi ExternalService" "External Business Logic de Generacion de Sugerencias" "Class / Laravel v10 / PHP v8.2.24" "BlenderApiExternalService,ExternalService"
                   CompartirExternalService = component "Mensajeria Api ExternalService" "External Business Logic de Generacion de Sugerencias" "Class / Laravel v10 / PHP v8.2.24" "MensajeriaApiExternalService,ExternalService"
                }
                 group "Recomendacion" {
                 RecomendacionRepository = component "Recomendacion Repository" "Repository interface de Recomendacion" "Interface / Laravel v10 / PHP v8.2.24" "RecomendacionRepository,Repository"
                  RecomendacionQuery = component "Recomendaicon Query" "Query for read Recomendacion" "Record" "RecomendacionQuery, Query"
                   RecomendacionCommand = component "Recomendacion Command" "Command for create, update and delete Recomendacion" "Record" "RecomendacionCommand, Command"
                    RecomendacionCommandService = component "Recomendacion CommandService" "Business Logic del Command de Recomendacion" "Class / Laravel v10 / PHP v8.2.24" "RecomendacionCommandService,Service"
                    RecomendacionQueryService = component "Recomendacion QueryService" "Business Logic del query de Recomendacion" "Class / Laravel v10 / PHP v8.2.24" "RecomendacionQueryService,Service"
                 RecomendacionEntity = component "Recomendacion Entity" "Container class for Recomendacion" "Class" "Entity"
                             }
                 group "inboundservices"{
                AlgoritmoContextFacade = component "Algoritmo ContextFacade " "Facade Bussines Logic de Generacion para sugerencias"  "Class / Laravel v10 / PHP v8.2.24" "AlgoritmoContextFacade,ContextFacade"
            }
             group "MedidaR" {
                MedidaRcontroller = component "Medida Controller" "RESTful API Controller class del Medidas" "Laravel v10 / PHP v8.2.24" "MedidaController,Controller"
                 MedidaRRepository = component "medida Repository" "Repository interface de medida" "Interface / Laravel v10 / PHP v8.2.24" "MedidaRepository,Repository"
                  MedidaRQuery = component "medida Query" "Query for read Medida" "Record" "MedidaQuery, Query"
                   MedidaRCommand = component "medida Command" "Command for create, update and delete medida" "Record" "MedidaCommand, Command"
                    MedidaRCommandService = component "medida CommandService" "Business Logic del Command del medida" "Class / Laravel v10 / PHP v8.2.24" "MedidaCommandService,Service"
                    MedidaRQueryService = component "Medida QueryService" "Business Logic del query de la Medida" "Class / Laravel v10 / PHP v8.2.24" "MedidaQueryService,Service"
                               MedidaREntity = component "Medida Entity" "Container class for Medida" "Class" "Entity"
                             }
            
                
                
                
            }
            carritoComprasBC = container "Carrito de Compras Bounded Context" "Permite registrar las dimensiones de los muebles" "Laravel v10 / PHP v8.2.24" "CarritoComprasBC,BoundedContext" {
             carritoController = component "Carrito Controller" "RESTful API Controller class del Cart" "Laravel v10 / PHP v8.2.24" "CarritoController,Controller"
                group "Carrito"  {
                    carritoRepository = component "Carrito Repository" "Repository Interface del Carrito" "Interface / Laravel v10 / PHP v8.2.24" "CarritoRepository,Repository"
                    carritoQuery = component "Carrito Query" "Query for read Carrito" "Record" "CarritoQuery, Query"
                    carritoCommand = component "Carrito Command" "Command for create, update and delete Carrito" "Record" "CarritoCommand, Command"
                    carritoCommandService = component "Carrito CommandService" "Business Logic del Command del Carrito" "Class / Laravel v10 / PHP v8.2.24" "CarritoCommandService,Service"
                    carritoQueryService = component "Carrito QueryService" "Business Logic del query del Carrito" "Class / Laravel v10 / PHP v8.2.24" "CarritoQueryService,Service"
                    
                }
                group "CarritoItem" {
                    carritoItemQuery = component "CarritoItem Query" "Query for read CarritoItem" "Record" "CarritoItemQuery, Query"
                    carritoItemCommand = component "CarritoItem Command" "Command for create, update and delete CarritoItem" "Record" "CarritoItemCommand, Command"
                }
                group "outboundservices" {
                    customerExternalService = component "Customer ExternalService" "External Business Logic de cliente" "Class / Laravel v10 / PHP v8.2.24" "CustomerExternalService,ExternalService"
                }
                group "inboundservices" {
                    customerContextFacade = component "Cart ContextFacade" "Facade Business Logic de carrito de compras" "Class / Laravel v10 / PHP v8.2.24" "CartContextFacade,ContextFacade"
                }
            }
            
            procesoCompraBC = container "Proceso de Compras Bounded Context" "Permite registrar las dimensiones de los muebles" "Laravel v10 / PHP v8.2.24" "ProcesoCompraBC,BoundedContext" {
                procesoCompraController = component "ProcesoCompra Controller" "RESTful API Controller class del ProcesoCompra" "Class / Laravel v10 / PHP v8.2.24" "ProcesoCompraController,Controller"
                customerController = component "Customer Controller" "RESTful API Controller class del Customer" "Class / Laravel v10 / PHP v8.2.24" "CustomerController,Controller"
                group "Payment" {
                    procesoCompraRepository = component "Payment Repository" "Repository Interface de ProcesoCompra" "Interface / Laravel v10 / PHP v8.2.24" "ProcesoCompraRepository,Repository"
                    procesoCompraQuery = component "Payment Query" "Query for read Payment" "Record" "PaymentQuery, Query"
                    procesoCompraCommand = component "Payment Command" "Command for create, update and delete Payment" "Record" "PaymentCommand, Command"
                    procesoCompraCommandService = component "Payment CommandService" "Business Logic del Command del Payment" "Class / Laravel v10 / PHP v8.2.24" "PaymentCommandService,Service"
                    procesoCompraQueryService = component "Payment QueryService" "Business Logic del query del Payment" "Class / Laravel v10 / PHP v8.2.24" "PaymentQueryService,Service"
                }
                group "Customer" {
                    customerRepository = component "Customer Repository" "Repository Interface de Customer" "Interface / Laravel v10 / PHP v8.2.24" "CustomerRepository,Repository"
                    customerQuery = component "Customer Query" "Query for read Customer" "Record" "CustomerQuery, Query"
                    customerCommand = component "Customer Command" "Command for create, update and delete Customer" "Record" "CustomerCommand, Command"
                    customerCommandService = component "Customer CommandService" "Business Logic del Command del Customer" "Class / Laravel v10 / PHP v8.2.24" "CustomerCommandService,Service"
                    customerQueryService = component "Customer QueryService" "Business Logic del query del Customer" "Class / Laravel v10 / PHP v8.2.24" "CustomerQueryService,Service"
                }
                group "Sale" {
                    saleRepository = component "Sale Repository" "Repository Interface de Sale" "Interface / Laravel v10 / PHP v8.2.24" "SaleRepository,Repository"
                    saleQuery = component "Sale Query" "Query for read Sale" "Record" "SaleQuery, Query"
                    saleCommand = component "Sale Command" "Command for create, update and delete Sale" "Record" "SaleCommand, Command"
                    saleCommandService = component "Sale CommandService" "Business Logic del Command del Sale" "Class / Laravel v 10 / PHP v8.2.24" "SaleCommandService,Service"
                    saleQueryService = component "Sale QueryService" "Business Logic del query del Sale" "Class / Laravel v10 / PHP v8.2.24" "SaleQueryService,Service"
                }
                group "SaleItem" {
                    saleItemQuery = component "SaleItem Query" "Query for read SaleItem" "Record" "SaleItemQuery, Query"
                    saleItemCommand = component "SaleItem Command" "Command for create, update and delete SaleItem" "Record" "SaleItemCommand, Command"
                }
                group "outboundservices" {
                    deliveryExternalService = component "Delivery ExternalService" "External Business Logic de entrega de productos" "Class / Laravel v10 / PHP v8.2.24" "DeliveryExternalService,ExternalService"
                    culquiApiExternalService = component "Culqui Api ExternalService" "External Business Logic de pago mediante billetera electrónica: yape y plin" "Class / Laravel v10 / PHP v8.2.24" "WalletApiExternalService,ExternalService"
                }
                group "inboundservices" {
                    saleContextFacade = component "Sale ContextFacade" "Facade Business Logic de venta de productos" "Class / Laravel v10 / PHP v8.2.24" "SaleContextFacade,ContextFacade"
                }
            }
            gestionAlmacenFabricadoBC = container "Gestión de al Almacén Personal para Fabricado Bounded Context" "Permite registrar las dimensiones de los muebles" "Laravel v10 / PHP v8.2.24" "GestionAlmacenFabricadoBC,BoundedContext" {
               FabController = component "Fabricado Controller" "RESTful API Controller class de Fabricado" "Laravel v10 / PHP v8.2.24" "FabricadoController,Controller"
                group "Almacen"{ 
                  Alcontroller = component "Almacen Controller" "RESTful API Controller class de Almacen" "Laravel v10 / PHP v8.2.24" "AlmacenController,Controller"
                 AlRepository = component "Almacen Repository" "Repository interface de Almacen" "Interface / Laravel v10 / PHP v8.2.24" "AlmacenRepository,Repository"
                  AlQuery = component "Almacen Query" "Query for read Medida" "Record" "AlmacenQuery, Query"
                   AlCommand = component "Almacen Command" "Command for create, update and delete Almacen" "Record" "AlmacenCommand, Command"
                    AlCommandService = component "Almacen CommandService" "Business Logic del Command del Almacen" "Class / Laravel v10 / PHP v8.2.24" "AlmacenCommandService,Service"
                    AlQueryService = component "Almacen QueryService" "Business Logic del query de Almacen" "Class / Laravel v10 / PHP v8.2.24" "AlmacenQueryService,Service"
                               AlEntity = component "Almacen Entity" "Container class for Almacen " "Class" "Entity"
                }
                
                 FaRepository = component "Fabricado Repository" "Repository interface de Fabricado" "Interface / Laravel v10 / PHP v8.2.24" "RecomendacionRepository,Repository"
                  FaQuery = component "Fabricado Query" "Query for read Fabricado" "Record" "FabricadoQuery, Query"
                   FaCommand = component "Fabricado Command" "Command for create, update and delete Fabricado" "Record" "FabricadoCommand, Command"
                    FaCommandService = component "Fabricado CommandService" "Business Logic del Command de Fabricado" "Class / Laravel v10 / PHP v8.2.24" "FabricadoCommandService,Service"
                    FaQueryService = component "Fabricado QueryService" "Business Logic del query de Fabricado" "Class / Laravel v10 / PHP v8.2.24" "FabricadoQueryService,Service"
                 FaEntity = component "Fabricado Entity" "Container class for Fabricado" "Class" "Entity"
                
                
                
                
                
    
            
            }
            
            procesoFabricadoBC = container "Proceso de Fabricado Bounded Context" "Permite registrar las dimensiones de los muebles" "Laravel v10 / PHP v8.2.24" "ProcesoFabricadoBC,BoundedContext"{
                       Fabricadocontroller = component "Fabricado Controller" "RESTful API Controller class de Fabricado" "Laravel v10 / PHP v8.2.24" "FabricadoController,Controller"
                    group "outboundservices" {
                    Blender3dExternalService = component "BlenderApi ExternalService" "External Business Logic de Proceso de Fabricado" "Class / Laravel v10 / PHP v8.2.24" "BlenderApiExternalService,ExternalService"
                }
                 group "Fabricado" {
                  FabRepository = component "Fabricado Repository" "Repository interface de Fabricado" "Interface / Laravel v10 / PHP v8.2.24" "RecomendacionRepository,Repository"
                  FabQuery = component "Fabricado Query" "Query for read Fabricado" "Record" "FabricadoQuery, Query"
                   FabCommand = component "Fabricado Command" "Command for create, update and delete Fabricado" "Record" "FabricadoCommand, Command"
                    FabCommandService = component "Fabricado CommandService" "Business Logic del Command de Fabricado" "Class / Laravel v10 / PHP v8.2.24" "FabricadoCommandService,Service"
                    FabQueryService = component "Fabricado QueryService" "Business Logic del query de Fabricado" "Class / Laravel v10 / PHP v8.2.24" "FabricadoQueryService,Service"
                 FabEntity = component "Fabricado Entity" "Container class for Fabricado" "Class" "Entity"
                             }
                 group "inboundservices"{
                AlmacenPersonalContextFacade = component "AlmacenPersonal ContextFacade " "Facade Bussines Logic de Proceso Fabricado"  "Class / Laravel v10 / PHP v8.2.24" "ProcesoFabricadoContextFacade,ContextFacade"
            }
            group "medidas" {
                 medidasComand = component " medida Command " "Command for create,update and delete medidas " "Record"  "MedidaCommand,Command "
                  medidasRepository = component "medidasRepository" "Repository Interface medidas Entity" "Interface" "comando1"
                  medidasQuery = component "medidasQuery" "Query for read medidas" "Record" "medidasQuery, Query"
                    medidasEntity = component "medidas Entity" "Container class for medidas " "Class" "Entity"
              } 
            
            }
            
            recomendacionComplementosBC = container "Recomendaciones de Complementos Bounded Context" "Permite registrar las dimensiones de los muebles" "Laravel v10 / PHP v8.2.24" "RecomendacionComplementosBC,BoundedContext" {
                recomendacionComplementocontroller = component "Recomendacion Complemento Controller" "RESTful API Controller class de Recomendacion Complemento" "Laravel v10 / PHP v8.2.24" "RecomendacionComplementoController,Controller"
                group "Recomendacion" {
                    recomendacionComplementoRepository = component "Recomendacion Complementos Repository" "Repository interface de Recomendacion" "Interface / Laravel v10 / PHP v8.2.24" "RecomendacionRepository,Repository"
                    recomendacionComplementoQuery = component "Recomendaicon Complementos Query" "Query for read Recomendacion" "Record" "RecomendacionQuery, Query"
                    recomendacionComplementoCommand = component "Recomendacion Complementos Command" "Command for create, update and delete Recomendacion" "Record" "RecomendacionCommand, Command"
                    recomendacionComplementoCommandService = component "Recomendacion Complementos CommandService" "Business Logic del Command de Recomendacion" "Class / Laravel v10 / PHP v8.2.24" "RecomendacionCommandService,Service"
                    recomendacionComplementoQueryService = component "Recomendacion Complementos QueryService" "Business Logic del query de Recomendacion" "Class / Laravel v10 / PHP v8.2.24" "RecomendacionQueryService,Service"
                    recomendacionComplementoEntity = component "Recomendacion Complementos Entity" "Container class for Recomendacion" "Class" "Entity"
                }
                
            }
            gestionMueblesEscogidosBC = container "Gestion de Muebles Escogidos Bounded Context" "Permite registrar las dimensiones de los muebles" "Laravel v10 / PHP v8.2.24" "GestionMueblesEscogidosBC,BoundedContext" 
        
            gestionAlmacenComunesBC = container "Gestion de Almacen Personal para Muebles Comunes Bounded Context" "Permite registrar las dimensiones de los muebles" "Laravel v10 / PHP v8.2.24" "GestionAlmacenComunesBC,BoundedContext" {
               Mueblecontroller = component "Mueble Controller" "RESTful API Controller class de mueble" "Laravel v10 / PHP v8.2.24" "muebleController,Controller"
                  group "AlmacenC"{ 
                  AcController = component "Almacen Controller" "RESTful API Controller class de Almacen" "Laravel v10 / PHP v8.2.24" "AlmacenController,Controller"
                 AcRepository = component "Almacen Repository" "Repository interface de Almacen" "Interface / Laravel v10 / PHP v8.2.24" "AlmacenRepository,Repository"
                  AcQuery = component "Almacen Query" "Query for read Medida" "Record" "AlmacenQuery, Query"
                   AcCommand = component "Almacen Command" "Command for create, update and delete Almacen" "Record" "AlmacenCommand, Command"
                    AcCommandService = component "Almacen CommandService" "Business Logic del Command del Almacen" "Class / Laravel v10 / PHP v8.2.24" "AlmacenCommandService,Service"
                    AcQueryService = component "Almacen QueryService" "Business Logic del query de Almacen" "Class / Laravel v10 / PHP v8.2.24" "AlmacenQueryService,Service"
                               AcEntity = component "Almacen Entity" "Container class for Almacen " "Class" "Entity"
                }
                group "comun"{
                        ComunComand = component "mueble Comun " "Command for create,update and delete mueble " "Record"
                        ComunRepository = component "muebleComun Repository" "Repository Interface  MuebleComun Repository" "Interface" "comando1"
                }
            
                
            }
            
            group "Databases" {
                dimesionesSugerenciasDB = container "Dimensiones de Sugerencias Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "DimensionesSugerenciasDB,Database"
                generacionSugerenciasDB = container "Generación de Sugerencia Bounded Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "GeneracionSugerenciasDB,Database"
                carritoComprasDB = container "Carrito de Compras Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "CarritoComprasDB,Database"
                procesoCompraDB = container "Proceso de Compras Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "ProcesoCompraDB,Database"
                gestionAlmacenFabricadoDB = container "Gestión de al Almacén Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "GestionAlmacenFabricadoDB,Database"
                procesoFabricadoDB = container "Proceso de Fabricado Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "ProcesoFabricadoDB,Database"
                recomendacionComplementosDB = container "Recomendaciones de Complementos Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "RecomendacionComplementosDB,Database"
                gestionMueblesEscogidosDB = container "Gestion de Muebles Escogidos Bounded Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "GestionMueblesEscogidosDB,Database"
                gestionAlmacenComunesDB = container "Gestion de Almacen Personal para Muebles Comunes Database" "Guarda la información de las dimensiones de los muebles " "MongoDB v8.0" "GestionAlmacenComunesDB,Database"
                
            }
            
            
        
        }
        


        camaraApi = softwareSystem "CamaraApi" "Sistema de medición" "CamaraApi" 
        galeriaApi = softwareSystem "GaleriaApi" "Sistema de alamcenaje de fotos" "Galeria Api"
        
        outlookApi = softwareSystem "Outlook API" "Web Service de Outlook, mensajería con el usuario" "OutlookApi"
        culquiApi = softwareSystem "CulquiApi" "Web Service de Culqui, sistema de pagos" "CulquiApi"
        googleMapsApi = softwareSystem "GoogleMapsApi" "Web Service de Google Maps, sistema geoespacial para la ubicacion" "GoogleMapsApi" 
        blenderApi = softwareSystem "BlenderApi" "Aplicación que servirá a la hora de personalizar los muebles" "BlenderApi"
        
        #Relaciones de Contexto
        comprador -> programa "Usa para comprar muebles"
        compradorGrande -> programa "Usa para comprar muebles a una gran escala"
        
                
        #Relaciones entre Componentes
        #Dimensiones para sugerencia 
        apiGateway -> MedidaController "Request GET, POST, PUT, DELETE del endpoint de Dimensiones para sugerencias"
           MedidaController -> MedidaQueryService "Call service method"
        MedidaController -> MedidaCommandService "Call service method"
        
   MedidaQueryService -> MedidaQuery "Handle query"
        MedidaQueryService -> MedidaRepository "Call repository method"
        MedidaQueryService -> AvanzadaRepository "Call repository method"

       MedidaCommandService -> MedidaCommand "Handle command"
        MedidaCommandService -> MedidaRepository "Call repository method"
        MedidaCommandService -> CamaraExternalService "Call external service method"
           MedidaCommandService -> GaleriaExternalService "Call external service method"
           
           CamaraExternalService -> VerificarContextFacade " " "
           GaleriaExternalService -> VerificarContextFacade " "
            AvanzadaRepository -> AvanzadaEntity " ""
              MedidaQueryService -> MedidaEntity  " "
          MedidaCommandService -> MedidaEntity " " "
           MedidaRepository -> MedidaEntity ""
           
           MedidaRepository ->  dimesionesSugerenciasDB  "Call service method"
           
           
           #Generacion para Sugerencia
                 apiGateway -> MedidaRController "Request GET, POST, PUT, DELETE del endpoint de Dimensiones para sugerencias"
           MedidaRController -> MedidaRQueryService "Call service method"
        MedidaRController -> MedidaRCommandService "Call service method"
          MedidaRCommandService -> MedidaRCommand "Handle command"
        MedidaRCommandService -> MedidaRRepository "Call repository method"
        
            MedidaRQueryService -> MedidaRQuery "Handle query"
        MedidaRQueryService -> MedidaRRepository "Call repository method"
           apiGateway -> RecomendacionController "Request GET, POST, PUT, DELETE del endpoint de Dimensiones para sugerencias"
             RecomendacionController -> RecomendacionQueryService "Call service method"
        RecomendacionController -> RecomendacionCommandService "Call service method"
        
            RecomendacionQueryService -> RecomendacionQuery "Handle query"
        RecomendacionQueryService -> RecomendacionRepository "Call repository method"

       RecomendacionCommandService -> RecomendacionCommand "Handle command"
        RecomendacionCommandService -> RecomendacionRepository "Call repository method"
        RecomendacionCommandService -> CompartirExternalService "Call external service method"
           RecomendacionCommandService -> BlenderExternalService "Call external service method"
             MedidaRCommandService -> MedidaREntity " " "
           MedidaRRepository -> MedidaREntity ""
           BlenderExternalService -> AlgoritmoContextFacade " " "
           CompartirExternalService -> AlgoritmoContextFacade " "
         
            RecomendacionCommandService -> MedidaREntity " " "
           RecomendacionRepository -> RecomendacionEntity ""
              MedidaRRepository -> generacionSugerenciasDB  "Call service method"
           RecomendacionRepository ->  generacionSugerenciasDB  "Call service method"
         
           
        #Carrito de Compra
        
        apiGateway -> carritoController "Request GET, POST, PUT, DELETE del endpoint del carrito de compras"

        carritoController -> carritoQueryService "Call service method"
        carritoController -> carritoCommandService "Call service method"

        carritoQueryService -> carritoQuery "Handle query"
        carritoQueryService -> carritoRepository "Call repository method"
        carritoQueryService -> carritoItemQuery "Handle query"

        carritoCommandService -> carritoCommand "Handle command"
        carritoCommandService -> carritoRepository "Call repository method"
        carritoCommandService -> carritoItemCommand "Handle command"
        carritoCommandService -> customerExternalService "Call external service method"

        carritoRepository -> carritoComprasDB "Store, update, delete and fetch records - cart" "SQL transaction"

        customerExternalService -> customerContextFacade "Continuar Compra"
        customerExternalService -> procesoCompraBC "Continuar Compra"
        customerContextFacade -> carritoCommandService "Call service method"
        
        #ProcesoCompra
        
        
        apiGateway -> customerController "Request GET, POST, PUT, DELETE del endpoint del customer"

        customerController -> customerQueryService "Call service method"
        customerController -> customerCommandService "Call service method"

        customerQueryService -> customerQuery "Handle query"
        customerQueryService -> customerRepository "Call repository method"

        customerCommandService -> customerCommand "Handle command"
        customerCommandService -> customerRepository "Call repository method"
        customerCommandService -> procesoCompraCommandService "Call service method"

        customerRepository -> procesoCompraDB "Store, update, delete and fetch records - customer" "SQL transaction"


        apiGateway -> procesoCompraController "Request POST del endpoint del payment"

        procesoCompraController -> procesoCompraQueryService "Call service method"
        procesoCompraController -> procesoCompraCommandService "Call service method"

        procesoCompraQueryService -> procesoCompraQuery "Handle query"
        procesoCompraQueryService -> procesoCompraRepository "Call repository method"

        procesoCompraCommandService -> procesoCompraCommand "Handle command"
        procesoCompraCommandService -> procesoCompraRepository "Call repository method"
        procesoCompraCommandService -> culquiApiExternalService "Call external service method"
        procesoCompraCommandService -> saleCommandService "Call service method"

        procesoCompraRepository -> procesoCompraDB "Store, update, delete and fetch records - payment" "SQL transaction"


        saleQueryService -> saleQuery "Handle query"
        saleQueryService -> saleRepository "Call repository method"
        saleQueryService -> saleItemQuery "Handle query"

        saleCommandService -> saleCommand "Handle command"
        saleCommandService -> saleRepository "Call repository method"
        saleCommandService -> saleItemCommand "Handle command"
        saleCommandService -> deliveryExternalService "Call external service method"

        saleRepository -> procesoCompraDB "Store, update, delete and fetch records - sale" "SQL transaction"

        culquiApiExternalService -> culquiApi "Generación del QR de pago"
        customerContextFacade -> customerCommandService "Call service method"
        saleContextFacade -> saleQueryService "Call service method"
        
    #Proceso Fabricado
              apiGateway -> FabricadoController "Request POST del endpoint del payment"
      FabricadoController -> medidasComand "call service comand"
      FabricadoController -> medidasQuery "query"
        FabricadoController -> FabQueryService "Call service method"
        FabricadoController -> FabCommandService "Call service method"
             FabQuery -> FabEntity ""
        FabQueryService -> FabQuery "Handle query"
        FabQueryService -> FabRepository "Call repository method"

        FabCommandService -> FabCommand "Handle command"
        FabCommandService -> FabRepository "Call repository method"
         FabCommandService -> Blender3dExternalService "Call external service method"
      Blender3dExternalService -> AlmacenPersonalContextFacade " "
       
        medidasComand -> medidasRepository " call repository method""
        medidasQuery -> medidasEntity "call Entity method"
        medidasRepository -> medidasEntity ""
                
           FabCommandService -> medidasEntity " " "
      FabRepository -> FabEntity "Entity"
      
      medidasRepository ->  procesoFabricadoDB "database"
      FabRepository -> procesoFabricadoDB "database"
      #Gestion Almacen Fabricado 
      apiGateway -> FabController " " 
      apiGateway -> AlController " "
      AlController -> AlCommand "call service comand"
      AlController -> FabQuery "query"
        AlController -> AlQueryService "Call service method"
        AlController -> AlCommandService "Call service method"
             AlQuery -> AlEntity ""
        AlQueryService -> AlQuery "Handle query"
        AlQueryService -> AlRepository "Call repository method"

        AlCommandService -> AlCommand "Handle command"
        AlCommandService -> AlRepository "Call repository method"
     
        FabController -> FaCommandService "Handle command"
        FabController -> FaQueryService "Handle Command"
    FaQueryService -> FaQuery  " "
    FaCommandService -> FaCommand " 
        FaCommand -> FaRepository " call repository method""
        FaQuery -> FaEntity "call Entity method"
        FaRepository -> FaEntity ""
                
           FaCommandService -> AlEntity "  "
      FaRepository -> FaEntity "Entity"
      FaQueryService -> FaQuery " Call query method"
      FaRepository ->  gestionAlmacenFabricadoDB "database"
      AlRepository ->  gestionAlmacenFabricadoDB "database"
      
      
      
      #Almacen Mueble Comunes 
       apiGateway -> AcController ""
         apiGateway -> Mueblecontroller " " 
    
      AcController -> ComunComand "call service comand"
      AcController -> ComunRepository "query"
        AcController -> AcQueryService "Call service method"
        AcController -> AcCommandService "Call service method"
             AcQuery -> AcEntity ""
        AcQueryService -> AcQuery "Handle query"
        AcQueryService -> AcRepository "Call repository method"

        AcCommandService -> AcCommand "Handle command"
        AcCommandService -> AcRepository "Call repository method"
     
        AcController -> AcCommandService "Handle command"
        AcController -> AcQueryService "Handle Command"
     ACQueryService -> AcQuery  " "
    AcCommandService -> AcCommand " 
        AcCommand -> AcRepository " call repository method""
        AcQuery -> AcEntity "call Entity method"
        AcRepository -> AcEntity ""
                
           AcCommandService -> AcEntity "  "
      AcRepository -> AcEntity "Entity"
      AcQueryService -> AcQuery " Call query method"
      AcRepository ->  gestionAlmacenComunesDB "database"
     
     #Recomendacion Complementos 
      apiGateway -> recomendacionComplementoController "Request POST del endpoint de los complementos"
        
        recomendacionComplementoController -> recomendacionComplementoQueryService "Call service method" 
        recomendacionComplementoController -> recomendacionComplementoCommandService "Call service method"

        recomendacionComplementoCommandService -> recomendacionComplementoCommand "Handle command"
        
        recomendacionComplementoQueryService -> recomendacionComplementoRepository "Call repository method"
        recomendacionComplementoCommandService -> recomendacionComplementoRepository "Call external service method"

        recomendacionComplementoQueryService -> recomendacionComplementoQuery  "Handle query"
        recomendacionComplementoQueryService -> recomendacionComplementoCommandService "Call repository method"
        
        recomendacionComplementoRepository -> recomendacionComplementoEntity
        #Relaciones de Contenedores
        comprador -> webApp "Usa para comprar muebles"
        comprador -> mobileApp  "Usa para comprar muebles"
        
        compradorGrande -> webApp "Usa para comprar muebles a una gran escala"
        compradorGrande -> mobileApp "Usa para comprar muebles a una gran escala"
        
        webApp -> apiGateway "EndPoint Request"
        mobileApp -> apiGateway "EndPoint Request"
        
        apiGateway -> dimesionesSugerenciasBC "Request  del endpoint de Dimensiones de Sugerencia"
        apiGateway -> generacionSugerenciasBC "Request  del endpoint de generación de Sugerencias"
        apiGateway -> carritoComprasBC "Request  del endpoint del Carrito de compras"
        apiGateway -> procesoCompraBC "Request  del endpoint del Proceso de Compra"
        apiGateway -> gestionAlmacenFabricadoBC "Request  del endpoint de Gestión de Almacén para el Fabricado"
        apiGateway -> procesoFabricadoBC "Request  del endpoint del Proceso de Fabricado"
        apiGateway -> recomendacionComplementosBC "Request  del endpoint Recomendaciones de Complementos"
        apiGateway -> gestionMueblesEscogidosBC "Request  del endpoint de gestión de Muebles Escogidos"
        apiGateway -> gestionAlmacenComunesBC "Request  del endpoint del Gestión de Muebles Comunes"
        
        dimesionesSugerenciasBC -> dimesionesSugerenciasDB "Store and Update Data"
        generacionSugerenciasBC -> generacionSugerenciasDB "Store and Update Data"
        carritoComprasBC -> carritoComprasDB "Store and Update Data"
        procesoCompraBC -> procesoCompraDB "Store and Update Data"
        gestionAlmacenFabricadoBC -> gestionAlmacenFabricadoDB "Store and Update Data"
        procesoFabricadoBC -> procesoFabricadoDB "Store and Update Data"
        recomendacionComplementosBC -> recomendacionComplementosDB "Store and Update Data"
        gestionMueblesEscogidosBC -> gestionMueblesEscogidosDB "Store and Update Data"
        gestionAlmacenComunesBC -> gestionAlmacenComunesDB "Store and Update Data"
        
        #Relaciones entre elementos
        dimesionesSugerenciasBC -> camaraApi "Sistema que sirve a la hora de sacar medidas"
        dimesionesSugerenciasBC -> galeriaApi "Obtiene medidas o las fotos por la Galeria del celular."
        
        procesoCompraBC -> googleMapsApi "Ayuda en obtener la dirección del usuario."
        procesoCompraBC -> outlookApi "Se envia mensajes por correo al usuario."
        procesoCompraBC -> culquiApi "Sistema que servirá para los pagos."

        procesoFabricadoBC -> blenderApi "Ayuda en el modelado de los muebles."

          
    }
    views {
        systemContext programa "FurnitureContext" "Compra de Muebles" {
            include *
            autoLayout tb
        }
         container programa "FastFurnitureContainer" "Diagrama de Contexto de FastFurniture" {
            include *
            autoLayout
        }
        component carritoComprasBC "carritoComprasComponent" "Diagrama de Componentes carritoComprasBC" {
            include *
            autoLayout tb
        }
        component procesoCompraBC "procesoComprasComponent" "Diagrama de Componentes procesoComprasBC" {
            include *
            autoLayout tb
        }
        component dimesionesSugerenciasBC "DimensionSugerenciaComponent" "Diagrama de Dimensiones para sugerenciasBC"{
              include *
              autoLayout tb
        }
        component generacionSugerenciasBC "GeneracionSugerenciaComponent" "Diagrama de Generacion para sugerencias BC"{
              include *
              autoLayout tb
        }
         component procesoFabricadoBC "ProcesoFabricadoComponent" "Diagrama de ProcesoFabricado BC"{
              include *
              autoLayout tb
        }
             component  gestionAlmacenFabricadoBC "GestionAlmacenFabricadoBComponent" "Diagrama de Gestion AlmacenFabricado BC"{
              include *
              autoLayout tb
        }
        component  gestionAlmacenComunesBC "GestionAlmacenComunesBComponent" "Diagrama de  gestionAlmacenComunes BC"{
              include *
              autoLayout tb
        }
         component recomendacionComplementosBC "RecomendacionComplementosComponent" "Diagrama de Recomendacion de Complementos BC" {
                include *
                autolayout tb
                
        }
        styles {
            element "Person" {
                shape Person
                background #68FAAF
                color #000000
            }
            element "Programa" {
                background #15EAED
            }
            element "BoundedContext" {
                background #4E4BFA
                color #ffffff
            }
            
            element "Database" {
                background skyblue
                
            }
            element "MobileApp" {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element "WebApp" {
                shape WebBrowser
                background #2067F5
                color #FFFFFF
                icon https://static.structurizr.com/themes/amazon-web-services-2020.04.30/Amazon-EC2_D2-Instance_light-bg@4x.png
            }
            element "Software System" {
                background #FA9F93
            }
                        element "Service" {
                shape Hexagon
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
            element "ExternalService" {
                shape Folder
                background #785ba1
                color #FFFFFF
            }
            element "ContextFacade" {
                shape Folder
                background #9710b1
                color #FFFFFF
            }
            element "Container" {
                shape Hexagon
                background #805B17
                color #FFFFFF
            }
            element "Group" {
                color #9a0000
            }
            
            
            
        }
        
        
    }

    

}