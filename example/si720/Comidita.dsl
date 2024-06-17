workspace "Comidita" "Sistema Académico de centros de enseñanza" {

    model {
        # persons: Gerente, Mesero, Chef y Cliente
        gerente = person "Gerente" "Quien administra el restaurante" "Gerente"
        mesero = person "Mesero" "Mesero, quien atiendo a los cliente" "Mesero"
        chef = person "Chef" "Quien prepara los alimentos" "Chef"
        cliente = person "Cliente" "Quien consume los alimentos" "Cliente"

        # External SoftwareSystem
        reniecApi = softwareSystem "Reniec API" "Web Service de RENIEC" "ReniecApi"
        driveApi = softwareSystem "Google Drive API" "REStful API de Google Drive" "DriveApi"
        mapApi = softwareSystem "Google Map API" "REStful API de Google Map" "MapApi"
        
        
        # SoftwareSystem
        comidita = softwareSystem "Comidita.Net" "Sistema de Restaurantes" "Comidita" {
            mobileApp = container "Mobile App" "Mobile Application del Sistema de Restaurane" "Swift v5.10" "MobileApp"
            webApp = container "Web App" "Web Application del Sistema de Restaurane" "Javascript / Vue.js v3.4.27" "WebApp"
            
            apiGateway = container "Api Gateway" "Routing los request de los Fronts UI" "api gateway" "ApiGateway" 
            
            peopleBC = container "People Bounded Context" "API RESTful of People" "Java v21 / Spring Boot v3.3.0 / Spring v6.1.8" "PeopleBC,BoundedContext"
            recetaBC = container "Receta Bounded Context" "API RESTful of Reseta" "Java v21 / Spring Boot v3.3.0 / Spring v6.1.8" "recetaBC,BoundedContext"
            alimentoBC = container "Alimento Bounded Context" "API RESTful of Alimento" "Java v21 / Spring Boot v3.3.0 / Spring v6.1.8" "AlimentoBC,BoundedContext"
            pedidoBC = container "Pedido Bounded Context" "API RESTful of Pedido" "Java v21 / Spring Boot v3.3.0 / Spring v6.1.8" "PedidoBC,BoundedContext"
            
            database = container "Database" "Guarda información de las transacciones" "MongoDB v7.0" "Database"        
        }

        #RelationShip
        gerente -> comidita "Usa App"
        mesero -> comidita "Usa App"
        chef -> comidita "Usa App"
        cliente -> comidita "Usa App"
        
        comidita -> reniecApi "Call Api"
        comidita -> driveApi "Call Api"
        comidita -> mapApi "Call Api"
        
        # RelationShip in ContextDiagram
        gerente -> mobileApp "Usa App"
        mesero -> mobileApp "Usa App"
        chef -> mobileApp "Usa App"
        cliente -> mobileApp "Usa App"
        gerente -> webApp "Usa App"
        mesero -> webApp "Usa App"
        chef -> webApp "Usa App"
        cliente -> webApp "Usa App"
        
        # Relationships Mobile and Web and ApiGateway
        mobileApp -> apiGateway "Endpoint request" "HTTP(S) / JSON"
        webApp -> apiGateway "Endpoint request" "HTTP(S) / JSON"
        
        # Relationships between ApiGateway and Bounded Context
        apiGateway -> peopleBC "Endpoint request" "HTTP(S) / JSON"
        apiGateway -> recetaBC "Endpoint request" "HTTP(S) / JSON"
        apiGateway -> alimentoBC "Endpoint request" "HTTP(S) / JSON"
        apiGateway -> pedidoBC "Endpoint request" "HTTP(S) / JSON"
        
        # Relationships between Bounded Contexts
        peopleBC -> recetaBC "Connect"
        peopleBC -> pedidoBC "Connect"
        recetaBC -> alimentoBC "Connect"
        pedidoBC -> alimentoBC "Connect"
        
        # Relationships between Bounded Context and Database
        peopleBC -> database "Store, fetch and update records" "Database Transaction" 
        recetaBC -> database "Store, fetch and update records" "Database Transaction"
        alimentoBC -> database "Store, fetch and update records" "Database Transaction"
        pedidoBC -> database "Store, fetch and update records" "Database Transaction"
        
        # Relationships between Bounded Context and External softwareSystem
        peopleBC -> reniecApi "Query of person" "TCP/IP"
        alimentoBC -> driveApi "Query of image" "TCP/IP"
        pedidoBC -> mapApi "Query of image" "TCP/IP"

    }
    views {
        systemContext comidita "ComiditaSystemContext" "Sistema de Resturante" {
            include *
            autoLayout tb
        }
        container comidita "ComiditaContainer" "Diagrama de Contenedores" {
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
            element "BoundedContext" {
                shape Component
            }
            element "WebApp" {
                shape WebBrowser
                background #3f47e1
            }
            element "MobileApp" {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element "ApiGateway" {
                shape Pipe
                background #884A39                
            }
            element "Database" {
                shape Cylinder
                background #CF0A0A
            }
            element "ComponentBC" {
                shape Component
                background #511991
                color #FFFFFF
            }
            element "Service" {
                shape Component
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
            element "Entity" {
                shape Box
                background #7D08BC
                color #FFFFFF
            }
            element "Container" {
                shape Hexagon
                background #805B17
                color #FFFFFF
            }
            element "Group:course" {
                color #FF0000
            }
            element "Group:syllabus" {
                color #0F9800
            }
            element "Group:book" {
                color #0000FF
            }
            element "Group:topic" {
                color #0000FF
            }
        }
    }

}
