workspace "DevTasker" "Sistema de Gestión de Proyectos" {
    model {
        #person
        leader = person "Lider" "Person who leads the group" "Leader"
        member = person "Integrante" "Person who belongs to the group" "Member"
        #software
        devTasker = softwareSystem "DevTasker" "Software que permite a grupos gestionar proyectos" "DevTasker" {
            webApp = container "Web Application" "Front de la Web" "React.js v8.1" "WebApplication"
            mobileApp = container "Mobile Application" "App DevTasker" "Android / Java v22" "MobileApp"
            apiGateway = container "Api Gateway" "Manager que acepta todas las llamadas API" "Amazon API Gateway" "ApiGateway"
            
            #Progreso BoundedContext
            progresoBC = container "Progreso Bounded Context" "Permite al integrante consultar el progreso del proyecto" "Java v22""ProgresoBC" {
                progresoController = component "Progreso Controller"" Controller class de la solicitud""Java v22 / Spring Boot v3.2.0" "ProgresoBC, BoundedContext"
                group "cronograma" {
                    cronogramaRepository = component "Cronograma Repository" "Repository Interface del Cronograma" "Interface / Java v22 / Spring Boot v3.2.0" "CronogramaRepository,Repository"
                    cronogramaQuery = component "Cronograma Query" "Query for read Cronograma" "Record" "CronogramaQuery, Query"
                    cronogramaCommand = component "Cronograma Command" "Command for create, update and delete Cronograma" "Record" "CronogramaCommand, Command"
                    cronogramaCommandService = component "Cronograma CommandService" "Business Logic del Command del Cronograma" "Java v22 / Spring Boot v3.2.0" "CronogramaCommandService,Service"
                    cronogramaQueryService = component "Cronograma QueryService" "Business Logic del query del Cronograma" "Java v22 / Spring Boot v3.2.0" "CronogramaQueryService,Service"
                }
                group "reporte" {
                    reporteRepository = component "Reporte Repository" "Repository Interface de Reportes" "Interface / Express.js / ECMAScript v2024" "ReporteRepository,Repository"
                    reporteQuery = component "Reporte Query" "Query for read Reportes" "Record" "ReporteQuery, Query"
                    reporteCommand = component "Reporte Command" "Command for create, update and delete Reportes" "Record" "ReporteCommand, Command"
                    reporteCommandService = component "Reporte CommandService" "Business Logic del Command del Reporte" "Java v22 / Spring Boot v3.2.0" "ReporteCommandService,Service"
                    reporteQueryService = component "Reporte QueryService" "Business Logic del query del Reporte" "Java v22 / Spring Boot v3.2.0" "ReporteQueryService,Service"
                }
                group "tarea" {
                    tareaQuery = component "Tarea Query" "Query for read tarea" "Record" "TareaQuery, Query"
                    
                }
                group "inboundservices" {
                    cronogramaContextFacade = component "Cronograma ContextFacade" "Facade Business Logic del progreso" "Java v22 / Spring Boot v3.2.0" "ProgresoContextFacade,ContextFacade"
                }
                group "outboundservices" {
                    googleDriveExternalService = component "Google Drive External Service" "External Business Logic de almacenamiento de archivos ""Java v22 / Spring Boot v3.2.0""GoogleDriveExternalService, ExternalService"
                }
            }
            
            #Proyecto BoundedContext
            proyectoBC = container "Proyecto Bounded Context" "Permite al lider gestionar el proyecto" "Java v22""AdelantoBC" {
                proyectoController = component "Proyecto Controller" "Api controller class de Proyecto" "Java v22 / Spring Boot v3.2.0" "adelantoBC, BoundedContext"
                
                group "creacion" {
                    creacionRepository = component "Contador Repository" "Repository Interface del Creacion" "Interface / Java v22 / Spring Boot v3.2.0" "ContadorRepository,Repository"
                    creacionQuery = component "Contador Query" "Query for read solicitud Creacion" "Record" "ContadorQuery, Query"
                    creacionCommand = component "Contador Command" "Command for create, update and delete Creacion de proyecto" "Record" "ContadorCommand, Command"
                    creacionCommandService = component "Contador CommandService" "Business Logic del Command de la Creacion de Proyecto" "Java v22 / Spring Boot v3.2.0" "ContadorCommandService,Service"
                    creacionQueryService = component "Contador QueryService" "Business Logic del query de la Creacion de proyecto" "Java v22 / Spring Boot v3.2.0" "ContadorQueryService,Service"
                }
                group "outboundservices" {
                    iCloudExternalService = component "iCloud External Service" "External Business Logic de almacenamiento en iOS ""Java v22 / Spring Boot v3.2.0""NiubizExternalService, ExternalService"
                }
                group "inboundservices" {
                    proyectoContextFacade = component "Proyecto ContextFacade" "Facade Business Logic de los proyectos" "Java v22 / Spring Boot v3.2.0" "AdelantoContextFacade,ContextFacade"
                }
            }
            
            group "Databases" {
                progresoDB = container "Progreso Database" "Guarda información del progreso realizado por el equipo" "DB2 v16" "ProgresoDB,Database"
                proyectoDB = container "Proyectos Database" "Guarda información de las solicitudes de adelanto de pago" "DB2 v16" "AdelantoDB,Database"
            }
        }
        
        #external system
        googleDrive = softwareSystem "GoogleDrive" "Almacena los reportes generados por los miembros del equipo en dispositivos Android" "GoogleDrive,ExternalSystem"
        iCloud = softwareSystem "iCloud" "Almacena los reportes generados por los miembros del equipo en dispositivos iOS" "iCloud,ExternalSystem"
        
        # Relationship systemContext
        leader -> devTasker "Gestiona el proyecto"
        member -> devTasker "Realiza tareas asignadas por el lider"
        devTasker -> googleDrive "Query de reportes almacenados en Drive"
        googleDrive -> devTasker "Response de reportes"
        devTasker -> iCloud "Query de reportes almacenados en la nube"
        iCloud -> devTasker "Response de reportes"

        # Relationship container
        leader -> webApp "Gestiona el proyecto"
        member -> webApp "Realiza tareas asignadas por el lider"
        leader -> mobileApp "Gestiona el proyecto"
        member -> mobileApp "Realiza tareas asignadas por el lider"
        
        webApp -> apiGateway "Solicitudes HTTP / API"
        mobileApp -> apiGateway "HTTP Request / API"

        apiGateway -> progresoBC "Endpoint request" "HTTPS / Json"
        apiGateway -> proyectoBC "Endpoint request" "HTTPS / Json"

        progresoBC -> progresoBC "Agregar solicitud " "ACL"
        proyectoBC -> proyectoBC "Continuar solicitud" "ACL"

        progresoBC -> progresoDB "Guardar y recupera datos" "SQL Commands"
        proyectoBC -> proyectoDB "Guardar y recupera datos" "SQL Commands"

        progresoBC -> googleDrive "Query de reportes del progreso y tareas"
        googleDrive -> progresoBC  "Response de reporte"
        proyectoBC -> iCloud "Almacenar en iCloud"

        # Relationships Progreso Bounded Context

        apiGateway -> progresoController "Request GET del endpoint de Progreso"

        progresoController -> cronogramaQueryService "Call service method"
        progresoController -> cronogramaCommandService "Call service method"

        cronogramaQueryService -> cronogramaQuery "Handle query"
        cronogramaQueryService -> cronogramaRepository "Call repository method"
        cronogramaQueryService -> tareaQuery "Handle query"

        cronogramaCommandService -> cronogramaCommand "Handle command"
        cronogramaCommandService -> cronogramaRepository "Call repository method"
        cronogramaCommandService -> googleDriveExternalService "Call external service method"
        
        
        reporteQueryService -> reporteQuery "Handle query"
        reporteQueryService -> reporteRepository "Call repository method"
        reporteQueryService -> tareaQuery "Handle query"

        reporteCommandService -> reporteCommand "Handle command"
        reporteCommandService -> reporteRepository "Call repository method"
        reporteCommandService -> googleDriveExternalService "Call external service method"

        cronogramaRepository -> progresoDB "Store, update, delete and fetch records -Cronograma" "SQL transaction"
        
        googleDriveExternalService -> cronogramaContextFacade "Call service method"

        googleDriveExternalService -> googleDrive "Almacenamiento por Google Drive"

        # Relationships Proyecto Bounded Context

        apiGateway -> proyectoController "Request GET, POST, PUT, DELETE del endpoint de la solicitud de Proyecto"

        proyectoController -> creacionQueryService "Call service method"
        proyectoController -> creacionCommandService "Call service method"

        creacionQueryService -> creacionQuery "Handle query"
        creacionQueryService -> creacionRepository "Call repository method"
        
        creacionCommandService -> creacionCommand "Handle command"
        creacionCommandService -> creacionRepository "Call repository method"
        creacionCommandService -> iCloudExternalService "Call external service method"

        creacionRepository -> proyectoDB "Store, update, delete and fetch records - Proyecto" "SQL transaction"

        iCloudExternalService -> proyectoContextFacade "Continuar con el proyecto"
        proyectoContextFacade -> creacionCommandService "Call service method"
    }
    views {
        systemContext devTasker "devTaskerSystemContext" "Sistema de Gestión de Proyectos" {
            include *
            autoLayout tb
        }
        container devTasker "devTaskerContainer" "Container del Software de gestión de proyectos" {
            include *
            autoLayout tb
        }
        component progresoBC "progresoComponent" "Diagrama de Componentes progresoBC" {
            include *
            autoLayout tb
        }
        component proyectoBC "proyectoComponent" "Diagrama de Componentes proyectoBC" {
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
            element "MobileApp" {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element "WebApp" {
                shape WebBrowser
                background #2067F5
                color #FFFFFF
                icon https://static.structurizr.com/themes/amazon-web-services-2020.04.30/Amazon-EC2_D2-Instance_light-bg@4x.png
            }
            element "LandingPage" {
                shape WebBrowser
                background #048000
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