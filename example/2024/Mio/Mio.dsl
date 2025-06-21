workspace "Mío" "Plataforma de compra y venta de productos y servicios" {

    model {
        /* Definición */
        comprador = person "Comprador" "Usuario que puede comprar artículos de segunda mano" "Comprador"
        vendedor = person "Vendedor" "Persona que vende un artículo de segunda mano" "Vendedor"
        mio = softwareSystem "Mío" "La aplicación móvil que ofrece una interfaz intuitiva y amigable para vender, comprar o intercambiar artículos de segunda mano" "Mio"{
            mobileApp = container "Mobile Application" "Android and IOs Mobile" "Kotlin 2.0.0/Swift 5.10" "MobileApp"
            apiGateway = container "Api Gateway" "Manager that accepts all API calls" "Amazon API Gateway" "ApiGateway"
            database = container "Database" "Almacenamiento de datos de usuarios, productos y transacciones" "MongoDB 8.0" "Database"
            
            loginBc = container "Login Bounded Context" "User authentication and authorization" "Kotlin 2.0.0/Swift 5.10" "LoginBC,BoundedContext" {
                group "user" {
                    userEntity = component "User Entity" "Entity for User" "Class" "UserEntity, Entity"
                    userRepository = component "User Repository" "Abstract for repository User" "Interface" "UserRepository, Repository"
                    userCommand = component "User Command" "Command for create, update and delete entity User" "Record" "UserCommand, Command"
                    userQuery = component "User Query" "Query for read entity User" "Record" "UserQuery, Query"
                    userCommandService = component "User CommandService" "Business logic for create, update and delete entity User" "Interface and Class" "UserCommandService, Service"
                    userQueryService = component "User QueryService" "Business logic for read entity User" "Interface and Class" "UserQueryService, Service"
                }
                loginController = component "Login Controller" "RESTful API for Login" "Class" "LoginController, Controller"
            }

            auctionBc = container "Auction Bounded Context" "Gestión de subastas" "Kotlin 2.0.0/Swift 5.10" "AuctionBC,BoundedContext" {
                group "auction" {
                    auctionEntity = component "Auction Entity" "Entity for Auction" "Class" "AuctionEntity, Entity"
                    auctionRepository = component "Auction Repository" "Abstract for repository Auction" "Interface" "AuctionRepository, Repository"
                    auctionCommand = component "Auction Command" "Command for create, update and delete entity Auction" "Record" "AuctionCommand, Command"
                    auctionQuery = component "Auction Query" "Query for read entity Auction" "Record" "AuctionQuery, Query"
                    auctionCommandService = component "Auction CommandService" "Business logic for create, update and delete entity Auction" "Interface and Class" "AuctionCommandService, Service"
                    auctionQueryService = component "Auction QueryService" "Business logic for read entity Auction" "Interface and Class" "AuctionQueryService, Service"
                }
                auctionController = component "Auction Controller" "RESTful API for Auction" "Class" "AuctionController, Controller"
            }

            notificationBc = container "Notification Bounded Context" "Gestión de notificaciones" "Kotlin 2.0.0/Swift 5.10" "NotificationBC,BoundedContext" {
                group "notification" {
                    notificationEntity = component "Notification Entity" "Entity for Notification" "Class" "NotificationEntity, Entity"
                    notificationRepository = component "Notification Repository" "Abstract for repository Notification" "Interface" "NotificationRepository, Repository"
                    notificationCommand = component "Notification Command" "Command for create, update and delete entity Notification" "Record" "NotificationCommand, Command"
                    notificationQuery = component "Notification Query" "Query for read entity Notification" "Record" "NotificationQuery, Query"
                    notificationCommandService = component "Notification CommandService" "Business logic for create, update and delete entity Notification" "Interface and Class" "NotificationCommandService, Service"
                    notificationQueryService = component "Notification QueryService" "Business logic for read entity Notification" "Interface and Class" "NotificationQueryService, Service"
                }
                notificationController = component "Notification Controller" "RESTful API for Notification" "Class" "NotificationController, Controller"
            }

            paymentBc = container "Payment Bounded Context" "Gestión de pagos" "Kotlin 2.0.0/Swift 5.10" "PaymentBC,BoundedContext" {
                group "payment" {
                    paymentEntity = component "Payment Entity" "Entity for Payment" "Class" "PaymentEntity, Entity"
                    paymentRepository = component "Payment Repository" "Abstract for repository Payment" "Interface" "PaymentRepository, Repository"
                    paymentCommand = component "Payment Command" "Command for create, update and delete entity Payment" "Record" "PaymentCommand, Command"
                    paymentQuery = component "Payment Query" "Query for read entity Payment" "Record" "PaymentQuery, Query"
                    paymentCommandService = component "Payment CommandService" "Business logic for create, update and delete entity Payment" "Interface and Class" "PaymentCommandService, Service"
                    paymentQueryService = component "Payment QueryService" "Business logic for read entity Payment" "Interface and Class" "PaymentQueryService, Service"
                }
                paymentController = component "Payment Controller" "RESTful API for Payment" "Class" "PaymentController, Controller"
            }

            dashboardBc = container "Dashboard Bounded Context" "Recomendación de productos" "Kotlin 2.0.0/Swift 5.10" "DashboardBC,BoundedContext" {
                group "dashboard" {
                    recommendationEntity = component "Recommendation Entity" "Entity for Recommendation" "Class" "RecommendationEntity, Entity"
                    recommendationRepository = component "Recommendation Repository" "Abstract for repository Recommendation" "Interface" "RecommendationRepository, Repository"
                    recommendationQuery = component "Recommendation Query" "Query for read entity Recommendation" "Record" "RecommendationQuery, Query"
                    recommendationCommand = component "Recommendation Command" "Command for create, update and delete entity Recommendation" "Record" "RecommendationCommand, Command"
                    recommendationCommandService = component "Recommendation CommandService" "Business logic for create, update and delete entity Recommendation" "Interface and Class" "RecommendationCommandService, Service"
                    recommendationQueryService = component "Recommendation QueryService" "Business logic for read entity Recommendation" "Interface and Class" "RecommendationQueryService, Service"
                }
            }

            searchBarBc = container "Search Bar Bounded Context" "Búsqueda de productos" "Kotlin 2.0.0/Swift 5.10" "SearchBarBC,BoundedContext" {
                group "search" {
                    searchEntity = component "Search Entity" "Entity for Search" "Class" "SearchEntity, Entity"
                    searchRepository = component "Search Repository" "Abstract for repository Search" "Interface" "SearchRepository, Repository"
                    searchQuery = component "Search Query" "Query for read entity Search" "Record" "SearchQuery, Query"
                    searchCommand = component "Search Command" "Command for create, update and delete entity Search" "Record" "SearchCommand, Command"
                    searchCommandService = component "Search CommandService" "Business logic for create, update and delete entity Search" "Interface and Class" "SearchCommandService, Service"
                    searchQueryService = component "Search QueryService" "Business logic for read entity Search" "Interface and Class" "SearchQueryService, Service"
                }
                searchController = component "Search Controller" "RESTful API for Search" "Class" "SearchController, Controller"
            }

            productBc = container "Productos Bounded Context" "Gestión de productos" "Kotlin 2.0.0/Swift 5.10" "ProductBC,BoundedContext" {
                group "product" {
                    productEntity = component "Product Entity" "Entity for Product" "Class" "ProductEntity, Entity"
                    productRepository = component "Product Repository" "Abstract for repository Product" "Interface" "ProductRepository, Repository"
                    productQuery = component "Product Query" "Query for read entity Product" "Record" "ProductQuery, Query"
                    productCommand = component "Product Command" "Command for create, update and delete entity Product" "Record" "ProductCommand, Command"
                    productCommandService = component "Product CommandService" "Business logic for create, update and delete entity Product" "Interface and Class" "ProductCommandService, Service"
                    productQueryService = component "Product QueryService" "Business logic for read entity Product" "Interface and Class" "ProductQueryService, Service"
                }
                productController = component "Product Controller" "RESTful API for Product" "Class" "ProductController, Controller"
                group "category" {
                    categoryEntity = component "Category Entity" "Entity for Category" "Class" "CategoryEntity, Entity"
                    categoryRepository = component "Category Repository" "Abstract for repository Category" "Interface" "CategoryRepository, Repository"
                    categoryService = component "Category Service" "Business logic for categories" "Interface and Class" "CategoryService, Service"
                }
                group "tag" {
                    tagEntity = component "Tag Entity" "Entity for Tag" "Class" "TagEntity, Entity"
                    tagRepository = component "Tag Repository" "Abstract for repository Tag" "Interface" "TagRepository, Repository"
                    tagService = component "Tag Service" "Business logic for tags" "Interface and Class" "TagService, Service"
                }
            }

            purchaseBc = container "Compras Bounded Context" "Gestión de compras" "Kotlin 2.0.0/Swift 5.10" "PurchaseBC,BoundedContext" {
                group "purchase" {
                    purchaseEntity = component "Purchase Entity" "Entity for Purchase" "Class" "PurchaseEntity, Entity"
                    purchaseRepository = component "Purchase Repository" "Abstract for repository Purchase" "Interface" "PurchaseRepository, Repository"
                    purchaseQuery = component "Purchase Query" "Query for read entity Purchase" "Record" "PurchaseQuery, Query"
                    purchaseCommand = component "Purchase Command" "Command for create, update and delete entity Purchase" "Record" "PurchaseCommand, Command"
                    purchaseCommandService = component "Purchase CommandService" "Business logic for create, update and delete entity Purchase" "Interface and Class" "PurchaseCommandService, Service"
                    purchaseQueryService = component "Purchase QueryService" "Business logic for read entity Purchase" "Interface and Class" "PurchaseQueryService, Service"
                }
                purchaseController = component "Purchase Controller" "RESTful API for Purchase" "Class" "PurchaseController, Controller"
            }

            orderBc = container "Órdenes Bounded Context" "Gestión de órdenes" "Kotlin 2.0.0/Swift 5.10" "OrderBC,BoundedContext" {
                group "order" {
                    orderEntity = component "Order Entity" "Entity for Order" "Class" "OrderEntity, Entity"
                    orderRepository = component "Order Repository" "Abstract for repository Order" "Interface" "OrderRepository, Repository"
                    orderQuery = component "Order Query" "Query for read entity Order" "Record" "OrderQuery, Query"
                    orderCommand = component "Order Command" "Command for create, update and delete entity Order" "Record" "OrderCommand, Command"
                    orderCommandService = component "Order CommandService" "Business logic for create, update and delete entity Order" "Interface and Class" "OrderCommandService, Service"
                    orderQueryService = component "Order QueryService" "Business logic for read entity Order" "Interface and Class" "OrderQueryService, Service"
                }
                orderController = component "Order Controller" "RESTful API for Order" "Class" "OrderController, Controller"
            }

            shipmentBc = container "Envíos Bounded Context" "Gestión de envíos" "Kotlin 2.0.0/Swift 5.10" "ShipmentBC,BoundedContext" {
                group "shipment" {
                    shipmentEntity = component "Shipment Entity" "Entity for Shipment" "Class" "ShipmentEntity, Entity"
                    shipmentRepository = component "Shipment Repository" "Abstract for repository Shipment" "Interface" "ShipmentRepository, Repository"
                    shipmentQuery = component "Shipment Query" "Query for read entity Shipment" "Record" "ShipmentQuery, Query"
                    shipmentCommand = component "Shipment Command" "Command for create, update and delete entity Shipment" "Record" "ShipmentCommand, Command"
                    shipmentCommandService = component "Shipment CommandService" "Business logic for create, update and delete entity Shipment" "Interface and Class" "ShipmentCommandService, Service"
                    shipmentQueryService = component "Shipment QueryService" "Business logic for read entity Shipment" "Interface and Class" "ShipmentQueryService, Service"
                }
                shipmentController = component "Shipment Controller" "RESTful API for Shipment" "Class" "ShipmentController, Controller"
            }
        }

        yapeApi = softwareSystem "YapeApi" "Wallet for paymetn RESTful API" "Yape"
        bcp = softwareSystem "BCP" "BCP Bank RESTful API" "Bcp"
        visa = softwareSystem "Visa" "Visa card RESTful API" "Visa"
        
        /* Relationships */
        vendedor -> mio "Usa" 
        comprador -> mio "Usa" 
        mio -> yapeAPi "manda información del vendedor y comprador"
        mio -> bcp "manda información del vendedor y comprador"
        mio -> visa "manda información del vendedor y comprador"
        visa -> mio "manda información de los pagos"
        
        apiGateway -> database "Lee y escribe datos"
        apiGateway -> auctionBc "Interfaz con"
        apiGateway -> notificationBc "Interfaz con"
        apiGateway -> paymentBc "Interfaz con"
        apiGateway -> loginBc "Interfaz con"
        apiGateway -> dashboardBc "Interfaz con"
        apiGateway -> searchBarBc "Interfaz con"
        apiGateway -> productBc "Interfaz con"
        apiGateway -> purchaseBc "Interfaz con"

        /* Relationship between Marketplace App and its Containers */
        vendedor -> mobileApp "Uses"
        vendedor -> apiGateway "Calls API"
        comprador -> mobileApp "Uses"
        comprador -> apiGateway "Calls API"
        

        /* Login Bounded Context */
        apiGateway -> loginBc "Uses"
        loginBc -> database "Reads/Writes"
        loginController -> userCommandService "Calls service method"
        loginController -> userQueryService "Calls service method"
        userCommandService -> userCommand "Handles command"
        userCommandService -> userRepository "Calls repository method"
        userCommandService -> userEntity "Uses entity"
        userQueryService -> userQuery "Handles query"
        userQueryService -> userRepository "Calls repository method"
        userQueryService -> userEntity "Uses entity"
        userRepository -> database "Reads/Writes"

        /* Auction Bounded Context */
        apiGateway -> auctionBc "Uses"
        auctionBc -> database "Reads/Writes"
        auctionController -> auctionCommandService "Calls service method"
        auctionController -> auctionQueryService "Calls service method"
        auctionCommandService -> auctionCommand "Handles command"
        auctionCommandService -> auctionRepository "Calls repository method"
        auctionCommandService -> auctionEntity "Uses entity"
        auctionQueryService -> auctionQuery "Handles query"
        auctionQueryService -> auctionRepository "Calls repository method"
        auctionQueryService -> auctionEntity "Uses entity"
        auctionRepository -> database "Reads/Writes"

        /* Notification Bounded Context */
        apiGateway -> notificationBc "Uses"
        notificationBc -> database "Reads/Writes"
        notificationController -> notificationCommandService "Calls service method"
        notificationController -> notificationQueryService "Calls service method"
        notificationCommandService -> notificationCommand "Handles command"
        notificationCommandService -> notificationRepository "Calls repository method"
        notificationCommandService -> notificationEntity "Uses entity"
        notificationQueryService -> notificationQuery "Handles query"
        notificationQueryService -> notificationRepository "Calls repository method"
        notificationQueryService -> notificationEntity "Uses entity"
        notificationRepository -> database "Reads/Writes"

        /* Payment Bounded Context */
        apiGateway -> paymentBc "Uses"
        paymentBc -> database "Reads/Writes"
        paymentController -> paymentCommandService "Calls service method"
        paymentController -> paymentQueryService "Calls service method"
        paymentCommandService -> paymentCommand "Handles command"
        paymentCommandService -> paymentRepository "Calls repository method"
        paymentCommandService -> paymentEntity "Uses entity"
        paymentQueryService -> paymentQuery "Handles query"
        paymentQueryService -> paymentRepository "Calls repository method"
        paymentQueryService -> paymentEntity "Uses entity"
        paymentRepository -> database "Reads/Writes"

        /* Dashboard Bounded Context */
        apiGateway -> dashboardBc "Uses"
        dashboardBc -> database "Reads/Writes"
        recommendationCommandService -> recommendationCommand "Handles command"
        recommendationCommandService -> recommendationRepository "Calls repository method"
        recommendationCommandService -> recommendationEntity "Uses entity"
        recommendationQueryService -> recommendationQuery "Handles query"
        recommendationQueryService -> recommendationRepository "Calls repository method"
        recommendationQueryService -> recommendationEntity "Uses entity"
        recommendationRepository -> database "Reads/Writes"

        /* Search Bar Bounded Context */
        apiGateway -> searchBarBc "Uses"
        searchBarBc -> database "Reads/Writes"
        searchController -> searchCommandService "Calls service method"
        searchController -> searchQueryService "Calls service method"
        searchCommandService -> searchCommand "Handles command"
        searchCommandService -> searchRepository "Calls repository method"
        searchCommandService -> searchEntity "Uses entity"
        searchQueryService -> searchQuery "Handles query"
        searchQueryService -> searchRepository "Calls repository method"
        searchQueryService -> searchEntity "Uses entity"
        searchRepository -> database "Reads/Writes"

        /* Product Bounded Context */
        apiGateway -> productBc "Uses"
        productBc -> database "Reads/Writes"
        productController -> productCommandService "Calls service method"
        productController -> productQueryService "Calls service method"
        productCommandService -> productCommand "Handles command"
        productCommandService -> productRepository "Calls repository method"
        productCommandService -> productEntity "Uses entity"
        productQueryService -> productQuery "Handles query"
        productQueryService -> productRepository "Calls repository method"
        productQueryService -> productEntity "Uses entity"
        productRepository -> database "Reads/Writes"
        categoryService -> categoryRepository "Calls repository method"
        categoryService -> categoryEntity "Uses entity"
        tagService -> tagRepository "Calls repository method"
        tagService -> tagEntity "Uses entity"

        /* Purchase Bounded Context */
        apiGateway -> purchaseBc "Uses"
        purchaseBc -> database "Reads/Writes"
        purchaseController -> purchaseCommandService "Calls service method"
        purchaseController -> purchaseQueryService "Calls service method"
        purchaseCommandService -> purchaseCommand "Handles command"
        purchaseCommandService -> purchaseRepository "Calls repository method"
        purchaseCommandService -> purchaseEntity "Uses entity"
        purchaseQueryService -> purchaseQuery "Handles query"
        purchaseQueryService -> purchaseRepository "Calls repository method"
        purchaseQueryService -> purchaseEntity "Uses entity"
        purchaseRepository -> database "Reads/Writes"

        /* Order Bounded Context */
        apiGateway -> orderBc "Uses"
        orderBc -> database "Reads/Writes"
        orderController -> orderCommandService "Calls service method"
        orderController -> orderQueryService "Calls service method"
        orderCommandService -> orderCommand "Handles command"
        orderCommandService -> orderRepository "Calls repository method"
        orderCommandService -> orderEntity "Uses entity"
        orderQueryService -> orderQuery "Handles query"
        orderQueryService -> orderRepository "Calls repository method"
        orderQueryService -> orderEntity "Uses entity"
        orderRepository -> database "Reads/Writes"
        
            /* Shipment Bounded Context */
        apiGateway -> shipmentBc "Uses"
        shipmentBc -> database "Reads/Writes"
        shipmentController -> shipmentCommandService "Calls service method"
        shipmentController -> shipmentQueryService "Calls service method"
        shipmentCommandService -> shipmentCommand "Handles command"
        shipmentCommandService -> shipmentRepository "Calls repository method"
        shipmentCommandService -> shipmentEntity "Uses entity"
        shipmentQueryService -> shipmentQuery "Handles query"
        shipmentQueryService -> shipmentRepository "Calls repository method"
        shipmentQueryService -> shipmentEntity "Uses entity"
        shipmentRepository -> database "Reads/Writes"

        /* Relationship between Mío App and its Containers */
        mobileApp -> apiGateway "Calls API"
        apiGateway -> database "Reads/Writes"
    }

    views {
        systemContext mio "mioSystemContext" {
            include *
            autoLayout
        }
        container mio "mioContainer" {
            include *
            autoLayout
        }
        
        component loginBc "loginBcComponent"{
            include *
            autoLayout
        }
        
        component auctionBc "auctionBcComponent"{
            include *
            autoLayout
        }
        
        component notificationBc "notificationBcComponent"{
            include *
            autoLayout
        }
        
        component paymentBc "paymentBcComponent"{
            include *
            autoLayout
        }
        
        component dashboardBc "dashboardBcComponent"{
            include *
            autoLayout
        }
        
        component searchBarBc "searchBarBcComponent"{
            include *
            autoLayout
        }
        
        component productBc "productBcComponent"{
            include *
            autoLayout
        }
        
        component purchaseBc "purchaseBcComponent"{
            include *
            autoLayout
        }
        
        component orderBc "orderBcComponent"{
            include *
            autoLayout
        }
        
        component shipmentBc "shipmentBcComponent"{
            include *
            autoLayout
        }
  
        styles {
            element "Person" {
                shape Person
                background #9D1444
                color #FFFFFF
            }
            element "MarketplaceApp" {
                background #218F40
                 color #F5EB2C
                shape RoundedBox
            }
            element "Mío App" {
                background #2067F5
                color #FFFFFF
            }
            element "Software System" {
                background #6048F5
                color #FFFFFF
            }
            element "WebApplication" {
                shape WebBrowser
                background #2067F5
                color #FFFFFF
                icon https://static.structurizr.com/themes/amazon-web-services-2020.04.30/Amazon-EC2_D2-Instance_light-bg@4x.png
            }
            element "ApiGateway" {
                shape Pipe
                background Orange
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
            element "Entity" {
                shape Box
                background #7D08BC
                color #FFFFFF
            }
            element "Database" {
                shape Cylinder
                background #306792
                color #FFFFFF
            }
            element "Container" {
                shape Hexagon
                background #805B17
                color #FFFFFF
            }
            element "Group:user" {
                color #FF0000
            }
            element "Group:auction" {
                color #0F9800
            }
            element "Group:notification" {
                color #0000FF
            }
            element "Group:payment" {
                color #FFA500
            }
            element "Group:dashboard" {
                color #4CAF50
            }
            element "Group:search" {
                color #9C27B0
            }
            element "Group:product" {
                color #3F51B5
            }
            element "Group:purchase" {
                color #2196F3
            }
            element "Group:order" {
                color #FF5722
            }
            element "Group:shipment" {
                color #795548
            }
            element "Group:category" {
                color #009688
            }
            element "Group:tag" {
                color #673AB7
            }
        }
    }

    configuration {
        scope softwaresystem
    }
}
