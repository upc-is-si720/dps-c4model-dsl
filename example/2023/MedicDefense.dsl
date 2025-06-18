workspace "MedicDefense" "This is a Diagram of MedicDefense" {

    model {
        # Person
        citizen = person "Citizen" "A user who uses the app to find the most efficient route in their city or to report incidents such as robberies or accidents in specific areas." "Citizen"
        governmentEntity = person "Government entity" "Government officials and entities that use the app to review notifications and incident reports provided by citizens." "Government entity"
        admin = person "Admin" "Responsible for ensuring the app's proper operation." "Admin"

        peaceAppSoftware = softwareSystem "PeaceApp" "A platform for citizen security, enabling users to access safety info, report incidents, and communicate with authorities." "PeaceAppSoftware" {
            singlePageApp = container "Single-Page Application" "Delivers comprehensive legal resources and support to healthcare professionals directly through their web browsers." "JavaScript / Vue" "WebApp"
            webApp = container "Web App" "Legal assistance and educational resources for the medical community via a web platform." "JavaScript / Vue" "WebApp"
            
            
            apiApplication = container "API Application" "Component that sits between clients and services and provides centralized handling of API communication between them" "Spring Cloud Gateway" "ApiApplication"
            paymentBC = container "Payment Bounded Context" "Api RESTful of payment" "Java v20 / Spring v3" "PaymentBC,BoundedContext"{
                paymentController = component "Payment Controller" "[Component: Java v20 / Spring Web]"
                paymentService = component "Payment Service" "[Component: Java v20 / Spring Web]"
                govermentEntityRepository5 = component "Goverment Entity Repository" "Repository Interface for Goverment Entity" "[Component: Java v17 / Spring Web]"
                }
            identityAccessBC = container "Identity and Access Bounded Context" "Api RESTful of Identity and Access Management" "Java v20 / Spring v3" "IdentityAccessBC,BoundedContext"{
                accessController = component "Access Controller" "REST Controller class of Real Time Access" "[Component: Java v17 / Spring Web]"
                loginService = component "Login Service" "Business Logic Class for LoginService" "[Component: Java v17 / Spring Web]"
                citizenRepository = component "Citizen Repository" "Repository Interface for Citizen Entity" "[Component: Java v17 / Spring Web]"
                govermentEntityRepository = component "Goverment Entity Repository" "Repository Interface for Goverment Entity" "[Component: Java v17 / Spring Web]"
            }
            notificationBC = container "Notification Bounded Context" "Api RESTful of Notification" "Java v20 / Spring v3" "notificationBC,BoundedContext"{
                notificationController = component "Notification Controller" "REST Controller class of Notification" "Java v20 / Spring Web" "NotificationController"
                notificationService = component "Notification Service" "Busines Logic class for Notification Service" "Java v20 / Spring Data" "NotificationService"
                citizenRepository4 = component "Citizen Repository" "Repository Interface for Citizen Entity" "[Component: Java v17 / Spring Web]"
                govermentEntityRepository4 = component "Goverment Entity Repository" "Repository Interface for Goverment Entity" "[Component: Java v17 / Spring Web]"
                notificationRepository = component "Notification Repository" "Repository Interface for Notification Entity" "[Component: Java v17 / Spring Web]"
            }
            locationBC = container "Location Bounded Context" "Api RESTful of Location" "Java v20 / Spring v3" "locationBC,BoundedContext" {
                locationController = component "Location Controller" "REST Controller class of Location" "Java v20 / Spring Web" "ConsultationController"
                locationService = component "Location Service" "Busines Logic class for Location Service" "Java v20 / Spring Data" "ConsultationService"
                citizenRepository2 = component "Citizen Repository" "Repository Interface for Citizen Entity" "[Component: Java v17 / Spring Web]"
                govermentEntityRepository2 = component "Goverment Entity Repository" "Repository Interface for Goverment Entity" "[Component: Java v17 / Spring Web]"
                districtRepository = component "District Repository" "Repository Interface for District Entity" "[Component: Java v17 / Spring Web]"
                cityRepository = component "City Repository""Repository Interface for City Entity" "Java v17 / Spring Data" "ReviewRepository"
                locationComponent = component "Location Component" "Integrates mapping and location services" "Java v20 / Spring v3" "LocationComponent"
            }
            reportManagementBC = container "Report Bounded Context" "Api RESTful of Report" "Java v20 / Spring v3" "reportBC,BoundedContext"{
                reportController = component "Report Controller" "REST Controller class of Report" "Java v20 / Spring Web" "EducationalResourceController"
                reportService = component "Report Service" "Busines Logic class for Report Service" "Java v20 / Spring Data" "EducationalResourceService"
                govermentEntityRepository6 = component "Goverment Entity Repository" "[Component: Java v20 / Spring Web]"
                citizenRepository3 = component "Citizen Repository" "[Component: Java v20 / Spring Web]"
                reportRepository2 = component "Report Repository" "[Component: Java v20 / Spring Web]"
            }
            notificationPriorizationBC = container "Notification Priorization Bounded Context" "Api RESTful of Notification Priorization" "Java v20 / Spring v3" "notificationPriorizationBC,BoundedContext"{
                notificationPriorizationController = component "Notification Priorization Controller" "REST Controller class of Notification Priorization" "Java v20 / Spring Web" "NotificationPriorizationController"
                notificationPriorizationService = component "Notification Priorization Service" "Busines Logic class for Notification Priorization Service" "Java v20 / Spring Data" "NotificationPriorizationService"
                notificationRepository2 = component "Notification Repository" "[Component: Java v20 / Spring Web]"
                govermentEntityRepository3 = component "Goverment Entity Repository" "[Component: Java v20 / Spring Web]"
                reportRepository = component "Report Repository" "[Component: Java v20 / Spring Web]"
            }
           relationalDatabase = container "Relational Database" "Stores and update information, hashed authentication credentials, access logs, etc." "Oracle Database 21c - Enterprise Edition" "RelationalDatabase"
        }

        # External Software System
        paymentSystem = softwareSystem "Payment System" "Facilitates secure and efficient processing of diverse electronic payments, including credit and debit transactions." "Payment System"
        locationSystem = softwareSystem "Location System" "Empowers citizens and governments with a heatmap feature for precise location tracking and analysis." "Location System"

        # relationships between people and software systems
        citizen ->  peaceAppSoftware "Access safety information, report incidents, and communicate with authorities for enhanced community security."
        governmentEntity ->  peaceAppSoftware "Review incident reports and access educational resources to support medical studies."
        admin ->  peaceAppSoftware "Manages and supports the application"

        # relationships between Falabella and external software systems
        peaceAppSoftware -> paymentSystem "Processes international and credit card payments for services."
        peaceAppSoftware -> locationSystem "Empowers users with a heatmap feature to track and analyze safety information across locations."
       
        // relationships between people and containers
        citizen -> singlePageApp "Accesses safety features, reports incidents, and manages personal settings via the single-page app."
        governmentEntity -> singlePageApp "Reviews safety data, prioritizes alerts, and manages district profiles using the single-page app."
        admin -> singlePageApp "Manages and supervises the application's functionality and user interactions."
        citizen -> webApp "Accesses safety features, reports incidents, and manages personal settings via the single-page app."
        governmentEntity -> webApp "Reviews safety data, prioritizes alerts, and manages district profiles using the single-page app."
        admin -> webApp "Manages and supervises the application's functionality and user interactions."
        
        # relationships between containers
        singlePageApp -> apiApplication "Endpoint call" "JSON / HTTPS"
        webApp -> apiApplication "Endpoint call" "JSON / HTTPS"

        # relationships of the Delivery BoundedContext 
        apiApplication -> locationController "Endpoint call" "JSON / HTTPS"
        locationController -> locationService "Methods call" "POO"
        locationService -> citizenRepository2 "Methods call" "POO"
        locationService -> govermentEntityRepository2 "Methods call" "POO"
        locationService -> CityRepository "Methods call" "POO"
        locationService -> DistrictRepository "Methods call" "POO"
        locationService -> locationComponent "Methods call" "POO"
        citizenRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        govermentEntityRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        cityRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        districtRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        locationComponent -> locationSystem "Endpoints call" "JSON / XML / HTTPS"
         # relationships of the Delivery BoundedContext 
         apiApplication -> accessController "Endpoint call" "JSON / HTTPS"
         accessController -> loginService "Methods call" "POO"
         loginService -> citizenRepository "Methods call" "POO"
         loginService -> govermentEntityRepository "Methods call" "POO"
         citizenRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         govermentEntityRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         # relationships of the Delivery BoundedContext
         apiApplication -> reportController "Endpoint call" "JSON / HTTPS"
         reportController -> reportService "Methods call" "POO"
         reportService -> reportRepository2 "Methods call" "POO"
         reportService -> citizenRepository3 "Methods call" "POO"
         reportService -> govermentEntityRepository6 "Methods call" "POO"
         reportRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         citizenRepository3  -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         govermentEntityRepository6 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         # relationships of the Delivery BoundedContext
         apiApplication -> notificationPriorizationController "Endpoint call" "JSON / HTTPS"
         notificationPriorizationController -> notificationPriorizationService "Methods call" "POO"
         notificationPriorizationService -> reportRepository "Methods call" "POO"
         notificationPriorizationService -> govermentEntityRepository3 "Methods call" "POO"
         notificationPriorizationService -> notificationRepository2 "Methods call" "POO"
         reportRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         govermentEntityRepository3 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         notificationRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         # relationships of the Delivery BoundedContext 
         apiApplication -> paymentController "Endpoint call" "JSON / HTTPS"
         paymentController -> paymentService "Methods call" "POO"
         paymentService -> govermentEntityRepository5 "Methods call" "POO"
         govermentEntityRepository5 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         paymentService -> paymentSystem "Store, get, update and delete record" "JDBC/SQL Transactional"
         # relationships of the Delivery BoundedContext 
         apiApplication -> notificationController "Endpoint call" "JSON / HTTPS"
         notificationController -> notificationService "Methods call" "POO"
         notificationService -> citizenRepository4 "Methods call" "POO"
         notificationService -> govermentEntityRepository4 "Methods call" "POO"
         notificationService -> notificationRepository "Methods call" "POO"
         notificationRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         citizenRepository4 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
         govermentEntityRepository4 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
    }
    views {
        systemContext  PeaceAppSoftware "SystemContext" {
            include *
            autoLayout 
        }
        container  PeaceAppSoftware "Containers" {
            include *    
            autoLayout
        }
        component identityAccessBC "identityAccessBC" {
            include *    
            autoLayout
        }
        component reportManagementBC "reportManagementBC" {
            include *    
            autoLayout
        }
        component paymentBC "paymentBC" {
            include *    
            autoLayout
        }
        component locationBC "locationBC" {
            include *    
            autoLayout
        }
        component notificationPriorizationBC "notificationPriorizationBC" {
            include *    
            autoLayout
        }
        component notificationBC "notificationBC" {
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
            element "PeaceAppSoftware" {
                background #fd7e14
            }
            element "Admin" {
                background #ac000d
                shape Robot
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
            element "ApiApplication" {
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