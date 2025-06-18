workspace "EcoTuna" "Sistema de pago de impuestos" {

    model {
        # person
        businessOwner = person "Business Owner" "Persona que posee un negocio" "BusinessOwner"
        
        # SoftwareSystem
        ecoTuna = softwareSystem "EcoTuna" "Aplicacion para pagar impuestos" "EcoTuna" {
            mobileApp = container "MobileApp" "Mobile App para pagar impuestos" "Android / Kotlin v2.0.0" "MobileApp"
            apiGateway = container "Api Gateway" "Gestiona los pagos de impuestos" "Azure API Management" "Api Gateway"
            
            #your bonded context
            paymentBC = container "Payment Bounded Context" "Permite el pago de impuestos" "Laravel v10 / PHP v8.2.24" "PaymentBC,BoundedContext"{
            paymentController = component "Payment Controller" "RESTful API Controller class del Payment" "Class / Laravel v10 / PHP v8.2.24" "PaymentController,Controller"
            
            
                group "Payment"{
                paymentRepository = component "Payment Repository" "Repository Interface de Payment" "Interface / Laravel v10 / PHP v8.2.24" "PaymentRepository,Repository"
                paymentQuery = component "Payment Query" "Query for read Payment" "Record" "PaymentQuery, Query"
                paymentCommand = component "Payment Command" "Command for create, update and delete Payment" "Record" "PaymentCommand, Command"
                paymentCommandService = component "Payment CommandService" "Business Logic del Command del Payment" "Class / Laravel v10 / PHP v8.2.24" "PaymentCommandService,Service"
                paymentQueryService = component "Payment QueryService" "Business Logic del query del Payment" "Class / Laravel v10 / PHP v8.2.24" "PaymentQueryService,Service"
                }
                
                 group "outboundservices" {
                    walletApiExternalService = component "Wallet Api ExternalService" "External Business Logic de pago por yape y plin" "Class / Laravel v10 / PHP v8.2.24" "WalletApiExternalService,ExternalService"
                }
            
                
            }
            
            
            group "Databases" {
            paymentDB = container "Payment Database" "Guarda la informacion del pago de impuestos" "Microsoft SQL Server v2022" "PaymentDB,Database"
            
            

            }
            
        }
        
        # External System
        walletApi = softwareSystem "Wallet Api" "Api de pago mediante billetera electrónica: yape y plin" "WalletApi" 
        correoElectronico = softwareSystem "Correo Electronico" "Correo electronico del Business Owner" "CorreoElectronico"
        cuentaBancaria = softwareSystem "Cuenta Bancaria" "Cuenta Bancaria que el Business Owner podra conectar a la aplicacion" "CuentaBancaria"
        
        # RelationShip systemContext
        businessOwner -> ecoTuna "Lo usa para pagar los impuestos de su negocio"
        ecoTuna -> walletApi "Generacion del QR de pago"
        ecoTuna -> correoElectronico "Notificacion de pago exitoso"
        ecoTuna -> correoElectronico "Envio de la boleta electronica"
        ecoTuna -> cuentaBancaria "Pago de impuestos mediante cuenta bancaria"
        
        
        # RelationShip container
        businessOwner -> mobileApp "Pagar impuestos"
        
        mobileApp -> apiGateway "Endpoint Request" "HTTPS / Json"
        
        apiGateway -> paymentBC "Request POST del endpoint del payment"
        
        paymentBC -> walletApi "Generación del QR de pago"
        paymentBC -> paymentDB "Store and update data"
        
        
        # Relationships Payment Bounded Context
        apiGateway -> paymentController "Request POST del endpoint del payment"
        paymentController -> paymentQueryService "Call service method"
        paymentController -> paymentCommandService "Call service method"

        paymentQueryService -> paymentQuery "Handle query"
        paymentQueryService -> paymentRepository "Call repository method"

        paymentCommandService -> paymentCommand "Handle command"
        paymentCommandService -> paymentRepository "Call repository method"
        paymentCommandService -> walletApiExternalService "Call external service method"
        
        paymentRepository -> paymentDB "Store, update, delete and fetch records - payment" "SQL transaction"
        
    }
    views {
        systemContext ecoTuna "EcoTunaSystemContext" "Diagrama de Contexto de EcoTuna" {
            include *
            autoLayout 
        }
        container ecoTuna "EcoTunaContainer" "Diagrama de Contexto de EcoTuna"{
            include *
            autoLayout
        }
        component paymentBC "paymentComponent" "Diagrama de Componentes PaymentBC"{
            include *
            autoLayout tb
        }
        
        styles {
            element BusinessOwner {
                shape Person
                background #3068F0
                color #FFFFFF
            }
            element "Container" {
                background #002A8D
                color #FFFFFF
            }
            element MobileApp {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element BoundedContext {
                shape Component
                background #196C37
                color #FFFFFF
            }
            element Database {
                shape Cylinder
                background #752375
                color #FFFFFF
            }
            element "ApiGateway" {
                shape Pipe
                background #884A39
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
            element "Group" {
                color #9a0000
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}