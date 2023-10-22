workspace "Clinica" "This is a Diagram of Clinica" {

    model {
        # Person
        clinica = person "Clinica" "Establecimiento que atiende a los pacientes que requiere ampliar su alcance de atencion" "Clinica"
        consultorio = person "Consultorio Medico" "Establecimiento donde acuden las consultas de los pacientes y que requiere ampliar su alcance de atencion" "Consultorio"
        farmacia = person "Farmacia" "Establecimiento donde venden medicamentos recetados por el medico." "Farmacia"
        paciente = person "Paciente" "Persona que sera atendida por el doctor de entre 20 a 45 años" "Paciente"
        administrador = person "Administrador" "Persona que brindara soporte y mantenimiento a la aplicacion" "Administrador"

        medicalAppSoftware = softwareSystem "Medical-App" "Aplicacion para pacientes que quiera contactar o realizar una cita con algun medico." "Medical-AppSoftware" {
            mobileApp = container "Mobile App" "Provides a set of the Internet functionality to patients via their mobile device." "Flutter" "MobileApp"

            apiGateway = container "API Gateway" "Component that sits between clients and services and provides centralized handling of API communication between them" "Spring Cloud Gateway" "ApiGateway"
            paymentBC = container "Payment Bounded Context" "Api RESTful of payment" "Java v20 / Spring v3" "PaymentBC,BoundedContext"{
                paymentController = component "Payment Controller" "[Component: Java v20 / Spring Web]"
                paymentService = component "Payment Service" "[Component: Java v20 / Spring Web]"
                pacienteRepository4 = component "Paciente Repository" "[Component: Java v20 / Spring Web]"
                farmaciaRepository2 = component "Farmacia Repository" "[Component: Java v20 / Spring Web]"
            }
            identityAccessBC = container "Identity and Access Bounded Context" "Api RESTful of Identity and Access Management" "Java v20 / Spring v3" "IdentityAccessBC,BoundedContext"{
                accessController = component "Acces Controller" "[Component: Java v20 / Spring Web]"
                loginService = component "Login Service" "[Component: Java v20 / Spring Web]"
                pacienteRepository = component "Paciente Repository" "[Component: Java v20 / Spring Web]"
                administradorRepository = component "Administrador Repository" "[Component: Java v20 / Spring Web]"
            }
            locationBC = container "Location Bounded Context" "Api RESTful of Location" "Java v20 / Spring v3" "LocationBC,BoundedContext" {
                locationController = component "Location Controller" "REST Controller class of Location" "Java v20 / Spring Web" "LocationController"
                locationService = component "Location Service" "Busines Logic class for Location Service" "Java v20 / Spring Data" "LocationService"
                pacienteRepository2 = component "Paciente Repository" "Repository Interface for Paciente Entity" "Java v20 / Spring Data" "PacienteRepository"
                clinicaRepository = component "Clinica Repository" "Repository Interface for Clinica Entity" "Java v20 / Spring Data" "ClinicaRepository"
                consultorioRepository = component "Consultorio Repository" "Repository Interface for Consultorio Entity" "Java v20 / Spring Data" "ConsultorioRepository"
                farmaciaRepository = component "Farmacia Repository" "Repository Interface for Farmacia Entity" "Java v20 / Spring Data" "FarmaciaRepository"
                googleMapComponent = component "Google Map Component" "Component to connect with the GoogleMap API" "Java v20 / Spring v3" "GoogleMapComponent"
            }
            searchSelectBC = container "Search and Select Bounded Context" "Api RESTful of Search and select a doctor" "Java v20 / Spring v3" "searchSelectBC,BoundedContext"{
                searchController = component "Search and Select Controller" "REST Controller class of Search and Select" "Java v20 / Spring Web" "SearchandSelectController"
                filterService = component "Filter Service" "Busines Logic class for Filter Service" "Java v20 / Spring Data" "FilterService"
                doctorRepository = component "Doctor Repository" "[Component: Java v20 / Spring Web]"
            }
            calendarBC = container "Calendar Tool Bounded Context" "Api RESTful of Calendar" "Java v20 / Spring v3" "calendarBC,BoundedContext"{
                calendarController = component "Calendar Controller" "REST Controller class of Real Time Calendar" "Java v20 / Spring Web" "CalendarController"
                calendarService = component "Calendar Service" "Busines Logic class for Calendar Service" "Java v20 / Spring Data" "CalendarService"
                pacienteRepository3 = component "Paciente Repository" "[Component: Java v20 / Spring Web]"
                agendaHeaderRepository = component "Agenda Header Repository" "[Component: Java v20 / Spring Web]"
                agendaDetailsRepository = component "Agenda Details Repository" "[Component: Java v20 / Spring Web]"
                citaRepository = component "Cita Repository" "[Component: Java v20 / Spring Web]"
            }
            videoCallBC = container "Video Call Bounded Context" "Api RESTful of Video Call" "Java v20 / Spring v3" "videoCallBC,BoundedContext"{
                videoCallController = component "Video Call Controller" "REST Controller class of Real Time Video Call" "Java v20 / Spring Web" "VideoCallController"
                videoCallService = component "Video Call Service" "Busines Logic class for Video Call Service" "Java v20 / Spring Data" "VideoCallService"
                pacienteRepository5 = component "Paciente Repository" "[Component: Java v20 / Spring Web]"
                clinicaRepository2 = component "Clinica Repository" "[Component: Java v20 / Spring Web]"
            }
            relationalDatabase = container "Relational Database" "Stores and update information, hashed authentication credentials, access logs, etc." "Mongo DB" "RelationalDatabase"
        }

        # External Software System
        visa = softwareSystem "Visa" "Sistema de sevicio de medios de Pago." "Visa"
        googleMaps = softwareSystem "Google Maps" "Is a web mapping platform and It offers satellite imagery, aerial photography and street maps" "Google Maps"
        payoneer = softwareSystem "Payoneer" "Plataforma de pagos transfronterizos para las empresas" "Payoneer"
        microsoftTeams = softwareSystem "Microsoft Teams" "Plataforma de comunicacion para realizar conversaciones por chat o video llamada." "Microsoft Teams"
        paypal = softwareSystem "Paypal" "Aplicacion que permite realizar transacciones electronicas" "Paypal"

        # relationships between people and software systems
        paciente -> medicalAppSoftware "Busca y encuentra doctores para que lo atiendan"
        farmacia -> medicalAppSoftware "Ofrece los medicamentos a los pacientes"
        consultorio -> medicalAppSoftware "Atiende a los problemas o dudas de salud de los pacientes"
        clinica -> medicalAppSoftware "Brinda opciones de solucion a sus pacientes mediante la app"
        administrador -> medicalAppSoftware "Manages and supports the application"

        # relationships between Falabella and external software systems
        medicalAppSoftware -> visa "Ofrece medios de pago internacional a los pacientes."
        medicalAppSoftware -> googleMaps "Obtiene la ubicacion de las clinicas, farmacias y consultorios"
        medicalAppSoftware -> payoneer "Ofrece medios de pagos transfonterizos para las empresas."
        medicalAppSoftware -> microsoftTeams "Ofrece videollamadas a los pacientes para que se contacten con el medico elegido."
        medicalAppSoftware -> paypal "Ofrece medios de pago para realizar transacciones electronicas."

        // relationships between people and containers
        paciente -> mobileApp "Busca y encuentra doctores para que lo atiendan"
        farmacia -> mobileApp "Ofrece los medicamentos a los pacientes"
        consultorio -> mobileApp "Atiende a los problemas o dudas de salud de los pacientes"
        clinica -> mobileApp "Brinda opciones de solucion a sus pacientes mediante la app"
        administrador -> mobileApp "Manages and supports the application"

        # relationships between containers
        mobileApp -> apiGateway "Endpoint call" "JSON / HTTPS"

        # relationships between apiGateway and BoundedContext
        apiGateway -> paymentBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> identityAccessBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> locationBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> searchSelectBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> calendarBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> videoCallBC "Endpoint call" "JSON / HTTPS"

        # relationships between BoundedContext and Database
        paymentBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        identityAccessBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        locationBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        searchSelectBC -> relationalDatabase "Store, get, update and delete record" "JDBC"
        calendarBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        videoCallBC ->  relationalDatabase "Store, get, update and delete record" "JDBC"
        # relationships between BoundedContext and external software systems
        paymentBC -> paypal "Endpoint call" "JSON / HTTPS"
        paymentBC -> payoneer "Endpoint call" "JSON / HTTPS"
        paymentBC -> visa "Endpoint call" "JSON / HTTPS"
        videoCallBC -> microsoftTeams "Endpoint call" "JSON / HTTPS"
        locationBC -> googleMaps "Endpoint call" "JSON / HTTPS"
        # relationships of the Delivery BoundedContext
        apiGateway -> locationController "Endpoint call" "JSON / HTTPS"
        locationController -> locationService "Methods call" "POO"
        locationService -> pacienteRepository2 "Methods call" "POO"
        locationService -> clinicaRepository "Methods call" "POO"
        locationService -> farmaciaRepository "Methods call" "POO"
        locationService -> consultorioRepository "Methods call" "POO"
        locationService -> googleMapComponent "Methods call" "POO"
        pacienteRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        clinicaRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        farmaciaRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        consultorioRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        googleMapComponent -> googleMaps "Endpoints call" "JSON / XML / HTTPS"
        # relationships of the Delivery BoundedContext
        apiGateway -> accessController "Endpoint call" "JSON / HTTPS"
        accessController -> loginService "Methods call" "POO"
        loginService -> pacienteRepository "Methods call" "POO"
        loginService -> administradorRepository "Methods call" "POO"
        pacienteRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        administradorRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        # relationships of the Delivery BoundedContext
        apiGateway -> searchController "Endpoint call" "JSON / HTTPS"
        searchController -> filterService "Methods call" "POO"
        filterService -> doctorRepository "Methods call" "POO"
        doctorRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        # relationships of the Delivery BoundedContext

        apiGateway -> calendarController "Endpoint call" "JSON / HTTPS"
        calendarController -> calendarService "Methods call" "POO"
        calendarService -> pacienteRepository3 "Methods call" "POO"
        calendarService -> agendaHeaderRepository "Methods call" "POO"
        calendarService -> agendaDetailsRepository "Methods call" "POO"
        calendarService -> citaRepository "Methods call" "POO"
        pacienteRepository3 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        agendaHeaderRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        agendaDetailsRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        citaRepository -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        # relationships of the Delivery BoundedContext
        apiGateway -> paymentController "Endpoint call" "JSON / HTTPS"
        paymentController -> paymentService "Methods call" "POO"
        paymentService -> pacienteRepository4 "Methods call" "POO"
        paymentService -> farmaciaRepository2 "Methods call" "POO"
        pacienteRepository4 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        farmaciaRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        paymentService -> visa "Store, get, update and delete record" "JDBC/SQL Transactional"
        paymentService -> paypal "Store, get, update and delete record" "JDBC/SQL Transactional"
        paymentService -> payoneer "Store, get, update and delete record" "JDBC/SQL Transactional"
        # relationships of the Delivery BoundedContext
        apiGateway -> videoCallController "Endpoint call" "JSON / HTTPS"
        videoCallController -> videoCallService "Methods call" "POO"
        videoCallService -> pacienteRepository5 "Methods call" "POO"
        videoCallService -> clinicaRepository2 "Methods call" "POO"
        pacienteRepository5 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        clinicaRepository2 -> relationalDatabase "Store, get, update and delete record" "JDBC/SQL Transactional"
        videoCallService -> microsoftTeams "Store, get, update and delete record" "JDBC/SQL Transactional"
    }
    views {
        systemContext medicalAppSoftware "SystemContext" {
            include *
            autoLayout
        }
        container medicalAppSoftware "Containers" {
            include *
            autoLayout
        }
        component locationBC "DeliveryBC" {
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
        component videoCallBC "videoCallBC" {
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