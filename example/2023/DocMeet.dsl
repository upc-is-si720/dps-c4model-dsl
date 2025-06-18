workspace "DocMeet" "This is an Diagram for DocMeet.com" {

    model {
        # Person
        pacient = person "Pacient" "Person who enters the application to schedule appointments with doctors." "Pacient"
        medic = person "Medic" "Person who treats and prescribes patients." "Medic"
        administrationUser = person "Administration User" "Person who manages and supports the application." "AdministrationUser"

        docMeetSoftware = softwareSystem "DocMeet.com" "Medical checkup management system." "DocMeetSoftware" {
            mobileApp = container "Mobile App" "Provides a quick and easy way to schedule medical checkups for patients through your mobile device." "Kotlin - Android / Swift - iOS" "MobileApp"
            webApp = container "Web App" "Provides a quick and easy way to schedule medical checkups for patients via Browser." "Java v17 / Spring v3" "WebApp"

            apiGateway = container "API Gateway" "Component that sits between clients and services and provides centralized handling of API communication between them" "Spring Cloud Gateway" "ApiGateway"

            menuManagementBC = container "Menu Management Context" "Api RESTful of client's menu for medical appointments" "Java v17 / Spring v3" "MenuManagementBC,BoundedContext"{
                menuController = component "Menu Controller" "REST Controller class of Menu Management" "Java v17 / Spring Web" "MenuController"
                menuService = component "Menu Service" "Busines Logic class for Management" "Java v17 / Spring Data" "MenuService"
                pacient1Repository = component "Pacient 1 Repository" "Repository Interface for Pacient Entity" "Java v17 / Spring Data" "Pacient1Repository"
                appoitment1Repository = component "Appointment Repository" "Repository Interface for appointments Entity" "Java v17 / Spring Data" "Appointment1Repository"
                menuRepository = component "Menu Repository" "Repository Interface for Management Entity" "Java v17 / Spring Data" "ManagementRepository"
            }
            registerBC = container "Registration and Ruthentication Bounded Context" "Api RESTful of Identity and Access Management" "Java v17 / Spring v3" "registerBC,BoundedContext" {
                registerController = component "Register Controller" "REST Controller class of Management" "Java v17 / Spring Web" "RegisterController"
                registerService = component "Register Service" "Busines Logic class for Management" "Java v17 / Spring Data" "RegisterService"
                pacient2Repository = component "Pacient Repository" "Repository Interface for Pacient Entity" "Java v17 / Spring Data" "Pacient2Repository"
                medicRepository = component "Medic Repository" "Repository Interface for Medic Entity" "Java v17 / Spring Data" "MedicRepository"
                adminRepository = component "Admin Repository" "Repository Interface for Identity Entity" "Java v17 / Spring Data" "registerRepository"
                googleSignInComponent = component "Google Sign-In Component" "Component to connect with the Google Sign-In API" "Java v17 / Spring v3" "GoogleSignInComponent"
                medicalSchoolComponent = component "Medical School Component" "Component to connect with medical verify API" "Java v17 / Spring v3" "MedicalSchoolComponent"
            }
            appointmentSearchBC = container "Book appointment Context" "Api RESTful for appointment search" "Java v17 / Spring v3" "AppointmentSearchBC,BoundedContext"{
                searchController = component "Booking Controller" "REST Controller class of Menu Management" "Java v17 / Spring Web" "SearchController"
                hospitalsRepository = component "Hospital Repository" "Repository Interface for Hospital Entity" "Java v17 / Spring Data" "HospitalRepository"
                searchService = component "Booking Service" "Busines Logic class for Management" "Java v17 / Spring Data" "SearchService"
                pacient3Repository = component "Pacient Repository" "Repository Interface for Pacient Entity" "Java v17 / Spring Data" "Pacient3Repository"
                medic1Repository = component "Medic Repository" "Repository Interface for Medic Entity" "Java v17 / Spring Data" "Medic1Repository"
                appoitment2Repository = component "Appointment Repository" "Repository Interface for appointments Entity" "Java v17 / Spring Data" "Appointment2Repository"
                searchRepository = component "Menu Repository" "Repository Interface for Management Entity" "Java v17 / Spring Data" "ManagementRepository"
                paymentComponent = component "Payment Component" "Component to connect with the payment options" "Java v17 / Spring v3" "PaymentComponent"
                googleCalendarComponent = component "Google Calendar Component" "Component to connect with the GoogleCalendar API" "Java v17 / Spring v3" "GoogleCalendarComponent"
                googleMapsComponent = component "Google Maps Component" "Component to connect with the Google Maps API" "Java v17 / Spring v3" "GoogleMapsComponent"
            }
            clientManagementAppointmentBC = container "Patient appointment management Context" "Api RESTful to manage appointment" "Java v17 / Spring v3" "ClientManagementAppointmentSearchBC,BoundedContext"{
                clientManagementController = component "Patient Management Controller" "REST Controller class of Menu Management" "Java v17 / Spring Web" "ClientManagementController"
                clientManagementService = component "Patient Management Service" "Busines Logic class for Management" "Java v17 / Spring Data" "ClientManagementService"
                pacient4Repository = component "Pacient Repository" "Repository Interface for Pacient Entity" "Java v17 / Spring Data" "Pacient4Repository"
                medic2Repository = component "Medic Repository" "Repository Interface for Medic Entity" "Java v17 / Spring Data" "Medic2Repository"
                appoitment3Repository = component "Appointment Repository" "Repository Interface for appointments Entity" "Java v17 / Spring Data" "Appointment3Repository"
                clientManagementRepository = component "Patient Management Repository" "Repository Interface for Management Entity" "Java v17 / Spring Data" "ClientManagementRepository"
            }
            medicalManagementAppointmentBC = container "Medical appointment scheduling Context" "Api RESTful to manage appointment" "Java v17 / Spring v3" "MedicalManagementAppointmentSearchBC,BoundedContext"{
                medicManagementController = component "Medic Management Controller" "REST Controller class of Menu Management" "Java v17 / Spring Web" "MedicManagementController"
                medicManagementService = component "Medic Management Service" "Busines Logic class for Management" "Java v17 / Spring Data" "MedicManagementService"
                pacient5Repository = component "Pacient Repository" "Repository Interface for Pacient Entity" "Java v17 / Spring Data" "Pacient5Repository"
                medic3Repository = component "Medic Repository" "Repository Interface for Medic Entity" "Java v17 / Spring Data" "Medic3Repository"
                appoitment4Repository = component "Appointment Repository" "Repository Interface for appointments Entity" "Java v17 / Spring Data" "Appointment4Repository"
                medicManagementRepository = component "Medic Management Repository" "Repository Interface for Management Entity" "Java v17 / Spring Data" "MedicManagementRepository"

            }
            feeingBC = container "Feeing Context" "Api RESTful of client's payment" "Java v17 / Spring v3" "FeeingBC,BoundedContext"{
                feeingController = component "Payment Controller" "REST Controller class of Menu Management" "Java v17 / Spring Web" "FeeingController"
                feeingService = component "Payment Service" "Busines Logic class for Management" "Java v17 / Spring Data" "FeeingService"
                culqiComponent = component "Culqi Component" "Component to connect with the Culqi API" "Java v17 / Spring v3" "CulqiComponent"
                pagoEfectivoComponent = component "PagoEfectivo Component" "Component to connect with the Culqi API" "Java v17 / Spring v3" "PagoEfectivoComponent"
                openpayComponent = component "Openpay Component" "Component to connect with the Culqi API" "Java v17 / Spring v3" "OpenpayComponent"
            }
            diagnosticBC = container "Diagnostic Context" "Api RESTful of diagnostics Management" "Java v17 / Spring v3" "DiagnosticBC,BoundedContext" {
                diagnosticController = component "Diagnostic Controller" "REST Controller class of Management" "Java v17 / Spring Web" "DiagnosticController"
                diagnosticService = component "Diagnostic Service" "Busines Logic class for Management" "Java v17 / Spring Data" "DiagnosticService"
                pacient6Repository = component "Pacient Repository" "Repository Interface for Pacient Entity" "Java v17 / Spring Data" "Pacient6Repository"
                appoitment6Repository = component "Appointment Repository" "Repository Interface for appointments Entity" "Java v17 / Spring Data" "Appointment5Repository"
                medic4Repository = component "Medic Repository" "Repository Interface for Medic Entity" "Java v17 / Spring Data" "Medic4Repository"
                diagnosticRepository = component "Diagnostic Repository" "Repository Interface for Identity Entity" "Java v17 / Spring Data" "DiagnosticRepository"
                cie10Component = component "CIE-10 Component" "Component to connect with the CIE-10 API" "Java v17 / Spring v3" "CIE10Component"
            }
            notificationsBC = container "Notifications Bounded Context" "Api RESTful of create and send notifications" "Java v17 / Spring v3" "NotificationsBC,BoundedContext" {
                notificationsController = component "Notifications Controller" "REST Controller class of Management" "Java v17 / Spring Web" "NotificationsController"
                notificationsService = component "Notifications Service" "Busines Logic class for Management" "Java v17 / Spring Data" "NotificationsService"
                pacient7Repository = component "Pacient Repository" "Repository Interface for Pacient Entity" "Java v17 / Spring Data" "Pacient7Repository"
                appoitment5Repository = component "Appointment Repository" "Repository Interface for appointments Entity" "Java v17 / Spring Data" "Appointment5Repository"
                notificationsRepository = component "Notifications Repository" "Repository Interface for Identity Entity" "Java v17 / Spring Data" "NotificationsRepository"
                gmailComponent = component "Gmail Component" "Component to connect with the Google Sign-In API" "Java v17 / Spring v3" "GmailComponent"
            }
            ratingBC = container "Rating Bounded Context" "Api RESTful of rate health care" "Java v17 / Spring v3" "RatingBC,BoundedContext" {
                ratingController = component "Rating Controller" "REST Controller class of Management" "Java v17 / Spring Web" "RatingController"
                ratingService = component "Rating Service" "Busines Logic class for Management" "Java v17 / Spring Data" "RatingService"
                pacient8Repository = component "Pacient Repository" "Repository Interface for Pacient Entity" "Java v17 / Spring Data" "Pacient8Repository"
                medic5Repository = component "Medic Repository" "Repository Interface for Medic Entity" "Java v17 / Spring Data" "Medic5Repository"
                ratingRepository = component "Rating Repository" "Repository Interface for Identity Entity" "Java v17 / Spring Data" "RatingRepository"
            }

            relationalDatabase = container "Relational Database" "Stores and update information, hashed authentication credentials, access logs, etc." "Oracle Database 21c - Enterprise Edition" "RelationalDatabase"
        }

        # External Software System
        googleSignIn = softwareSystem "Google Sign-In" "It is a service to register directly with a gmail account developed by Google" "GoogleSignIn"
        googleMaps = softwareSystem "Google Maps" "It is a service to use a map and services provide by Google" "GoogleMaps"
        googleCalendar = softwareSystem "Google Calendar" "It is a service to add, update or delete appointments in a Google calendar" "Google Calendar"
        culqi = softwareSystem "Culqi" "App that accepts payments with debit and credit cards" "Culqi"
        gmail = softwareSystem "Gmail" "It is a service to send emails to Gmail accounts" "Gmail"
        peruvianMedicalCollege = softwareSystem "Peruvian Medical College" "A service that allows doctors to be identified" "PeruvianMedicalCollege"
        cie10 = softwareSystem "CIE-10" "A service to make and validate appoitments" "CIE10"
        pagoEfectivo = softwareSystem "PagoEfectivo" "App that allows you to buy online and pay without a card" "PagoEfectivo"
        openpay = softwareSystem "Openpay" "App that receives payments by sending a link via WhatsApp, social networks or mail. And offers all payment methods" "Openpay"


        # relationships between people and software systems
        pacient -> docMeetSoftware "Schedule appointments with doctors"
        medic -> docMeetSoftware "Treats and prescribes patients"
        administrationUser -> docMeetSoftware "Manages and supports the application"

        # relationships between DocMeet and external software systems
        docMeetSoftware -> googleSignIn "Allows you to create an account."
        docMeetSoftware -> culqi "Register card information, pay and validate payment."
        docMeetSoftware -> gmail "Send notifications"
        docMeetSoftware -> googleCalendar "Modify events on a calendar."
        docMeetSoftware -> peruvianMedicalCollege "Validate doctors"
        docMeetSoftware -> cie10 "Consult codes for consultations"
        docMeetSoftware -> pagoEfectivo "Obtain CIP payment code and validate payment."
        docMeetSoftware -> openpay "Obtain payment link and validate payment made."

        # relationships between people and containers
        pacient -> mobileApp "Schedule appointments with doctors"
        pacient -> webApp "Schedule appointments with doctors"
        medic -> mobileApp "Treats and prescribes patients"
        medic -> webApp "Treats and prescribes patients"
        administrationUser -> webApp "Manages and supports the application"

        # relationships between containers
        mobileApp -> apiGateway "Endpoint call" "JSON / HTTPS"
        webApp -> apiGateway "Endpoint call" "JSON / HTTPS"

        # relationships between apiGateway and BoundedContext
        apiGateway -> menuManagementBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> registerBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> appointmentSearchBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> clientManagementAppointmentBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> medicalManagementAppointmentBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> feeingBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> diagnosticBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> notificationsBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> ratingBC "Endpoint call" "JSON / HTTPS"

        # relationships between BoundedContexts
        menuManagementBC -> appointmentSearchBC "Search for appointments"
        menuManagementBC -> clientManagementAppointmentBC "See, modify or delete appointments"
        appointmentSearchBC -> feeingBC "Method to pay"
        appointmentSearchBC -> medicalManagementAppointmentBC "The doctors receive it"

        # relationships between BoundedContext and Database
        menuManagementBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        registerBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        appointmentSearchBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        clientManagementAppointmentBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        medicalManagementAppointmentBC -> relationalDatabase "Store, get, update and delete record" "JDBC"
        feeingBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        ratingBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        diagnosticBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        notificationsBC -> relationalDatabase "Store, get, update and delete record" "JDBC"

        # relationships between BoundedContext and external software systems
        feeingBC -> culqi "Endpoint call" "JSON / HTTPS"
        feeingBC -> pagoEfectivo "Endpoint call" "JSON / HTTPS"
        feeingBC -> openpay "Endpoint call" "JSON / HTTPS"
        registerBC -> googleSignIn  "Endpoint call" "JSON / HTTPS"
        notificationsBC -> gmail "Endpoint call" "JSON / HTTPS"
        appointmentSearchBC -> googleCalendar "Endpoint call" "JSON / HTTPS"
        diagnosticBC -> cie10 "Endpoint call" "JSON / HTTPS"
        registerBC -> peruvianMedicalCollege "Endpoint call" "JSON / HTTPS"

        # relationships of the Menu Management BoundedContext
        apiGateway -> menuController "Endpoint call" "JSON / HTTPS"
        menuController -> menuService "Methods call" "POO"
        menuService -> pacient1Repository "Methods call" "POO"
        menuService -> appoitment1Repository "Methods call" "POO"
        menuService -> menuRepository "Methods call" "POO"
        pacient1Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        appoitment1Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        menuRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"

        # relationships of the Register BoundedContext
        apiGateway -> registerController "Endpoint call" "JSON / HTTPS"
        registerController -> registerService "Methods call" "POO"
        registerService -> pacient2Repository "Methods call" "POO"
        registerService -> medicRepository "Methods call" "POO"
        registerService -> adminRepository "Methods call" "POO"
        registerService -> googleSignInComponent "Methods call" "POO"
        registerService -> medicalSchoolComponent "Methods call" "POO"
        pacient2Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        medicRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        adminRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        googleSignInComponent -> googleSignIn "Endpoints call" "JSON / XML / HTTPS"
        medicalSchoolComponent -> peruvianMedicalCollege "Endpoints call" "JSON / XML / HTTPS"

        # relationships of the Appointment Search BoundedContext
        apiGateway -> searchController "Endpoint call" "JSON / HTTPS"
        searchController -> searchService "Methods call" "POO"
        searchService -> pacient3Repository "Methods call" "POO"
        searchService -> medic1Repository "Methods call" "POO"
        searchService -> appoitment2Repository "Methods call" "POO"
        searchService -> searchRepository "Methods call" "POO"
        searchService -> googleCalendarComponent "Methods call" "POO"
        searchService -> paymentComponent "Methods call" "POO"
        searchService -> hospitalsRepository "Methods call" "POO"
        searchService -> googleMapsComponent "Methods call" "POO"
        hospitalsRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        pacient3Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        medic1Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        appoitment2Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        searchRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        googleCalendarComponent -> googleCalendar "Endpoints call" "JSON / XML / HTTPS"
        googleMapsComponent -> googleMaps "Endpoints call" "JSON / XML / HTTPS"
        paymentComponent -> feeingBC "Endpoints call" "JSON / XML / HTTPS"

        # relationships of the Client Management Appointment BoundedContext
        apiGateway -> clientManagementController "Endpoint call" "JSON / HTTPS"
        clientManagementController -> clientManagementService "Methods call" "POO"
        clientManagementService -> pacient4Repository "Methods call" "POO"
        clientManagementService -> medic2Repository "Methods call" "POO"
        clientManagementService -> appoitment3Repository "Methods call" "POO"
        clientManagementService -> clientManagementRepository "Methods call" "POO"
        pacient4Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        medic2Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        appoitment3Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        clientManagementRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"

        # relationships of the Medic Management Appointment BoundedContext
        apiGateway -> medicManagementController "Endpoint call" "JSON / HTTPS"
        medicManagementController -> medicManagementService "Methods call" "POO"
        medicManagementService -> pacient5Repository "Methods call" "POO"
        medicManagementService -> medic3Repository "Methods call" "POO"
        medicManagementService -> appoitment4Repository "Methods call" "POO"
        medicManagementService -> medicManagementRepository "Methods call" "POO"
        pacient5Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        medic3Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        appoitment4Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        medicManagementRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"

        # relationships of the feeing BoundedContext
        apiGateway -> feeingController "Endpoint call" "JSON / HTTPS"
        feeingController -> feeingService "Methods call" "POO"
        feeingService -> culqiComponent "Methods call" "POO"
        feeingService -> pagoEfectivoComponent "Methods call" "POO"
        feeingService -> openpayComponent "Methods call" "POO"
        culqiComponent -> culqi "Endpoints call" "JSON / XML / HTTPS"
        pagoEfectivoComponent -> pagoEfectivo "Endpoints call" "JSON / XML / HTTPS"
        openpayComponent -> openpay "Endpoints call" "JSON / XML / HTTPS"

        # relationships of the diagnostic BoundedContext
        apiGateway -> diagnosticController "Endpoint call" "JSON / HTTPS"
        diagnosticController -> diagnosticService "Methods call" "POO"
        diagnosticService -> pacient6Repository "Methods call" "POO"
        diagnosticService -> medic4Repository "Methods call" "POO"
        diagnosticService -> diagnosticRepository "Methods call" "POO"
        diagnosticService -> cie10Component "Methods call" "POO"
        pacient6Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        medic4Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        appoitment6Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        diagnosticRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        cie10Component -> cie10 "Endpoints call" "JSON / XML / HTTPS"

        # relationships of the Rating BoundedContext
        apiGateway -> ratingController "Endpoint call" "JSON / HTTPS"
        ratingController -> ratingService "Methods call" "POO"
        ratingService -> pacient8Repository "Methods call" "POO"
        ratingService -> medic5Repository "Methods call" "POO"
        ratingService -> ratingRepository "Methods call" "POO"
        pacient8Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        medic5Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        ratingRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"

        # relationships of the Notifications BoundedContext
        apiGateway -> notificationsController "Endpoint call" "JSON / HTTPS"
        notificationsController -> notificationsService "Methods call" "POO"
        notificationsService -> pacient7Repository "Methods call" "POO"
        notificationsService -> notificationsRepository "Methods call" "POO"
        notificationsService -> appoitment5Repository "Methods call" "POO"
        notificationsService -> gmailComponent "Methods call" "POO"
        pacient7Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        notificationsRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        appoitment5Repository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        gmailComponent -> gmail "Endpoints call" "JSON / XML / HTTPS"
    }
    views {
        systemContext docMeetSoftware "SystemContext" {
            include *
            autoLayout
        }
        container docMeetSoftware "Containers" {
            include *
            autoLayout
        }
        component menuManagementBC "MenuManagementBC" {
            include *
            autoLayout
        }
        component registerBC "RegisterBC" {
            include *
            autoLayout
        }
        component diagnosticBC "DiagnosticBC" {
            include *
            autoLayout
        }
        component notificationsBC "NotificationsBC" {
            include *
            autoLayout
        }
        component appointmentSearchBC "AppointmentSearchBC" {
            include *
            autoLayout
        }
        component clientManagementAppointmentBC "ClientManagementAppointmentSearchBC" {
            include *
            autoLayout
        }
        component medicalManagementAppointmentBC "MedicalManagementAppointmentSearchBC" {
            include *
            autoLayout
        }
        component feeingBC "FeeingBC" {
            include *
            autoLayout
        }
        component ratingBC "RatingBC" {
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
            element "Component" {
                color #ffffff
                background #F2A35E
                fontSize 22
                shape Pipe
            }
            element "Pacient" {
                background #042940
            }
            element "Medic" {
                background #9FC131
            }
            element "AdministrationUser" {
                background #D6D58E
                shape Robot
            }
            element "DocMeetSoftware" {
                background #005C53
                shape Ellipse
            }
            element "CIE10" {
                background #8ABF54
            }
            element "PeruvianMedicalCollege" {
                background #A6A04B
            }
            element "Gmail" {
                background #FF5A33
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
                background #F2CB05
                color #ffffff
                shape Component
            }
            element "PagoEfectivo" {
                background #ffcc00
                color #000000
            }
            element "Openpay" {
                background #5DA684
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #F29F05
                color #ffffff
            }
            element "RepositoryDependency" {
                background #999999
            }
            element "MobileApp" {
                background #A3AFBF
                shape MobileDevicePortrait
            }
            element "WebApp" {
                background #A3AFBF
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
            element "MenuController" {
                background #D97971
                shape RoundedBox
            }
            element "RegisterController" {
                background #D97971
                shape RoundedBox
            }
            element "SearchController" {
                background #D97971
                shape RoundedBox
            }
            element "ClientManagementController" {
                background #D97971
                shape RoundedBox
            }
            element "MedicManagementController" {
                background #D97971
                shape RoundedBox
            }
            element "FeeingController" {
                background #D97971
                shape RoundedBox
            }
            element "DiagnosticController" {
                background #D97971
                shape RoundedBox
            }
            element "NotificationsController" {
                background #D97971
                shape RoundedBox
            }
            element "RatingController" {
                background #D97971
                shape RoundedBox
            }
            element "MenuService" {
                background #1BA6A6
                shape Diamond
            }
            element "RegisterService" {
                background #1BA6A6
                shape Diamond
            }
            element "SearchService" {
                background #1BA6A6
                shape Diamond
            }
            element "ClientManagementService" {
                background #1BA6A6
                shape Diamond
            }
            element "MedicManagementService" {
                background #1BA6A6
                shape Diamond
            }
            element "FeeingService" {
                background #1BA6A6
                shape Diamond
            }
            element "DiagnosticService" {
                background #1BA6A6
                shape Diamond
            }
            element "NotificationsService" {
                background #1BA6A6
                shape Diamond
            }
            element "RatingService" {
                background #1BA6A6
                shape Diamond
            }
        }
    }


}
