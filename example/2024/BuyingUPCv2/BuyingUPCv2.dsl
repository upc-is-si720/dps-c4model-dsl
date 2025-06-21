workspace "BuyingUPCv2" "Sistema de Venta de productos" {

    model {
        # --------------------------------------------------------
        # Person
        # --------------------------------------------------------
        shopper = person "Shopper" "Persona que realiza la compra de productos" "Shopper"
        manager = person "Manager" "Persona que gestiona el software" "Manager"
        anonymous = person "Anonymous" "Persona no registrada" "Anonymous"

        # --------------------------------------------------------
        # softwareSystem 
        # --------------------------------------------------------
        buyingUPC = softwareSystem "BuyingUPC" "Software de soporte para la Compra de productos" "BuyingUPC" {
            webApp = container "Web Application" "Single-page Application de Compras" "Angular v18.1 / Typescript 5.6.3" "WebApp"
            mobileApp = container "Mobile Application" "App de Compras" "Iphone / iOS / Swift 6.0" "MobileApp"

            apiGateway = container "Api Gateway" "Controlador de tráfico de solicitudes de API entrantes de back-end" "Amazon API Gateway" "ApiGateway"
            
            # --------------------------------------------------------
            # SearchAndSelect Bounded Context
            # --------------------------------------------------------
            searchAndSelectBC = container "Search and Select Bounded Context" "Permite la busqueda y agregar productos al carrito de compras" "Express.js / ECMAScript v2024" "SearchAndSelectBC,BoundedContext"  {
                searchEngineController = component "SearchEngine Controller" "RESTful API Controller class del SearchEngine" "Class / Express.js / ECMAScript v2024" "SearchEngineController,Controller"
                group "searchEngine" {
                    searchEngineRepository = component "SearchEngine Repository" "Repository Interface de SearchEngine" "Interface / Express.js / ECMAScript v2024" "SearchEngineRepository,Repository"
                    searchEngineCommandService = component "SearchEngine CommandService" "Business Logic del Command del SearchEngine" "Class / Express.js / ECMAScript v2024" "SearchEngineCommandService,Service"
                    searchEngineQueryService = component "SearchEngine QueryService" "Business Logic del query del SearchEngine" "Class / Express.js / ECMAScript v2024" "SearchEngineQueryService,Service"
                }
                group "product" {
                    productRepository = component "Product Repository" "Repository Interface de Product" "Interface / Express.js / ECMAScript v2024" "ProductRepository,Repository"
                    productQueryService = component "Product QueryService" "Business Logic del query del Product" "Class / Express.js / ECMAScript v2024" "ProductQueryService,Service"
                }
                group "outboundservices" {
                    cartExternalService = component "Cart ExternalService" "External Business Logic de carrito de compras" "Class / Express.js / ECMAScript v2024" "CartExternalService,ExternalService"
                }
                group "outboundexternal" {
                    googlePhotosExternalService = component "Google Photos ExternalService" "External Business Logic de fotos de productos" "Class / Express.js / ECMAScript v2024" "GooglePhotosExternalService,ExternalService"
                }
            }

            # --------------------------------------------------------
            # Shopping Cart Bounded Context
            # --------------------------------------------------------
            shoppingCartBC = container "Shopping cart Bounded Context" "Permite la gestión del carrito de compras" "Express.js / ECMAScript v2024" "ShoppingCartBC,BoundedContext" {
                cartController = component "Cart Controller" "RESTful API Controller class del Cart" "Class / Express.js / ECMAScript v2024" "CartController,Controller"
                group "Cart"  {
                    cartRepository = component "Cart Repository" "Repository Interface de Cart" "Interface / Express.js / ECMAScript v2024" "CartRepository,Repository"
                    cartCommandService = component "Cart CommandService" "Business Logic del Command del Cart" "Class / Express.js / ECMAScript v2024" "CartCommandService,Service"
                    cartQueryService = component "Cart QueryService" "Business Logic del query del Cart" "Class / Express.js / ECMAScript v2024" "CartQueryService,Service"
                }
                group "outboundservices" {
                    customerExternalService = component "Customer ExternalService" "External Business Logic de cliente" "Class / Express.js / ECMAScript v2024" "CustomerExternalService,ExternalService"
                }
                group "inboundservices" {
                    cartContextFacade = component "Cart ContextFacade" "Facade Business Logic de carrito de compras" "Class / Express.js / ECMAScript v2024" "CartContextFacade,ContextFacade"
                }
            }

            # --------------------------------------------------------
            # Payment Bounded Context
            # --------------------------------------------------------
            paymentBC = container "Payment Bounded Context" "Permite el pago de producto del carrito de compras" "Express.js / ECMAScript v2024" "PaymentBC,BoundedContext" {
                paymentController = component "Payment Controller" "RESTful API Controller class del Payment" "Class / Express.js / ECMAScript v2024" "PaymentController,Controller"
                customerController = component "Customer Controller" "RESTful API Controller class del Customer" "Class / Express.js / ECMAScript v2024" "CustomerController,Controller"
                group "Payment" {
                    paymentRepository = component "Payment Repository" "Repository Interface de Payment" "Interface / Express.js / ECMAScript v2024" "PaymentRepository,Repository"
                    paymentCommandService = component "Payment CommandService" "Business Logic del Command del Payment" "Class / Express.js / ECMAScript v2024" "PaymentCommandService,Service"
                    paymentQueryService = component "Payment QueryService" "Business Logic del query del Payment" "Class / Express.js / ECMAScript v2024" "PaymentQueryService,Service"
                }
                group "Customer" {
                    customerRepository = component "Customer Repository" "Repository Interface de Customer" "Interface / Express.js / ECMAScript v2024" "CustomerRepository,Repository"
                    customerCommandService = component "Customer CommandService" "Business Logic del Command del Customer" "Class / Express.js / ECMAScript v2024" "CustomerCommandService,Service"
                    customerQueryService = component "Customer QueryService" "Business Logic del query del Customer" "Class / Express.js / ECMAScript v2024" "CustomerQueryService,Service"
                }
                group "Sale" {
                    saleRepository = component "Sale Repository" "Repository Interface de Sale" "Interface / Express.js / ECMAScript v2024" "SaleRepository,Repository"
                    saleCommandService = component "Sale CommandService" "Business Logic del Command del Sale" "Class / Express.js / ECMAScript v2024" "SaleCommandService,Service"
                    saleQueryService = component "Sale QueryService" "Business Logic del query del Sale" "Class / Express.js / ECMAScript v2024" "SaleQueryService,Service"
                }
                group "outboundservices" {
                    deliveryExternalService = component "Delivery ExternalService" "External Business Logic de entrega de productos" "Class / Express.js / ECMAScript v2024" "DeliveryExternalService,ExternalService"
                }
                group "outboundexternal" {
                    walletApiExternalService = component "Wallet Api ExternalService" "External Business Logic de pago mediante billetera electrónica: yape y plin" "Class / Express.js / ECMAScript v2024" "WalletApiExternalService,ExternalService"
                    pagoEfectivoExternalService = component "PagoEfectivo ExternalService" "External Business Logic de Generación de Código de pago" "Class / Express.js / ECMAScript v2024" "PagoEfectivoExternalService,ExternalService"
                    googleMapExternalService = component "Google Map ExternalService" "External Business Logic para la ubicación Geoespacial de la dirección en el mapa" "Class / Express.js / ECMAScript v2024" "GoogleMapExternalService,ExternalService"
                }
                group "inboundservices" {
                    saleContextFacade = component "Sale ContextFacade" "Facade Business Logic de venta de productos" "Class / Express.js / ECMAScript v2024" "SaleContextFacade,ContextFacade"
                    customerContextFacade = component "Customer ContextFacade" "Facade Business Logic de cliente" "Class / Express.js / ECMAScript v2024" "CustomerContextFacade,ContextFacade"
                }
            }

            # --------------------------------------------------------
            # Delivery Bounded Context
            # --------------------------------------------------------
            deliveryBC = container "Delivery Bounded Context" "Gestiona la entraga de productos comprados" "Express.js / ECMAScript v2024" "DeliveryBC,BoundedContext" {
                deliveryController = component "Delivery Controller" "RESTful API Controller class del Delivery" "Class / Express.js / ECMAScript v2024" "DeliveryController,Controller"
                transportController = component "Transport Controller" "RESTful API Controller class del Transport" "Class / Express.js / ECMAScript v2024" "TransportController,Controller"
                group "Delivery" {
                    deliveryRepository = component "Delivery Repository" "Repository Interface de Delivery" "Interface / Express.js / ECMAScript v2024" "DeliveryRepository,Repository"
                    deliveryCommandService = component "Delivery CommandService" "Business Logic del Command del Delivery" "Class / Express.js / ECMAScript v2024" "DeliveryCommandService,Service"
                    deliveryQueryService = component "Delivery QueryService" "Business Logic del query del Delivery" "Class / Express.js / ECMAScript v2024" "DeliveryQueryService,Service"
                }
                group "Transport" {
                    transportRepository = component "Transport Repository" "Repository Interface de Transport" "Interface / Express.js / ECMAScript v2024" "TransportRepository,Repository"
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

            # --------------------------------------------------------
            # databases
            # --------------------------------------------------------
            group "Databases" {
                searchAndSelectDB = container "Search and Select Database" "Guarda información de la selección de productos" "MongoDB Database v8.0" "SearchAndSelectDB,Database"
                shoppingCartDB = container "Shopping cart Database" "Guarda información de los productos agregados al carrito de compras" "MongoDB Database v8.0" "ShoppingCartDB,Database"
                paymentDB = container "Payment Database" "Guarda información de los pago de los productos a comprar" "Redis Database v7.4" "PaymentDB,Database"
                deliveryDB = container "Delivery Database" "Guarda información de la entrega de los productos comprados" "MongoDB Database v8.0" "DeliveryDB,Database"
            }
        }

        # --------------------------------------------------------
        # External System
        # --------------------------------------------------------
        googlePhotos = softwareSystem "Google Photos" "Repositorio de fotos" "GooglePhotos,ExternalSystem"
        googleMap = softwareSystem "Google Map" "Api de Interacción con las Mapas de Google" "GoogleMap,ExternalSystem"
        walletAPI = softwareSystem "Wallet API" "Api de Billetera eletrónica: yape y plin" "WalletAPI,ExternalSystem"
        pagoEfectivo = softwareSystem "Pago Efectivo" "Api de Pago Efectivo" "PagoEfectivo,ExternalSystem"

        # --------------------------------------------------------
        # RelationShip
        # --------------------------------------------------------

        # --------------------------------------------------------
        # Relationship systemContext
        # --------------------------------------------------------
        shopper -> buyingUPC "Compra productos"
        manager -> buyingUPC "Gestiona Software"
        anonymous -> buyingUPC "View productos"
        buyingUPC -> googlePhotos "Query de fotos de producto seleccionado"
        buyingUPC -> googleMap "Ubicación Geoespacial de la dirección en el mapa"
        googlePhotos -> buyingUPC "Response de fotos de los producto"
        buyingUPC -> walletAPI "Generación del QR de pago"
        buyingUPC -> pagoEfectivo "Generación de Código de pago"

        # --------------------------------------------------------
        # Relationship container
        # --------------------------------------------------------
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
        paymentBC -> pagoEfectivo "Generación de Código de pago"
        paymentBC -> googleMap "Ubicación Geoespacial de la dirección en el mapa"

        # --------------------------------------------------------
        # Relationships SearchAndSelect Bounded Context
        # --------------------------------------------------------
        apiGateway -> searchEngineController "Request GET del endpoint de Búsqueda"

        searchEngineController -> searchEngineQueryService "Call service method"
        searchEngineController -> searchEngineCommandService "Call service method"
        searchEngineController -> productQueryService "Call service method"
        
        searchEngineQueryService -> searchEngineRepository "Call repository method"

        searchEngineCommandService -> searchEngineRepository "Call repository method"
        searchEngineCommandService -> cartExternalService "Call external service method"
        searchEngineCommandService -> googlePhotosExternalService "Endpoint Request" "HTTPS / Json"

        searchEngineRepository -> searchAndSelectDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"

        productQueryService -> productRepository "Call repository method"

        productRepository -> searchAndSelectDB "fetch records - product" "SQL transaction"

        cartExternalService -> cartContextFacade "Agregar producto al carrito de Compras"
        googlePhotosExternalService -> googlePhotos "Query de fotos de producto seleccionado"
        googlePhotos -> googlePhotosExternalService "Response de fotos de los producto"

        # --------------------------------------------------------
        # Relationships ShoppingCart Bounded Context
        # --------------------------------------------------------
        apiGateway -> cartController "Request GET, POST, PUT, DELETE del endpoint del carrito de compras"

        cartController -> cartQueryService "Call service method"
        cartController -> cartCommandService "Call service method"

        cartQueryService -> cartRepository "Call repository method"

        cartCommandService -> cartRepository "Call repository method"
        cartCommandService -> customerExternalService "Call external service method"

        cartRepository -> shoppingCartDB "Store, update, delete and fetch records - cart" "SQL transaction"

        customerExternalService -> customerContextFacade "Continuar Compra"
        cartContextFacade -> cartCommandService "Call service method"

        # --------------------------------------------------------
        # Relationships Payment Bounded Context
        # --------------------------------------------------------
        apiGateway -> customerController "Request GET, POST, PUT, DELETE del endpoint del customer"

        customerController -> customerQueryService "Call service method"
        customerController -> customerCommandService "Call service method"

        customerQueryService -> customerRepository "Call repository method"

        customerCommandService -> customerRepository "Call repository method"
        customerCommandService -> paymentCommandService "Call service method"

        customerRepository -> paymentDB "Store, update, delete and fetch records - customer" "SQL transaction"

        apiGateway -> paymentController "Request POST del endpoint del payment"

        paymentController -> paymentQueryService "Call service method"
        paymentController -> paymentCommandService "Call service method"

        paymentQueryService -> paymentRepository "Call repository method"

        paymentCommandService -> paymentRepository "Call repository method"
        paymentCommandService -> walletApiExternalService "Call external service method"
        paymentCommandService -> pagoEfectivoExternalService "Call external service method"
        paymentCommandService -> googleMapExternalService "Call external service method"
        paymentCommandService -> saleCommandService "Call service method"

        paymentRepository -> paymentDB "Store, update, delete and fetch records - payment" "SQL transaction"

        saleQueryService -> saleRepository "Call repository method"

        saleCommandService -> saleRepository "Call repository method"
        saleCommandService -> deliveryExternalService "Call external service method"

        saleRepository -> paymentDB "Store, update, delete and fetch records - sale" "SQL transaction"

        walletApiExternalService -> walletApi "Generación del QR de pago"
        pagoEfectivoExternalService -> pagoEfectivo "Generación de Código de pago"
        googleMapExternalService -> googleMap "Ubicación Geoespacial de la dirección en el mapa"
        deliveryExternalService -> deliveryContextFacade "Planificar la entrega del producto"
        
        customerContextFacade -> customerCommandService "Call service method"
        saleContextFacade -> saleQueryService "Call service method"

        # --------------------------------------------------------
        # Relationships Delivery Bounded Context
        # --------------------------------------------------------

        apiGateway -> deliveryController "Request GET, POST, PUT, DELETE del endpoint del delivery"

        deliveryController -> deliveryQueryService "Call service method"
        deliveryController -> deliveryCommandService "Call service method"

        deliveryQueryService -> deliveryRepository "Call repository method"
        deliveryQueryService -> saleExternalService "Call service method"

        deliveryCommandService -> deliveryRepository "Call repository method"
        deliveryCommandService -> transportQueryService "Call service method"

        deliveryRepository -> deliveryDB "Store, update, delete and fetch records - delivery" "SQL transaction"

        apiGateway -> transportController "Request GET, POST, PUT, DELETE del endpoint del transport"

        transportController -> transportQueryService "Call service method"
        transportController -> transportCommandService "Call service method"

        transportQueryService -> transportRepository "Call repository method"

        transportCommandService -> transportRepository "Call repository method"

        transportRepository -> deliveryDB "Store, update, delete and fetch records - transport" "SQL transaction"

        saleExternalService -> saleContextFacade "Call service method"
        deliveryContextFacade -> deliveryCommandService "Call service method"

    }
    # --------------------------------------------------------
    # View c4 Model
    # --------------------------------------------------------
    views {
        # --------------------------------------------------------
        # View SystemContext
        # --------------------------------------------------------
        systemContext buyingUPC "BuyingUPCSystemContext" "Software de soporte para la Compra de productos" {
            include *
            autoLayout tb
        }

        # --------------------------------------------------------
        # View Container
        # --------------------------------------------------------
        container buyingUPC "BuyingUPCContainer" "Container del Software de soporte" {
            include *
            autoLayout tb
        }

        # --------------------------------------------------------
        # View
        # --------------------------------------------------------
        component searchAndSelectBC "searchAndSelectComponent" "Diagrama de Componentes SearchAndSelectBC" {
            include *
            autoLayout tb
        }

        # --------------------------------------------------------
        # View 
        # --------------------------------------------------------
        component shoppingCartBC "shoppingCartComponent" "Diagrama de Componentes ShoppingCartBC" {
            include *
            autoLayout tb
        }

        # --------------------------------------------------------
        # View
        # --------------------------------------------------------
        component paymentBC "paymentComponent" "Diagrama de Componentes PaymentBC" {
            include *
            autoLayout tb
        }

        # --------------------------------------------------------
        # View
        # --------------------------------------------------------
        component deliveryBC "deliveryComponent" "Diagrama de Componentes DeliveryBC" {
            include *
            autoLayout tb
        }

        # --------------------------------------------------------
        # Style
        # # --------------------------------------------------------
        styles {
            element "Person" {
                shape Person
                background #5F04B4
                color #FFFFFF
            }
            element "Software System" {
                background #C22777
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