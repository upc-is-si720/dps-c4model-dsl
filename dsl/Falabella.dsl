workspace "Falabella" "This is an Diagram for Falabella.com" {

    model {
        # Person
        anonymousUser = person "Anonymous User" "Person who enters the application to search, customize and add products to the shopping cart." "AnonymousUser"
        buyer = person "Buyer" "Person who defines the delivery address and pays for the products in the shopping cart." "Buyer"
        storeOwner = person "Store Owner" "Person who manages his products to sell." "StoreOwner"
        administrationUser = person "Administration User" "Person who manages and supports the application." "Administration User"

        # Software System and theirs containers
        /* 
        apiRESTful = container "API RESTful" "Provides Internet functionality via a JSON/HTTPS API." "Java/Spring" "ApiRESTful"
        */
        falabellaSoftware = softwareSystem "Falabella.com" "Home products retail system." "FalabellaSoftware" {
            mobileApp = container "Mobile App" "Provides a set of the Internet functionality to customers via their mobile device." "Kotlin/Swift" "MobileApp"
            webApp = container "Web App" "Provides a set of the Web functionality via Browser." "Java/Spring" "WebApp"
            apiGateway = container "API Gateway" "Component that sits between clients and services and provides centralized handling of API communication between them" "Azure API Management " "ApiRESTful"
            relationalDatabase = container "Relational Database" "Stores and update information, hashed authentication credentials, access logs, etc." "Oracle Database 21c - Enterprise Edition" "RelationalDatabase"
            queryDatabase = container "Query Database" "Read information and Queries always return the JSON data with DTO objects " "MongoDB Community Server v6 - NoSQL Database" "QueryDatabase"
            eventBus = container "Event Bus" "Mediator that transfers a message from Relational Database to Query Database, it provides a communication way between database." "Kafka - Publish/Subscribe channel" "EventBus"
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
        mobileApp -> apiGateway "Call to Endpoints" "JSON / HTTPS"
        webApp -> apiGateway "Call to Endpoints" "JSON / HTTPS"
        
        relationalDatabase -> eventBus "Send Message to Topic" "Event"
        eventBus -> queryDatabase "Topic send message" "Event"
        
        
    }
    views {
        systemcontext falabellaSoftware "SystemContext" {
            include *
            autoLayout 
        }
        container falabellaSoftware "Containers" {
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
            element "RelationalDatabase" {
                background #FF0000
                shape Cylinder
            }
            element "QueryDatabase" {
                background #116149
                shape Cylinder
            }
            element "EventBus" {
                background #53AB40
                shape Pipe
            }
        }
    }


}
