workspace "Falabella" "This is an Diagram for Falabella.com" {

    model {
        # Person
        anonymousUser = person "Anonymous User" "Person who enters the application to search, customize and add products to the shopping cart." "AnonymousUser"
        buyer = person "Buyer" "Person who defines the delivery address and pays for the products in the shopping cart." "Buyer"
        storeOwner = person "Store Owner" "Person who manages his products to sell." "StoreOwner"
        administrationUser = person "Administration User" "Person who manages and supports the application." "AdministrationUser"

        falabellaSoftware = softwareSystem "Falabella.com" "Home products retail system." "FalabellaSoftware" {
            mobileApp = container "Mobile App" "Provides a set of the Internet functionality to customers via their mobile device." "Kotlin - Android / Swift - iOS" "MobileApp"
            webApp = container "Web App" "Provides a set of the Web functionality via Browser." "Java v17 / Spring v3" "WebApp"
            
            apiGateway = container "API Gateway" "Component that sits between clients and services and provides centralized handling of API communication between them" "Spring Cloud Gateway" "ApiGateway"
            
            cartBC = container "Shopping cart Bounded Context" "Api RESTful of Shopping cart" "Java v17 / Spring v3" "CartBC,BoundedContext"
            paymentBC = container "Payment Bounded Context" "Api RESTful of payment" "Java v17 / Spring v3" "PaymentBC,BoundedContext"
            identityAccessBC = container "Identity and Access Bounded Context" "Api RESTful of Identity and Access Management" "Java v17 / Spring v3" "IdentityAccessBC,BoundedContext"
            deliveryBC = container "Delivery Bounded Context" "Api RESTful of Delivery" "Java v17 / Spring v3" "DeliveryBC,BoundedContext" {
                deliveryController = component "Delivery Controller" "REST Controller class of Delivery" "Java v17 / Spring Web" "DeliveryController"
                deliveryService = component "Delivery Service" "Busines Logic class for Delivery" "Java v17 / Spring Data" "DeliveryService"
                buyerRepository = component "Buyer Repository" "Repository Interface for Buyer Entity" "Java v17 / Spring Data" "BuyerRepository"
                buyRepository = component "Buy Repository" "Repository Interface for Buy Entity" "Java v17 / Spring Data" "BuyRepository"
                deliveryRepository = component "Delivery Repository" "Repository Interface for Delivery Entity" "Java v17 / Spring Data" "DeliveryRepository"
                googleMapComponent = component "Google Map Component" "Component to connect with the GoogleMap API" "Java v17 / Spring v3" "GoogleMapComponent"
            }
            productBC = container "Product Bounded Context" "Api RESTful of Product Management" "Java v17 / Spring v3" "ProductBC,BoundedContext"
            searchSelectBC = container "Search and Select Bounded Context" "Api RESTful of Search and select product" "Java v17 / Spring v3" "searchSelectBC,BoundedContext"
            crudBC = container "CRUD Bounded Context" "Api RESTful of CRUD entities" "Java v17 / Spring v3" "crudBC,BoundedContext"
            
            relationalDatabase = container "Relational Database" "Stores and update information, hashed authentication credentials, access logs, etc." "Oracle Database 21c - Enterprise Edition" "RelationalDatabase"
        }

        # External Software System
        googlePhotos = softwareSystem "Google Photos" "Is a photo sharing and storage service developed by Google." "GooglePhotos"
        googleMaps = softwareSystem "Google Maps" "Is a web mapping platform and It offers satellite imagery, aerial photography and street maps" "Google Maps"
        walletApp = softwareSystem "Wallet App" "App that allows you to send and receive money and buy online" "WalletApp"
        culqi = softwareSystem "Culqi" "App that accepts payments with debit and credit cards" "Culqi"
        pagoEfectivo = softwareSystem "PagoEfectivo" "App that allows you to buy online and pay without a card" "PagoEfectivo"
        openpay = softwareSystem "Openpay" "App that receives payments by sending a link via WhatsApp, social networks or mail. And offers all payment methods" "Openpay"

        # relationships between people and software systems
        anonymousUser -> falabellaSoftware "Search, customize and add products to the shopping cart"
        buyer -> falabellaSoftware "Search, customize and add products to the shopping cart, defines the delivery address and pays"
        storeOwner -> falabellaSoftware "Manages his products to sell"
        administrationUser -> falabellaSoftware "Manages and supports the application"

        # relationships between Falabella and external software systems
        falabellaSoftware -> googlePhotos "Record and get the photos of the products."
        falabellaSoftware -> googleMaps "Get the map and set the geospatial location."
        falabellaSoftware -> walletApp "Obtain QR and validate payment made."
        falabellaSoftware -> culqi "Register card information, pay and validate payment."
        falabellaSoftware -> pagoEfectivo "Obtain CIP payment code and validate payment."
        falabellaSoftware -> openpay "Obtain payment link and validate payment made."
        
        # relationships between people and containers
        anonymousUser -> mobileApp "Search, customize and add products to the shopping cart"
        anonymousUser -> webApp "Search, customize and add products to the shopping cart"
        buyer -> mobileApp "Search, customize and add products to the shopping cart, defines the delivery address and pays"
        buyer -> webApp "Search, customize and add products to the shopping cart, defines the delivery address and pays"
        storeOwner -> webApp "Manages his products to sell"
        administrationUser -> webApp "Manages and supports the application"
        
        # relationships between containers
        mobileApp -> apiGateway "Endpoint call" "JSON / HTTPS"
        webApp -> apiGateway "Endpoint call" "JSON / HTTPS"
        
        # relationships between apiGateway and BoundedContext
        apiGateway -> cartBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> paymentBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> identityAccessBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> deliveryBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> productBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> searchSelectBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> crudBC "Endpoint call" "JSON / HTTPS"
        
        # relationships between BoundedContext and Database
        cartBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        paymentBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        identityAccessBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        deliveryBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        productBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        searchSelectBC -> relationalDatabase "Store, get, update and delete record" "JDBC"
        crudBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        
        # relationships between BoundedContext and external software systems
        paymentBC -> walletApp "Endpoint call" "JSON / HTTPS"
        paymentBC -> culqi "Endpoint call" "JSON / HTTPS"
        paymentBC -> pagoEfectivo "Endpoint call" "JSON / HTTPS"
        paymentBC -> openpay "Endpoint call" "JSON / HTTPS"
        deliveryBC -> googleMaps "Endpoint call" "JSON / HTTPS"
        productBC -> googlePhotos  "Endpoint call" "JSON / HTTPS"
        searchSelectBC ->  googlePhotos "Endpoint call" "JSON / HTTPS"

        # relationships of the Delivery BoundedContext 
        apiGateway -> deliveryController "Endpoint call" "JSON / HTTPS"
        deliveryController -> deliveryService "Methods call" "POO"
        deliveryService -> buyerRepository "Methods call" "POO"
        deliveryService -> buyRepository "Methods call" "POO"
        deliveryService -> deliveryRepository "Methods call" "POO"
        deliveryService -> googleMapComponent "Methods call" "POO"
        buyerRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        buyRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        deliveryRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        googleMapComponent -> googleMaps "Endpoints call" "JSON / XML / HTTPS"
    }
    views {
        systemContext falabellaSoftware "SystemContext" {
            include *
            autoLayout 
        }
        container falabellaSoftware "Containers" {
            include *    
            autoLayout
        }
        component deliveryBC "DeliveryBC" {
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
