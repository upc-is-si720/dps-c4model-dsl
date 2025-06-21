workspace "CliSync" "CMR inmoviliario" {

    model {
        // Person
        client = person "Client" "Persona en el mercado inmobiliario" "Client"
        realEstateAgent = person "Real Estate Agent" "Profesional del sector inmoviliario" "RealEstateAgent"
        manager = person "Manager" "Gerente de la inmoviliaria" "Manager"
        
        // SoftwareSystem
        cliSync = softwareSystem "CliSync" "Software CMR para la recopilacion de datos Inmoviliarios" "CliSync" {
            webApp = container "Web Application" "Single Page Application" "Next.js v15.0.2 / Typescript v5.6.3" "WebApp"
            
            // API Gateway
            apiGateway = container "API Gateway" "Contorlador de trafico de solicitudes API entrantes del backend" "Amazon API Gateway" "APIGateway"
            
            // Bounded Context
            // Customer info BC
            customerInfoBC = container "Handling and Processing Customer Information Bounded Context" "BC que permite registra, modificar, eliminar y exportar informacion del cliente" "Node.js v22.11.0 LTS" "CustomerInfoBC, BoundedContext" {
                clientController = component "Client Controller" "RESTful API Controller class del Client" "Class / Node.js / ECMAScript v2024" "ClientController, Controller"
                interactionController = component "Interaction Controller" "RESTful API Controller class del Interaction" "Class / Node.js / ECMAScript v2024" "InteractionController, Controller"
                group "Client" {
                    clientRepository = component "Client Repository" "Repository Interface de Client" "Interface / Node.js / ECMAScript v2024" "ClientRepository,Repository"
                    clientQuery = component "Client Query" "Query for read Client" "Record" "ClientQuery, Query"
                    clientCommand = component "Client Command" "Command for create, update and delete Client" "Record" "ClientCommand, Command"
                    clientCommandService = component "Client CommandService" "Business Logic del Command de Client" "Class / Node.js / ECMAScript v2024" "ClientCommandService,Service"
                    clientQueryService = component "Client QueryService" "Business Logic del query de Client" "Class / Node.js / ECMAScript v2024" "ClientQueryService,Service"
                }
                group "Interaction" {
                    interactionRepository = component "Interaction Repository" "Repository Interface de Interaction" "Interface / Node.js / ECMAScript v2024" "InteractionRepository,Repository"
                    interactionQuery = component "Interaction Query" "Query for read Interaction" "Record" "InteractionQuery, Query"
                    interactionCommand = component "Interaction Command" "Command for create, update and delete Interaction" "Record" "InteractionCommand, Command"
                    interactionCommandService = component "Interaction CommandService" "Business Logic del Command de Interaction" "Class / Node.js / ECMAScript v2024" "InteractionCommandService,Service"
                    interactionQueryService = component "Interaction QueryService" "Business Logic del query de Interaction" "Class / Node.js / ECMAScript v2024" "InteractionQueryService,Service"
                }
                group "Segment" {
                    segmentQuery = component "Segment Query" "Query for read Segment" "Record" "SegmentQuery, Query"
                    segmentCommand = component "Segment Command" "Command for create, update and delete Segment" "Record" "SegmentCommand, Command"
                }
                group "Date" {
                    dateQuery = component "Date Query" "Query for read Date" "Record" "DateQuery, Query"
                    dateCommand = component "Date Command" "Command for create, update and delete Date" "Record" "DateCommand, Command"
                }
                group "outboundservices"{
                    mailChimpExternalService = component "MailChimp Api ExternalService" "External Business Logic de Mail" "Class / Express.js / ECMAScript v2024" "MailChimpExternalService,ExternalService"

                }
                group "inboundservices" {
                    clientContextFacade = component "Client ContextFacade" "Facade Business Logic de Client" "Class / Express.js / ECMAScript v2024" "ClientFacade,ContextFacade"
                }
            }
            
            // Property Management BC
            propertyManagementBC = container "Property Manangement Bounded Context" "BC que permite registrar, modificar y eliminar informacion de las propiedades" "Node.js v22.11.0 LTS" "PropertyManageBC, BoundedContext" {
                gestionPropiedadesController = component "GestionPropiedades Controller" "RESTful API Controller class del GestionPropiedades" "Class / Node.js / ECMAScript v2024" "GestionPropiedadesController, Controller"
                group "gestionPropiedades" {
                    gestionPropiedadesRepository = component "GestionPropiedades Repository" "Repository Interface de GestionPropiedades" "Interface / Node.js / ECMAScript v2024" "GestionPropiedadesRepository,Repository"
                    gestionPropiedadesQuery = component "GestionPropiedades Query" "Query for read GestionPropiedades" "Record" "GestionClientesQuery, Query"
                    gestionPropiedadesCommand = component "GestionPropiedades Command" "Command for create, update and delete GestionPropiedades" "Record" "GestionPropiedadesCommand, Command"
                    gestionPropiedadesCommandService = component "GestionPropiedades CommandService" "Business Logic del Command de GestionPropiedades" "Class / Node.js / ECMAScript v2024" "GestionPropiedadesCommandService,Service"
                    gestionPropiedadesQueryService = component "GestionPropiedades QueryService" "Business Logic del query de GestionPropiedades" "Class / Node.js / ECMAScript v2024" "GestionPropiedadesQueryService,Service"
                }
                group "property" {
                    propertyQuery = component "Property Query" "Query for read Property" "Record" "PropertyQuery, Query"
                }
                group "outboundservices"{
                    salesManagementExternalService = component "Sales Manangement  ExternalService" "External Business Logic de Sales Manangement" "Class / Node.js / ECMAScript v2024" "SalesManangementExternalService,ExternalService"
                }
                group "inboundservices" {
                    gestionPropiedadesContextFacade = component "GestionPropiedades ContextFacade" "Facade Business Logic de Gestion de Propiedades" "Class / Express.js / ECMAScript v2024" "GestionPropiedadesFacade,ContextFacade"
                }
            }
            
            // sales Management BC
            salesManagementBC = container "Sales Manangement Bounded Context" "BC que permite registrar, modificar y eliminar informacion de las ventas" "Node.js v22.11.0 LTS" "SalesManageBC, BoundedContext" {
                bookingController = component "Booking Controller" "RESTful API Controller class del Booking" "Class / Node.js / ECMAScript v2024" "BookingController, Controller"
                paymentbookingController = component "PaymentBooking Controller" "RESTful API Controller class del PaymentBooking" "Class / Node.js / ECMAScript v2024" "PaymentBookingController, Controller"
                group "Booking" {
                    bookingRepository = component "Booking Repository" "Repository Interface de Booking" "Interface / Node.js / ECMAScript v2024" "BookingRepository,Repository"
                    bookingQuery = component "Booking Query" "Query for read Booking" "Record" "BookingQuery, Query"
                    bookingCommand = component "Booking Command" "Command for create, update and delete Booking" "Record" "BookingCommand, Command"
                    bookingCommandService = component "Booking CommandService" "Business Logic del Command de Booking" "Class / Node.js / ECMAScript v2024" "BookingCommandService,Service"
                    bookingQueryService = component "Booking QueryService" "Business Logic del query de Booking" "Class / Node.js / ECMAScript v2024" "BookingQueryService,Service"
                }
                group "PaymentBooking" {
                    paymentBookingRepository = component "PaymentBooking Repository" "Repository Interface de PaymentBooking" "Interface / Node.js / ECMAScript v2024" "PaymentBookingRepository,Repository"
                    paymentBookingQuery = component "PaymentBooking Query" "Query for read PaymentBooking" "Record" "PaymentBookingQuery, Query"
                    paymentBookingCommand = component "PaymentBooking Command" "Command for create, update and delete PaymentBooking" "Record" "PaymentBookingCommand, Command"
                    paymentBookingCommandService = component "PaymentBooking CommandService" "Business Logic del Command de PaymentBooking" "Class / Node.js / ECMAScript v2024" "PaymentBookingCommandService,Service"
                    paymentBookingQueryService = component "PaymentBooking QueryService" "Business Logic del query de PaymentBooking" "Class / Node.js / ECMAScript v2024" "PaymentBookingQueryService,Service"
                }
                group "Payment" {
                    paymentQuery = component "Payment Query" "Query for read Payment" "Record" "PaymentQuery, Query"
                    paymentCommand = component "Payment Command" "Command for create, update and delete Payment" "Record" "PaymentCommand, Command"
                }
                group "outboundservices"{
                    clientManagmentExternalService = component "Client Managment ExternalService" "External Business Logic de Client Managment" "Class / Node.js / ECMAScript v2024" "ReportAndAnalysisExternalService,ExternalService"
                    gestionPropiedadesExternalService = component "Property Manangement ExternalService" "External Business Logic de Property Manangement" "Class / Node.js / ECMAScript v2024" "ReportAndAnalysisExternalService,ExternalService"
                }
                group "inboundservices" {
                    salesManagementContextFacade = component "SalesManagement ContextFacade" "Facade Business Logic de Sales Management" "Class / Express.js / ECMAScript v2024" "GestionPropiedadesFacade,ContextFacade"
                }
            }
            
            // report Analysis BC
            reportAndAnalysisBC = container "Report and analysis Bounded Context" "BC que permite generar reporte de ventas" "Node.js v22.11.0 LTS" "ReportAndAnalysisBC, BoundedContext" {
                reportController = component "Report Controller" "RESTful API Controller class del Report" "Class / Node.js / ECMAScript v2024" "ReportController, Controller"
                analysisController = component "Analysis Controller" "RESTful API Controller class del Analysis" "Class / Node.js / ECMAScript v2024" "AnalysisController, Controller"
                group "Report" {
                    reportRepository = component "Report Repository" "Repository Interface de Report" "Interface / Node.js / ECMAScript v2024" "ReportRepository,Repository"
                    reportQuery = component "Report Query" "Query for read Report" "Record" "ReportQuery, Query"
                    reportCommand = component "Report Command" "Command for create, update and delete Report" "Record" "ReportCommand, Command"
                    reportCommandService = component "Report CommandService" "Business Logic del Command de Report" "Class / Node.js / ECMAScript v2024" "ReportCommandService,Service"
                    reportQueryService = component "Report QueryService" "Business Logic del query de Report" "Class / Node.js / ECMAScript v2024" "ReportQueryService,Service"
                }
                group "Analysis" {
                    analysisRepository = component "Analysis Repository" "Repository Interface de Analysis" "Interface / Node.js / ECMAScript v2024" "AnalysisRepository,Repository"
                    analysisQuery = component "Analysis Query" "Query for read Analysis" "Record" "AnalysisQuery, Query"
                    analysisCommand = component "v Command" "Command for create, update and delete Analysis" "Record" "AnalysisCommand, Command"
                    analysisCommandService = component "Analysis CommandService" "Business Logic del Command de Analysis" "Class / Node.js / ECMAScript v2024" "AnalysisCommandService,Service"
                    analysisQueryService = component "Analysis QueryService" "Business Logic del query de Analysis" "Class / Node.js / ECMAScript v2024" "AnalysisQueryService,Service"
                }
                
                group "Archivo" {
                    fileQuery = component "File Query" "Query for read file type" "Record" "FileQuery, Query"
                    fileCommand = component "File Command" "Command for create, update and delete File" "Record" "FileCommand, Command"
                }
                group "outboundservices"{
                    salesManagmentExternalService = component "Sales Managment ExternalService" "External Business Logic de Client Managment" "Class / Node.js / ECMAScript v2024" "ReportAndAnalysisExternalService,ExternalService"
                }
            }
            
            // Database
            group "Data Bases" {
                customerInfoDB = container "Handling and Processing Customer Information DataBase" "Store customer information" "MySQL v8.0" "CustomerInfoDB, DataBase"
                
                propertyManagementDB = container "Property Manangement DataBase" "Store properties information" "MySQL v8.0" "CustomerInfoDB, DataBase"
            
                salesManagementDB = container "Sales Manangement DataBase" "Store sales information" "MySQL v8.0" "CustomerInfoDB, DataBase"
            
                reportAndAnalysisDB = container "Report and analysis DataBase" "Store reports information" "MySQL v8.0" "CustomerInfoDB, DataBase"
            }
            
        }
        
        // External System
        googleMaps = softwareSystem "Google Maps" "Places API" "GoogleMaps, ExternalSystem"
        mailchimp = softwareSystem "Mailchimp" "Email marketing platform" "Mailchimp, ExternalSystem"
        
        // Relationship for System Context
        client -> cliSync "Compra o cotiza inmuebles"
        realEstateAgent -> cliSync "Registro informacion cliente"
        realEstateAgent -> cliSync "Registro de venta de inmueble"
        realEstateAgent -> cliSync "Registro Propiedad"
        manager -> cliSync "Solicita reporte de ventas"
        
        cliSync -> googleMaps "Query de datos de ubicacion introducida"
        googleMaps -> cliSync "Response de datos de la ubicacion"
        cliSync -> mailchimp "Enviar notificacion mail"
        
        // Relationships container
        client -> webApp "Register client information"
        realEstateAgent -> webApp "Register client information"
        
        webApp -> googleMaps "Request data Location"
        googleMaps -> webApp "Response location data"
        
        webApp -> apiGateway "API / HTTP Request"
        
        // Relationship container API with BC
        apiGateway -> customerInfoBC "Endpoint Request" "HTTPS / JSON"
        apiGateway -> propertyManagementBC "Endpoint Request" "HTTPS / JSON"
        apiGateway -> salesManagementBC "Endpoint Request" "HTTPS / JSON"
        apiGateway -> reportAndAnalysisBC "Endpoint Request" "HTTPS / JSON"
        
        // Relationship containers BC to BC
        customerInfoBC -> salesManagementBC "Asignar cliente a reserva"
        propertyManagementBC -> salesManagementBC "Asignar propiedad a reserva"
        salesManagementBC -> reportAndAnalysisBC "Generar reporte"
        
        
        // Relationship containers BC with DB
        customerInfoBC -> customerInfoDB "Store and Recover Data" "SQL Commands"
        propertyManagementBC -> propertyManagementDB "Store and Recover Data" "SQL Commands"
        salesManagementBC -> salesManagementDB "Store and Recover Data" "SQL Commands"
        reportAndAnalysisBC -> reportAndAnalysisDB "Store and Recover Data" "SQL Commands"
        
        // Relationship containers BC with Mail Service
        customerInfoBC -> mailchimp "Send Email notification"
        propertyManagementBC -> mailchimp "Send Email notification"
        salesManagementBC -> mailchimp "Send Email notification"
        reportAndAnalysisBC -> mailchimp "Send Email notification"
        // End Relationship containers
        
        //Relationships GestionClientes Bounded Context

        apiGateway -> clientController "Request GET del endpoint de Client"
        apiGateway -> interactionController "Request GET del endpoint de Interaction"

        clientController -> clientQueryService "Call service method"
        clientController -> clientCommandService "Call service method"
        
        interactionController -> interactionQueryService "Call service method"
        interactionController -> interactionCommandService "Call service method"

        clientQueryService -> clientQuery "Handle query"
        clientQueryService -> clientRepository "Call repository method"
        clientQueryService -> segmentQuery "Handle query"

        clientContextFacade -> clientCommandService "Call service method"
        clientCommandService -> clientCommand "Handle command"
        clientCommandService -> clientRepository "Call repository method"
        clientCommandService -> segmentCommand "Handle command"
        clientCommandService -> mailChimpExternalService "Call external service method"

        
        interactionQueryService -> interactionQuery "Handle query"
        interactionQueryService -> interactionRepository "Call repository method"
        interactionQueryService -> dateQuery "Handle query"


        interactionCommandService -> interactionCommand "Handle command"
        interactionCommandService -> interactionRepository "Call repository method"
        interactionCommandService -> dateCommand "Handle command"
        
        // Relationship between Client that call Interaction
        clientCommandService -> interactionQueryService "Handle query"

        clientRepository -> customerInfoDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"
        interactionRepository -> customerInfoDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"
        mailChimpExternalService -> mailchimp "Send notification email"
        
        
        //Relationships GestionPropiedades Bounded Context
        apiGateway -> gestionPropiedadesController "Request GET del endpoint de Gestion clientes"

        gestionPropiedadesController -> gestionPropiedadesQueryService "Call service method"
        gestionPropiedadesController -> gestionPropiedadesCommandService "Call service method"

        gestionPropiedadesQueryService -> gestionPropiedadesQuery "Handle query"
        gestionPropiedadesQueryService -> gestionPropiedadesRepository "Call repository method"
        gestionPropiedadesQueryService -> propertyQuery "Handle query"

        gestionPropiedadesCommandService -> gestionPropiedadesCommand "Handle command"
        gestionPropiedadesCommandService -> gestionPropiedadesRepository "Call repository method"
        gestionPropiedadesCommandService -> salesManagementExternalService "Call external service method"

        gestionPropiedadesRepository -> propertyManagementDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"

        gestionPropiedadesContextFacade -> gestionPropiedadesCommandService "Call service method"
        
        //Relationships Sales Manangement Bounded Context
        apiGateway -> paymentbookingController "Request GET del endpoint de PaymentBooking"
        apiGateway -> bookingController "Request GET del endpoint Booking"
        
        paymentbookingController -> paymentbookingQueryService "Call service method"
        paymentbookingController -> paymentbookingCommandService "Call service method"

        paymentbookingQueryService -> paymentbookingQuery "Handle query"
        paymentbookingQueryService -> paymentbookingRepository "Call repository method"
        paymentbookingQueryService -> paymentQuery "Handle query"

        salesManagementContextFacade -> paymentbookingCommandService "Call service method"
        paymentbookingCommandService -> paymentbookingCommand "Handle command"
        paymentbookingCommandService -> paymentbookingRepository "Call repository method"
        paymentbookingCommandService -> paymentCommand "Handle command"

        bookingController -> bookingQueryService "Call service method"
        bookingController -> bookingCommandService "Call service method"

        bookingQueryService -> bookingQuery "Handle query"
        bookingQueryService -> bookingRepository "Call repository method"

        bookingCommandService -> bookingCommand "Handle command"
        bookingCommandService -> bookingRepository "Call repository method"
        bookingCommandService -> clientManagmentExternalService "Call external service method"
        bookingCommandService -> gestionPropiedadesExternalService "Call external service method"
        
        paymentbookingCommandService -> bookingQueryService "Handle query"

        bookingRepository -> salesManagementDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"
        paymentbookingRepository -> salesManagementDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"
        
        clientManagmentExternalService -> clientContextFacade "Relacionar cliente con propiedad"
        gestionPropiedadesExternalService -> gestionPropiedadesContextFacade "Call service method"
        
        //Relationships Report Analysis  Bounded Context
        apiGateway -> reportController "Request GET del endpoint de Report"
        apiGateway -> analysisController "Request GET del endpoint de Analysis"


        reportController -> reportQueryService "Call service method"
        reportController -> reportCommandService "Call service method"

        reportQueryService -> reportQuery "Handle query"
        reportQueryService -> reportRepository "Call repository method"
        reportQueryService -> fileQuery "Handle query"

        reportCommandService -> reportCommand "Handle command"
        reportCommandService -> reportRepository "Call repository method"
        reportCommandService -> salesManagmentExternalService "Call external service method"
        reportCommandService -> fileCommand "Handle command"
        
        
        analysisController -> analysisQueryService "Call service method"
        analysisController -> analysisCommandService "Call service method"

        analysisQueryService -> analysisQuery "Handle query"
        analysisQueryService -> analysisRepository "Call repository method"

        analysisCommandService -> analysisCommand "Handle command"
        analysisCommandService -> analysisRepository "Call repository method"
        
        reportCommandService -> analysisQueryService "Handle query"

        
        
        reportRepository -> reportAndAnalysisDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"
        analysisRepository -> reportAndAnalysisDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"
        
        salesManagmentExternalService -> salesManagementContextFacade "Relacionar cliente con propiedad"

    }
    
    views {
        systemContext cliSync "CliSyncSystemContext" "Sistema CMR para la recopilacion de datos Inmoviliarios" {
            include *
            autolayout
        }
        container cliSync "ClisyncContainer" "Container del Sistema CMR" {
            include *
            autolayout
        }
        component customerInfoBC "CustomerInfoComponent" "Diagrama de Componentes Customer Information BC" {
            include *
            autoLayout tb
        }
        component propertyManagementBC "PropertyManagementBC" "Diagrama de Componentes de Property Management BC" {
            include *
            autoLayout tb
        }
        component salesManagementBC "SalesManagementBC" "Diagrama de Componentes de Sales Management BC" {
            include *
            autoLayout tb
        }
        component reportAndAnalysisBC "ReportAndAnalysisBC" "Diagrama de Componentes de Report And Analysis BC" {
            include *
            autoLayout tb
        }
        styles {
            element "Person" {
                shape Person
                background #5F04B4
                color #FFFFFF
            }
            element "Container" {
                background #002A8D
                color #FFFFFF
            }
            element "ExternalSystem" {
                background #FABB32
            }
            element "BoundedContext" {
                shape Component
            }

            element "WebApp" {
                shape WebBrowser
                background #2067F5
                color #FFFFFF
            }

            element "ApiGateway" {
                shape Pipe
                background #884A39
            }
            element "Database" {
                shape Cylinder
                background #CF0A0A
            }
            element "Service" {
                shape Hexagon
                background #169923
                color #FFFFFF
            }
            element "Repository" {
                shape Diamond
                background #F0EB0A
            }
            element "Command" {
                shape Circle
                background #C22777
                color #FFFFFF
            }
            element "Query" {
                shape Ellipse
                background #42B8C2
                color #FFFFFF
            }
            element "Controller" {
                shape RoundedBox
                background #1D75F0
                color #FFFFFF
            }
            element "ExternalService" {
                shape Folder
                background #785ba1
                color #FFFFFF
            }
            element "ContextFacade" {
                shape Folder
                background #9710b1
                color #FFFFFF
            }
            element "Container" {
                shape Hexagon
                background #805B17
                color #FFFFFF
            }
            element "Group" {
                color #9a0000
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}