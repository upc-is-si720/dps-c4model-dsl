workspace "TiendaHunt" "TiendaHunt" {

    model {
        # Person
        anonymousUser = person "Anonymous User" "Person who enters the web page to search products." "AnonymousUser"
        buyer = person "Buyer" "Person who has a list of products defined and already paided" "Buyer"
        storeOwner = person "Store Owner" "Person who has a store and manage it through the web" "StoreOwner"

        TiendaHuntSoftware = softwareSystem "tiendahunt.com" "Food Products retail system" "TiendaHuntSoftware" {
            webApp = container "Web App" "Provides the web application via browser" "JavaScript / React JS" "WebApp"
            apiGateway = container "API Gateway" "Provides a set of the Web functionalities via Broswer to interact with the database and another services" "Node.js" "ApiGateway"

            authenticationBC = container "Authentication Bounded Context" "API RESTful of User" "Node.js" "AuthenticationBC, BoundedContext" {
                userController = component "User Controller" "REST Controller class of User" "Node.js / ES5 / Express JS" "UserController"
                userService = component "User Service" "Business logic class for User" "JavaScript/ Express JS / Fastify" "UserService"
                userRepository = component "User Repository" "Interact with the entity User" "JavaScript / Express JS" "UserRepository"
                googleAuthComponent = component "Google Auth Component" "Component to connect with GoogleAuth API" "JavaScript / Express JS" "GoogleAuthComponent"
            }

            paymentBC = container "Payment Bounded Context" "API RESTful of Payment" "Node.js" "PaymentBC, BoundedContext"  {
                paymentController = component "Payment Controller" "REST Controller class of Payment" "Node.js / ES5 / Express JS" "PaymentController"
                paymentService = component "Payment Service" "REST Service class of Payment" "Node.js / ES5 / Express JS" "PaymentService"
                paymentRepository = component "Payment Repository" "REST Repository class of Payment" "Node.js / ES5 / Express JS" "PaymentRepository"
                YapeComponent = component "Yape Component" "Component to connect with Yape API" "JavaScript / Express JS" "YapeComponent"
                BCPComponent = component "BCP Component" "Component to connect with BCP API" "JavaScript / Express JS" "BCPComponent"
                pagoEfectivoComponent = component "PagoEffectivo Component" "Component to connect with PagoEffectivo API" "JavaScript / Express JS" "PagoEffectivoComponent"
            }
            buyProductsBC = container "Buy Products Bounded Context" "API RESTful of Sale" "Node.js" "BuyProductsBC, BoundedContext" {
                buyProductController = component "Buy Product Controller" "REST Controller class to Buy Products" "Node.js / ES5 / Express JS" "BuyProductController"
                buyProductService = component "Buy Product Service" "REST Service class to Buy Products" "Node.js / ES5 / Express JS" "BuyProductService"
                buyProductRepository = component "Buy Product Repository" "REST Repository class to Buy Products" "Node.js / ES5 / Express JS" "BuyProductRepository"
            }
            checkMoneyAccountBC = container "Check Money Account Bounded Context" "API RESTful of Money Account" "Node.js" "CheckMoneyAccountBC, BoundedContext" {
                checkMoneyAccountController = component "Check Money Account Controller" "REST Controller class to Check Account" "Node.js / ES5 / Express JS" "CheckAccountController"
                checkMoneyAccountService = component "Check Money Account Service" "REST Service class to Check Account" "Node.js / ES5 / Express JS" "CheckAccountService"
                checkMoneyAccountRepository = component "Check Money Account Repository" "REST Repository class to Check Account" "Node.js / ES5 / Express JS" "CheckAccountRepository"
            }
            manageProductsBC = container "Manage Products Bounded Context" "API RESTful of Products" "Node.js" "ManageProductsBC, BoundedContext" {
                manageProductController = component "Manage Products Controller" "REST Controller class to Manage Product" "Node.js / ES5 / Express JS" "ManageProductController"
                manageProductService = component "Manage Products Service" "REST Service class to Manage Product" "Node.js / ES5 / Express JS" "ManageProductService"
                manageProductRepository = component "Manage Products Repository" "REST Repository class to Manage Product" "Node.js / ES5 / Express JS" "ManageProductRepository"
            }
            ordersBC = container "Manage Orders Bounded Context" "API RESTful of Order" "Node.js" "OrdersBC, BoundedContext" {
                orderController = component "Order Controller" "REST Controller class of Order" "Node.js / ES5 / Express JS" "OrderController"
                orderService = component "Order Service" "Business logic class for Order" "JavaScript/ Express JS / Fastify" "OrderService"
                orderRepository = component "Order Repository" "Business logic class for Order" "JavaScript/ Express JS / Fastify" "OrderService"
                googleMapComponent = component "Google Map Component" "Component to connect with GOOGLEMAP API" "JavaScript / Express JS" "GoogleMapComponent"
            }
            manageStoreBC = container "Manage Store Bounded Context" "API RESTful of Store" "Node.js" "ManageStoreBC, BoundedContext" {
                manageStoreController = component "Manage Store Controler" "REST Controller class to Manage Store" "Node.js / ES5 / Express JS" "ManageStoreController"
                manageStoreService = component "Manage Store Service" "REST Service class to Manage Store" "Node.js / ES5 / Express JS" "ManageStoreService"
                manageStoreRepository = component "Manage Store Repository" "REST Repository class to Manage Store" "Node.js / ES5 / Express JS" "ManageStoreRepository"
            }
            manageProfileBC = container "Manage Profile Bounded Context" "API RESTful of Profile" "Node.js" "ManageProfileBC, BoundedContext" {
                manageProfileController = component "Profile Controler" "REST Controller class to Manage Profile" "Node.js / ES5 / Express JS" "ManageProfileController"
                manageProfileService = component "Profile Service" "REST Service class to Manage Profile" "Node.js / ES5 / Express JS" "ManageProfileService"
                manageProfileRepository = component "Profile Repository" "REST Repositoru class to Manage Profile" "Node.js / ES5 / Express JS" "ManageProfileRepository"
            }

            relationalDatabase = container "Relational Database" "Stores and update information, has credentials, data,  etc" "Postgree 15" "RelationalDatabase"
        }

        # External Software System
        googleAuth = softwareSystem "Google Auth" "Is a web service that allows a user to authenticate with his Google Account" "GoogleAuth"
        googleMaps = softwareSystem "Google Maps" "Is a web mapping platform and It offers satellite imagery, aerial photography and street maps" "Google Maps"
        Yape = softwareSystem "Yape" "It's an app that allows you send and receive money from other people only knowing the phone number" "Yape"
        BCP = softwareSystem "BCP" "Is an app and web that allows you recieve and transfer to many accounts from other banks" "BCP"
        pagoEfectivo = softwareSystem "PagoEfectivo" "App that allows you to buy online and pay without a card" "PagoEfectivo"
        AmazonRDS = softwareSystem "AmazonRDS" "Is a service from AWS that allows us configure, operate and escale our databases" "AmazonRDS"
        AmazonEC2 = softwareSystem "AmazonEC2" "Is a service from AWS that allows us create, configure and deploy our web application" "AmazonEC2"


        #relationship between people and containers
        anonymousUser -> webApp "Search, customize and compare products"
        storeOwner -> webApp "Manage his/her store to sell his/her products"
        buyer -> webApp "Add products to cart and buy them if he/she like them"

        #relationship between containers
        webApp -> apiGateway "Endpoint call" "JSON / HTTPS"

        #relationships between apiGateway and BoundedContext
        apiGateway -> AuthenticationBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> paymentBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> buyProductsBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> checkMoneyAccountBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> manageProductsBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> ordersBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> manageStoreBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> manageProfileBC "Endpoint call" "JSON / HTTPS"

        #relationships between BoundedContext and Database
        AuthenticationBC -> relationalDatabase "Store, get, update and delete record" "pg-promise"
        paymentBC -> relationalDatabase "Store, get, update and delete record" "pg-promise"
        buyProductsBC -> relationalDatabase "Store, get, update and delete record" "pg-promise"
        ordersBC -> relationalDatabase "Store, get, update and delete record" "pg-promise"
        manageStoreBC -> relationalDatabase "Store, get, update and delete record" "pg-promise"
        manageProfileBC -> relationalDatabase "Store, get, update and delete record" "pg-promise"

        # relationships between BoundedContext and external software systems
        authenticationBC -> googleAuth "Endpoint call" "JSON / HTTPS"
        paymentBC -> Yape "Endpoint call" "JSON / HTTPS"
        paymentBC -> BCP "Endpoint call" "JSON / HTTPS"
        paymentBC -> pagoEfectivo "Endpoint call" "JSON / HTTPS"
        ordersBC -> googleMaps "Endpoint call" "JSON / HTTPS"


        #relationships between TiendaHunt and external software systems
        TiendaHuntSoftware -> googleMaps "Get the location of a store"
        TiendaHuntSoftware -> Yape "Receive and give money with just our phone number"
        TiendaHuntSoftware -> BCP "Receive and transfer money from any bank"
        TiendaHuntSoftware -> pagoEfectivo "Obtain CIP payment code and validate payment"
        TiendaHuntSoftware -> AmazonRDS "Put our database on cloud"
        TiendaHuntSoftware -> AmazonEC2 "Deploy our web application"

        apiGateway -> userController "Endpoint call" "JSON / HTTPS"
        userController -> userService "Methods call" "POO"
        userService -> userRepository "Methods call" "POO"
        userService -> googleAuthComponent "Methods call" "POO"
        userRepository ->  relationalDatabase "Store, get, update and delete record" "pg-promise"
        googleAuthComponent -> googleAuth Endpoints call" "JSON / XML / HTTPS"

        apiGateway -> orderController "Endpoint call" "JSON / HTTPS"
        orderController -> orderService "Methods call" "POO"
        orderService -> userService "Methods call" "POO"
        orderService -> orderRepository "Methods call" "POO"
        orderService -> googleMapComponent "Methods call" "POO"

        orderRepository -> relationalDatabase "Store, get, update and delete record" "pg-promise"
        googleMapComponent -> googleMaps "Endpoints call" "JSON / XML / HTTPS"


        apiGateway -> paymentController "Endpoint call" "JSON / HTTPS"
        paymentController -> paymentService "Methods call" "POO"
        paymentService -> paymentRepository "Methods call" "POO"
        paymentService -> userRepository "Methods call" "POO"
        paymentService -> YapeComponent "Methods call" "POO"
        paymentService -> BCPComponent "Methods call" "POO"
        paymentService -> pagoEfectivoComponent "Methods call" "POO"
        YapeComponent -> Yape "Endpoints call" "JSON / XML / HTTPS"
        BCPComponent -> BCP "Endpoints call" "JSON / XML / HTTPS"
        pagoEfectivoComponent -> pagoEfectivo "Endpoints call" "JSON / XML / HTTPS"
        paymentRepository -> relationalDatabase "Store, get, update and delete record" "pg-promise"


        apiGateway -> buyProductController "Endpoint call" "JSON / HTTPS"
        buyProductController -> buyProductService "Methods call" "POO"
        buyProductService -> buyProductRepository "Methods call" "POO"
        buyProductService -> userRepository "Methods call" "POO"
        buyProductService -> orderRepository "Methods call" "POO"
        buyProductRepository -> relationalDatabase "Store, get, update and delete record" "pg-promise"




        apiGateway -> checkMoneyAccountController "Endpoint call" "JSON / HTTPS"
        checkMoneyAccountController -> checkMoneyAccountService "Methods call" "POO"
        checkMoneyAccountService -> checkMoneyAccountRepository "Methods call" "POO"
        checkMoneyAccountService -> paymentRepository "Methods call" "POO"
        checkMoneyAccountService -> orderRepository "Methods call" "POO"


        checkMoneyAccountRepository -> relationalDatabase "Store, get, update and delete record" "pg-promise"

        apiGateway -> manageProductController "Endpoint call" "JSON / HTTPS"
        manageProductController -> manageProductService "Methods call" "POO"
        manageProductService -> manageProductRepository "Methods call" "POO"
        manageProductService -> orderRepository "Methods call" "POO"
        manageProductRepository -> relationalDatabase "Store, get, update and delete record" "pg-promise"


        apiGateway -> manageStoreController "Endpoint call" "JSON / HTTPS"
        manageStoreController -> manageStoreService "Methods call" "POO"
        manageStoreService -> manageStoreRepository "Methods call" "POO"
        manageStoreService -> buyProductRepository  "Methods call" "POO"
        manageStoreRepository -> relationalDatabase "Store, get, update and delete record" "pg-promise"


        apiGateway -> manageProfileController "Endpoint call" "JSON / HTTPS"
        manageProfileController -> manageProfileService "Methods call" "POO"
        manageProfileService -> manageProfileRepository "Methods call" "POO"
        manageProfileRepository -> relationalDatabase "Store, get, update and delete record" "pg-promise"




    }

    views {
        systemcontext TiendaHuntSoftware "SystemContext" {
            include *
            autoLayout
        }
        container TiendaHuntSoftware "Containers" {
            include *
            autoLayout
        }
        component AuthenticationBC "Component" {
            include *
            autoLayout
        }
        component ordersBC "ComponentOrders" {
            include *
            autoLayout
        }
        component paymentBC "ComponentPayments" {
            include *
            autoLayout
        }
        component buyProductsBC "ComponentBuyProduct" {
            include *
            autoLayout
        }
        component checkMoneyAccountBC "ComponentCheckMoneyAccount" {
            include *
            autoLayout
        }
        component manageProductsBC "ComponentManageProduc" {
            include *
            autoLayout
        }
        component manageStoreBC "ComponentManageStore" {
            include *
            autoLayout
        }
        component manageProfileBC "ComponentManageProfile" {
            include *
            autoLayout
        }
        styles {
            element "Person" {
                color #ffffff
                background #08427b
                fontSize 22
                shape Person
            }
            element "AnonymousUser" {
                background #526D82
            }
            element "Buyer" {
                background #2f2a4b
            }
            element "StoreOwner" {
                background #124652
            }
            element "AdministrationUser" {
                background #ac000d
                shape Robot
            }

            element "FalabellaSoftware" {
                background #fd7e14
            }
            element "PagoEfectivo" {
                background #ffcc00
                color #000000
            }
            element "Culqi" {
                background #00a19b
                color #ffffff
            }
            element "WalletApp" {
                background #4be1ce
                color #ffffff
            }

            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "MobileApp" {
                shape MobileDevicePortrait
            }
            element "WebApp" {
                shape WebBrowser
            }
            element "ApiGateway" {
                shape RoundedBox
                background #7E1717
            }
            element "BoundedContext" {
                shape Hexagon
            }

            element "RelationalDatabase" {
                background #FF0000
                shape Cylinder
            }

        }
    }
}
