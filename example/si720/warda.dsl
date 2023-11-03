workspace "Warda" "La alcancía virtual del BCP" {

    model {
        # persons
        customer = person "Customer BCP" "Persona que tiene una cuenta en le BCP y quiere ahorrar" "Customer"
        manager = person "Manager" "Administra la Aplicación" "Manager"

        # External SoftwareSystem
        coreBankingBcp = softwareSystem "Core Banking BCP" "Administran y controla los procesos y actividades bancarias" "CoreBankingBcp"
        smsApi = softwareSystem "Sms API" "Envio de mensajes de texto" "SmsApi"
        emailApi = softwareSystem "E-mail API" "Envio de correos electrónicos" "EmailApi"
        
        # SoftwareSystem
        warda = softwareSystem "Warda" "App de alcancía virtual del BCP" "Warda" {
            landingPage = container "Landing Page" "Página marketera del Mobile App" "Html, Css y JavaScript" "LandingPage"
            webApp = container "Web App" "Web Application para el registro y Dashboard del ahorro" "Angular v16.2 and Angula Material" "WebApp"
            mobileApp = container "Mobile App" "Mobile Application para pesonalizar y gestionar los ahorros" "Kotlin - Android / Swift - iOS" "MobileApp"
            
            apiGateway = container "Api Gateway" "Routing los request de los Fronts UI" "api gateway" "ApiGateway" 

            registerBC = container "Register Bounded Context" "API RESTful de Registro de Clientes" "Java v21 / Spring Boot v3" "RegisterBC,BoundedContext"
            automaticBC = container "Warda en automático Bounded Context" "API RESTful de Warda en automático" "C# / .NET 7.0" "AutomaticBC,BoundedContext"
            percentageBC = container "Warda un porcentaje Bounded Context" "API RESTful de Warda un porcentaje" "C# / .NET 7.0" "PercentageBC,BoundedContext"
            returnBC = container "Warda el Vuelto Bounded Context" "API RESTful de Warda el vuelto" "Python v3.11 / Django v4.2" "ReturnBC,BoundedContext"
            dashboardBC = container "Dashboard Bounded Context" "API RESTful del Dashboard de Warda" "Java v21 / Spring Boot v3" "DashboardBC,BoundedContext"

            database = container "Database" "Guarda información de las transacciones" "PostgreSQL v16" "Database"
            
            # Relationships between Person and Front
            customer -> landingPage "Visualiza"
            customer -> webApp "Registra"
            customer -> mobileApp "Personaliza y Ahorrar"

            manager -> webApp "Gestiona WebApp"
            manager -> mobileApp "Gestiona MobileApp"

            # Relationships between Front UI and Front App
            landingPage -> webapp "Deriva" 
            
            # Relationships between Front App and ApiGateway                                  
            webApp -> apiGateway "Endpoint request" "HTTP(S) / JSON"
            mobileApp -> apiGateway "Endpoint request" "HTTP(S) / JSON"

            # Relationships between ApiGateway and Bounded Context
            apiGateway -> registerBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> automaticBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> percentageBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> returnBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> dashboardBC "Endpoint request" "HTTP(S) / JSON"

            # Relationships between Bounded Context and Database
            registerBC -> database "Store and fetch records" "Database Transaction"
            automaticBC -> database "Store, fetch and update records" "Database Transaction"
            percentageBC -> database "Store, fetch and update records" "Database Transaction"
            returnBC -> database "Store, fetch and update records" "Database Transaction"
            dashboardBC -> database "Store, fetch, update and delete records" "Database Transaction"

            # Relationships between Bounded Context and External softwareSystem
            registerBC -> coreBankingBcp "Query of account" "TCP/IP"
            registerBC -> smsApi "Send SMS" "SMPP"
            registerBC -> emailApi "Send email" "SMTP"
            automaticBC -> coreBankingBcp "Query, update and store in account" "TCP/IP"
            percentageBC -> coreBankingBcp "Query, update and store in account" "TCP/IP"
            returnBC -> coreBankingBcp "Query, update and store in account" "TCP/IP"
            dashboardBC -> coreBankingBcp "Query of account" "TCP/IP"

        }

        # Relationships between Person and softwareSystem
        customer -> warda "Usa"
        manager -> warda "Gestiona"
        
        # Relationships between softwareSystem and External softwareSystem
        warda -> coreBankingBcp "Usa"
        warda -> smsApi "Usa"
        warda -> emailApi "Usa"
    
    }
    views {
        systemContext warda "WardaSystemContext" "Sistema de Contexto" {
            include *
            autoLayout tb
        }
        container warda "WardaContainer" "Diagrama de Contenedores" {
            include *
            autoLayout tb
        }
        styles {
            element "Person" {
                color #FFFFFF
            }
            element "Customer" {
                shape Person
                background #5F04B4                
            }
            element "Manager" {
                shape Robot
                background #219C90
            }
            element "Software System" {
                background #3f47e1
                color #FFFFFF
            }
            element "CoreBankingBcp" {
                background #DF7401
            }
            element "Container" {
                background #002A8D
                color #FFFFFF
            }
            element "BoundedContext" {
                shape Component
            }
            element "WebApp" {
                shape MobileDevicePortrait
                background #3f47e1
            }
            element "MobileApp" {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element "ApiGateway" {
                shape Hexagon
                background #884A39                
            }
            element "Database" {
                shape Cylinder
                background #CF0A0A
            }

        }
    }
    
    

}