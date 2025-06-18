workspace "KanchitaUPC" "Software for booking football pitch" {

    model {
        /* Definición */
        ownerPitch = person "Owner Pitch" "Person who is owner of Pitch" "OwnerPitch"
        footballPlayer = person "Soccer player" "Person who soccer player" "FootballPlayer"
        kanchitaUpc = softwareSystem "Kanchita.UPC" "Software that allows the rental of soccer fields" "KanchitaUpc" {
            webApplication = container "Web Application" "Front in Browser" "React.js v18.2" "WebApplication"
            landingPage = container "Landing Page" "Application marketing page" "Bootstrap v5.3.3" "LandingPage"
            apiGateway = container "Api Gateway" "manager that accepts all API calls" "Amazon API Gateway" "ApiGateway"
            loginBc = container "Login Bounded Context" "Sign in, sign Up, sign out and login App" "Laravel PHP" "LoginBc"
            paymentBc = container "Payment Bounded Context" "Football pitch reservation payments" "Laravel PHP" "LoginBc"
            bookingBc = container "Booking Bounded Context" "Booking a pitch" "Laravel PHP" "BookingBc" {
                group "booking" {
                    bookingEntity = component "Booking Entity" "Entity for Booking" "Class" "BookingEntity, Entity"
                    bookingRepository = component "Booking Repository" "Abstract for reposity Booking" "Interface" "BookingRepository, Repository"
                    bookingQuery = component "Booking Query" "Query for read entity Booking" "Record" "BookingQuery, Query"
                    bookingCommand = component "Booking Command" "Command for create, update and delete entity Booking" "Record" "BookingCommand, Command"
                    bookingCommandService = component "Booking CommandService" "Business Login for create, update and delete entity Booking" "Interface and Class" "BookingCommandService, Service"
                    bookingQueryService = component "Booking QueryService" "Business Login for read entity Booking" "Interface and Class" "BookingQueryService, Service"
                }
                group "pitch" {
                    pitchEntity = component "Pitch Entity" "Entity for Pitch" "Class" "PitchEntity, Entity"
                    pitchRepository = component "Pitch Repository" "Abstract for reposity Pitch" "Interface" "PitchRepository, Repository"
                    pitchQuery = component "Pitch Query" "Query for read entity Pitch" "Record" "PitchQuery, Query"
                    pitchQueryService = component "Pitch QueryService" "Business Login for read entity Pitch" "Interface and Class" "PitchQueryService, Service"
                }
                group "player" {
                    playerEntity = component "Player Entity" "Entity for Player" "Class" "PlayerEntity, Entity"
                }
                bookingController = component "Booking Controller" "RESTful API for Booking" "Class" "BookingController, Controller"
            }   
            database = container "Database" "Store data of app" "PostgreSQL v16.3" "Database"
        }
        googleMapApi = softwareSystem "Google Map Api" "API that returns maps" "GoogleMapApi"
        yapeApi = softwareSystem "Yape Api" "Electronic wallet via QR" "yapeApi"
        
        /* Relationship */
        ownerPitch -> kanchitaUpc "Use"
        footballPlayer -> kanchitaUpc "Use"
        kanchitaUpc -> googleMapApi "Consume"
        kanchitaUpc -> yapeApi "Consume"
        
        /* Relation Ship kanchitaUpc */
        ownerPitch -> webApplication "Use"
        footballPlayer -> webApplication "Use"
        footballPlayer -> landingPage "Use"
        
        webApplication -> apiGateway "Call Api"
        landingPage -> webApplication "Redirect"
        
        apiGateway -> loginBc "Call Api"
        apiGateway -> bookingBc "Call Api"
        apiGateway -> paymentBc "Call Api"
        
        loginBc -> database "Query"
        bookingBc -> database "Query"
        paymentBc -> database "Query"
        
        webApplication -> googleMapApi "Call Api"
        paymentBc -> yapeApi "Call Api"
        
        /* Relation Ship bookingBc */
        apiGateway -> bookingController "Request endpoints"
        
        bookingController -> bookingCommandService "Call service method"
        bookingController -> bookingQueryService "Call service method"
        bookingController -> pitchQueryService "Call service method"

        bookingCommandService -> bookingCommand "Handle command"
        bookingCommandService -> bookingRepository "Call repository method"
        bookingCommandService -> bookingEntity "Use entity"
        
        bookingQueryService -> bookingQuery "Handle query"
        bookingQueryService -> bookingRepository "Call repository method"
        bookingQueryService -> bookingEntity "Use entity"
        
        pitchQueryService -> pitchQuery "Handle query"
        pitchQueryService -> pitchRepository "Call repository method"
        pitchQueryService -> pitchEntity "Use entity"

        bookingRepository -> database "Store, read, update and delete record"
        bookingRepository -> bookingEntity "Use entity"
        
        pitchRepository -> database "Store, read, update and delete record"
        pitchRepository -> pitchEntity "Use entity"
        
        bookingQuery -> playerEntity "Use entity"
        
    }
    views {
        systemContext kanchitaUpc "kanchitaUpcSystemContext" {
            include *
            autoLayout
        }
        container kanchitaUpc "kanchitaUpcContainer" {
            include *
            autoLayout
        }
        component bookingBc "bookingBcComponent" {
            include *
            autoLayout
        }
        styles {
            element "Person" {
                shape Person
                background #9D1444
                color #FFFFFF
            }
            element "KanchitaUpc" {
                background #218F40
                color #F5EB2C
                shape RoundedBox
            }
            element "Software System" {
                background #6048F5
                color #FFFFFF
            }
            element "WebApplication" {
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
                background Orange
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
            element "Database" {
                shape Cylinder
                background #306792
                color #FFFFFF
            }
            element "Container" {
                shape Hexagon
                background #805B17
                color #FFFFFF
            }
            element "Group:booking" {
                color #FF0000
            }
            element "Group:pitch" {
                color #0F9800
            }
            element "Group:player" {
                color #0000FF
            }
            
        }
    }

    configuration {
        scope softwaresystem
    }

}
