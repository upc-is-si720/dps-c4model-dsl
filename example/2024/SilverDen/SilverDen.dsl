workspace "SilverDen" "Sistema de reporte de nomina" {

    model {
        #Person
        administracion = person "Administracion" "area que autoriza" "Administracion"
        contabilidad = person "Contabilidad" "area que supervisa reporte generador por sistema" "Contabilidad"
        recursosHumanos = person "Recursos Humanos" "area que supervisa empleado trabajo realizado" "RecursosHumanos"
        
        #softwareSystem
        silverDen = softwareSystem "SilverDen" "Sistema de reporte de nomina" "SilverDen" {
            #DIAGRAMA DE CONTENEDORES
            webApp = container "Web Application" "Simple-page-Application" "Angular v18.1 / Typescrip 5.6.3" "WebApp"
            
            apiGateway = container "Api Gateway" "Controlador de tráfico que guía las solicitudes de API entrantes de back-end adecuados" "Amazon API Gateway" "ApiGateway"
            
            #Django v5.1.2 / Python V3.14
            
            #Búsqueda y selección Bounded Context
            busquedaSeleccionBC = container "Búsqueda y selección Bounded Context" "Busca los empleados registrados" "Django v5.1.2 / Python V3.14" "BúsquedaSelecciónBC, BoundedContext"{
                busquedaEngineController = component "BusquedaEngine Controller" "RESTful API Controller class del BusquedaEngine" "Class / Django v5.1.2 / Python V3.14" "BusquedaEngineController,Controller"
                group "busquedaEngine" {
                    busquedaEngineRepository = component "BusquedaEngine Repository" "Repository Interface de BusquedaEngine" "Interface / Django v5.1.2 / Python V3.14" "BusquedaEngineRepository,Repository"
                    busquedaEngineQuery = component "BusquedaEngine Query" "Query for read BusquedaEngine" "Record" "BusquedaEngineQuery, Query"
                    busquedaEngineCommand = component "BusquedaEngine Command" "Command for create, update and delete BusquedaEngine" "Record" "BusquedaEngineCommand, Command"
                    busquedaEngineCommandService = component "BusquedaEngine CommandService" "Business Logic del Command del BusquedaEngine" "Class / Django v5.1.2 / Python V3.14" "BusquedaEngineCommandService,Service"
                    busquedaEngineQueryService = component "BusquedaEngine QueryService" "Business Logic del query del BusquedaEngine" "Class / Django v5.1.2 / Python V3.14" "BusquedaEngineQueryService,Service"
                }
                group "outboundservices" {
                    visualizacionExternalService = component "Visualización de información ExternalService" "External Business Logic de Visualización de información" "Class / Django v5.1.2 / Python V3.14" "VisualizacionExternalService,ExternalService"
                }
            }
                
            #Visualización de información Bounded Context
            visualizacionInformacionBC = container "Visualización de información Bounded Context" "Visualiza informacion registrada" "Django v5.1.2 / Python V3.14" "VisualizacionInformacionBC, BoundedContext"{
                visualizacionEngineController = component "VisualizacionEngine Controller" "RESTful API Controller class del VisualizacionEngine" "Class / Django v5.1.2 / Python V3.14" "VisualizacionEngineController,Controller"
                group "visualizacionEngine" {
                    visualizacionEngineRepository = component "VisualizacionEngine Repository" "Repository Interface de VisualizacionEngine" "Interface / Django v5.1.2 / Python V3.14" "VisualizacionEngineRepository,Repository"
                    visualizacionEngineQuery = component "VisualizacionEngine Query" "Query for read VisualizacionEngine" "Record" "VisualizacionEngineQuery, Query"
                    visualizacionEngineCommand = component "VisualizacionEngine Command" "Command for create, update and delete VisualizacionEngine" "Record" "VisualizacionEngineCommand, Command"
                    visualizacionEngineCommandService = component "VisualizacionEngine CommandService" "Business Logic del Command del VisualizacionEngine" "Class / Django v5.1.2 / Python V3.14" "VisualizacionEngineCommandService,Service"
                    visualizacionEngineQueryService = component "VisualizacionEngine QueryService" "Business Logic del query del VisualizacionEngine" "Class / Django v5.1.2 / Python V3.14" "VisualizacionEngineQueryService,Service"
                }
                group "inboundservices" {
                    visualizacionContextFacade = component "Visualización de información ContextFacade" "Facade Business Logic de Visualización de información" "Class / Django v5.1.2 / Python V3.14" "VisualizacionContextFacade,ContextFacade"
                }
                group "outboundservices" {
                    registroExternalService = component "Registro de informacion ExternalService" "External Business Logic de Registro de informacion" "Class / Django v5.1.2 / Python V3.14" "RegistroExternalService,ExternalService"
                }
            }
            
            #Registro de informacion Bounded Context
            registroInformacionBC = container "Registro de informacion Bounded Context" "Registro de informacion de trabajo" "Django v5.1.2 / Python V3.14" "RegistroInformacionBC, BoundedContext" {
                registroEngineController = component "RegistroEngine Controller" "RESTful API Controller class del RegistroEngine" "Class / Django v5.1.2 / Python V3.14" "RegistroEngineController,Controller"
                group "registroEngine" {
                    registroEngineRepository = component "RegistroEngine Repository" "Repository Interface de RegistroEngine" "Interface / Django v5.1.2 / Python V3.14" "RegistroEngineRepository,Repository"
                    registroEngineQuery = component "RegistroEngine Query" "Query for read RegistroEngine" "Record" "RegistroEngineQuery, Query"
                    registroEngineCommand = component "RegistroEngine Command" "Command for create, update and delete RegistroEngine" "Record" "RegistroEngineCommand, Command"
                    registroEngineCommandService = component "RegistroEngine CommandService" "Business Logic del Command del RegistroEngine" "Class / Django v5.1.2 / Python V3.14" "RegistroEngineCommandService,Service"
                    registroEngineQueryService = component "RegistroEngine QueryService" "Business Logic del query del RegistroEngine" "Class / Django v5.1.2 / Python V3.14" "RegistroEngineQueryService,Service"
                }
                group "RegistroTrabajadorItem" {
                    registroTrabajadorItemQuery = component "RegistroTrabajadorItem Query" "Query for read RegistroTrabajadorItem" "Record" "RegistroTrabajadorItemQuery, Query"
                    registroTrabajadorItemCommand = component "RegistroTrabajadorItem Command" "Command for create, update and delete RegistroTrabajadorItem" "Record" "RegistroTrabajadorItemCommand, Command"
                }
                group "inboundservices" {
                    registroContextFacade = component "Registro de informacion ContextFacade" "Facade Business Logic de Registro de informacion" "Class / Django v5.1.2 / Python V3.14" "RegistroContextFacade,ContextFacade"
                }
                group "outboundservices" {
                    correccionExternalService = component "Correccion de informacion ExternalService" "External Business Logic de Correccion de informacion" "Class / Django v5.1.2 / Python V3.14" "CorreccionExternalService,ExternalService"
                }
            }
            
            #Correccion de informacion Bounded Context
            correccionInformacionBC = container "Correccion de informacion Bounded Context" "Correcion de informacion si hubiera algun error" "Django v5.1.2 / Python V3.14" "CorreccionInformacionBC, BoundedContext"{
                correccionEngineController = component "CorreccionEngine Controller" "RESTful API Controller class del CorreccionEngine" "Class / Django v5.1.2 / Python V3.14" "CorreccionEngineController,Controller"
                group "correccionEngine" {
                    correccionEngineRepository = component "CorreccionEngine Repository" "Repository Interface de CorreccionEngine" "Interface / Django v5.1.2 / Python V3.14" "CorreccionEngineRepository,Repository"
                    correccionEngineQuery = component "CorreccionEngine Query" "Query for read CorreccionEngine" "Record" "CorreccionEngineQuery, Query"
                    correccionEngineCommand = component "CorreccionEngine Command" "Command for create, update and delete CorreccionEngine" "Record" "CorreccionEngineCommand, Command"
                    correccionEngineCommandService = component "CorreccionEngine CommandService" "Business Logic del Command del CorreccionEngine" "Class / Django v5.1.2 / Python V3.14" "CorreccionEngineCommandService,Service"
                    correccionEngineQueryService = component "CorreccionEngine QueryService" "Business Logic del query del CorreccionEngine" "Class / Django v5.1.2 / Python V3.14" "CorreccionEngineQueryService,Service"
                }
                group "CorreccionTrabajadorItem" {
                    correccionTrabajadorItemQuery = component "CorreccionTrabajadorItem Query" "Query for read CorreccionTrabajadorItem" "Record" "CorreccionTrabajadorItemQuery, Query"
                    correccionTrabajadorItemCommand = component "CorreccionTrabajadorItem Command" "Command for create, update and delete CorreccionTrabajadorItem" "Record" "CorreccionTrabajadorItemCommand, Command"
                }
                group "inboundservices" {
                    correccionContextFacade = component "Correccion de informacion ContextFacade" "Facade Business Logic de Correccion de informacion" "Class / Django v5.1.2 / Python V3.14" "CorreccionContextFacade,ContextFacade"
                }
                group "outboundservices" {
                    revisionExternalService = component "Revision de reporte de pago ExternalService" "External Business Logic de Revision de reporte de pago" "Class / Django v5.1.2 / Python V3.14" "RevisionExternalService,ExternalService"
                }
            }
            
            #Revision de reporte de pago Bounded Context
            revisionReporteBC = container "Revision de reporte de pago Bounded Context" "Revision de conformidad de reportes generados" "Django v5.1.2 / Python V3.14" "RevisionReporteBC, BoundedContext"{
                revisionEngineController = component "RevisionEngine Controller" "RESTful API Controller class del RevisionEngine" "Class / Django v5.1.2 / Python V3.14" "RevisionEngineController,Controller"
                group "correccionEngine" {
                    revisionEngineRepository = component "RevisionEngine Repository" "Repository Interface de RevisionEngine" "Interface / Django v5.1.2 / Python V3.14" "RevisionEngineRepository,Repository"
                    revisionEngineQuery = component "RevisionEngine Query" "Query for read RevisionEngine" "Record" "RevisionEngineQuery, Query"
                    revisionEngineCommand = component "RevisionEngine Command" "Command for create, update and delete RevisionEngine" "Record" "RevisionEngineCommand, Command"
                    revisionEngineCommandService = component "RevisionEngine CommandService" "Business Logic del Command del RevisionEngine" "Class / Django v5.1.2 / Python V3.14" "RevisionEngineCommandService,Service"
                    revisionEngineQueryService = component "RevisionEngine QueryService" "Business Logic del query del RevisionEngine" "Class / Django v5.1.2 / Python V3.14" "RevisionEngineQueryService,Service"
                }
                group "inboundservices" {
                    revisionContextFacade = component "Revision de reporte de pago ContextFacade" "Facade Business Logic de Revision de reporte de pago" "Class / Django v5.1.2 / Python V3.14" "RevisionContextFacade,ContextFacade"
                }
                group "outboundservices" {
                    notificacionExternalService = component "Notificación ExternalService" "External Business Logic de Notificación" "Class / Django v5.1.2 / Python V3.14" "NotificacionExternalService,ExternalService"
                }
            }
            
            #Notificación Bounded Context
            notificacionBC = container "Notificación Bounded Context" "Envio de notificacion de reportes" "Django v5.1.2 / Python V3.14" "NotificacionBC, BoundedContext"{
                notificacionEngineController = component "NotificacionEngine Controller" "RESTful API Controller class del BusquedaEngine" "Class / Django v5.1.2 / Python V3.14" "NotificacionEngine,Controller"
                group "notificacionEngine" {
                    notificacionEngineRepository = component "NotificacionEngine Repository" "Repository Interface de NotificacionEngine" "Interface / Django v5.1.2 / Python V3.14" "NotificacionEngine,Repository"
                    notificacionEngineQuery = component "NotificacionEngine Query" "Query for read NotificacionEngine" "Record" "NotificacionEngine, Query"
                    notificacionEngineCommand = component "NotificacionEngine Command" "Command for create, update and delete NotificacionEngine" "Record" "NotificacionEngine, Command"
                    notificacionEngineCommandService = component "NotificacionEngine CommandService" "Business Logic del Command del NotificacionEngine" "Class / Django v5.1.2 / Python V3.14" "NotificacionEngine,Service"
                    notificacionEngineQueryService = component "NotificacionEngine QueryService" "Business Logic del query del NotificacionEngine" "Class / Django v5.1.2 / Python V3.14" "NotificacionEngine,Service"
                }
                group "ver" {
                    trabajadorNotificarQuery = component "Trabajador Query" "Query for read Product" "Record" "TrabajadorQuery, Query"
                }
                group "inboundservices" {
                    notificacionContextFacade = component "Notificación de pago ContextFacade" "Facade Business Logic de Notificación" "Class / Django v5.1.2 / Python V3.14" "NotificacionContextFacade,ContextFacade"
                }
                group "outboundservices" {
                    correoExternalService = component "Correo ExternalService" "External Business Logic Repositorio de información" "Class / Django v5.1.2 / Python V3.14" "Correo,ExternalSystem"
                }
                group "NotificarTrabajadorItem" {
                    notificarTrabajadorItemQuery = component "NotificarTrabajadorItem Query" "Query for read RevisionTrabajadorItem" "Record" "notificarTrabajadorItemQuery, Query"
                    notificarTrabajadorItemCommand = component "NotificarTrabajadorItem Command" "Command for create, update and delete RevisionTrabajadorItem" "Record" "notificarTrabajadorItemCommand, Command"
                }
            }
            
            group "Databases" {
                busquedaSeleccionDB = container "Búsqueda y selección Data Base" "Guarda informacion de las seleccion" "Oracle Database v19c" "BúsquedaSelecciónDB,DataBase" 
                visualizacionInformacionDB = container "Visualización de información Data Base" "Guarda informacion de la informacion registrada" "Oracle Database v19c" "VisualizacionInformacionDB,DataBase"
                registroInformacionDB = container "Registro de informacion Data Base" "Guarda informacion de trabajo" "Oracle Database v19c" "RegistroInformacionDB,DataBase"
                correccionInformacionDB = container "Correccion de informacion Data Base" "Guarda informacion de las correciones" "Oracle Database v19c" "CorreccionInformacionDB,DataBase"
                revisionReporteDB = container "Revision de reporte de pago Data Base" "Guarda informacion de la conformidad de reportes" "Oracle Database v19c" "RevisionReporteDB,DataBase"
                notificacionDB = container "Notificación Data Base" "Guarda informacion de las notificaciones" "Oracle Database v19c" "NotificacionDB,DataBase"
            }
            
        }
        
        #ExternalSystem
        correo = softwareSystem "Correo" "Envio de correos" "Correo,ExternalSystem" 
        
        #Relationship systemContext
        administracion -> silverDen "autoriza procesos"
        contabilidad -> silverDen "revisa y corrige informacion"
        recursosHumanos -> silverDen "supervisa informacion registrada"
        
        silverDen -> correo "Query de correo"
        correo -> silverDen "Response de correo"
        
        #Relationship container
        administracion -> webApp "Autoriza conformidad"
        contabilidad -> webApp "Revisa y corrige información"
        recursosHumanos -> webApp "Supervisa y registra información"
        
        webApp -> apiGateway "Solicitudes HTTP / API"
        
        apiGateway -> busquedaSeleccionBC "Endpoint request" "HTTPS / Json"
        apiGateway -> visualizacionInformacionBC "Endpoint request" "HTTPS / Json"
        apiGateway -> registroInformacionBC "Endpoint request" "HTTPS / Json"
        apiGateway -> correccionInformacionBC "Endpoint request" "HTTPS / Json"
        apiGateway -> revisionReporteBC "Endpoint request" "HTTPS / Json"
        apiGateway -> notificacionBC "Endpoint request" "HTTPS / Json"
        
        busquedaSeleccionBC -> visualizacionInformacionBC "Selecciona y visualiza trabajador" "ACL"
        visualizacionInformacionBC -> registroInformacionBC "Registro y revision de datos" "ACL"
        registroInformacionBC -> correccionInformacionBC "Correccion de datos" "ACL"
        correccionInformacionBC -> revisionReporteBC "Supervision y correccion de reporte de pago" "ACL"
        revisionReporteBC -> notificacionBC "Notificar reporte listo" "ACL"
        
        busquedaSeleccionBC -> busquedaSeleccionDB "Guarda y recupera datos" "SQL Commands"
        visualizacionInformacionBC -> visualizacionInformacionDB "Guarda y recupera datos" "SQL Commands"
        registroInformacionBC -> registroInformacionDB "Guarda y recupera datos" "SQL Commands"
        correccionInformacionBC -> correccionInformacionDB "Guarda y recupera datos" "SQL Commands"
        revisionReporteBC -> revisionReporteDB "Guarda y recupera datos" "SQL Commands"
        notificacionBC -> notificacionDB "Guarda y recupera datos" "SQL Commands"
        
        notificacionBC -> correo "Envio de correo notificacion reporte"
        
        # Relationships Búsqueda y selección Bounded Context
        
        apiGateway -> busquedaEngineController "Request GET del endpoint de Búsqueda"

        busquedaEngineController -> busquedaEngineQueryService "Call service method"
        busquedaEngineController -> busquedaEngineCommandService "Call service method"

        busquedaEngineQueryService -> busquedaEngineQuery "Handle query"
        busquedaEngineQueryService -> busquedaEngineRepository "Call repository method"
        busquedaEngineQueryService -> visualizacionExternalService "Consulta query"

        busquedaEngineCommandService -> busquedaEngineCommand "Handle command"
        busquedaEngineCommandService -> busquedaEngineRepository "Call repository method"

        busquedaEngineRepository -> busquedaSeleccionDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"
            
        visualizacionExternalService -> visualizacionContextFacade "Visualizacion de datos de trabajador"
            
        # Relationships Visualización de información Bounded Context
        apiGateway -> visualizacionEngineController "Request GET del endpoint de Búsqueda"

        visualizacionEngineController -> visualizacionEngineQueryService "Call service method"
        visualizacionEngineController -> visualizacionEngineCommandService "Call service method"

        visualizacionEngineQueryService -> visualizacionEngineQuery "Handle query"
        visualizacionEngineQueryService -> visualizacionEngineRepository "Call repository method"

        visualizacionEngineCommandService -> visualizacionEngineCommand "Handle command"
        visualizacionEngineCommandService -> visualizacionEngineRepository "Call repository method"
        visualizacionEngineCommandService -> registroExternalService "Registro command"
        
        visualizacionEngineRepository -> visualizacionInformacionDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"
        
        visualizacionContextFacade -> visualizacionEngineQueryService "Visualizacion de datos de trabajador"
        registroExternalService -> registroContextFacade "Registro de datos de trabajador"
        
        # Relationships Registro de informacion Bounded Context
        apiGateway -> registroEngineController "Request GET del endpoint de Búsqueda"

        registroEngineController -> registroEngineQueryService "Call service method"
        registroEngineController -> registroEngineCommandService "Call service method"

        registroEngineQueryService -> registroEngineQuery "Handle query"
        registroEngineQueryService -> registroEngineRepository "Call repository method"
        registroEngineQueryService -> registroTrabajadorItemQuery "Handle query"

        registroEngineCommandService -> registroEngineCommand "Handle command"
        registroEngineCommandService -> registroEngineRepository "Call repository method"
        registroEngineCommandService -> registroTrabajadorItemCommand "Handle command"
        registroEngineCommandService -> correccionExternalService "Correccion command"
        
        registroEngineRepository -> registroInformacionDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"      
        
        registroContextFacade -> registroEngineCommandService "Registro de datos de trabajador"
        correccionExternalService -> correccionContextFacade "Correccion de datos de trabajador"
        
        # Relationships Correccion de informacion Bounded Context
        apiGateway -> correccionEngineController "Request GET del endpoint de Búsqueda"

        correccionEngineController -> correccionEngineQueryService "Call service method"
        correccionEngineController -> correccionEngineCommandService "Call service method"

        correccionEngineQueryService -> correccionEngineQuery "Handle query"
        correccionEngineQueryService -> correccionEngineRepository "Call repository method"
        correccionEngineQueryService -> correccionTrabajadorItemQuery "Handle query"
        correccionEngineQueryService -> revisionExternalService "Revision query"
        
        correccionEngineCommandService -> correccionEngineCommand "Handle command"
        correccionEngineCommandService -> correccionEngineRepository "Call repository method"
        correccionEngineCommandService -> correccionTrabajadorItemCommand "Handle command"
        
        correccionEngineRepository -> correccionInformacionDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"   
        
        correccionContextFacade -> correccionEngineCommandService "Correccion de datos de trabajador"
        revisionExternalService -> revisionContextFacade "Revision de datos de trabajador"
            
        # Relationships Revision de reporte de pago Bounded Context
        apiGateway -> revisionEngineController "Request GET del endpoint de Búsqueda"

        revisionEngineController -> revisionEngineQueryService "Call service method"
        revisionEngineController -> revisionEngineCommandService "Call service method"

        revisionEngineQueryService -> revisionEngineQuery "Handle query"
        revisionEngineQueryService -> revisionEngineRepository "Call repository method"
        
        revisionEngineCommandService -> revisionEngineCommand "Handle command"
        revisionEngineCommandService -> revisionEngineRepository "Call repository method"
        revisionEngineCommandService -> notificacionExternalService "Notificar command"
        
        revisionEngineRepository -> revisionReporteDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"  
        
        revisionContextFacade -> revisionEngineQueryService "Revision de datos de trabajador"
        notificacionExternalService -> notificacionContextFacade "Notificacion de envio reporte"
            
        # Relationships Notificación Bounded Context
        apiGateway -> notificacionEngineController "Request GET del endpoint de Búsqueda"

        notificacionEngineController -> notificacionEngineQueryService "Call service method"
        notificacionEngineController -> notificacionEngineCommandService "Call service method"

        notificacionEngineQueryService -> notificacionEngineQuery "Handle query"
        notificacionEngineQueryService -> notificacionEngineRepository "Call repository method"
        notificacionEngineQueryService -> notificarTrabajadorItemQuery "Handle query"
        
        notificacionEngineCommandService -> notificacionEngineCommand "Handle command"
        notificacionEngineCommandService -> notificacionEngineRepository "Call repository method"
        notificacionEngineCommandService -> correoExternalService "Endpoint Request" "HTTPS / Json"
        notificacionEngineCommandService -> notificarTrabajadorItemCommand "Handle command"
        
        notificacionEngineRepository -> notificacionDB "Store, update, delete and fetch records - searchEngine" "SQL transaction"

        trabajadorNotificarQuery -> notificarTrabajadorItemQuery "Query de notificar trabajador seleccionado"
        notificarTrabajadorItemQuery -> trabajadorNotificarQuery "Response de notificar trabajador"   
        
        correoExternalService -> correo "Query de envio correo a trabajador seleccionado"
        correo -> correoExternalService "Response de envio correo a trabajador"   
        
        notificacionContextFacade -> notificacionEngineQueryService "Notificacion de envio reporte"
    }
    
    views {
        systemContext silverDen "SilverDenSystemContext" "Sistema de reporte de nomina" {
            include *
            autoLayout tb
        }
        
        container silverDen "SilverDenContainer" "Container del software de soporte" {
            include *
            autoLayout tb
        }
        component busquedaSeleccionBC "busquedaSeleccionComponent" "Diagrama de Componentes BusquedaSeleccionBC" {
            include *
            autoLayout tb
        }
        component visualizacionInformacionBC "visualizacionInformacionComponent" "Diagrama de Componentes VisualizacionInformacionBC" {
            include *
            autoLayout tb
        }
        component registroInformacionBC "registroInformacionComponent" "Diagrama de Componentes RegistroInformacionBC" {
            include *
            autoLayout tb
        }
        component correccionInformacionBC "correccionInformacionComponent" "Diagrama de Componentes CorreccionInformacionBC" {
            include *
            autoLayout tb
        }
        component revisionReporteBC "revisionReporteComponent" "Diagrama de Componentes RevisionReporteBC" {
            include *
            autoLayout tb
        }
        component notificacionBC "notificacionComponent" "Diagrama de Componentes NotificacionBC" {
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
            element "DataBase" {
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