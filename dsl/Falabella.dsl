workspace "Falabella" "This is an Diagram for Falabella.com" {

    model {
        anonymousUser = person "Anonymous User" "Person who enters the application to search, customize and add products to the shopping cart." "AnonymousUser"
        buyer = person "Buyer" "Person who defines the delivery address and pays for the products in the shopping cart." "Buyer"
        storeOwner = person "Store Owner" "Person who manages his products to sell." "StoreOwner"
        administrationUser = person "Administration User" "Person who manages and supports the application." "Administration User"

        falabellaSoftware = softwareSystem "Falabella.com" "Home products retail system." "FalabellaSoftware"

        googlePhotos = softwareSystem "Google Photos" "Is a photo sharing and storage service developed by Google." "GooglePhotos"
        googleMaps = softwareSystem "Google Maps" "Is a web mapping platform and It offers satellite imagery, aerial photography and street maps" "Google Maps"
        walletApp = softwareSystem "Wallet App" "App that allows you to send and receive money and buy online" "WalletApp"
        culqi = softwareSystem "Culqi" "App that accepts payments with debit and credit cards" "Culqi"
        pagoEfectivo = softwareSystem "PagoEfectivo" "App that allows you to buy online and pay without a card" "PagoEfectivo"
        openpay = softwareSystem "Openpay" "App that receives payments by sending a link via WhatsApp, social networks or mail. And offers all payment methods" "Openpay"


        driver = person "Taxi Driver" "A customer business of the Taxi." "Driver"
        passenger = person "Taxi Passenger" "A customer of the Taxi." "Passenger"

        paymentSoftware = softwaresystem "Payment System" "Allows customers pay with cards." "Existing System"

        taxiChurroSoftware = softwaresystem "TaxiChurro Software" "Allows customers to take a taxi and make payments with cards" {
            mobileApp = container "Mobile App" "Provides a set of the Internet functionality to customers via their mobile device." "Kotlin" "Mobile App"
            apiApplication = container "API Application" "Provides Internet functionality via a JSON/HTTPS API." "Java"
            database = container "Database" "Stores information, hashed authentication credentials, access logs, etc." "postgreSQL Database Schema" "Database"
        }

        # relationships between people and software systems
        anonymousUser -> falabellaSoftware "Search, customize and add products to the shopping cart"
        buyer -> falabellaSoftware "Defines the delivery address and pays for the products in the shopping cart"
        storeOwner -> falabellaSoftware "Manages his products to sell"
        administrationUser -> falabellaSoftware "Manages and supports the application"

        falabellaSoftware -> googlePhotos "Record and get the photos of the products."
        falabellaSoftware -> googleMaps "Get the map and set the geospatial location."
        falabellaSoftware -> walletApp "Obtain QR and validate payment made."
        falabellaSoftware -> culqi "Register card information, pay and validate payment."
        falabellaSoftware -> pagoEfectivo "Obtain CIP payment code and validate payment made."
        falabellaSoftware -> openpay "Obtain payment link and validate payment made."


        driver -> taxiChurroSoftware "Driver taxi, and receive payments"
        passenger -> taxiChurroSoftware "Take taxi, and make payments"
        taxiChurroSoftware -> paymentSoftware "Process payments"

        # relationships to/from containers
        driver -> mobileApp "Views taxi information, Driver taxi, and receive payments"
        passenger -> mobileApp "Views taxi information, Take taxi, and make payments"
        mobileApp -> apiApplication "Makes API calls to" "JSON/HTTPS"
        apiApplication -> database "Reads from and writes to" "JDBC"

    }
    views {
        systemcontext falabellaSoftware "SystemContext" {
            include *
        }
        container taxiChurroSoftware "Containers" {
            include *           
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
                        
            element "Driver" {
                background #08427b
            }
            element "Passenger" {
                background #08427b
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
            element "Mobile App" {
                shape MobileDevicePortrait
            }
            element "Database" {
                shape Cylinder
            }
        }
    }


}
