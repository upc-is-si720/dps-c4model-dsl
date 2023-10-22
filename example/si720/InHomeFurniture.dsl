workspace "InHomeFurniture" "Furniture sales system and plan design with 3D visualization" {

    model {
        customer = person "Customer user" "Person who buys furniture" "Customer"
        designer = person "Interior Designer user" "Interior designer creating his blueprints" "Designer"
        seller = person "Shop owner user" "Owner of the store that sells the furniture" "Seller"
        manager = person "Manager system" "Person who administers and supports the system"

        furnitureSystem = softwareSystem "InHomeFurniture UPC" "System to sell/buy furniture and design plans, using VR technology" "FurnitureSystem" {
            mobileApplication = container "Mobile Application" "App mobile of Application" "Kotlin/Swift" "mobileApp"
            database = container "Database" "Database of Application" "MySQL" "IHFdatabase"

            # Bounded Context
            accountBC = container "Account Bounded Context" "API RESTful Management user Account" "Java 20 / Spring 3.1.0" "AccountBC" {
                UserRepository = component "User Repository" "Repository interface for user Entity" "Java v17 / Spring Web" "UserRepository"
                accountController = component "Account Controller" "REST Controller ofor Account" "Java v17 / Spring Web" "AccountController,Controller"
                accountService = component "Account Service" "Business Login for Account" "Java v17 / Spring Data" "AccountService,Service"
                roleRepository = component "Role Repository" "Business Login for Account" "Java v17 / Spring Data" "RoleRepository"
                permissionRepository  = component " Permission Repository" "Validate the permission of the user" "Java v17 / Spring Data" "PermissionRepository"
                userActivityRepository  = component "User Activity Repository" "Repository Interface for activities" "Java v17 / Spring Data" "UserActivityRepository"
                gmailUserComponent  = component "Gmail component" "Component to connect with the gmail API" "Java v17 / Spring Data" "GmailUserComponent"
            }
            crudSearch = container "Search and Select Bounded Context" "API RESTful Management CRUD of Customer, Owner and Designer" "Java 20 / Spring 3.1.0" "crudUserBC" {
                SearchSelectController = component "Search and Select Controller" "REST Controller ofor Account" "Java v17 / Spring Web" "furnitureController,Controller"
                SearchSelectService = component "Search and Select Service" "Business Login for Account" "Java v17 / Spring Data" "furnitureService,Service"
                SearchRepository = component "Search Repository" "Repository Interface for Buyer Entity" "Java v17 / Spring Data" "furnitureRepository"
                invertorycomponent = component "Inventory Component" "Repository Interface for Buyer Entity" "Java v17 / Spring Data" "sellerrRepository"
                googlephotoscomponent = component "Google Photos Component" "Repository Interface for Buyer Entity" "Java v17 / Spring Data" "sellerrRepository"
            }

            //component  Furniture
            crudFurnitureBC = container "CRUD Furniture Bounded Context" "CRUD Management of Furniture" "Java 20 / Spring 3.1.0" "CrudFurnitureBC" {
                furnitureController = component "Furniture Controller" "REST Controller for furniture" "Java v17 / Spring Web" "FurnitureController,Controller"
                furnitureService = component "Furniture Service" "Business Login for Furniture" "Java v17 / Spring Data" "FurnitureService,Service"
                furnitureRepository = component "Furniture Repository" "Repository Interface for Furniture Entity" "Java v17 / Spring Data" "FurnitureRepository"
                sellerRepository = component "Seller Repository" "Repository Interface for Seller Entity" "Java v17 / Spring Data" "SellerrRepository"
                invertorcomponent = component "Inventory Component" "Component to connect with the Inventory System API" "Java v17 / Spring Data" "Invertorcomponent"
                googleviewcomponente = component "Google 3D Viewer Component" "Component to connect with the Google 3D Viewer API" "Java v17 / Spring Data" "Googleviewcomponente"
            }

            //component Payment //Pagar
            crudPaymentBC = container "CRUD Payment Methods" "CRUD Management of Payment Methods" "Java 20 / Spring 3.1.0" "CrudPaymentBC" {
                paymentController = component "Payment Controller" "REST Controller for Payment" "Java v17 / Spring Web" "PaymentController,Controller"
                paymentService = component "Payment Service" "Business Login for Payment" "Java v17 / Spring Data" "PaymentService,Service"
                paymentRepository = component "Payment Repository" "Repository Interface for Payment Entity" "Java v17 / Spring Data" "PaymentRepository"
                visaComponent = component "Visa Component" "Component to connect with the VISA API" "Java v17 / Spring v3" "VisaComponent"
            }

            //component Sell //Vender
            crudSellBC = container "CRUD SELL" "CRUD SELL" "Java 20 / Spring 3.1.0" "CrudSellBC"{
                sellController = component "Sell Controller" "REST Controller for Sells" "Java v17 / Spring Web" "SellController,Controller"
                sellService = component "Sell Service" "Business Login for Sells" "Java v17 / Spring Data" "SellService,Service"
                sellerrRepository = component "Seller Repository" "Repository Interface for Seller Entity" "Java v17 / Spring Data" "SellerRepository"
                customerRepository = component "Customer Repository" "Repository Interface for Buyer Entity" "Java v17 / Spring Data" "CustomerRepository"
                sellRepository = component "Sell Repository" "Repository Interface for Sell Entity" "Java v17 / Spring Data" "SellRepository"
                googleMapComponent = component "Google Map Component" "Component to connect with the GoogleMap API" "Java v17 / Spring v3" "GoogleMapComponent"
            }

            //component Plane //Arquitecto creo
            crudPlaneBC = container "CRUD Plane" "CRUD Plane" "Java 20 / Spring 3.1.0" "CrudPlaneBC" {
                planeController = component "Plane Controller" "REST Controller for Plane" "Java v17 / Spring Web" "PlaneController,Controller"
                PlaneService = component "Plane Service" "Business Login for Plane" "Java v17 / Spring Data" "PlaneService,Service"
                planeRepository = component "Plane Repository" "Repository Interface for Plane Entity" "Java v17 / Spring Data" "PlaneRepository"
                designerRepository = component "Designer repository" "Repository Interface for Designer Entity" "Java v17 / Spring Data" "PlaneRepositoryy"
                googleviewcomponent = component "Google 3D Viewer" "Component to connect with the Google 3D Viewer API" "Java v17 / Spring Data" "Googleviewcomponent"
            }

            //Componente Gestion Producto
            productManagementBC = container "Product Management BC" "Bounded context de la gestion de producto" "Java 20 / Spring 3.1.0" "productManagBC" {
                ProductController           =   component "Product Controller" "REST Controller for Product" "Java v17 / Spring Web" "ProductController"
                ProductService              =   component "Product Service" "Business Logic for Product management" "Java v17 / Spring Web" "ProductService"
                ProductRepository           =   component "Product Repository" "Repository Interface for Product Entity" "Java v17 / Spring Data" "ProductRepository"
                PM_SellerRepository         =   component "Seller Repository" "Repository Interface for Seller Entity" "Java v17 / Spring Web" "SellerRepository"
                PM_GoogleViewComponent      =   component "Google 3D Viewer Component" "Component to connect with Google 3D Viewer API" "Java v17 / Spring Data" "Googleviewcomponent"
                PM_GooglePhotosComponent    =   component "Google Photos Component" "Component to view photos and videos from Google Photos Gallery" "Java / C++ / Spring" "Googlephotoscomponent"
            }

            //API Gateway
            apiGateway = container "API Gateway" "General access control for API calls" "Java 20 / Sring 3.1.0" "ApiGateway"
        }

        //=========================
        // Sistemas externos
        //=========================
        google3dSystem = softwareSystem "Google 3D Viewer" "System to visualize 3D models in Virtual Reality" "Google3dSystem"
        googlePhotos = softwareSystem "Google Photos" "System to store and visualize photos and videos" "GooglePhotosSystem"
        googleMaps = softwareSystem "Google Maps" "Get the map and set the geospatial location" "GoogleMapSystem"
        gmailSystem = softwareSystem "Gmail System" "System to manage user emails" "GmailSystem"
        inventorySystem = softwareSystem "Inventory System" "System to manage furniture published by sellers" "InventorySystemSys"
        apiVisa = softwareSystem "Visa API" "Visa API for management Visa credit and debit cards" "VisaAPISystem"

        //=========================
        // Diagrama de contexto
        //=========================
        customer -> furnitureSystem "Find, customize and buy furniture"
        designer -> furnitureSystem "Design plans, add furniture"
        seller -> furnitureSystem "Publish and manage their furniture."
        # ---
        furnitureSystem -> google3dSystem "Visualize in 3D the furniture"
        furnitureSystem -> googleMaps "Visualize the map in the order of the product"
        furnitureSystem -> googlePhotos "Visualize photos and videos of furniture published"
        furnitureSystem -> gmailSystem "System to manage user emails"
        furnitureSystem -> inventorySystem "Publish, delete, add to cart furniture of the sellers"
        furnitureSystem -> apiVisa "Management Visa credit and debit cards of users"

        //=========================
        // Diagrama de Contenedores
        //=========================
        customer -> mobileApplication "Use the Web Application to buy" "Http/https"
        designer -> mobileApplication "Use the Web Application to design" "Http/https"
        seller -> mobileApplication "Use the Web Application to sell furniture" "Http/https"
        # ---
        mobileApplication -> apiGateway "Call the endpoint from API RESTful"
        apiGateway -> accountBC "Call the endpoints of BC Accounts" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        apiGateway -> crudSearch "Call the endpoints of BC Search and Select" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        apiGateway -> crudFurnitureBC "Call the endpoints of BC CRUD Furniture" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        apiGateway -> crudPaymentBC "Call the endpoints of BC Payment Methods" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        apiGateway -> productManagementBC "Call the endpoints of BC Product Management Methods" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        apiGateway -> crudSellBC "Call the endpoints of BC sell ""JSON / XML / HTTPS/ ODBC/ADO.NET"
        apiGateway -> crudPlaneBC "Call the endpoints of BC plane" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        # ---
        accountBC -> database "Store, view, update, delete data" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        accountBC -> gmailSystem "Validate and Get Email information" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        accountBc -> googlephotos "Product photos uploaded to the cloud to be purchased" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        # ---
        crudFurnitureBC -> google3dSystem "interact with the 3D function" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        crudFurnitureBC -> inventorySystem " Store furniture inventory" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        # ---
        furnitureRepository -> database  "get furniture's record"
        # ---
        sellerRepository -> database  "get records of seller information"
        # ---
        crudPaymentBC -> database  " purchase sale of the product"  "JSON / XML / HTTPS/ ODBC/ADO.NET"
        planeRepository -> database  "view and update  plan's record"
        # ---
        crudPaymentBC -> apiVisa "validate visa as payment method""JSON / XML / HTTPS/ ODBC/ADO.NET"
        # ---
        crudPlaneBC -> google3dSystem "Interact with the 3D function" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        # ---
        crudSellBC -> googleMaps "Use of google maps for shopping" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        crudSellBC -> apiVisa "Validate visa as payment method" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        # ---
        crudSearch -> googlephotos "Product photos uploaded to the cloud to be purchased" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        crudSearch -> inventorySystem " Get furniture inventory" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        # ---
        productManagementBC -> googlephotos "Get photos and video of the product" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        productManagementBC -> google3dsystem "Get 3D model of the furniture" "JSON / XML / HTTPS/ ODBC/ADO.NET"

        //=========================
        //  Componentes SELL
        //=========================
        apiGateway -> sellController "CALL CONTROLLER"
        sellController -> sellService "CALL SERVICE"
        # ---
        sellService ->  sellRepository "CALL THE SALES-BOUND METHODS "
        sellService -> customerRepository "CALL THE CLIENTS-BOUND METHODS"
        sellService ->  sellerrRepository "CALL THE SELLERS-BOUND METHODS"
        sellService -> googleMapComponent "CALL THE ADDRESS-BOUND METHODS"
        # ---
        crudSellBC -> database  " purchase sale of the product"  "JSON / XML / HTTPS/ ODBC/ADO.NET"
        sellerrRepository -> database  "seller profile information and their activities"
        customerRepository -> database  "information about the profile and history of purchases by customers"
        sellRepository -> database  "sales information"
        googleMapComponent -> googleMaps "Validates the customer's location so they can buy your product at the nearest store"
        googleMapComponent -> database "sale and collection of the product"
        sellRepository ->  visaComponent "CALL METHOD TO LINK VISA API GATEWAY"
        visaComponent -> apiVisa "validate payment method"

        //=========================
        //  Component Product Manager
        //=========================
        productManagementBC -> database "Product information"
        apiGateway -> ProductController "Call Product Controller"
        ProductController -> ProductService "Call the Product service"
        # ---
        ProductService -> ProductRepository "Call the Product-bound methods"
        ProductService -> PM_SellerRepository "Call the Seller-bound methods"
        ProductService -> PM_GoogleViewComponent "Use 3D mode"
        ProductService -> PM_GooglePhotosComponent "View photos and videos from Google Photos"
        # ---
        ProductRepository -> database "Store, view, delete and update data of products"
        PM_SellerRepository -> database "Store, view, delete and update data of sellers"
        PM_GooglePhotosComponent -> googlePhotos "Manage media files as CRUD"
        PM_GoogleViewComponent -> google3dSystem "Manage 3D furniture files as CRUD"

        //=========================
        //  Componentes Payment
        //=========================
        apiGateway -> paymentController "CALL CONTROLLER"
        paymentController -> paymentService "CALL SERVICE"
        # ---
        paymentService ->  paymentRepository "CALL THE PAYMENTS-BOUND METHODS"
        # ---
        paymentRepository -> database  " facilitate and secure of  pay methods"
        paymentRepository ->  visaComponent "CALL METHOD TO LINK VISA API GATEWAY"

        //=========================
        //  Componentes Furniture //Implementamos payment mediante el servide de furniture
        //=========================
        apiGateway -> furnitureController "CALL CONTROLLER"
        furnitureController -> furnitureService "CALL SERVICE"
        # ---
        furnitureService ->  furnitureRepository "CALL THE FURNITURES-BOUND METHODS"
        furnitureService -> sellerRepository "CALL THE SELLERS-BOUND METHODS"
        furnitureService ->  paymentRepository "CALL THE PAYMENT-BOUND METHODS"
        furnitureService -> invertorcomponent "CALL METHOD TO LINK INVENTORY API GATEWAY"
        furnitureService -> googleviewcomponente "CALL METHOD TO LINK GOOGLE VIEW API GATEWAY"
        # ---
        invertorcomponent -> inventorySystem "Store furniture information"
        invertorcomponent -> database "Store, view, update, delete product"
        googleviewcomponente -> google3dSystem "user and producer interaction through 3d function"

        //=========================
        //Componentes Plane //Arqui
        //=========================
        designerRepository -> database  " create, implement and modify plans"
        apiGateway -> planeController "CALL CONTROLLER"
        planeController -> PlaneService "CALL SERVICE"
        # ---
        PlaneService ->  planeRepository "CALL THE PLANS-BOUND METHODS"
        PlaneService -> designerRepository "CALL THE DESIGNERS-BOUND METHODS"
        PlaneService ->  googleviewcomponent "CALL METHOD TO LINK GOOGLE VIEW API GATEWAY"
        # ---
        googleviewcomponent -> google3dSystem "user and producer interaction through 3d function"

        //=========================
        // componente account
        //=========================
        apiGateway ->  accountController "CALL CONTROLLER"
        accountController ->  accountService "CALL SERVICE"
        # ---
        accountService -> RoleRepository "CALL METHOD"
        accountService -> PermissionRepository "CALL METHOD"
        accountService -> UserActivityRepository "CALL METHOD"
        accountService -> gmailUserComponent "CALL METHOD"
        accountService -> UserRepository "CALL METHOD"
        # ---
        gmailUserComponent -> gmailSystem "validates the delivery of the order through the user's email"
        RoleRepository -> database "information stored about existing user profiles"
        PermissionRepository -> database "stores and manages information about permissions and access rights to the system"
        UserActivityRepository -> database "stores and manages information related to the activities and actions carried out by users"
        gmailUserComponent -> database "validate purchase information by mail"
        UserRepository -> database "stores and manages user information in an application or system"
        gmailUserComponent -> database "allows the user to communicate to have information about their purchase"

        //=========================
        //componente search
        //=========================
        crudSearch -> database "search and select available products" "JSON / XML / HTTPS/ ODBC/ADO.NET"
        apiGateway ->  SearchSelectController "CALL CONTROLLER"
        SearchSelectController ->  SearchSelectService "CALL SERVICE"
        SearchSelectService -> SearchRepository "CALL THE SEARCHS- BOUND METHODS"
        SearchSelectService -> invertorycomponent "CALL METHOD TO LINK INVENTORY API GATEWAY"
        SearchSelectService ->  googlephotoscomponent  "CALL METHOD TO LINK GOOGLE PHOTOS API GATEWAY"
        # ---
        googlephotoscomponent -> googlePhotos "show the product catalog"
        invertorycomponent -> inventorySystem "Store furniture information"
        SearchRepository -> database "Store, view, update, delete product"
        invertorycomponent -> database  "Store, view, update, delete product"
        googlephotoscomponent  -> database  "Product photos uploaded to the cloud to be purchased"
    }

    views {
        systemcontext furnitureSystem "SystemContext" {
            include *
            autoLayout
        }
        container furnitureSystem "ContainerSystem" {
            include *
            autoLayout
        }
        component crudSellBC "ComponentSell"{
            include *
            autoLayout
        }
        component crudPaymentBC "ComponentPayment" {
            include *
            autoLayout
        }
        component crudFurnitureBC "ComponentFurniture"{
            include *
            autoLayout
        }
        component crudPlaneBC "ComponentPlane"{
            include *
            autoLayout
        }
        component accountBC "ComponentUser"{
            include *
            autoLayout
        }
        component crudSearch "ComponentSearch"{
            include *
            autoLayout
        }
        component productManagementBC "ComponentProductManagement" {
            include *
            autoLayout
        }
        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Customer" {
                background #2f2a4b
            }
            element "Designer" {
                background #124533
            }
            element "Seller" {
                background #18f364
            }
            element "Software System" {
                background #9e2181
                color #ffffff
            }
            element "mobileApp" {
                background #d4fffc
                shape MobileDevicePortrait
            }
            element "FurnitureSystem" {
                background #9e8721
            }
            element "IHFdatabase" {
                background #f5f5ba
                shape Cylinder
            }
            element "ApiGateway" {
                shape Pipe
                background #f5f5ba

            }
            //Bounded Contexts
            element "crudFurnitureBC" {
                shape Folder
            }
        }
    }