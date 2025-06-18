workspace "ComprasUPC" "Sistema de compras de la UPC" {

    model {
        # person
        shopper = person "Shopper" "Persona que compra productos" "Shopper"
        manager = person "Manager" "Persona que Gestiona el Software" "Manager"

        # SoftwareSystem
        comprasUPC = softwareSystem "ComprasUPC" "Sistema de Compras de la UPC" "ComprasUPC" {
            mobileApp = container "MobileApp" "Mobile App para Compras" "Android / Kotlin v2.0.0" "MobileApp"
            webApp = container "Web Application" "Simple-Page Application para compras" "React v18.2.0 / ECMAScript 2020" "WebApp"
            apiGateway = container "api Gateway" "Gestiona las peticiones HTTP" "Azure API Management" "ApiGateway"

            # SearchAndSelect Bounded Context
            searchAndSelectBC = container "Search and Select Bunded Context" "Permite la busqueda y agregar productos al carrito de compras" "Laravel v10 / PHP v8.2.24" "SearchAndSelectBC,BoundedContext"  {
                searchEngineController = component "SearchEngine Controller" "RESTful API Controller class del SearchEngine" "Class / Laravel v10 / PHP v8.2.24" "SearchEngineController,Controller"
                group "searchEngine" {
                    searchEngineRepository = component "SearchEngine Repository" "Repository Interface de SearchEngine" "Interface / Laravel v10 / PHP v8.2.24" "SearchEngineRepository,Repository"
                    searchEngineQuery = component "SearchEngine Query" "Query for read SearchEngine" "Record" "SearchEngineQuery, Query"
                    searchEngineCommand = component "SearchEngine Command" "Command for create, update and delete SearchEngine" "Record" "SearchEngineCommand, Command"
                    searchEngineCommandService = component "SearchEngine CommandService" "Business Logic del Command del SearchEngine" "Class / Laravel v10 / PHP v8.2.24" "SearchEngineCommandService,Service"
                    searchEngineQueryService = component "SearchEngine QueryService" "Business Logic del query del SearchEngine" "Class / Laravel v10 / PHP v8.2.24" "SearchEngineQueryService,Service"
                }
                group "product" {
                    productQuery = component "Product Query" "Query for read Product" "Record" "ProductQuery, Query"
                }
                group "outboundservices" {
                    cartExternalService = component "Cart ExternalService" "External Business Logic de carrito de compras" "Class / Laravel v10 / PHP v8.2.24" "CartExternalService,ExternalService"
                    googlePhotosExternalService = component "Google Photos ExternalService" "External Business Logic de fotos de productos" "Class / Laravel v10 / PHP v8.2.24" "GooglePhotosExternalService,ExternalService"
                }
            }

            # Shopping Cart Bounded Context
            shoppingCartBC = container "Shopping cart Bunded Context" "Permite la gestión del carrito de compras" "Laravel v10 / PHP v8.2.24" "ShoppingCartBC,BoundedContext" {
                cartController = component "Cart Controller" "RESTful API Controller class del Cart" "Class / Laravel v10 / PHP v8.2.24" "CartController,Controller"
                group "Cart"  {
                    cartRepository = component "Cart Repository" "Repository Interface de Cart" "Interface / Laravel v10 / PHP v8.2.24" "CartRepository,Repository"
                    cartQuery = component "Cart Query" "Query for read Cart" "Record" "CartQuery, Query"
                    cartCommand = component "Cart Command" "Command for create, update and delete Cart" "Record" "CartCommand, Command"
                    cartCommandService = component "Cart CommandService" "Business Logic del Command del Cart" "Class / Laravel v10 / PHP v8.2.24" "CartCommandService,Service"
                    cartQueryService = component "Cart QueryService" "Business Logic del query del Cart" "Class / Laravel v10 / PHP v8.2.24" "CartQueryService,Service"
                }
                group "CartItem" {
                    cartItemQuery = component "CartItem Query" "Query for read CartItem" "Record" "CartItemQuery, Query"
                    cartItemCommand = component "CartItem Command" "Command for create, update and delete CartItem" "Record" "CartItemCommand, Command"
                }
                group "outboundservices" {
                    customerExternalService = component "Customer ExternalService" "External Business Logic de cliente" "Class / Laravel v10 / PHP v8.2.24" "CustomerExternalService,ExternalService"
                }
                group "inboundservices" {
                    cartContextFacade = component "Cart ContextFacade" "Facade Business Logic de carrito de compras" "Class / Laravel v10 / PHP v8.2.24" "CartContextFacade,ContextFacade"
                }
            }

            # Payment Bounded Context
            paymentBC = container "Payment Bunded Context" "Permite el pago de producto del carrito de compras" "Laravel v10 / PHP v8.2.24" "PaymentBC,BoundedContext" {
                paymentController = component "Payment Controller" "RESTful API Controller class del Payment" "Class / Laravel v10 / PHP v8.2.24" "PaymentController,Controller"
                customerController = component "Customer Controller" "RESTful API Controller class del Customer" "Class / Laravel v10 / PHP v8.2.24" "CustomerController,Controller"
                group "Payment" {
                    paymentRepository = component "Payment Repository" "Repository Interface de Payment" "Interface / Laravel v10 / PHP v8.2.24" "PaymentRepository,Repository"
                    paymentQuery = component "Payment Query" "Query for read Payment" "Record" "PaymentQuery, Query"
                    paymentCommand = component "Payment Command" "Command for create, update and delete Payment" "Record" "PaymentCommand, Command"
                    paymentCommandService = component "Payment CommandService" "Business Logic del Command del Payment" "Class / Laravel v10 / PHP v8.2.24" "PaymentCommandService,Service"
                    paymentQueryService = component "Payment QueryService" "Business Logic del query del Payment" "Class / Laravel v10 / PHP v8.2.24" "PaymentQueryService,Service"
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
                    walletApiExternalService = component "Wallet Api ExternalService" "External Business Logic de pago mediante billetera electrónica: yape y plin" "Class / Laravel v10 / PHP v8.2.24" "WalletApiExternalService,ExternalService"
                }
                group "inboundservices" {
                    saleContextFacade = component "Sale ContextFacade" "Facade Business Logic de venta de productos" "Class / Laravel v10 / PHP v8.2.24" "SaleContextFacade,ContextFacade"
                    customerContextFacade = component "Customer ContextFacade" "Facade Business Logic de cliente" "Class / Laravel v10 / PHP v8.2.24" "CustomerContextFacade,ContextFacade"
                }
            }

            # Delivery Bounded Context
            deliveryBC = container "Delivery Bunded Context" "Gestiona la entraga de productos comprados" "Laravel v10 / PHP v8.2.24" "DeliveryBC,BoundedContext" {
                deliveryController = component "Delivery Controller" "RESTful API Controller class del Delivery" "Class / Laravel v10 / PHP v8.2.24" "DeliveryController,Controller"
                transportController = component "Transport Controller" "RESTful API Controller class del Transport" "Class / Laravel v10 / PHP v8.2.24" "TransportController,Controller"
                group "Delivery" {
                    deliveryRepository = component "Delivery Repository" "Repository Interface de Delivery" "Interface / Laravel v10 / PHP v8.2.24" "DeliveryRepository,Repository"
                    deliveryQuery = component "Delivery Query" "Query for read Delivery" "Record" "DeliveryQuery, Query"
                    deliveryCommand = component "Delivery Command" "Command for create, update and delete Delivery" "Record" "DeliveryCommand, Command"
                    deliveryCommandService = component "Delivery CommandService" "Business Logic del Command del Delivery" "Class / Laravel v10 / PHP v8.2.24" "DeliveryCommandService,Service"
                    deliveryQueryService = component "Delivery QueryService" "Business Logic del query del Delivery" "Class / Laravel v10 / PHP v8.2.24" "DeliveryQueryService,Service"
                }
                group "Transport" {
                    transportRepository = component "Transport Repository" "Repository Interface de Transport" "Interface / Laravel v10 / PHP v8.2.24" "TransportRepository,Repository"
                    transportQuery = component "Transport Query" "Query for read Transport" "Record" "TransportQuery, Query"
                    transportCommand = component "Transport Command" "Command for create, update and delete Transport" "Record" "TransportCommand, Command"
                    transportCommandService = component "Transport CommandService" "Business Logic del Command del Transport" "Class / Laravel v10 / PHP v8.2.24" "TransportCommandService,Service"
                    transportQueryService = component "Transport QueryService" "Business Logic del query del Transport" "Class / Laravel v10 / PHP v8.2.24" "TransportQueryService,Service"
                }
                group "outboundservices" {
                    saleExternalService = component "Sale ExternalService" "External Business Logic de venta de productos" "Class / Laravel v10 / PHP v8.2.24" "SaleExternalService,ExternalService"
                }
                group "inboundservices" {
                    deliveryContextFacade = component "Delivery ContextFacade" "Facade Business Logic de entrega de productos" "Class / Laravel v10 / PHP v8.2.24" "DeliveryContextFacade,ContextFacade"
                }
            }

            group "Databases" {
                searchAndSelectDB = container "Search and Select Database" "Guarda la información de busqueda y productos agregados al carrito de compras" "MongoDB v8.0" "SearchAndSelectDB,Database"
                shoppingCartDB = container "Shopping cart Database" "Guarda la información del carrito de compras" "Microsoft SQL Server v2022" "ShoppingCartDB,Database"
                paymentDB = container "Payment Database" "Guarda la información del pago de producto del carrito de compras" "Microsoft SQL Server v2022" "PaymentDB,Database"
                deliveryDB = container "Delivery Database" "Guarda la información de la entraga de productos comprados" "Microsoft SQL Server v2022" "DeliveryDB,Database"
            }
        }

        # External System
        googleMaps = softwareSystem "Google Maps" "Sistema de maps geoespaciales" "GoogleMaps,ExternalSystem"
        googlePhotos = softwareSystem "Google Photos" "Sistema de almacena las fotos" "GooglePhotos,ExternalSystem"
        walletApi = softwareSystem "Wallet Api" "Api de pago mediante billetera electrónica: yape y plin" "WalletApi,ExternalSystem"

        # RelationShip systemContext
        shopper -> comprasUPC "Usa para comprar"
        manager -> comprasUPC "Gestiona"
        comprasUPC -> googleMaps "Consulta de Dirección de Cliente"
        comprasUPC -> googlePhotos "Query de fotos de producto seleccionado"
        googlePhotos -> comprasUPC "Response de fotos de los producto"
        comprasUPC -> walletApi "Generación del QR de pago"

        # RelationShip Container
        shopper -> mobileApp "Comprar productos"
        shopper -> webApp "Comprar productos"
        manager -> webApp "Gestionar Productos"

        mobileApp -> apiGateway "Endpoint Request" "HTTPS / Json"
        webApp -> apiGateway "Endpoint Request" "HTTPS / Json"

        apiGateway -> searchAndSelectBC "Request GET del endpoint de Búsqueda"
        apiGateway -> shoppingCartBC "Request GET, POST, PUT, DELETE del endpoint del carrito de compras"
        apiGateway -> paymentBC "Request POST del endpoint del payment"
        apiGateway -> deliveryBC "Request GET del endpoint del Delivery"

        searchAndSelectBC -> googlePhotos "Query de fotos de producto seleccionado"
        searchAndSelectBC -> searchAndSelectDB "Query de datos del producto"
        searchAndSelectBC -> shoppingCartBC "Agregar producto al carrito de Compras"
        googlePhotos -> searchAndSelectBC "Response de fotos de los producto"
        searchAndSelectDB -> searchAndSelectBC "Response de fotos de los producto"

        shoppingCartBC -> paymentBC "Continuar Compra"
        shoppingCartBC -> shoppingCartDB "Datos e información del carrito de compras"
        shoppingCartDB -> shoppingCartBC "Query de datos del carrito de compras"

        paymentBC -> walletApi "Generación del QR de pago"
        paymentBC -> deliveryBC "Planificar la entrega del producto"
        paymentBC -> paymentDB "Store and update data"

        deliveryBC -> deliveryDB "Store and update data"

        # Relationships SearchAndSelect Bounded Context

        apiGateway -> searchEngineController "Request GET del endpoint de Búsqueda"

        searchEngineController -> searchEngineQueryService "Call service method"
        searchEngineController -> searchEngineCommandService "Call service method"

        searchEngineQueryService -> searchEngineQuery "Handle query"
        searchEngineQueryService -> searchEngineRepository "Call repository method"
        searchEngineQueryService -> productQuery "Handle query"

        searchEngineCommandService -> searchEngineCommand "Handle command"
        searchEngineCommandService -> searchEngineRepository "Call repository method"
        searchEngineCommandService -> cartExternalService "Call external service method"
        searchEngineCommandService -> googlePhotosExternalService "Endpoint Request" "HTTPS / Json"

        searchEngineRepository -> searchAndSelectDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"

        cartExternalService -> cartContextFacade "Agregar producto al carrito de Compras"
        googlePhotosExternalService -> googlePhotos "Query de fotos de producto seleccionado"
        googlePhotos -> googlePhotosExternalService "Response de fotos de los producto"

        # Relationships ShoppingCart Bounded Context

        apiGateway -> cartController "Request GET, POST, PUT, DELETE del endpoint del carrito de compras"

        cartController -> cartQueryService "Call service method"
        cartController -> cartCommandService "Call service method"

        cartQueryService -> cartQuery "Handle query"
        cartQueryService -> cartRepository "Call repository method"
        cartQueryService -> cartItemQuery "Handle query"

        cartCommandService -> cartCommand "Handle command"
        cartCommandService -> cartRepository "Call repository method"
        cartCommandService -> cartItemCommand "Handle command"
        cartCommandService -> customerExternalService "Call external service method"

        cartRepository -> shoppingCartDB "Store, update, delete and fetch records - cart" "SQL transaction"

        customerExternalService -> customerContextFacade "Continuar Compra"
        cartContextFacade -> cartCommandService "Call service method"

        # Relationships Payment Bounded Context

        apiGateway -> customerController "Request GET, POST, PUT, DELETE del endpoint del customer"

        customerController -> customerQueryService "Call service method"
        customerController -> customerCommandService "Call service method"

        customerQueryService -> customerQuery "Handle query"
        customerQueryService -> customerRepository "Call repository method"

        customerCommandService -> customerCommand "Handle command"
        customerCommandService -> customerRepository "Call repository method"
        customerCommandService -> paymentCommandService "Call service method"

        customerRepository -> paymentDB "Store, update, delete and fetch records - customer" "SQL transaction"


        apiGateway -> paymentController "Request POST del endpoint del payment"

        paymentController -> paymentQueryService "Call service method"
        paymentController -> paymentCommandService "Call service method"

        paymentQueryService -> paymentQuery "Handle query"
        paymentQueryService -> paymentRepository "Call repository method"

        paymentCommandService -> paymentCommand "Handle command"
        paymentCommandService -> paymentRepository "Call repository method"
        paymentCommandService -> walletApiExternalService "Call external service method"
        paymentCommandService -> saleCommandService "Call service method"

        paymentRepository -> paymentDB "Store, update, delete and fetch records - payment" "SQL transaction"


        saleQueryService -> saleQuery "Handle query"
        saleQueryService -> saleRepository "Call repository method"
        saleQueryService -> saleItemQuery "Handle query"

        saleCommandService -> saleCommand "Handle command"
        saleCommandService -> saleRepository "Call repository method"
        saleCommandService -> saleItemCommand "Handle command"
        saleCommandService -> deliveryExternalService "Call external service method"

        saleRepository -> paymentDB "Store, update, delete and fetch records - sale" "SQL transaction"

        walletApiExternalService -> walletApi "Generación del QR de pago"
        deliveryExternalService -> deliveryContextFacade "Planificar la entrega del producto"
        customerContextFacade -> customerCommandService "Call service method"
        saleContextFacade -> saleQueryService "Call service method"

        # Relationships Delivery Bounded Context

        apiGateway -> deliveryController "Request GET, POST, PUT, DELETE del endpoint del delivery"

        deliveryController -> deliveryQueryService "Call service method"
        deliveryController -> deliveryCommandService "Call service method"

        deliveryQueryService -> deliveryQuery "Handle query"
        deliveryQueryService -> deliveryRepository "Call repository method"
        deliveryQueryService -> transportQuery "Handle query"
        deliveryQueryService -> saleExternalService "Call service method"

        deliveryCommandService -> deliveryCommand "Handle command"
        deliveryCommandService -> deliveryRepository "Call repository method"
        deliveryCommandService -> transportQueryService "Call service method"

        deliveryRepository -> deliveryDB "Store, update, delete and fetch records - delivery" "SQL transaction"

        apiGateway -> transportController "Request GET, POST, PUT, DELETE del endpoint del transport"
        
        transportController -> transportQueryService "Call service method"
        transportController -> transportCommandService "Call service method"

        transportQueryService -> transportQuery "Handle query"
        transportQueryService -> transportRepository "Call repository method"

        transportCommandService -> transportCommand "Handle command"
        transportCommandService -> transportRepository "Call repository method"

        transportRepository -> deliveryDB "Store, update, delete and fetch records - transport" "SQL transaction"

        saleExternalService -> saleContextFacade "Call service method"
        deliveryContextFacade -> deliveryCommandService "Call service method"

    }
    views {
        systemContext comprasUPC "ComprasUPCSystemContext" "Diagrama de Contexto de ComprasUPC" {
            include *
            autoLayout
        }
        container comprasUPC "ComprasUPCContainer" "Diagrama de Contexto de ComprasUPC" {
            include *
            autoLayout
        }
        component searchAndSelectBC "searchAndSelectComponent" "Diagrama de Componentes SearchAndSelectBC" {
            include *
            autoLayout tb
        }
        component shoppingCartBC "shoppingCartComponent" "Diagrama de Componentes ShoppingCartBC" {
            include *
            autoLayout tb
        }
        component paymentBC "paymentComponent" "Diagrama de Componentes PaymentBC" {
            include *
            autoLayout tb
        }
        component deliveryBC "deliveryComponent" "Diagrama de Componentes DeliveryBC" {
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
                icon https://static.structurizr.com/themes/amazon-web-services-2020.04.30/Amazon-EC2_D2-Instance_light-bg@4x.png
            }
            element "LandingPage" {
                shape WebBrowser
                background #048000
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