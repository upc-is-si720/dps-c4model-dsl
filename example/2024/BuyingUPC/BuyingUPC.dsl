workspace "BuyingUPC" "Sistema de Venta de productos" {

    model {
        # Person
        shopper = person "Shopper" "Persona que realiza la compra de productos" "Shopper"
        manager = person "Manager" "Persona que gestiona el software" "Manager"
        anonymous = person "Anonymous" "Persona no registrada" "Anonymous"

        # softwareSystem 
        buyingUPC = softwareSystem "BuyingUPC" "Software de soporte para la Compra de productos" "BuyingUPC" {
            webApp = container "Web Application" "Single-page Application de Compras" "Angular v18.1 / Typescript 5.6.3" "WebApp"
            mobileApp = container "Mobile Application" "App de Compras" "Iphone / iOS / Swift 6.0" "MobileApp"

            apiGateway = container "Api Gateway" "Controlador de tráfico de solicitudes de API entrantes de back-end" "Amazon API Gateway" "ApiGateway"
            
            # Express.js / ECMAScript v2024

            # SearchAndSelect Bounded Context
            searchAndSelectBC = container "Search and Select Bunded Context" "Permite la busqueda y agregar productos al carrito de compras" "Express.js / ECMAScript v2024" "SearchAndSelectBC,BoundedContext"  {
                searchEngineController = component "SearchEngine Controller" "RESTful API Controller class del SearchEngine" "Class / Express.js / ECMAScript v2024" "SearchEngineController,Controller"
                group "searchEngine" {
                    searchEngineRepository = component "SearchEngine Repository" "Repository Interface de SearchEngine" "Interface / Express.js / ECMAScript v2024" "SearchEngineRepository,Repository"
                    searchEngineQuery = component "SearchEngine Query" "Query for read SearchEngine" "Record" "SearchEngineQuery, Query"
                    searchEngineCommand = component "SearchEngine Command" "Command for create, update and delete SearchEngine" "Record" "SearchEngineCommand, Command"
                    searchEngineCommandService = component "SearchEngine CommandService" "Business Logic del Command del SearchEngine" "Class / Express.js / ECMAScript v2024" "SearchEngineCommandService,Service"
                    searchEngineQueryService = component "SearchEngine QueryService" "Business Logic del query del SearchEngine" "Class / Express.js / ECMAScript v2024" "SearchEngineQueryService,Service"
                }
                group "product" {
                    productQuery = component "Product Query" "Query for read Product" "Record" "ProductQuery, Query"
                }
                group "outboundservices" {
                    cartExternalService = component "Cart ExternalService" "External Business Logic de carrito de compras" "Class / Express.js / ECMAScript v2024" "CartExternalService,ExternalService"
                    googlePhotosExternalService = component "Google Photos ExternalService" "External Business Logic de fotos de productos" "Class / Express.js / ECMAScript v2024" "GooglePhotosExternalService,ExternalService"
                }
            }

            # Shopping Cart Bounded Context
            shoppingCartBC = container "Shopping cart Bunded Context" "Permite la gestión del carrito de compras" "Express.js / ECMAScript v2024" "ShoppingCartBC,BoundedContext" {
                cartController = component "Cart Controller" "RESTful API Controller class del Cart" "Class / Express.js / ECMAScript v2024" "CartController,Controller"
                group "Cart"  {
                    cartRepository = component "Cart Repository" "Repository Interface de Cart" "Interface / Express.js / ECMAScript v2024" "CartRepository,Repository"
                    cartQuery = component "Cart Query" "Query for read Cart" "Record" "CartQuery, Query"
                    cartCommand = component "Cart Command" "Command for create, update and delete Cart" "Record" "CartCommand, Command"
                    cartCommandService = component "Cart CommandService" "Business Logic del Command del Cart" "Class / Express.js / ECMAScript v2024" "CartCommandService,Service"
                    cartQueryService = component "Cart QueryService" "Business Logic del query del Cart" "Class / Express.js / ECMAScript v2024" "CartQueryService,Service"
                }
                group "CartItem" {
                    cartItemQuery = component "CartItem Query" "Query for read CartItem" "Record" "CartItemQuery, Query"
                    cartItemCommand = component "CartItem Command" "Command for create, update and delete CartItem" "Record" "CartItemCommand, Command"
                }
                group "outboundservices" {
                    customerExternalService = component "Customer ExternalService" "External Business Logic de cliente" "Class / Express.js / ECMAScript v2024" "CustomerExternalService,ExternalService"
                }
                group "inboundservices" {
                    cartContextFacade = component "Cart ContextFacade" "Facade Business Logic de carrito de compras" "Class / Express.js / ECMAScript v2024" "CartContextFacade,ContextFacade"
                }
            }

            # Payment Bounded Context
            paymentBC = container "Payment Bunded Context" "Permite el pago de producto del carrito de compras" "Express.js / ECMAScript v2024" "PaymentBC,BoundedContext" {
                paymentController = component "Payment Controller" "RESTful API Controller class del Payment" "Class / Express.js / ECMAScript v2024" "PaymentController,Controller"
                customerController = component "Customer Controller" "RESTful API Controller class del Customer" "Class / Express.js / ECMAScript v2024" "CustomerController,Controller"
                group "Payment" {
                    paymentRepository = component "Payment Repository" "Repository Interface de Payment" "Interface / Express.js / ECMAScript v2024" "PaymentRepository,Repository"
                    paymentQuery = component "Payment Query" "Query for read Payment" "Record" "PaymentQuery, Query"
                    paymentCommand = component "Payment Command" "Command for create, update and delete Payment" "Record" "PaymentCommand, Command"
                    paymentCommandService = component "Payment CommandService" "Business Logic del Command del Payment" "Class / Express.js / ECMAScript v2024" "PaymentCommandService,Service"
                    paymentQueryService = component "Payment QueryService" "Business Logic del query del Payment" "Class / Express.js / ECMAScript v2024" "PaymentQueryService,Service"
                }
                group "Customer" {
                    customerRepository = component "Customer Repository" "Repository Interface de Customer" "Interface / Express.js / ECMAScript v2024" "CustomerRepository,Repository"
                    customerQuery = component "Customer Query" "Query for read Customer" "Record" "CustomerQuery, Query"
                    customerCommand = component "Customer Command" "Command for create, update and delete Customer" "Record" "CustomerCommand, Command"
                    customerCommandService = component "Customer CommandService" "Business Logic del Command del Customer" "Class / Express.js / ECMAScript v2024" "CustomerCommandService,Service"
                    customerQueryService = component "Customer QueryService" "Business Logic del query del Customer" "Class / Express.js / ECMAScript v2024" "CustomerQueryService,Service"
                }
                group "Sale" {
                    saleRepository = component "Sale Repository" "Repository Interface de Sale" "Interface / Express.js / ECMAScript v2024" "SaleRepository,Repository"
                    saleQuery = component "Sale Query" "Query for read Sale" "Record" "SaleQuery, Query"
                    saleCommand = component "Sale Command" "Command for create, update and delete Sale" "Record" "SaleCommand, Command"
                    saleCommandService = component "Sale CommandService" "Business Logic del Command del Sale" "Class / Express.js / ECMAScript v2024" "SaleCommandService,Service"
                    saleQueryService = component "Sale QueryService" "Business Logic del query del Sale" "Class / Express.js / ECMAScript v2024" "SaleQueryService,Service"
                }
                group "SaleItem" {
                    saleItemQuery = component "SaleItem Query" "Query for read SaleItem" "Record" "SaleItemQuery, Query"
                    saleItemCommand = component "SaleItem Command" "Command for create, update and delete SaleItem" "Record" "SaleItemCommand, Command"
                }
                group "outboundservices" {
                    deliveryExternalService = component "Delivery ExternalService" "External Business Logic de entrega de productos" "Class / Express.js / ECMAScript v2024" "DeliveryExternalService,ExternalService"
                    walletApiExternalService = component "Wallet Api ExternalService" "External Business Logic de pago mediante billetera electrónica: yape y plin" "Class / Express.js / ECMAScript v2024" "WalletApiExternalService,ExternalService"
                }
                group "inboundservices" {
                    saleContextFacade = component "Sale ContextFacade" "Facade Business Logic de venta de productos" "Class / Express.js / ECMAScript v2024" "SaleContextFacade,ContextFacade"
                    customerContextFacade = component "Customer ContextFacade" "Facade Business Logic de cliente" "Class / Express.js / ECMAScript v2024" "CustomerContextFacade,ContextFacade"
                }
            }

            # Delivery Bounded Context
            deliveryBC = container "Delivery Bunded Context" "Gestiona la entraga de productos comprados" "Express.js / ECMAScript v2024" "DeliveryBC,BoundedContext" {
                deliveryController = component "Delivery Controller" "RESTful API Controller class del Delivery" "Class / Express.js / ECMAScript v2024" "DeliveryController,Controller"
                transportController = component "Transport Controller" "RESTful API Controller class del Transport" "Class / Express.js / ECMAScript v2024" "TransportController,Controller"
                group "Delivery" {
                    deliveryRepository = component "Delivery Repository" "Repository Interface de Delivery" "Interface / Express.js / ECMAScript v2024" "DeliveryRepository,Repository"
                    deliveryQuery = component "Delivery Query" "Query for read Delivery" "Record" "DeliveryQuery, Query"
                    deliveryCommand = component "Delivery Command" "Command for create, update and delete Delivery" "Record" "DeliveryCommand, Command"
                    deliveryCommandService = component "Delivery CommandService" "Business Logic del Command del Delivery" "Class / Express.js / ECMAScript v2024" "DeliveryCommandService,Service"
                    deliveryQueryService = component "Delivery QueryService" "Business Logic del query del Delivery" "Class / Express.js / ECMAScript v2024" "DeliveryQueryService,Service"
                }
                group "Transport" {
                    transportRepository = component "Transport Repository" "Repository Interface de Transport" "Interface / Express.js / ECMAScript v2024" "TransportRepository,Repository"
                    transportQuery = component "Transport Query" "Query for read Transport" "Record" "TransportQuery, Query"
                    transportCommand = component "Transport Command" "Command for create, update and delete Transport" "Record" "TransportCommand, Command"
                    transportCommandService = component "Transport CommandService" "Business Logic del Command del Transport" "Class / Express.js / ECMAScript v2024" "TransportCommandService,Service"
                    transportQueryService = component "Transport QueryService" "Business Logic del query del Transport" "Class / Express.js / ECMAScript v2024" "TransportQueryService,Service"
                }
                group "outboundservices" {
                    saleExternalService = component "Sale ExternalService" "External Business Logic de venta de productos" "Class / Express.js / ECMAScript v2024" "SaleExternalService,ExternalService"
                }
                group "inboundservices" {
                    deliveryContextFacade = component "Delivery ContextFacade" "Facade Business Logic de entrega de productos" "Class / Express.js / ECMAScript v2024" "DeliveryContextFacade,ContextFacade"
                }
            }

            group "Databases" {
                searchAndSelectDB = container "Search and Select Database" "Guarda información de la selección de productos" "MongoDB Database v8.0" "SearchAndSelectDB,Database"
                shoppingCartDB = container "Shopping cart Database" "Guarda información de los productos agregados al carrito de compras" "MongoDB Database v8.0" "ShoppingCartDB,Database"
                paymentDB = container "Payment Database" "Guarda información de los pago de los productos a comprar" "Redis Database v7.4" "PaymentDB,Database"
                deliveryDB = container "Delivery Database" "Guarda información de la entrega de los productos comprados" "MongoDB Database v8.0" "DeliveryDB,Database"
            }

        }

        # External System
        googlePhotos = softwareSystem "Google Photos" "Repositorio de fotos" "GooglePhotos,ExternalSystem"
        walletAPI = softwareSystem "Wallet API" "Api de Billetera eletrónica: yape y plin" "WalletAPI,ExternalSystem"

        # Relationship systemContext
        shopper -> buyingUPC "Compra productos"
        manager -> buyingUPC "Gestiona Software"
        anonymous -> buyingUPC "View productos"
        buyingUPC -> googlePhotos "Query de fotos de producto seleccionado"
        googlePhotos -> buyingUPC "Response de fotos de los producto"
        buyingUPC -> walletAPI "Generación del QR de pago"

        # Relationship container
        shopper -> webApp "Compra productos"
        shopper -> mobileApp "Compra productos"
        manager -> webApp "Gestiona la Aplicacción"
        anonymous -> webApp "Buscar y agregar productos al Carrito de compras"

        webApp -> apiGateway "Solicitudes HTTP / API"
        mobileApp -> apiGateway "HTTP Request / API"

        apiGateway -> searchAndSelectBC "Endpoint request" "HTTPS / Json"
        apiGateway -> shoppingCartBC "Endpoint request" "HTTPS / Json"
        apiGateway -> paymentBC "Endpoint request" "HTTPS / Json"
        apiGateway -> deliveryBC "Endpoint request" "HTTPS / Json"

        searchAndSelectBC -> shoppingCartBC "Agregar producto al carrito de Compras" "ACL"
        shoppingCartBC -> paymentBC "Continuar Compra" "ACL"
        paymentBC -> deliveryBC "Planificar la entrega del producto" "ACL"

        searchAndSelectBC -> searchAndSelectDB "Guardar y recupera datos" "SQL Commands"
        shoppingCartBC -> shoppingCartDB "Guardar y recupera datos" "SQL Commands"
        paymentBC -> paymentDB "Guardar y recupera datos" "SQL Commands"
        deliveryBC -> deliveryDB "Guardar y recupera datos" "SQL Commands"

        searchAndSelectBC -> googlePhotos "Query de fotos de producto seleccionado"
        googlePhotos -> searchAndSelectBC "Response de fotos de los producto"
        paymentBC -> walletAPI "Generación del QR de pago"

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
        systemContext buyingUPC "BuyingUPCSystemContext" "Software de soporte para la Compra de productos" {
            include *
            autoLayout tb
        }
        container buyingUPC "BuyingUPCContainer" "Container del Software de soporte" {
            include *
            autoLayout tb
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