workspace "JatoFacil" "Sistema de compra y alquiler de un inmueble" {

    model {
        
        # Personas
        shopper = person "Shopper" "Persona que compra inmuebles" "Shopper"
        trader = person "Trader" "Persona que vende y alquila inmuebles" "Trader"

        # Sistema de Software
        JatoFacil = softwareSystem "JatoFacil" "Sistema de compra y alquiler de inmuebles" "JatoFacil" {
            mobileApp = container "MobileApp" "Aplicación móvil para compras y alquiler" "Android / Kotlin v2.0.0" "MobileApp"
            webApp = container "WebApp" "Aplicación web SPA para compras y alquiler" "React v18.2.0 / ECMAScript 2020" "WebApp"
            apiGateway = container "ApiGateway" "Gestiona las peticiones HTTP" "Azure API Management" "ApiGateway"

            # SearchAndSelect Bounded Context
            verificarUsuarioBC = container "VerificarUsuarioBC" "Permite que el usuario se registre" "Laravel v10 / PHP v8.2.24" "SearchAndSelectBC,BoundedContext" {
                verificarEngineController = component "VerificarEngineController" "RESTful API Controller del Verificar Usuario" "Class / Laravel v10 / PHP v8.2.24" "VerificarEngineController,Controller"
                verificarDNI = component "VerificarDNI" "RESTful API Controller del Verificar DNI" "Class / Laravel v10 / PHP v8.2.24" "VerificarDNI,Controller"
                verificarAntescendente = component "VerificarAntescedenteCriminal" "RESTful API Controller del Verificar Antecedente Criminal" "Class / Laravel v10 / PHP v8.2.24" "VerificarAntescedenteCriminal,Controller"
                verificarRespaldo = component "VerificarRespaldo" "RESTful API Controller del Verificar Respaldo Económico" "Class / Laravel v10 / PHP v8.2.24" "VerificarRespaldo,Controller"

                group "VerificarUsuario" {
                    verificarUsuarioRepository = component "VerificarUsuarioRepository" "Repository Interface de VerificarUsuario" "Interface / Laravel v10 / PHP v8.2.24" "VerificarUsuarioRepository,Repository"
                    antecedentesQuery = component "AntecedentesQuery" "Query para leer VerificarUsuarioBC" "Record" "AntecedentesQuery,Query"
                    verificarEngineCommand = component "VerificarUsuarioCommand" "Command para crear, actualizar y eliminar VerificarUsuarioBC" "Record" "VerificarUsuarioCommand,Command"
                    verificarEngineCommandService = component "VerificarUsuarioCommandService" "Lógica de negocio del Command del VerificarUsuario" "Class / Laravel v10 / PHP v8.2.24" "VerificarUsuarioCommandService,Service"
                    verificarEngineQueryService = component "VerificarUsuarioQueryService" "Lógica de negocio del query del VerificarUsuario" "Class / Laravel v10 / PHP v8.2.24" "VerificarUsuarioQueryService,Service"
                }
                group "Product" {
                    registroQuery = component "RegistroQuery" "Query para leer el inmueble" "Record" "RegistroQuery,Query"
                }
                group "OutboundServices" {
                    procesoInspeccionBC = component "ProcesoInspeccion" "Lógica de negocio externa de verificar usuario" "Class / Laravel v10 / PHP v8.2.24" "ProcesoInspeccionBC,ExternalService"
                    apiDeVerificacionDNI = component "GooglePhotosExternalService" "Lógica de negocio externa de fotos de inmuebles" "Class / Laravel v10 / PHP v8.2.24" "GooglePhotosExternalService,ExternalService"
                   apiDeVerificacionAntescente = component "ProcesoVerificacionAntecedente" "Lógica de verificación de antecedentes" "Class / Laravel v10 / PHP v8.2.24" "VerificacionAntescendenteService,ExternalService"
                   apiDeVerificacionRespaldo = component "ProcesoVerificacionRespaldo" "Lógica de verificación de respaldo económico" "Class / Laravel v10 / PHP v8.2.24" "VerificacionRespaldoEconomicoService,ExternalService"
                }
            }

            # Purchase of property Bounded Context
            inspeccionBC = container "InspeccionBC" "Permite la gestión de visitas de las propiedades" "Laravel v10 / PHP v8.2.24" "InspeccionBC,BoundedContext" {
                inspeccionController = component "InspeccionController" "RESTful API Controller de la compra" "Class / Laravel v10 / PHP v8.2.24" "CartController,Controller"
                group "Inspeccion" {
                    inspeccionRepository = component "InspeccionRepository" "Repository Interface de Inspeccion" "Interface / Laravel v10 / PHP v8.2.24" "CartRepository,Repository"
                    inspeccionQuery = component "InspeccionQuery" "Query para leer Inspeccion" "Record" "InspeccionQuery,Query"
                    inspeccionCommand = component "InspeccionCommand" "Command para crear, actualizar y eliminar Inspeccion" "Record" "CartCommand,Command"
                    inspeccionCommandService = component "InspeccionCommandService" "Lógica de negocio del Command del Inspeccion" "Class / Laravel v10 / PHP v8.2.24" "CartCommandService,Service"
                    inspeccionQueryService = component "InspeccionQueryService" "Lógica de negocio del query del Inspeccion" "Class / Laravel v10 / PHP v8.2.24" "CartQueryService,Service"
                }
                group "InspeccionItem" {
                    inspeccionItemQuery = component "InspeccionItemQuery" "Query para leer InspeccionItem" "Record" "InspeccionItemQuery,Query"
                    inspeccionItemCommand = component "InspeccionItemCommand" "Command para crear, actualizar y eliminar InspeccionItem" "Record" "InspeccionItemCommand,Command"
                }
                group "OutboundServices" {
                
                    
                    apiDeMaps = component "GoogleMapsExternalService" "Lógica de negocio externa de ruta mas corta al inmueble " "Class / Laravel v10 / PHP v8.2.24" "GoogleMapsExternalService,ExternalService"
                    customerExternalService = component "CustomerExternalService" "Lógica de negocio externa de cliente" "Class / Laravel v10 / PHP v8.2.24" "CustomerExternalService,ExternalService"
                    apiDeValidacion = component "ProcesoValidacion" "Lógica de validacion de autenticidad del usuario por medio del DNI" "Class / Laravel v10 / PHP v8.2.24" "ValidacionEconomoicoService,ExternalService"
                   

                }
                group "InboundServices" {
                    inspeccionContextFacade = component "InspeccionContextFacade" "Facade de lógica de negocio de Inspeccion" "Class / Laravel v10 / PHP v8.2.24" "InspeccionContextFacade,ContextFacade"
                }
            }

            # Payment Bounded Context
            compraPagoBC = container "CompraPagoBC" "Permite el pago de la propiedad seleccionada" "Laravel v10 / PHP v8.2.24" "CompraPagoBC,BoundedContext" {
                compraPagoController = component "CompraPagoController" "RESTful API Controller del Payment" "Class / Laravel v10 / PHP v8.2.24" "CompraPagoController,Controller"
                customerController = component "CustomerController" "RESTful API Controller del Customer" "Class / Laravel v10 / PHP v8.2.24" "CustomerController,Controller"
                group "CompraPago" {
                    compraPagoRepository = component "CompraPagoRepository" "Repository Interface de Payment" "Interface / Laravel v10 / PHP v8.2.24" "PaymentRepository,Repository"
                    compraPagoQuery = component "CompraPagoQuery" "Query para leer Payment" "Record" "CompraPagoQuery,Query"
                    compraPagoCommand = component "CompraPagoCommand" "Command para crear, actualizar y eliminar CompraPago" "Record" "CompraPagoCommand,Command"
                    compraPagoCommandService = component "CompraPagoCommandService" "Lógica de negocio del Command del CompraPago" "Class / Laravel v10 / PHP v8.2.24" "CompraPagoCommandService,Service"
                    compraPagoQueryService = component "CompraPagoQueryService" "Lógica de negocio del query del CompraPago" "Class / Laravel v10 / PHP v8.2.24" "PaymentQueryService,Service"
                }
                group "Customer" {
                    customerRepository = component "CustomerRepository" "Repository Interface de Customer" "Interface / Laravel v10 / PHP v8.2.24" "CustomerRepository,Repository"
                    customerQuery = component "CustomerQuery" "Query para leer Customer" "Record" "CustomerQuery,Query"
                    customerCommand = component "CustomerCommand" "Command para crear, actualizar y eliminar Customer" "Record" "CustomerCommand,Command"
                    customerCommandService = component "CustomerCommandService" "Lógica de negocio del Command del Customer" "Class / Laravel v10 / PHP v8.2.24" "CustomerCommandService,Service"
                    customerQueryService = component "CustomerQueryService" "Lógica de negocio del query del Customer" "Class / Laravel v10 / PHP v8.2.24" "CustomerQueryService,Service"
                }
                group "Sale" {
                    saleRepository = component "SaleRepository" "Repository Interface de Sale" "Interface / Laravel v10 / PHP v8.2.24" "SaleRepository,Repository"
                    saleQuery = component "SaleQuery" "Query para leer Sale" "Record" "SaleQuery,Query"
                    saleCommand = component "SaleCommand" "Command para crear, actualizar y eliminar Sale" "Record" "SaleCommand,Command"
                    saleCommandService = component "SaleCommandService" "Lógica de negocio del Command del Sale" "Class / Laravel v10 / PHP v8.2.24" "SaleCommandService,Service"
                    saleQueryService = component "SaleQueryService" "Lógica de negocio del query del Sale" "Class / Laravel v10 / PHP v8.2.24" "SaleQueryService,Service"
                }
                group "SaleItem" {
                    saleItemQuery = component "SaleItemQuery" "Query para leer SaleItem" "Record" "SaleItemQuery,Query"
                    saleItemCommand = component "SaleItemCommand" "Command para crear, actualizar y eliminar SaleItem" "Record" "SaleItemCommand,Command"
                }
                group "OutboundServices" {
                    envioNotificacionesService = component "EnvioNotificacionesService" "Lógica de negocio externa de envío de notificaciones y confirmación" "Class / Laravel v10 / PHP v8.2.24" "DeliveryExternalService,ExternalService"
                    walletApiExternalService = component "WalletApiExternalService" "Lógica de negocio externa de pago mediante billetera electrónica" "Class / Laravel v10 / PHP v8.2.24" "WalletApiExternalService,ExternalService"
                }
                group "InboundServices" {
                    saleContextFacade = component "SaleContextFacade" "Facade de lógica de negocio de venta de inmuebles" "Class / Laravel v10 / PHP v8.2.24" "SaleContextFacade,ContextFacade"
                    customerContextFacade = component "CustomerContextFacade" "Facade de lógica de negocio de cliente" "Class / Laravel v10 / PHP v8.2.24" "CustomerContextFacade,ContextFacade"
                }
             }
                GestiondocumentariaBC = container "GestiondocumentariaBC" "Permite la gestión de documentos" "Laravel v10 / PHP v8.2.24" "GestiondocumentariaBC,BoundedContext" {
                gestiondocumentariaController = component "GestiondocumentariaController" "RESTful API Controller para gestión de documentos" "Class / Laravel v10 / PHP v8.2.24" "GestiondocumentariaController,Controller"
                
                group "Gestiondocumentaria" {
                    gestiondocumentariaRepository = component "GestiondocumentariaRepository" "Repository Interface para gestión de documentos" "Interface / Laravel v10 / PHP v8.2.24" "GestiondocumentariaRepository,Repository"
                    gestiondocumentariaQuery = component "GestiondocumentariaQuery" "Query para leer documentos" "Record" "GestiondocumentariaQuery,Query"
                    gestiondocumentariaCommand = component "GestiondocumentariaCommand" "Command para crear, actualizar y eliminar documentos" "Record" "GestiondocumentariaCommand,Command"
                    gestiondocumentariaCommandService = component "GestiondocumentariaCommandService" "Lógica de negocio del Command para gestión de documentos" "Class / Laravel v10 / PHP v8.2.24" "GestiondocumentariaCommandService,Service"
                    gestiondocumentariaQueryService = component "GestiondocumentariaQueryService" "Lógica de negocio del Query para gestión de documentos" "Class / Laravel v10 / PHP v8.2.24" "GestiondocumentariaQueryService,Service"
                }
                
                group "GestionContratos" {
                    gestionContratosItemQuery = component "GestionContratosItemQuery" "Query para leer contratos" "Record" "GestionContratosItemQuery,Query"
                    gestionContratosItemCommand = component "GestionContratosItemCommand" "Command para crear, actualizar y eliminar contratos" "Record" "GestionContratosItemCommand,Command"
                }
                
                group "OutboundServices" {
                    customerExternalServiceV2 = component "CustomerExternalServiceV2" "Lógica de negocio externa de cliente para otra funcionalidad" "Class / Laravel v10 / PHP v8.2.24" "CustomerExternalServiceV2,ExternalService"
                }
                
                group "InboundServices" {
                    inspeccionContextFacadeV2 = component "InspeccionContextFacadeV2" "Facade de lógica de negocio de Inspección (versión alternativa)" "Class / Laravel v10 / PHP v8.2.24" "InspeccionContextFacadeV2,ContextFacade"
                }
            }
 
             # Notification Bounded Context
                EnvioDeNotifiacionyConfirmacionBC = container "EnvioDeNotifiacionyConfirmacionBC" "Gestiona la entrega de notifiaciones" "Laravel v10 / PHP v8.2.24" "DeliveryBC,BoundedContext" {
                EnvioDeNotifiacionController = component "EnvioDeNotifiacionController" "RESTful API Controller del Delivery" "Class / Laravel v10 / PHP v8.2.24" "DeliveryController,Controller"
                EnvioConfirmacionController = component "EnvioConfirmacionController" "RESTful API Controller del Transport" "Class / Laravel v10 / PHP v8.2.24" "TransportController,Controller"
                group "EnvioDeNotifiacion" {
                     EnvioDeNotifiacionRepository = component "EnvioDeNotifiacionRepository" "Repository Interface de Delivery" "Interface / Laravel v10 / PHP v8.2.24" "DeliveryRepository,Repository"
                     EnvioDeNotifiacionQuery = component "EnvioDeNotifiacionQuery" "Query para leer Delivery" "Record" "DeliveryQuery,Query"
                     EnvioDeNotifiacionCommand = component "EnvioDeNotifiacionCommand" "Command para crear, actualizar y eliminar Delivery" "Record" "DeliveryCommand,Command"
                     EnvioDeNotifiacionCommandService = component "EnvioDeNotifiacionCommandService" "Lógica de negocio del Command del Delivery" "Class / Laravel v10 / PHP v8.2.24" "DeliveryCommandService,Service"
                     EnvioDeNotifiacionQueryService = component "EnvioDeNotifiacionQueryService" "Lógica de negocio del query del Delivery" "Class / Laravel v10 / PHP v8.2.24" "DeliveryQueryService,Service"
                }
                group "EnvioConfirmacion" {
                    EnvioConfirmacionRepository = component "EnvioConfirmacionRepository" "Repository Interface de Transport" "Interface / Laravel v10 / PHP v8.2.24" "TransportRepository,Repository"
                    EnvioConfirmacionQuery = component "EnvioConfirmacionQuery" "Query para leer Transport" "Record" "TransportQuery,Query"
                    EnvioConfirmacionCommand = component "EnvioConfirmacionCommand" "Command para crear, actualizar y eliminar Transport" "Record" "TransportCommand,Command"
                    EnvioConfirmacionCommandService = component "EnvioConfirmacionCommandService" "Lógica de negocio del Command del Transport" "Class / Laravel v10 / PHP v8.2.24" "TransportCommandService,Service"
                    EnvioConfirmacionQueryService = component "EnvioConfirmacionQueryService" "Lógica de negocio del query del Transport" "Class / Laravel v10 / PHP v8.2.24" "TransportQueryService,Service"
                }
                group "OutboundServices" {
                    saleExternalService = component "SaleExternalService" "Lógica de negocio externa de venta de inmuebles" "Class / Laravel v10 / PHP v8.2.24" "SaleExternalService,ExternalService"
                }
                group "InboundServices" {
                    deliveryContextFacade = component "DeliveryContextFacade" "Facade de lógica de negocio de entrega de inmuebles" "Class / Laravel v10 / PHP v8.2.24" "DeliveryContextFacade,ContextFacade"
                }
            }

            group "Databases" {
                verificarUsuarioDB = container "VerificarUsuarioDB" "Guarda la información de los registros y verifica según la base de datos" "MongoDB v8.0" "SearchAndSelectDB,Database"
                inspeccionDB = container "InspeccionDB" "Guarda la información de las inspecciones realizadas con los comentarios y retroalimentación" "Microsoft SQL Server v2022" "ShoppingCartDB,Database"
                compraPagoDB = container "CompraPagoDB" "Guarda la información del pago de la propiedad" "Microsoft SQL Server v2022" "PaymentDB,Database"
                GestiondocumentariaDB = container "GestiondocumentariaBD" "Guarda la información de los documentos" "Microsoft SQL Server v2022" "ShoppingCartDB,Database"
                EnvioDeNotifiacionyConfirmacionDB = container "EnvioDeNotifiacionyConfirmacionDB" "Guarda la información de la entrega de inmuebles y de las notificaciones enviadas" "Microsoft SQL Server v2022" "DeliveryDB,Database"
            }
        }

        # Sistema Externo
        googleMaps = softwareSystem "Google Maps" "Sistema de mapas geoespaciales" "GoogleMaps,ExternalSystem"
        googlePhotos = softwareSystem "Google Photos" "Sistema de almacenamiento de fotos" "GooglePhotos,ExternalSystem"
        walletApi = softwareSystem "Wallet Api" "API de pago mediante billetera electrónica" "WalletApi,ExternalSystem"
        NotificacionSMSApi = softwareSystem "NotificacionSMS Api" "API de notificacion mediante el sms" "NotificacionSMSApi,ExternalSystem"
        NotificacionGMAILApi = softwareSystem "NotificacionGMAIL Api" "API de notificacion mediante el gmail" "NotificacionGMAILApi,ExternalSystem"
        RespaldoEconomicoApi = softwareSystem "RespaldoEconomico Api" "API de respaldo economico" "RespaldoEconomicoApi,ExternalSystem"
        AntescedentesApi = softwareSystem "Antescedentes Api " "API de antescedentes del comprador" "AntescedentesApi,ExternalSystem"

        # Relaciones del sistema de contexto
         shopper -> JatoFacil "Usa para comprar o alquilar"
         trader -> JatoFacil "Gestiona los inmuebles que publicó"
         JatoFacil -> googleMaps "Consulta de dirección del usuario comprador"
         JatoFacil -> googlePhotos "Consulta de fotos del inmueble seleccionado"
         JatoFacil -> NotificacionSMSApi "Consulta de sms del dueño del inmueble seleccionado"
         JatoFacil -> NotificacionGMAILApi "Consulta del gmail del dueño del inmueble seleccionado"
         JatoFacil -> RespaldoEconomicoApi "Consulta de la estabilidad del comprador"
         JatoFacil -> AntescedentesApi "Consulta de los antecedentes del usuario "
         JatoFacil -> walletApi "Mostrar número de cuenta del vendedor a depositar"
         googlePhotos -> JatoFacil "Respuesta con fotos del inmueble seleccionado"
         AntescedentesApi -> JatoFacil "Respuesta con los antecedentes del usario/comprador"
         

        # Relaciones del contenedor
        shopper -> mobileApp "Compra inmuebles"
        shopper -> webApp "Compra o alquila inmuebles"
        trader -> webApp "Gestiona inmuebles"

        mobileApp -> apiGateway "Request al endpoint" "HTTPS / JSON"
        webApp -> apiGateway "Request al endpoint" "HTTPS / JSON"

        apiGateway -> verificarUsuarioBC "Request GET al endpoint de búsqueda"
        apiGateway -> inspeccionBC "Request al endpoint del compra de compras"
        apiGateway -> compraPagoBC "Request POST al endpoint del pago"
        apiGateway -> EnvioDeNotifiacionyConfirmacionBC "Request GET al endpoint de entrega"
    
        verificarEngineController -> apiDeVerificacionDNI "Consulta fotos de inmueble seleccionado"
        apiDeVerificacionDNI -> verificarEngineController "Respuesta con fotos del inmueble"
    
        inspeccionBC -> compraPagoBC "Continuar compra"
        inspeccionBC -> inspeccionDB "Datos e información del compra de compras"
        inspeccionBC -> inspeccionDB "Consulta datos del compra de compras"
    
        compraPagoBC -> walletApi "Generación del QR de pago"
        compraPagoBC -> EnvioDeNotifiacionyConfirmacionBC "Planificar la entrega del inmueble"
        compraPagoBC -> compraPagoDB "Guarda y actualiza datos"
    
        EnvioDeNotifiacionyConfirmacionBC -> EnvioDeNotifiacionyConfirmacionDB "Guarda y actualiza datos"
    
        # Relaciones del Bounded Context de SearchAndSelect
        apiGateway -> verificarEngineController "Request GET al endpoint de búsqueda"
    
        verificarEngineController -> verificarEngineQueryService "Llama método de servicio"
        verificarEngineController -> verificarEngineCommandService "Llama método de servicio"
    
        verificarEngineQueryService -> antecedentesQuery "Maneja consulta"
        verificarEngineQueryService -> verificarUsuarioRepository "Llama método del repositorio"
        verificarEngineQueryService -> registroQuery "Maneja consulta"
    
        verificarEngineCommandService -> verificarEngineCommand "Maneja comando"
        verificarEngineCommandService -> verificarUsuarioRepository "Llama método del repositorio"
        verificarEngineCommandService -> procesoInspeccionBC "Llama método del servicio externo"
        verificarEngineCommandService -> apiDeVerificacionDNI "Request al endpoint" "HTTPS / JSON"
    
        verificarUsuarioRepository -> verificarUsuarioDB "Guarda, actualiza, elimina y consulta registros - VerificarUsuario" "Transacción SQL"
    
        procesoInspeccionBC -> inspeccionContextFacade "Agrega inmueble al compra de compras"
        apiDeVerificacionDNI -> googlePhotos "Consulta fotos del inmueble seleccionado"
        googlePhotos -> apiDeVerificacionDNI "Respuesta con fotos del inmueble"
    
        # Relaciones del Bounded Context de ShoppingCart
        apiGateway -> inspeccionController "Request al endpoint del compra de compras"
    
        inspeccionController -> inspeccionQueryService "Llama método de servicio"
        inspeccionController -> inspeccionCommandService "Llama método de servicio"
    
        inspeccionQueryService -> inspeccionQuery "Maneja consulta"
        inspeccionQueryService -> inspeccionRepository "Llama método del repositorio"
        inspeccionQueryService -> inspeccionItemQuery "Maneja consulta"
    
        inspeccionCommandService -> inspeccionCommand "Maneja comando"
        inspeccionCommandService -> inspeccionRepository "Llama método del repositorio"
        inspeccionCommandService -> inspeccionItemCommand "Maneja comando"
        inspeccionCommandService -> customerExternalService "Llama método del servicio externo"
        inspeccionCommandService -> apiDeValidacion "Llama método del proceso de validacion"
        inspeccionCommandService -> apiDeMaps "Llama metodo del proceso de busqueda de rutas"
    
        inspeccionRepository -> inspeccionDB "Guarda, actualiza, elimina y consulta registros - Inspeccion" "Transacción SQL"
    
        customerExternalService -> customerContextFacade "Continúa compra"
        inspeccionContextFacade -> inspeccionCommandService "Llama método de servicio"
    
        # Relaciones del Bounded Context de Payment
        apiGateway -> customerController "Request al endpoint del cliente"
    
        customerController -> customerQueryService "Llama método de servicio"
        customerController -> customerCommandService "Llama método de servicio"
    
        customerQueryService -> customerQuery "Maneja consulta"
        customerQueryService -> customerRepository "Llama método del repositorio"
    
        customerCommandService -> customerCommand "Maneja comando"
        customerCommandService -> customerRepository "Llama método del repositorio"
        customerCommandService -> compraPagoCommandService "Llama método de servicio"
    
        customerRepository -> compraPagoDB "Guarda, actualiza, elimina y consulta registros - Cliente" "Transacción SQL"
    
        apiGateway -> compraPagoController "Request POST al endpoint de pago"
    
        compraPagoController -> compraPagoQueryService "Llama método de servicio"
        compraPagoController -> compraPagoCommandService "Llama método de servicio"
    
        compraPagoQueryService -> compraPagoQuery "Maneja consulta"
        compraPagoQueryService -> compraPagoRepository "Llama método del repositorio"
    
        compraPagoCommandService -> compraPagoCommand "Maneja comando"
        compraPagoCommandService -> compraPagoRepository "Llama método del repositorio"
        compraPagoCommandService -> walletApiExternalService "Llama método del servicio externo"
        compraPagoCommandService -> saleCommandService "Llama método de servicio"
    
        compraPagoRepository -> compraPagoDB "Guarda, actualiza, elimina y consulta registros - Pago" "Transacción SQL"
    
        saleQueryService -> saleQuery "Maneja consulta"
        saleQueryService -> saleRepository "Llama método del repositorio"
        saleQueryService -> saleItemQuery "Maneja consulta"
    
        saleCommandService -> saleCommand "Maneja comando"
        saleCommandService -> saleRepository "Llama método del repositorio"
        saleCommandService -> saleItemCommand "Maneja comando"
        saleCommandService -> envioNotificacionesService "Llama método del servicio externo"
    
        saleRepository -> compraPagoDB "Guarda, actualiza, elimina y consulta registros - Venta" "Transacción SQL"
    
        walletApiExternalService -> walletApi "Generación del QR de pago"
        envioNotificacionesService -> deliveryContextFacade "Planificar la entrega del inmueble"
        customerContextFacade -> customerCommandService "Llama método de servicio"
        saleContextFacade -> saleQueryService "Llama método de servicio"
    
        # Relaciones del Bounded Context de Delivery
        apiGateway -> EnvioDeNotifiacionController "Request al endpoint de entrega"
    
        EnvioDeNotifiacionController -> EnvioDeNotifiacionQueryService "Llama método de servicio"
        EnvioDeNotifiacionController -> EnvioDeNotifiacionCommandService "Llama método de servicio"
    
        EnvioDeNotifiacionQueryService -> EnvioDeNotifiacionQuery "Maneja consulta"
        EnvioDeNotifiacionQueryService -> EnvioDeNotifiacionRepository "Llama método del repositorio"
        EnvioDeNotifiacionQueryService -> saleExternalService "Llama método de servicio"
    
        EnvioDeNotifiacionCommandService -> EnvioDeNotifiacionCommand "Maneja comando"
        EnvioDeNotifiacionCommandService -> EnvioDeNotifiacionRepository "Llama método del repositorio"
        EnvioDeNotifiacionCommandService -> EnvioDeNotifiacionQueryService "Llama método de servicio"
    
        EnvioDeNotifiacionRepository -> EnvioDeNotifiacionyConfirmacionDB "Guarda, actualiza, elimina y consulta registros - Entrega" "Transacción SQL"
    
        apiGateway -> EnvioConfirmacionController "Request al endpoint del transporte"
    
        EnvioConfirmacionController -> EnvioConfirmacionQueryService "Llama método de servicio"
        EnvioConfirmacionController -> EnvioConfirmacionCommandService "Llama método de servicio"
    
        EnvioConfirmacionQueryService -> EnvioConfirmacionQuery "Maneja consulta"
        EnvioConfirmacionQueryService -> EnvioConfirmacionRepository "Llama método del repositorio"
    
        EnvioConfirmacionCommandService -> EnvioConfirmacionCommand "Maneja comando"
        EnvioConfirmacionCommandService -> EnvioConfirmacionRepository "Llama método del repositorio"
    
        EnvioConfirmacionRepository -> EnvioDeNotifiacionyConfirmacionDB "Guarda, actualiza, elimina y consulta registros - Transporte" "Transacción SQL"
    
        saleExternalService -> saleContextFacade "Llama método de servicio"
        deliveryContextFacade -> EnvioDeNotifiacionCommandService "Llama método de servicio"
        
        
        # Relaciones del Bounded Context de Gestiondocumentaria
        apiGateway -> gestiondocumentariaController "Request al endpoint de gestión de documentos"
        
        gestiondocumentariaController -> gestiondocumentariaQueryService "Llama método de servicio"
        gestiondocumentariaController -> gestiondocumentariaCommandService "Llama método de servicio"
        
        gestiondocumentariaQueryService -> gestiondocumentariaQuery "Maneja consulta"
        gestiondocumentariaQueryService -> gestiondocumentariaRepository "Llama método del repositorio"
        
        gestiondocumentariaCommandService -> gestiondocumentariaCommand "Maneja comando"
        gestiondocumentariaCommandService -> gestiondocumentariaRepository "Llama método del repositorio"
        gestiondocumentariaCommandService -> gestionContratosItemCommand "Maneja comando"
        
        gestiondocumentariaRepository -> GestiondocumentariaDB "Guarda, actualiza, elimina y consulta registros - Documentos" "Transacción SQL"
        
        # Relaciones externas si es necesario
        customerExternalServiceV2 -> customerContextFacade "Llama método de servicio"
        inspeccionContextFacadeV2 -> gestiondocumentariaCommandService "Llama método de servicio"
        
        
      }

    views {
        systemContext JatoFacil "JatoFacilSystemContext" "Diagrama de Contexto de JatoFacil" {
            include *
            autoLayout
        }
        container JatoFacil "JatoFacilContainer" "Diagrama de Contenedores de JatoFacil" {
            include *
            autoLayout
        }
        component verificarUsuarioBC "VerificarUsuarioComponent" "Diagrama de Componentes de VerificarUsuarioBC" {
            include *
            autoLayout tb
        }
        component inspeccionBC "InspeccionComponent" "Diagrama de Componentes de InspeccionBC" {
            include *
            autoLayout tb
        }
        component compraPagoBC "CompraPagoComponent" "Diagrama de Componentes de CompraPagoBC" {
            include *
            autoLayout tb
        }
        component GestiondocumentariaBC "GestiondocumentariaComponent" "Diagrama de Componentes de GestiondocumentariaBC" {
            include *
            autoLayout tb
        }
        component EnvioDeNotifiacionyConfirmacionBC "NotificacionesComponent" "Diagrama de Componentes de EnvioDeNotifiacionyConfirmacionBC" {
            include *
            autoLayout tb
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
            element "ExternalSystem" {
                background #FABB32
            }
            element "BoundedContext" {
                shape Component
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
            }
            element "ApiGateway" {
                shape Pipe
                background #884A39
            }
            element "Database" {
                shape Cylinder
                background #CF0A0A
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

    configuration {
        scope softwaresystem
    }
}
