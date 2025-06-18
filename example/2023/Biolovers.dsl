workspace "Biolovers" "Context Diagraman Biolovers.com" {

    model {
        # Person
        anonymousUser = person "Anonymous User" "Person who enters the application to search, customize and add products to the shopping cart." "AnonymousUser"
        buyer = person "Buyer" "Person who defines the delivery address and pays for the products in the shopping cart." "Buyer"
        seller = person "Seller" "Person in charge of selling biodegradable products." "Seller"

        administrationUser = person "Administration User" "Person who manages and supports the application." "AdministrationUser"


        bioloversSoftware = softwareSystem "Biolovers.com" "System of sale of biodegradable products." "BioloversSoftware" {
            mobileApp = container "Mobile App" "Provides a set of the Internet functionality to customers via their mobile device." "Kotlin - Android / Swift - iOS" "MobileApp"
            webApp = container "Web App" "Provides a set of the Web functionality via Browser." "Java v17 / Spring v3" "WebApp"

            apiGateway = container "API Gateway" "API" "ApiGateway"
            // Buyer
            loginRegistration = container "Login and Registration process" "User login and registration process" "Java/Spring" "LoginandRegistration,BoundedContext"{
                registrationController = component "Registration Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                registerService =  component "Register Service" "Relation to repository"
                repositoryVerification = component "Repository Verification" "Method for access to manager table"
                repositoryBuyer = component "Buyer Repository" "Methods for access to client table"
                repositorySeller_0 = component "Seller Repository" "Methods for acess to client table"
                anonymousRepository = component "Anonymous Repository" "Method for access to user table"
                gmailComponent = component "Gmail Component" "Component to connect with Gmail API"
                #database = component "Database"
                instagramComponent = component "Instagram Component" "Method to connect with Instagram API"

            }
            searchingProducts = container "Search Product" "Buyer search" "Java/Spring" "SearchProduct,BoundedContext"{
                searchingController = component "Searching Controller" "REST of Register Controller" "DeliveryController"
                searchingService = component "Searching Service"
                repositoryProduct = component "Repository Product"
                #database_1 = component "Database"
                repositorySeller_7 = component "Repository Seller"

            }
            productInformation = container "Product Information" "Description of the searched product" "Java/Spring" "ProductInformation,BoundedContext"{
                informationController = component "Information Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                informationService = component "Product information Service"
                repositoryProduct_1 = component "Repository Product"
                repositoryBuyer_0 = component "Repository Buyer"
                #database_2 = component "Database"


            }
            paymentProcess = container "Payment Process" "Product payment checkout process" "Java/Spring" "PaymentProcess,BoundedContext"{
                #database_3 = component "Database"
                paymentService = component "Payment Service"
                paymentController = component "Payment Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                repositoryBuyer_1 = component "Repository Buyer"
                repositoryProduct_2 = component "Repository Product"
                repositoryDelivery = component "Repository Delivery"
                repositoryPay = component "Repository Payment"


            }
            buyerProfile = container "Buyer Profile" "Buyer profile editing" "Java/Spring" "BuyerProfile,BoundedContext" {
                profileController = component "Profile Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                profileService = component "Buyer Profile Service"
                repositoryBuyer_2 = component "Repository Buyer"
                #database_4 = component "Database"

            }
            shoppingCar = container "Shopping Car" "Shopping car edition" "Java/Spring" "ShoppingCar,BoundedContext"{
                carController = component "Car Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                #database_5 = component "Database"
                carService = component "Shopping Car Service"
                repositoryProduct_3 = component "Repository Product"
                repositoryBuyer_3 = component "Repository Buyer"
                volusionComponent = component "Volusion System"

            }
            // Seller
            registrationSeller = container "Seller Registration" "Seller user registration process" "Java/Spring" "SellerRegistration,BoundedContext"{
                sellerController = component "Seller Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                #database_6 = component "Database"
                sellerService = component "Registration Seller Service"
                repositorySeller = component "Repository Seller"

            }
            loginSeller = container "Seller Login" "Seller login process" "Java/Spring" "SellerLogin,BoundedContext"{
                loginController = component "Login Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                #database_7 = component "Database"
                loginService = component "Login Seller Service"
                repositorySeller_1 = component "Repository Seller"
                repositoryVerification_1 = component "Repository Verification"

            }
            sellerProfile = container "Edit Profile" "Profile editing" "Java/Spring" "EditProfile,BoundedContext"{
                profileSeller = component "Profile Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                #database_8 = component "Database"
                profileSellerService = component "Seller Profile Service"
                profileBuyerService = component "Buyer Profile Service"
                repositoryBuyer_4 = component "Repository Buyer"
                repositorySeller_2 = component "Repository Seller"
            }
            uploadInformation = container "Upload Product Information" "Color information loading process, availability quantity and product" "Java/Spring" "UploadInformation,BoundedContext" {
                informationControler = component "Information Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                uploadInformationService = component "Upload Information Service"
                #database_9 = component "Database"
                repositoryProduct_4 = component "Repository Product"
                repositorySeller_3 = component "Repository Seller"
            }
            uploadPhotoDescription = container "Upload Photo and Description" "Upload Product Photo and Description" "Java/Spring" "UploadPhotoandDescription,BoundedContext"{
                photoController = component "Photo Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                photoService = component "Photo Description Service"
                #database_10 = component "Database"
                repositoryProduct_5 = component "Repository Product"
                repositorySeller_4 = component "Repository Seller"
                googlePhotosComponent = component "Google Photos"

            }
            publicationPlan = container "Publication Plan" "Choice of publication plan" "Java/Spring" "PublicationPlan,BoundedContext" {
                planController = component "Plan Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                planService = component "Publication Plan Service"
                #database_11 = component "Database"
                repositorySeller_5 = component "Repository Seller"
                repositoryPay_1 = component "Repository Payment"
                pagoComponent = component "Pago Efectivo"
                pagoSystem = component "Pago Efectivo System"

            }
            productEdition = container "Product Edition" "Published product edition" "Java/Spring" "ProductEdition,BoundedContext" {
                productController = component "Product Controller" "REST of Register Controller" "Java v17 / Spring web" "DeliveryController"
                productService = component "Product Edition Service"
                #database_12 = component "Database"
                repositoryProduct_6 = component "Repository Product"
                repositorySeller_6 = component "Repository Seller"

            }

            relationalDatabase = container "Relational DataBase" "Stores and updates information, encrypted authentication credentials, access logs, etc." "Oracle Database 21c - Enterprise Edition" "RelationalDataBase"


        }



        # External Software System
        googleMaps = softwareSystem "Google Maps" "Web mapping platform and offers satellite images, aerial photography and street maps." "GoogleMaps"
        googlePhotos = softwareSystem "Google Photos" "Photo sharing and storage service." "GooglePhotos"
        googleCalendar = softwareSystem " Google Calendar" "Tool for organice and view calendar" "GoogleCalendar"
        pagoEfectivo = softwareSystem "PagoEfectivo" "App that allows you to buy online and pay without a card." "PagoEfectivo"
        APISunat = softwareSystem "API Sunat" "RUC identifier for personal and business information." "APISunat"
        gmailExternal = softwareSystem "Gmail" "Method to register and login" "Gmail"
        instagramExternal = softwareSystem "Instagram" "Method to register and login" "InstagramExternal"

        volusionAPI = softwareSystem "Volusion System" "Method to car shopping" "VolusionAPI"

        # relationships between people and software systems
        anonymousUser -> bioloversSoftware "Search, customize and add products to the shopping cart"
        buyer -> bioloversSoftware "Search, customize and add products to the shopping cart, define the delivery address and pay"


        seller -> bioloversSoftware "Upload products"
        administrationUser -> bioloversSoftware "Manage and support the application."



        # relationships between Falabella and external software systems
        bioloversSoftware -> googleMaps "Get the map and set the geospatial location."
        bioloversSoftware -> pagoEfectivo "Obtain the CIP payment code and validate the payment."
        bioloversSoftware -> googlePhotos  "Obtain the CIP payment code and validate the payment."
        bioloversSoftware -> APISunat "Obtains the personal or business RUC of the user"
        bioloversSoftware -> gmailExternal "Obtain access for user"
        bioloversSoftware -> googleCalendar "Get calendar and set date or time for delivery"
        # relationships between people and containers
        anonymousUser -> mobileApp "Search, customize and add products to the shopping cart"
        anonymousUser -> webApp "Search, customize and add products to the shopping cart"
        buyer -> mobileApp "Search, customize and add products to the shopping cart, defines the delivery address and pays"
        buyer -> webApp "Search, customize and add products to the shopping cart, defines the delivery address and pays"

        administrationUser -> webApp "Manages and supports the application"


        mobileApp -> apiGateway "Endpoint call" "JSON / HTTPS"
        webApp -> apiGateway "Endpoint call" "JSON / HTTPS"

        # relationships between containers
        #Buyer
        apiGateway -> loginRegistration "Endpoint call" "JSON / HTTPS"
        apiGateway -> searchingProducts "Endpoint call" "JSON / HTTPS"
        apiGateway -> productInformation "Endpoint call" "JSON / HTTPS"
        apiGateway -> paymentProcess "Endpoint call" "JSON / HTTPS"
        apiGateway -> buyerProfile "Endpoint call" "JSON / HTTPS"
        apiGateway -> shoppingCar "Endpoint call" "JSON / HTTPS"

        # Seller
        apiGateway -> registrationSeller "Endpoint call" "JSON / HTTPS"
        apiGateway -> loginSeller "Endpoint call" "JSON / HTTPS"
        apiGateway -> sellerProfile "Endpoint call" "JSON / HTTPS"
        apiGateway -> uploadInformation "Endpoint call" "JSON / HTTPS"
        apiGateway -> uploadPhotoDescription "Endpoint call" "JSON / HTTPS"
        apiGateway -> publicationPlan "Endpoint call" "JSON / HTTPS"
        apiGateway -> productEdition "Endpoint call" "JSON / HTTPS"


        loginRegistration -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        loginRegistration -> gmailExternal
        loginRegistration -> instagramExternal
        searchingProducts -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        productInformation -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        paymentProcess -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        paymentProcess -> pagoEfectivo
        paymentProcess -> googleMaps
        paymentProcess -> googleCalendar
        buyerProfile -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        buyerProfile -> googleMaps
        buyerProfile -> googlePhotos
        shoppingCar -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        shoppingCar -> volusionAPI

        registrationSeller -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        registrationSeller -> APISunat
        loginSeller -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        sellerProfile -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        uploadInformation -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        uploadPhotoDescription -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        uploadPhotoDescription -> googlePhotos
        publicationPlan -> relationalDatabase "Endpoint call" "JSON / HTTPS"
        productEdition -> relationalDatabase "Endpoint call" "JSON / HTTPS"




        #Buyer login and registration
        apiGateway -> registrationController "Endpoint call"  "JSON/HTTPS"
        registrationController -> registerService "Methods call"  "Java"
        registerService -> repositoryVerification "Methods call" "Java"
        registerService -> repositoryBuyer "Methods call" "Java"
        registerService -> repositorySeller_0 "Methods call" "Java"
        registerService -> anonymousRepository "Methods call" "Java"
        registerService -> gmailComponent "Methods call" "Java"
        registerService -> instagramComponent
        instagramComponent -> instagramExternal
        gmailComponent -> gmailExternal "Methods call" "Java"
        repositoryVerification -> relationalDatabase "Methods call"
        repositoryBuyer -> relationalDatabase "Methods call"
        repositorySeller_0 -> relationalDatabase "Methods call"
        anonymousRepository -> relationalDatabase "Methods call"


        #Searching bounded
        apiGateway -> searchingController "Endpoint call"  "JSON/HTTPS"
        searchingController -> searchingService "Endpoint call"  "JSON/HTTPS"
        searchingService -> repositoryProduct "Endpoint call"  "JSON/HTTPS"
        searchingService -> repositorySeller_7
        repositoryProduct -> relationalDatabase
        repositorySeller_7 -> relationalDatabase

        #Information product bounded
        apiGateway -> informationController "Endpoint call"  "JSON/HTTPS"
        informationController -> informationService
        informationService -> repositoryProduct_1
        informationService -> repositoryBuyer_0
        repositoryProduct_1 -> relationalDatabase
        repositoryBuyer_0 -> relationalDatabase

        #Payment Method Bounded
        apiGateway -> paymentController "Endpoint call"  "JSON/HTTPS"
        paymentController -> paymentService
        paymentService -> repositoryBuyer_1
        paymentService -> repositoryProduct_2
        paymentService -> repositoryDelivery
        paymentService -> repositoryPay
        repositoryBuyer_1 -> relationalDatabase
        repositoryProduct_2 -> relationalDatabase
        repositoryDelivery -> relationalDatabase
        repositoryPay -> relationalDatabase

        #Profile Editor Bounded
        apiGateway -> profileController "Endpoint call"  "JSON/HTTPS"
        profileController -> profileService "Endpoint call"  "JSON/HTTPS"
        profileService -> repositoryBuyer_1 "Endpoint call"  "JSON/HTTPS"
        repositoryBuyer_1 -> relationalDatabase "Endpoint call"  "JSON/HTTPS"

        # Car Shopping Bounded
        apiGateway -> carController "Endpoint call"  "JSON/HTTPS"
        carController -> carService
        carService -> repositoryProduct_3
        carService -> repositoryBuyer_3
        carService -> volusionComponent
        volusionComponent -> volusionAPI
        repositoryProduct_3 -> relationalDatabase
        repositoryBuyer_3 -> relationalDatabase

        #Seller Profile Bounded
        apiGateway -> sellerController "Endpoint call"  "JSON/HTTPS"
        sellerController -> sellerService
        sellerService -> repositorySeller
        repositorySeller -> relationalDatabase

        #Login Bounded
        apiGateway -> loginController "Endpoint call"  "JSON/HTTPS"
        loginController -> loginService
        loginService -> repositorySeller_1
        loginService -> repositoryVerification_1
        repositorySeller_1 -> relationalDatabase
        repositoryVerification_1 -> relationalDatabase

        #Profile Seller Bounded
        apiGateway -> profileSeller "Endpoint call"  "JSON/HTTPS"
        profileSeller -> profileSellerService
        profileSeller -> profileBuyerService
        profileSellerService -> repositorySeller_2
        profileBuyerService -> repositoryBuyer_4
        repositorySeller_2 -> relationalDatabase
        repositoryBuyer_4 -> relationalDatabase


        #Information Product Bounded
        apiGateway -> informationControler "Endpoint call"  "JSON/HTTPS"
        informationControler -> uploadInformationService
        uploadInformationService -> repositoryProduct_4
        uploadInformationService -> repositorySeller_3

        repositoryProduct_4 -> relationalDatabase
        repositorySeller_3 -> relationalDatabase

        #Photo Product Bounded
        apiGateway -> photoController "Endpoint call"  "JSON/HTTPS"
        photoController -> photoService
        photoService -> repositoryProduct_5
        photoService -> repositorySeller_4
        photoService -> googlePhotosComponent
        googlePhotosComponent -> googlePhotos
        repositoryProduct_5 -> relationalDatabase
        repositorySeller_4 -> relationalDatabase

        #Plan Month Bounded
        apiGateway -> planController "Endpoint call"  "JSON/HTTPS"
        planController -> planService
        planService -> repositorySeller_5
        planService -> repositoryPay_1
        planService -> pagoComponent
        pagoComponent -> pagoSystem
        repositorySeller_5 -> relationalDatabase
        repositoryPay_1 -> relationalDatabase

        #Product Editor Bounded
        apiGateway -> productController "Endpoint call"  "JSON/HTTPS"
        productController -> productService
        productService -> repositoryProduct_6
        productService -> repositorySeller_6
        repositoryProduct_6 -> relationalDatabase
        repositorySeller_6 -> relationalDatabase

    }
    views {
        systemContext bioloversSoftware "ContextoSistema" {
            include *
            autoLayout
        }
        container bioloversSoftware "Contenedores" {
            include *
            autoLayout
        }

        component loginRegistration "Componentes" {
            include *
            autoLayout
        }

        component searchingProducts "Componentes1" {
            include *
            autoLayout
        }

        component productInformation "Componentes2" {
            include *
            autoLayout
        }

        component  paymentProcess "Componentes3" {
            include *
            autoLayout
        }

        component shoppingCar "Componentes5" {
            include *
            autoLayout
        }

        component sellerProfile "Componentes8" {
            include *
            autoLayout
        }

        component uploadInformation "Componentes9" {
            include *
            autoLayout
        }

        component uploadPhotoDescription "Componentes10" {
            include *
            autoLayout
        }

        component publicationPlan "Componentes11" {
            include *
            autoLayout
        }

        component productEdition "Componentes12" {
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
            element "BioloversSoftware" {
                background #d6e870
                color #121709
            }
            element "InstagramExternal" {
                background #e15e6e
                color #ffffff

            }
            element "GoogleMaps" {
                background #df0128
                color #ffffff
            }

            element "VolusionAPI"{
                background #fa3419

            }
            element "ExternalSystem"{
                background #fa3419
            }
            element "PagoEfectivo" {
                background #ffca27
            }
            element "GooglePhotos"{
                background #df0128
                color #ffffff
            }

            element "GoogleCalendar"{
                background #df0128
                color #ffffff
            }

            element "Gmail"{
                background #df0128
                color #ffffff
            }

            element "APISunat"{

                background #00cef5

            }

            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #001457
                color #ffffff
            }
            element "MobileApp" {
                shape MobileDevicePortrait
                background #0abfbc
            }
            element "WebApp" {
                shape WebBrowser
            }
            element "ApiGateway" {
                shape RoundedBox
                background #7E1717
            }
            element "BoundedContext" {
                background #a3c3b8
                color #2b2628
                shape Hexagon
            }

            element "RelationalDataBase" {
                background #ffed2f
                color #2b2628
                shape Cylinder
            }

        }
    }


}