workspace "homeCare" "System to request domestic services" {

    model {
        // variable=person (el usuario) "nombre que figura en el objeto" "descripción"
        client = person "Contractor client" "person who contracts a home service" "Client"
        worker = person "Independient worker" "Worker who attends the service" "Worker"
        company = person "Company Service" "Company who have workers who attends home service" "Company"
        administrationUser = person "Administration User" "Person who manages and supports the application." "AdministrationUser"

        // variable=sotfwareSystem: el tipo de variable, el sistema del centro
        homeCareSoftware = softwareSystem "HomeCare Service" "System to request domestic services" "HomeCareSoftware" {
            webApplication = container "Web Application" "Provides a set of the Web functionality via Browser." "Java v17 / Spring v3" "WebApplication"
            mobileApplication = container "Mobile App" "Provides a set of the Internet functionality to customers via their mobile device." "Kotlin - Android / Swift - iOS" "MobileApplication"

            apiGateway = container "API Gateway" "Component that sits between clients and services and provides centralized handling of API communication between them" "Spring Cloud Gateway" "ApiGateway"

            # Bounded countexts
            userLoginBC = container "User Login Bounded Context" "Api RESTful of User login" "Java v17 / Spring v3" "UserLoginBC, BoundedContext" {
                userLoginController = component "User Login Controller" "REST controller for User Login" "Java v17 / Spring Web" "UserLoginController"
                userLoginService = component "User Login Service" "Business Logic class for User Login" "Java v17 / Spring Web" "UserLoginController"
                workerRepository = component "Worker Repository" "Repository interface for Worker Entity" "Java v17 / Spring Web" "WorkerRepository"
                clientRepository = component "Client Repository" "Repository interface for Client Entity" "Java v17 / Spring Web" "ClientRepository"
                LoginRepository = component "Login Repository" "Repository interface for Login Entity" "Java v17 / Spring Web" "LoginRepository"
                googleGmailComponent = component "Gmail Component" "Component to connect with the Gmail API" "Java v17 / Spring Web" "GoogleGmailComponent"

            }
            workerSearchBC = container "Search Worker Bounded Context" "Api RESTful of worker Search" "Java v17 / Spring v3" "WorkerSearchBC, BoundedContext"  {
                workerSearchController = component "Worker Search Controller" "REST controller for Worker Search" "Java v17 / Spring Web" "WorkerSearchController"
                workerSearchService = component "Worker Search Service" "Business Logic class for Worker Search" "Java v17 / Spring Web" "WorkerSearchService"
                workerRepository2 = component "Worker Repository" "Repository interface for Worker Entity" "Java v17 / Spring Web" "WorkerRepository2"
                criminalRecordRepository = component "Criminal Record Repository" "Repository interface for Criminal Record" "Java v17 / Spring Web" "CriminalRecordRepository"
            }
            paymentBC = container "Payment System Bounded Context" "Api RESTful of payment" "Java v17 / Spring v3" "PaymentBC, BoundedContext" {
                paymentController = component "Payment Controller" "REST controller for Payment" "Java v17 / Spring Web" "PaymentController"
                paymentService = component "Payment Service" "Business Logic class for Payment" "Java v17 / Spring Web" "PaymentService"
                clientRepository2 = component "Client Repository" "Repository interface for Client Entity" "Java v17 / Spring Web" "ClientRepository2"
                workerRepository3 = component "Worker Repository" "Repository interface for Worker Entity" "Java v17 / Spring Web" "WorkerRepository3"
                bankAccountRepository = component "Bank Account Repository" "Repository interface for Bank Account" "Java v17 / Spring Web" "BankAccountRepository"
                culquiComponent = component "Culqui Component" "Component to conntect with the Culqui API" "Java v17 / Spring Web" "CulquiComponent"
                SunatComponent = component "SUNAT component" "Component to conntect with the Culqui API" "Java v17 / Spring Web" "SunatComponent"
            }
            appointmentBC = container "Appointment Management Bounded Context" "Api RESTful of Appointment management" "Java v17 / Spring v3" "AppointmentBC, BoundedContext" {
                appointmentController = component "Appointment Controller" "REST controller for Payment" "Java v17 / Spring Web" "Appointment Controller"
                appointmentService = component "Appointment Service" "Business Logic class for Appointment" "Java v17 / Spring Web" "Appointment Service"
                companyRepository = component "Repository interface for Company" "CompanyRepository"
                workerRepository4 = component "Worker Repository" "Repository interface for Worker Entity" "Java v17 / Spring Web" "WorkerRepository4"
                registeredAppointmentRepository = component "Registered Appointment Repository" "Repository interface for registered appintments" "Java v17 / Spring Web" "RegisteredAppointmentRepository"
                googleCalendarComponent = component "Google Calendar" "Component to connect with the Google Calendar API" "Java v17 / Spring Web" "GoogleCalendarComponent"
            }
            #del trabajador
            evaluationBC = container "Worker Evaluation Bounded Context" "Api RESTful of Worker evaluation" "Java v17 / Spring v3" "EvaluationBC, BoundedContext" {
                evaluationController = component "Evaluation Controller" "REST controller for Evaluation" "Java v17 / Spring Web" "Evaluation Controller"
                evaluationService = component "Evaluation Service" "Business Logic class for Evaluation" "Java v17 / Spring Web" "EvaluationService"
                workerRepository5 = component "Worker Repository" "Repository interface for Worker Entity" "Java v17 / Spring Web" "WorkerRepository5"
                clientRepository3 = component "Client Repository" "Repository interface for Client Entity" "Java v17 / Spring Web" "ClientRepository3"
                commentaryRepository = component "Commentary Repository" "Repository interface for Commentary Entity" "Java v17 / Spring Web" "Commentary Repository"
            }
            workerReviewBC = container "Worker Review Bounded Context" "Api RESTful of Worker review" "Java v17 / Spring v3" "WorkerReviewBC, BoundedContext" {
                workerReviewController = component "Worker Review Controller" "REST controller for Worker Review" "Java v17 / Spring Web" "WorkerReviewController"
                workerReviewService = component "Worker Review Service" "Business Logic class for Worker Review" "Java v17 / Spring Web" "WorkerReviewService"
                workerRepository6 = component "Worker Repository" "Repository interface for Worker Entity" "Java v17 / Spring Web" "WorkerRepository6"
                criminalRecordRepository2 = component "Criminal Record Repository" "Repository interface for Criminal Record Entity" "Java v17 / Spring Web" "CriminalRecordRepository2"
                valorationRepository = component "Worker Valoration repository" "Repository interface for Worker Valoration" "Java v17 / Spring Web" "WorkerValoration"
                googleMapsComponent = component "Google Maps" "Component to conntect with the Google Maps API" "Java v17 / Spring Web" "GoogleMapsComponent"
                poderJudicialComponent = component "Poder Judicial del Perú" "Component to connect with the Poder Judicial Perú API" "Java v17 / Spring Web" "PoderJudicialComponent"
            }
            workerSelectionBC = container "Worker Selection Bounded Context" "Api RESTful of Worker selection" "Java v17 / Spring v3" "WorkerSelectionBC, BoundedContext" {
                workerSelectionController = component "Worker Selection Controller" "REST controller for Worker Selection" "Java v17 / Spring Web" "Worker Selection"
                workerSelectionService = component "Worker Selection Service" "Business Logic class for Worker Selection" "Java v17 / Spring Web" "Worker Service"
                workerRepository7 = component "Worker Repository" "Repository interface for Worker Entity" "Java v17 / Spring Web" "WorkerRepository7"
                criminalRecordRepository3 = component "Criminal Record Repository" "Repository interface for Criminal Record Entity" "Java v17 / Spring Web" "CriminalRecordRepository3"
            }
            databaseApplication = container "Relational Database" "Stores and update information, hashed authentication credentials, access logs, etc." "Oracle Database 21c - Enterprise Edition" "RelationalDatabase"
        }
        /*
        buscar información sobre cómo desarrollar una web app
        para complementar la informacón del diagrama
        */
        googleMaps = softwareSystem "Google Maps" "Is a web mapping platform and It offers satellite imagery, aerial photography and street maps" "GoogleMaps"
        googleGmail = softwareSystem "Gmail" "Service that allows access to Gmail mailboxes and send emails." "GoogleGmail"
        qulqiSystem = softwareSystem "Qulqi" "App that accepts payments with debit and credit cards" "QulqiSystem"
        registerSystem = softwareSystem "Google Sign-In" "Authentication service that allows users to sign in to websites using their Google accounts." "GoogleRegister"
        sunatSystem = softwareSystem "SUNAT" "Electronic invoicing service in the cloud that generates, signs, sends and stores your receipts." "SunatSystem"
        googleCalendar = softwareSystem "Google Calendar" "RESTful HTTP API which provides the user's calendar" "Google Calendar"
        poderJudicial = softwareSystem "Poder Judicial" "HTTP API that provides criminal records for Peruvian workers" "Poder Judicial"

        # relationships between people and software systems
        client -> homeCareSoftware "Book, cancel appointment with the employee"
        worker -> homeCareSoftware "Accept and decline user's appointments"
        company -> homeCareSoftware "Confirm and decline services"
        administrationUser -> homeCareSoftware "Manages and supports the application"


        # relationships between Falabella and external software systems
        homeCareSoftware -> googleGmail "Receive notification of payment made by email"
        homeCareSoftware -> registerSystem "Register with the accounts google"
        homeCareSoftware -> googleMaps "Get the map and route between specific locations"
        homeCareSoftware -> sunatSystem "Obtain electronic receipt of the payment made"
        homeCareSoftware -> qulqiSystem "Register card information, pay and validate payment"

        # relationships between people and containers
        client -> webApplication "Search for a person who performs domestic service"
        client -> mobileApplication "Search for a person who performs domestic service"
        worker -> webApplication "Worker who attends the service"
        worker -> mobileApplication "Worker who attends the service"
        company -> webApplication "Company who have workers who attends domestic service"
        administrationUser -> webApplication "Manages and supports the application"

        # relationships between containers
        mobileApplication -> apiGateway "Endpoint call" "JSON / HTTPS"
        webApplication -> apiGateway "Endpoint call" "JSON / HTTPS"

        # relationships between apiGateway and BoundedContext
        apiGateway -> userLoginBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> workerSearchBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> paymentBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> appointmentBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> evaluationBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> workerReviewBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> workerSelectionBC "Endpoint call" "JSON / HTTPS"

        # relationships between BoundedContext and Database
        userLoginBC -> databaseApplication "Store, get, update and delete record" "JDBC"
        workerSearchBC -> databaseApplication "Store, get, update and delete record" "JDBC"
        paymentBC -> databaseApplication "Store, get, update and delete record" "JDBC"
        appointmentBC -> databaseApplication "Store, get, update and delete record" "JDBC"
        evaluationBC -> databaseApplication "Store, get, update and delete record" "JDBC"
        workerReviewBC -> databaseApplication "Store, get, update and delete record" "JDBC"
        workerSelectionBC -> databaseApplication "Store, get, update and delete record" "JDBC"

        # relationships between BoundedContext and external software systems
        userLoginBC -> registerSystem "Endpoint call" "JSON / HTTPS"
        workerReviewBC -> googleMaps "Endpoint call" "JSON / HTTPS"
        paymentBC -> qulqiSystem "Endpoint call" "JSON / HTTPS"
        paymentBC -> googleGmail "Endpoint call" "JSON / HTTPS"
        paymentBC -> sunatSystem "Endpoint call" "JSON / HTTPS"

        # relationships of the LoginUser BoundedContext
        apiGateway -> userLoginController "Endpoint call" "JSON / HTTPS"
        userLoginController -> userLoginService "Methods Call" "POO"
        userLoginService -> workerRepository "Methods Call" "POO"
        userLoginService -> clientRepository "Methods Call" "POO"
        userLoginService -> loginRepository "Methods Call" "POO"
        userLoginService -> googleGmailComponent "Methods Call" "POO"
        workerRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        clientRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        loginRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        googleGmailComponent -> googleGmail "Endpoints call" "JSON / XML / HTTPS"

        # relationships of the WorkerSearch BoundedContext
        apiGateway -> workerSearchController "Endpoint call" "JSON / HTTPS"
        workerSearchController -> workerSearchService "Methods Call"
        workerSearchService -> workerRepository2 "Methods Call" "POO"
        workerSearchService -> criminalRecordRepository "Methods Call" "POO"
        workerRepository2 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        criminalRecordRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"

        # relationships of the Paymnent BoundedContext
        apiGateway -> paymentController "Endpoint call" "JSON / HTTPS"
        paymentController -> paymentService "Methods Call"
        paymentService -> workerRepository3 "Methods Call" "POO"
        paymentService -> clientRepository2 "Methods Call" "POO"
        paymentService -> bankAccountRepository "Methods Call" "POO"
        paymentService -> sunatComponent "Methods Call" "POO"
        paymentService -> culquiComponent "Methods Call" "POO"
        workerRepository3 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        clientRepository2 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        bankAccountRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        culquiComponent -> qulqiSystem "Endpoints call" "JSON / XML / HTTPS"
        sunatComponent -> SunatSystem "Endpoints call" "JSON / XML / HTTPS"

        # relationships of the Appointment BoundedContext
        apiGateway -> appointmentController "Endpoint call" "JSON / HTTPS"
        appointmentController -> appointmentService "Methods Call"
        appointmentService -> workerRepository4 "Methods Call" "POO"
        appointmentService -> companyRepository "Methods Call" "POO"
        appointmentService -> registeredAppointmentRepository "Methods Call" "POO"
        appointmentService -> googleCalendarComponent "Endpoints Call" "JSON / XML / HTTPS"
        googleCalendarComponent -> googleCalendar "Endpoints Call" "JSON / XML / HTTPS"
        workerRepository4 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        companyRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        registeredAppointmentRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"

        # relationships of the Worker Evaluation BoundedContext
        apiGateway -> evaluationController "EndPoint Call" "JSON / HTTPS"
        evaluationController -> evaluationService "Methods Call"
        evaluationService -> workerRepository5 "Methods Call"
        evaluationService -> commentaryRepository "Methods Call" "POO"
        evaluationService -> clientRepository3 "Methods Call" "POO"
        workerRepository5 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        commentaryRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        clientRepository3 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"

        # relationships of the Worker Review BoundedContext
        apiGateway -> workerReviewController "EndPoint Call" "JSON / HTTPS"
        workerReviewController -> workerReviewService "Methods call"
        workerReviewService -> workerRepository6 "Methods Call" "POO"
        workerReviewService -> criminalRecordRepository2  "Methods Call" "POO"
        workerReviewService -> valorationRepository "Methods Call" "POO"
        workerReviewService -> googleMapsComponent "Methods Call" "POO"
        workerReviewService -> poderJudicialComponent "Methods Call" "POO"
        poderJudicialComponent -> poderJudicial "Endpoints Call" "JSON / XML / HTTPS"
        googleMapsComponent -> googleMaps "Endpoints Call" "JSON / XML / HTTPS"
        workerRepository6 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        criminalRecordRepository2 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        valorationRepository -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"


        # relationships of the Worker Selection BoundedContext
        apiGateway -> workerSelectionController "EndPoint Call" "JSON / HTTPS"
        workerSelectionController -> workerSelectionService "Methods call"
        workerSelectionService -> workerRepository7 "Methods Call" "POO"
        workerSelectionService -> criminalRecordRepository3  "Methods Call" "POO"
        workerRepository7 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        criminalRecordRepository3 -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
    }

    views {
        systemContext homeCareSoftware "SystemContext" {
            include *
            animation {
                client
                worker
                company
                administrationUser
                homeCareSoftware
            }
            autoLayout
        }
        container homeCareSoftware "ContainerSystem" {
            include *
            animation {
                client
                webApplication
                apiGateway
                databaseApplication
            }
            autoLayout
        }
        component userLoginBC "UserLoginBC" {
            include *
            autoLayout
        }
        component workerSearchBC "WorkerSearchBC" {
            include *
            autoLayout
        }
        component paymentBC "PaymentBC" {
            include *
            autoLayout
        }
        component appointmentBC "AppointmentBC" {
            include *
            autoLayout
        }
        component evaluationBC "EvaluationBC" {
            include *
            autoLayout
        }
        component workerReviewBC "WorkerReviewBC" {
            include *
            autoLayout
        }
        component workerSelectionBC "WorkerSelectionBC" {
            include *
            autoLayout
        }


        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Client"{
                background #2f2a4b
            }
            element "Worker"{
                background #a78d4b
            }
            element "Company"{
                background #3f5a9c
            }
            element "AdministrationUser" {
                background #E34A32
                shape Robot
            }

            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "HomeCareSoftware" {
                background #314371
            }
            element "GoogleMaps" {
                background #CFE8DC
                color #000000
            }
            element "GoogleGmail" {
                background #97C377
                color #000000
            }
            element "QulqiSystem" {
                background #00a19b
            }
            element "GoogleRegister" {
                background #ffcc00
                color #000000
            }
            element "SunatSystem" {
                color #000000
                background #DDF0F2
            }

            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "MobileApplication" {
                shape MobileDevicePortrait
            }
            element "WebApplication" {
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