workspace "TechniSearch" "This is a Diagram of TechniSearch" {

    model {
        # Person
        customer = person "Customer" "Person who searches a technical close to their district." "Customer"
        technician = person "Technician" "Person who offers their services to the customers." "Technician"
        developer = person "Developer" "Person who manages and supports the application in addition to maintenance." "Developer"

        techniSearchSoftware = softwareSystem "TechniSearch" "System of services that offer solutions to domestic problems." "TechniSearchSoftware" {
            mobileApp = container "Mobile App" "Provides a set of the Internet functionality to customers via their mobile device." "Kotlin - Android / Swift - iOS" "MobileApp"

            apiGateway = container "API Gateway" "Component that sits between clients and services and provides centralized handling of API communication between them" "Spring Cloud Gateway" "ApiGateway"
            paymentBC = container "Payment Bounded Context" "Api RESTful of payment" "Java v17 / Spring v3" "PaymentBC,BoundedContext"{
                paymentController = component "Payment Controller" "[Component: Java v17 / Spring Web]"
                paymentService = component "Payment Service" "[Component: Java v17 / Spring Web]"
                customerRepository3 = component "Customer Repository" "[Component: Java v17 / Spring Web]"
                technicianRepository3 = component "Technician Repository" "[Component: Java v17 / Spring Web]"
            }
            identityAccessBC = container "Identity and Access Bounded Context" "Api RESTful of Identity and Access Management" "Java v17 / Spring v3" "IdentityAccessBC,BoundedContext"{
                accessController = component "Access Controller" "REST Controller class of Real Time Access" "[Component: Java v17 / Spring Web]"
                loginService = component "Login Service" "Business Logic Class for LoginService" "[Component: Java v17 / Spring Web]"
                customerRepository = component "Customer Repository" "Repository Interface for Customer Entity" "[Component: Java v17 / Spring Web]"
                technicianRepository = component "Technician Repository" "Repository Interface for Technician Entity" "[Component: Java v17 / Spring Web]"
            }
            deliveryBC = container "Location Technician Bounded Context" "Api RESTful of Delivery" "Java v17 / Spring v3" "DeliveryBC,BoundedContext" {
                deliveryController = component "Real Time Location and Comunication Controller" "REST Controller class of Real Time Tehcnician" "Java v17 / Spring Web" "DeliveryController"
                deliveryService = component "Technicial Service" "Busines Logic class for Technicial Service" "Java v17 / Spring Data" "DeliveryService"
                buyerRepository = component "Customer Repository" "Repository Interface for Customer Entity" "Java v17 / Spring Data"
                buyRepository = component "Review Repository""Repository Interface for Reviews Entity" "Java v17 / Spring Data" "ReviewRepository"
                deliveryRepository = component "Delivery Repository" "Repository Interface for Calendar Entity"  "Java v17 / Spring Data" "DateAdministrationRepository"
                googleMapComponent = component "Google Map Component" "Component to connect with the GoogleMap API" "Java v17 / Spring v3" "GoogleMapComponent"
                technicialRepository = component "Technician Repository" "Repository Interface for Technician Entity"  "Java v17 / Spring Data" "TehcnicianRepository"
            }
            searchSelectBC = container "Search and Select Bounded Context" "Api RESTful of Search and select a technician" "Java v17 / Spring v3" "searchSelectBC,BoundedContext"{
                searchController = component "Search and Select Controller" "REST Controller class of Real Time Search and Select" "Java v17 / Spring Web" "SearchandSelectController"
                filterService = component "Filter Service" "Busines Logic class for Filter Service" "Java v17 / Spring Data" "FilterService"
                technicianRepository2 = component "Technician Repository" "[Component: Java v17 / Spring Web]"
            }
            calendarBC = container "Calendar Tool Bounded Context" "Api RESTful of Calendar" "Java v17 / Spring v3" "calendarBC,BoundedContext"{
                calendarController = component "Calendar Controller" "REST Controller class of Calendar" "Java v17 / Spring Web" "SearchandSelectController"
                calendarService = component "Calendar Service" "Busines Logic class for Calendar Service" "Java v17 / Spring Data" "CalendarService"
                customerRepository2 = component "Customer Repository" "Repository Interface for Technician Entity" "[Component: Java v17 / Spring Web]"
                agendaHeaderRepository = component "AgendarHeader Repository" "Repository Interface for AgendaHeader Entity" "[Component: Java v17 / Spring Web]"
                agendaDetailsRepository = component "AgendaDetail Repository" "Repository Interface for AgendaDetails Entity" "[Component: Java v17 / Spring Web]"
                technicianRepositoy = component "Technician Repository" "Repository Interface for Technician Entity" "[Component: Java v17 / Spring Web]"

            }
            criminalRecordViewBC = container "Criminal Record View Bounded Context" "Api RESTFUL of Criminal Record View" "Java v17 / Spring v3" "criminalRecordView, BoundedContext"{
                criminalRecordController = component "Criminal Record View Controller" "REST Controller class of Criminal Record View" "Java v17 / Spring Web" "CriminalRecordViewController"
                criminalRecordService = component "Criminal Record View Service" "Busines Logic class for Criminal Record View Service"
                customerRepository4 = component "Customer Repository" "Repository Interface for Customer Entity" "[Component: Java v17 / Spring Web]"
                technicianRepository4 = component "Technician Repository" "Repository Interface for Technician Entity" "[Component: Java v17 / Spring Web]"
                personalArchivesRepository = component "Personal Archives Repository" "Repository Interface for Personal Archives Entity" "[Component: Java v17 / Spring Web]"
                reniecComponent = component "Reniec Component" "Component to connect with the Reniec API" "Java v17 / Spring v3" "ReniecComponent"
            }
            relationalDatabase = container "Relational Database" "Stores and update information, hashed authentication credentials, access logs, etc." "Oracle Database 21c - Enterprise Edition" "RelationalDatabase"
        }

        # External Software System
        bcp = softwareSystem "BCP" "App that allows you to make transactions to a mobile bank." "BCP"
        googleMaps = softwareSystem "Google Maps" "Is a web mapping platform and It offers satellite imagery, aerial photography and street maps" "Google Maps"
        yape = softwareSystem "Yape" "App that allows you to send and receive money through a QR" "Yape"
        plin = softwareSystem "Plin" "App that allows you to send and receive money through a QR for BBVA Bank users" "Plin"
        sunat = softwareSystem "SUNAT" "App that allows you to register legally the bill in the system of the goverment" "SUNAT"

        # relationships between people and software systems
        customer -> techniSearchSoftware "Finds and contacts technicaians to solve their domestic problems"
        technician -> techniSearchSoftware "Manages to publish their services to solve the domestical problems of their customers"
        developer -> techniSearchSoftware "Manages and supports the application"

        # relationships between Falabella and external software systems
        techniSearchSoftware -> bcp "Obtain the account number of the company to carry out the transaction."
        techniSearchSoftware -> googleMaps "Get the map and set the geospatial location."
        techniSearchSoftware -> yape "Obtain QR and validate payment made."
        techniSearchSoftware -> plin "Obtain QR and validate payment made."
        techniSearchSoftware -> sunat "Obtain the bill and validate the customer and purchase data to be sent to SUNAT."

        # relationships between people and containers
        customer -> mobileApp "Finds and contacts technicaians to solve their domestic problems"
        technician -> mobileApp "Manages to publish their services to solve the domestical problems of their customers"
        developer -> mobileApp "Manages and supports the application"

        # relationships between containers
        mobileApp -> apiGateway "Endpoint call" "JSON / HTTPS"

        # relationships between apiGateway and BoundedContext
        apiGateway -> paymentBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> identityAccessBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> deliveryBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> searchSelectBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> calendarBC "Endpoint call" "JSON / HTTPS"

        # relationships between BoundedContext and Database
        paymentBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        identityAccessBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        deliveryBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        searchSelectBC -> relationalDatabase "Store, get, update and delete record" "JDBC"
        calendarBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        # relationships between BoundedContext and external software systems
        paymentBC -> bcp "Endpoint call" "JSON / HTTPS"
        paymentBC -> yape "Endpoint call" "JSON / HTTPS"
        paymentBC -> plin "Endpoint call" "JSON / HTTPS"
        paymentBC -> sunat "Endpoint call" "JSON / HTTPS"
        deliveryBC -> googleMaps "Endpoint call" "JSON / HTTPS"
        # relationships of the Delivery BoundedContext
        apiGateway -> deliveryController "Endpoint call" "JSON / HTTPS"
        deliveryController -> deliveryService "Methods call" "POO"
        deliveryService -> buyerRepository "Methods call" "POO"
        deliveryService -> buyRepository "Methods call" "POO"
        deliveryService -> deliveryRepository "Methods call" "POO"
        deliveryService -> googleMapComponent "Methods call" "POO"
        deliveryService -> technicialRepository "Methods call" "POO"
        technicialRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        buyerRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        buyRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        deliveryRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        googleMapComponent -> googleMaps "Endpoints call" "JSON / XML / HTTPS"
        # relationships of the Identity Access BoundedContext
        apiGateway -> accessController "Endpoint call" "JSON / HTTPS"
        accessController -> loginService "Methods call" "POO"
        loginService -> customerRepository "Methods call" "POO"
        loginService -> technicianRepository "Methods call" "POO"
        customerRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        technicianRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        # relationships of the SearchSelect BoundedContext
        apiGateway -> searchController "Endpoint call" "JSON / HTTPS"
        searchController -> filterService "Methods call" "POO"
        filterService -> technicianRepository2 "Methods call" "POO"
        technicianRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        # relationships of the Calendar BoundedContext
        apiGateway -> calendarController "Endpoint call" "JSON / HTTPS"
        calendarController -> calendarService "Methods call" "POO"
        calendarService -> customerRepository2 "Methods call" "POO"
        calendarService -> agendaHeaderRepository "Methods call" "POO"
        calendarService -> agendaDetailsRepository "Methods call" "POO"
        calendarService -> technicianRepositoy "Methods call" "POO"
        customerRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        agendaHeaderRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        agendaDetailsRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        technicianRepositoy -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        # relationships of the Delivery BoundedContext
        apiGateway -> paymentController "Endpoint call" "JSON / HTTPS"
        paymentController -> paymentService "Methods call" "POO"
        paymentService -> customerRepository3 "Methods call" "POO"
        paymentService -> technicianRepository3 "Methods call" "POO"
        customerRepository3 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        technicianRepository3 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        paymentService -> bcp "Store, get, update and delete record" "JDBC/SQL Transactional"
        paymentService -> yape "Store, get, update and delete record" "JDBC/SQL Transactional"
        paymentService -> sunat "Store, get, update and delete record" "JDBC/SQL Transactional"
        paymentService -> plin "Store, get, update and delete record" "JDBC/SQL Transactional"
        # relationships of the Delivery BoundedContext
        apiGateway -> criminalRecordController "Endpoint call" "JSON / HTTPS"
        criminalRecordController -> criminalRecordService "Methods call" "POO"
        criminalRecordService -> customerRepository4 "Methods call" "POO"
        criminalRecordService -> technicianRepository4 "Methods call" "POO"
        criminalRecordService -> personalArchivesRepository "Methods call" "POO"
        criminalRecordService -> reniecComponent "Methods call" "POO"
        customerRepository4 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        technicianRepository4 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        personalArchivesRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
    }
    views {
        systemContext techniSearchSoftware "SystemContext" {
            include *
            autoLayout
        }
        container techniSearchSoftware "Containers" {
            include *
            autoLayout
        }
        component deliveryBC "DeliveryBC" {
            include *
            autoLayout
        }
        component identityAccessBC "identityAccessBC" {
            include *
            autoLayout
        }
        component calendarBC "calendarBC" {
            include *
            autoLayout
        }
        component paymentBC "paymentBC" {
            include *
            autoLayout
        }
        component searchSelectBC "searchSelectBC" {
            include *
            autoLayout
        }
        component criminalRecordViewBC "criminalRecordBC"{
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
            element "Customer" {
                background #2f2a4b
            }
            element "Technician" {
                background #124652
            }
            element "Developer" {
                background #ac000d
                shape Robot
            }

            element "TechniSearchSoftware" {
                background #fd7e14
            }
            element "SUNAT" {
                background #ffcc00
                color #000000
            }
            element "Yape" {
                background #00a19b
                color #ffffff
            }
            element "Plin" {
                background #00a19b
                color #ffffff
            }
            element "Google Maps" {
                background gray
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