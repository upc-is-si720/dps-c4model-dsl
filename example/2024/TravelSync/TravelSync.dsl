workspace "TravelSync" "Software to organize group trips" {
    model {
    /*Definition*/
        travelerUser = person "Traveler User" "Person who will make the trip" "Traveler User"
        admin = person "Admin" "Person in charge of managing the software" "Admin"
        travelSync = softwareSystem "Travel Sync" "Software that allows you to organize and coordinate group trips" "TravelSync"{
            mobileApplication = container "Mobile Application" "Front in Browser" "React.js v18.2" "WebApplication"
            landingPage = container "Landing Page" "Application marketing page" "tailwindcss v3.3.3" "LandingPage"
            apiGateway = container "Api Gateway" "manager that accepts all API calls" "Amazon API Gateway" "ApiGateway"
            
            userRegisterBC = container "User Register Bounded Context" "Sign in, sign Up, sign out and login App" "Laravel PHP" "UserRegisterBC" {
                travelerEntity = component "traveler Entity" "Entity for traveler" "Class" "TravelerEntity, Entity"
                travelerRepository = component "Traveler Repository" "Abstract for reposity Traveler" "Interface" "TravelerRepository, Repository"
                travelerQuery = component "Traveler Query" "Query for read entity traveler" "Record" "TravelerQuery, Query" 
                travelerCommand = component "Traveler Command" "Command for create, update and delete entity traveler" "Record" "TravelerCommand, Command"
                travelerCommandService = component "Traveler CommandService" "Business Login for create, update and delete entity Traveler" "Interface and Class" "TraveleCommandService, Service"
                travelerQueryService = component "Traveler QueryService" "Traveler Login for read entity Traveler" "Interface and Class" "TravelerQueryService, Service"
                travelerController = component "Traveler Controller" "RESTful API for Traveler" "Class" "TravelerController, Controller"
            }
            travelRegisterBC = container "Travel Register Bounded Context" "Creation of a group trip" "Laravel PHP" "TravelRegisterBC"{
                group "travel" {
                    travelEntity = component "Travel Entity" "Entity for Travel" "Class" "TravelEntity, Entity"
                    travelRepository = component "Travel Repository" "Abstract for reposity Travel" "Interface" "TravelRepository, Repository"
                    travelQuery = component "Travel Query" "Query for read entity Travel" "Record" "TravelQuery, Query"
                    travelCommand = component "Travel Command" "Command for create, update and delete entity Travel" "Record" "TravelCommand, Command"
                    travelCommandService = component "Travel CommandService" "Business Login for create, update and delete entity Travel" "Interface and Class" "TravelCommandService, Service"
                    travelQueryService = component "Travel QueryService" "Business Login for read entity Travel" "Interface and Class" "TravelQueryService, Service"
                }
                group "destinationPlace" {
                    destinationPlaceEntity = component "DestinationPlace Entity" "Entity for DestinationPlace" "Class" "DestinationPlaceEntity, Entity"
                    destinationPlaceRepository = component "DestinationPlace Repository" "Abstract for reposity DestinationPlace" "Interface" "DestinationPlaceRepository, Repository"
                    destinationPlaceQuery = component "DestinationPlace Query" "Query for read entity DestinationPlace" "Record" "DestinationPlaceQuery, Query"
                    destinationPlaceQueryService = component "DestinationPlace Query Service" "Business Login for read entity DestinationPlace" "Interface and Class" "DestinationPlaceQueryService, Service"
                }
                
                travelController = component "Travel Controller" "RESTful API for Travel" "Class" "TravelController, Controller"
            }
            memberManagementeBC = container "Member Managemente Bounded Context" "Management of travel partners" "Laravel PHP" "MemberManagementeBC" {
                group "partner" {
                    partnerEntity = component "Partner Entity" "Entity for Partner" "Class" "PartnerEntity, Entity"
                    partnerRepository = component "Partner Repository" "Abstract for reposity Partner" "Interface" "PartnerRepository, Repository"
                    partnerQuery = component "Partner Query" "Query for read entity Partner" "Record" "PartnerQuery, Query"
                    partnerCommand = component "Partner Command" "Command for create and delete entity Partner" "Record" "PartnerCommand, Command"
                    partnerCommandService = component "Partner CommandService" "Business Login for create, update and delete entity Partner" "Interface and Class" "PartnerCommandService, Service"
                    partnerQueryService = component "Partner QueryService" "Business Login for read entity Partner" "Interface and Class" "PartnerQueryService, Service"
                }
                group "partnerRecord" {
                    partnerRecordEntity = component "PartnerRecord Entity" "Entity for PartnerRecord" "Class" "PartnerRecordEntity, Entity"
                    partnerRecordRepository = component "PartnerRecord Repository" "Abstract for reposity PartnerRecord" "Interface" "PartnerRecordRepository, Repository"
                    partnerRecordQuery = component "PartnerRecord Query" "Query for read entity PartnerRecord" "Record" "PartnerRecordQuery, Query"
                    partnerRecordCommand = component "PartnerRecord Command" "Command for create and delete entity PartnerRecord" "Record" "PartnerRecordCommand, Command"
                    partnerRecordCommandService = component "PartnerRecord CommandService" "Business Login for create, update and delete entity PartnerRecord" "Interface and Class" "PartnerRecordCommandService, Service"
                    partnerRecordQueryService = component "PartnerRecord QueryService" "Business Login for read entity PartnerRecord" "Interface and Class" "PartnerRecordQueryService, Service"
                }
                
                partnerController = component "Partner Controller" "RESTful API for Partner" "Class" "partnerController, Controller"    
                partnerRecordController = component "PartnerRecord Controller" "RESTful API for PartnerRecord" "Class" "PartnerRecordController, Controller"    
            
            }
            intineraryRegisterBC = container "Intinerary Register Bounded Context" "Registration of travel itineraries" "IntineraryRegisterBC"{
                group "itinerary" {
                    itineraryEntity = component "Itinerary Entity" "Entity for itinerary" "Class" "itineraryEntity, Entity"
                    itineraryRepository = component "Itinerary Repository" "Abstract for reposity itinerary" "Interface" "ItineraryRepository, Repository"
                    itineraryQuery = component "Itinerary Query" "Query for read entity Itinerary" "Record" "ItineraryQuery, Query"
                    itineraryCommand = component "Itinerary Command" "Command for create and delete entity Itinerary" "Record" "ItineraryCommand, Command"
                    itineraryCommandService = component "Itinerary CommandService" "Business Login for create, update and delete entity Itinerary" "Interface and Class" "ItineraryCommandService, Service"
                    itineraryQueryService = component "Itinerary QueryService" "Business Login for read entity Itinerary" "Interface and Class" "ItineraryQueryService, Service"
                }
                itineraryController = component "Itinerary Controller " "Restful API for Itinerary" "Class" "ItineraryController, Controller" 
            }
            expenseCostBC = container "Expense Cost Bounded Context" "Travel Expense and Cost Record" "ExpenseCostBC"{
                group "travelManagement" {
                    travelManagementEntity = component "TravelManagement Entity" "Entity for TravelManagement" "Class" "TravelManagementEntity, Entity"
                    travelManagementRepository = component "TravelManagement Repository" "Abstract for reposity TravelManagement" "Interface" "TravelManagementRepository, Repository"
                    travelManagementQuery = component "TravelManagement Query" "Query for read entity TravelManagement" "Record" "TravelManagementQuery, Query"
                    travelManagementCommand = component "TravelManagement Command" "Command for create and delete entity TravelManagement" "Record" "TravelManagementCommand, Command"
                    travelManagementCommandService = component "TravelManagement CommandService" "Business Login for create, update and delete entity TravelManagement" "Interface and Class" "TravelManagementCommandService, Service"
                    travelManagementQueryService = component "TravelManagement QueryService" "Business Login for read entity TravelManagement" "Interface and Class" "TravelManagementQueryService, Service"
                }
                group "budget"{
                    budgetEntity = component "BudgetManagement Entity" "Entity for Budget" "Class" "BudgetEntity, Entity"
                    budgetRepository = component "Budget Repository" "Abstract for reposity Budget" "Interface" "BudgetRepository, Repository"
                }
                group "totalCost"{
                    totalCostEntity = component "totalCost Entity" "Entity for totalCost" "Class" "totalCostEntity, Entity"
                    totalCostRepository = component "totalCost Repository" "Abstract for reposity totalCost" "Interface" "totalCostRepository, Repository"
                }
                
                travelManagementController = component "TravelManagement Controller " "Restful API for Itinerary" "Class" "ItineraryController, Controller" 
                 
            }
            paymentBC = container "Record Payment Bounded Context" "Record Payment of trip members" "RecordPaymentBC"{
                group "creditCard"{
                    creditCardEntity = component "CreditCard Entity" "Entity for CreditCard" "Class" "CreditCardEntity, Entity"
                    creditCardRepository = component "CreditCard Repository" "Abstract for reposity CreditCard" "Interface" "CreditCardRepository, Repository"
                    creditCardQuery = component "CreditCard Query" "Query for read entity CreditCard" "Record" "CreditCardQuery, Query" 
                    creditCardCommand = component "CreditCard Command" "Business Login for create, update and delete entity CreditCard" "CreditCardCommand, Command"
                    creditCardQueryService = component "CreditCard QueryService" "CreditCard Login for read entity Booking" "Interface and Class" "CreditCardQueryService, Service"
                    creditCardCommandService = component "CreditCard CommandService" "Command for create, update and delete entity CreditCard" "Record" "CreditCardCommandService, Service"
                    
                }
                
                group "api" {
                    plinApicomponent = component "PlinApi component" "Electronic wallet via QR" "PlinApiComponent, Service"
                    yapeApicomponent = component "YapeApi component" "Electronic wallet via QR" "PlinApiComponent, Service"
                    cardApicomponent = component "CardApi component" "Electronic wallet via QR" "PlinApiComponent, Service"
                }
                
                creditCardController = component "CreditCard Controller " "Restful API for CreditCard" "Class" "CreditCardController, Controller"
            }
            travelHistoryBC = container "TravelHistoryBC" "History of all trips made by the user" "TravelHistoryBC"{
                travelHistoryControler = component "Travel History Controler" "RESTful API for Booking" "Class" "travelHistoryControler, Controller"
                travelHistoryEntity = component "Travel History Entity" "Entity for Travel History" "Class" "TravelHistoryEntity, Entity"
                travelHistoryRepository = component "Travel History Repository" "Abstract for reposity Travel History" "Interface" "travelHistoryRepository, Repository"
                travelHistoryQuery = component "Traveler History Query" "Query for read entity traveler" "Record" "TravelHistoryQuery, Query" 
                travelHistoryQueryService = component "Traveler QueryService" "Traveler Login for read entity Booking" "Interface and Class" "TravelHistoryQueryService, Service"
                travelHistoryCommandService = component "Traveler CommandService" "Command for create, update and delete entity traveler" "Record" "TravelerCommandService, Service"
                travelHistoryCommand = component "Traveler Command" "Business Login for create, update and delete entity Travele" "Interface and Class" "TraveleCommand, Command"
            }
            
            database = container "Database" "Store data of app" "PostgreSQL v16.3" "Database"
        }
        plinApi = softwareSystem "Plin Api" "Electronic wallet via QR" "plinApi"
        yapeApi = softwareSystem "Yape Api" "Electronic wallet via QR" "yapeApi"
        cardApi = softwareSystem "Card Api" "Electronic wallet via QR" "cardApi"
        smsApi = softwareSystem "SMS Api" "Send and receive SMS in real time the status of sent messages." "smsApi"
        
        /*Relation System Context*/
        travelerUser -> travelSync "Use"
        admin -> travelSync "Use"
        travelSync -> plinApi "Consume"
        travelSync -> yapeApi "Consume"
        travelSync -> cardApi "Consume"
        travelSync -> smsApi "Consume"
        
        /* Relation Container*/
        travelerUser -> landingPage "Use"
        landingPage -> mobileApplication "Redirect"
        travelerUser -> mobileApplication "Use"
        admin -> mobileApplication "Use" 
        
        mobileApplication -> apiGateway "Call Api"
        mobileApplication -> smsApi "Call Api"
        
        apiGateway -> userRegisterBC "Call Api"
        apiGateway -> travelRegisterBC "Call Api"
        apiGateway -> memberManagementeBC "Call Api"
        apiGateway -> intineraryRegisterBC "Call Api"
        apiGateway -> expenseCostBC "Call Api"
        apiGateway -> paymentBC "Call Api"
        apiGateway -> travelHistoryBC "Call Api"
        
        userRegisterBC -> database "Query"
        travelRegisterBC -> database "Query"
        memberManagementeBC -> database "Query"
        intineraryRegisterBC -> database "Query"
        expenseCostBC -> database "Query"
        paymentBC -> database "Query"
        travelHistoryBC -> database "Query"
        
        
        paymentBC -> plinApi "Call Api"
        paymentBC -> yapeApi "Call Api"
        paymentBC -> cardApi "Call Api"
        
        /* Relation Component User Register*/
        apiGateway -> travelerController "Request endpoints" 
        travelerController -> travelerQueryService "Call service method"
        travelerController -> travelerCommandService "Call service method"
        TravelerCommandService -> travelerCommand "Handle command"
        travelerCommandService -> travelerRepository "Call repository method" 
        travelerCommandService -> travelerEntity "Use entity"
        
        travelerQueryService -> travelerQuery "Handle query"
        travelerQueryService -> travelerRepository "Call repository method"
        travelerQueryService -> travelerEntity "Use entity"
        travelerRepository -> database "Store, read, update and delete record"
        travelerRepository -> travelerEntity "Use entity"
        
        /* Relation Ship travelerRegisterBc */
        apiGateway -> travelController "Request endpoints"
        
        travelController -> travelCommandService "Call service method"
        travelController -> travelQueryService "Call service method"
        travelController -> destinationPlaceQueryService "Call service method"

        travelCommandService -> travelCommand "Handle command"
        travelCommandService -> travelRepository "Call repository method"
        travelCommandService -> travelEntity "Use entity"
        
        travelQueryService -> travelQuery "Handle query"
        travelQueryService -> travelRepository "Call repository method"
        travelQueryService -> travelEntity "Use entity"
        
        destinationPlaceQueryService -> destinationPlaceQuery "Handle query"
        destinationPlaceQueryService -> destinationPlaceRepository "Call repository method"
        destinationPlaceQueryService -> destinationPlaceEntity "Use entity"

        travelRepository -> database "Store, read, update and delete record"
        travelRepository -> travelEntity "Use entity"
        
        destinationPlaceRepository -> database "Store, read, update and delete record"
        destinationPlaceRepository -> destinationPlaceEntity "Use entity"
        
        travelQuery -> travelerEntity "Use entity"
        
        /* Relation Component MemberManagementeBC*/
        
        apiGateway -> partnerController "Request endpoints"
        apiGateway -> PartnerRecordController "Request endpoints"
        
        partnerController -> partnerCommandService "Call service method"
        partnerController -> partnerQueryService "Call service method"
        
        PartnerRecordController -> partnerRecordCommandService "Call service method"
        PartnerRecordController -> partnerRecordQueryService "Call service method"
        

        partnerCommandService -> partnerCommand "Handle command"
        partnerCommandService -> partnerRepository "Call repository method"
        partnerCommandService -> partnerEntity "Use entity"
        
        partnerQueryService -> partnerQuery "Handle query"
        partnerQueryService -> partnerRepository "Call repository method"
        partnerQueryService -> partnerEntity "Use entity"
        
        partnerRecordCommandService -> partnerRecordCommand "Handle command"
        partnerRecordCommandService -> partnerRecordRepository "Call repository method"
        partnerRecordCommandService -> partnerRecordEntity "Use entity"
        
        partnerRecordQueryService -> partnerRecordQuery "Handle query"
        partnerRecordQueryService -> partnerRecordRepository "Call repository method"
        partnerRecordQueryService -> partnerRecordEntity "Use entity"
        
        partnerRepository -> partnerEntity "Use entity"
        partnerRecordRepository -> partnerRecordEntity "Use entity"
       
        partnerRecordRepository -> database "Store, read, update and delete record"
        partnerRepository -> database "Store, read, update and delete record"
        
        
        
        partnerQuery -> travelerEntity "Use entity"
        
        /* Relation Ship ItineraryRegisterBc */
        apiGateway -> itineraryController "Request endpoints" 
        itineraryController -> ItineraryCommandService "Call service method"
        itineraryController -> ItineraryQueryService "Call service method"
        itineraryController -> destinationPlaceQueryService "Call service method"

        ItineraryCommandService -> ItineraryCommand "Handle command"
        ItineraryCommandService -> ItineraryRepository "Call repository method"
        ItineraryCommandService -> ItineraryEntity "Use entity"
        
        ItineraryQueryService -> ItineraryQuery "Handle query"
        ItineraryQueryService -> ItineraryRepository "Call repository method"
        ItineraryQueryService -> ItineraryEntity "Use entity"
        
        ItineraryRepository ->  database "Store, read, update and delete record"
        
        /* Relation Ship  ExpenseCostBC*/
        apiGateway -> travelManagementController "Endpoint request -  travelManagement" "HTTP(S) / JSON"
        
        travelManagementController -> travelManagementCommandService "Call service method"
        travelManagementController -> travelManagementQueryService "Call service method"
        
        travelManagementCommandService -> travelManagementCommand Handle command"
        travelManagementCommandService -> travelManagementRepository "Call repository method"
        travelManagementCommandService -> travelManagementEntity "Use entity"
        travelManagementQueryService -> travelManagementQuery "Handle query"
        travelManagementQueryService -> travelManagementRepository "Call repository method"
        travelManagementQueryService -> travelManagementEntity "Use entity"
        
        travelManagementCommandService -> budgetRepository "Call repository method"
        travelManagementCommandService -> budgetEntity "Use entity"
        travelManagementCommandService -> totalCostRepository "Call repository method"
        travelManagementCommandService -> totalCostEntity "Use entity"
        
        travelManagementQueryService -> totalCostRepository "Call repository method"
        travelManagementQueryService -> totalCostEntity "Use entity"
        travelManagementQueryService -> budgetRepository "Call repository method"
        travelManagementQueryService -> budgetEntity "Use entity"
        
        totalCostRepository -> totalCostEntity "Methods call" "POO"
        budgetRepository -> budgetEntity "Methods call" "POO"
        
        travelManagementRepository -> database "Store, read, update and delete record"
        totalCostRepository -> database "Store, read, update and delete record"
        budgetRepository -> database "Store, read, update and delete record"
        
        travelManagementRepository -> travelManagementEntity "Use entity"
        
         /* Relation Component paymentBC*/
         apiGateway -> creditCardController "Request endpoints"
         
        creditCardController -> creditCardCommandService "Call service method"
        creditCardController -> creditCardQueryService "Call service method"
         
        creditCardCommandService -> creditCardCommand Handle command"
        creditCardCommandService -> creditCardRepository "Call repository method"
        creditCardCommandService -> creditCardEntity "Use entity"
        
        creditCardQueryService -> creditCardQuery "Handle query"
        creditCardQueryService -> creditCardRepository "Call repository method"
        creditCardQueryService -> creditCardEntity "Use entity"
        creditCardRepository -> creditCardEntity "Methods call" "POO"
        
        creditCardCommandService -> cardApiComponent "Call repository method"
        creditCardCommandService -> yapeApiComponent "Call repository method"
        creditCardCommandService -> plinApiComponent "Call repository method"
        
        creditCardQueryService -> cardApiComponent "Call repository method"
        creditCardQueryService -> yapeApiComponent "Call repository method"
        creditCardQueryService -> plinApiComponent "Call repository method"
        
        
        cardApiComponent -> cardApi
        yapeApiComponent -> yapeApi
        plinApiComponent -> plinApi
        
        creditCardRepository -> database "Store, read, update and delete record"
        
        
        /* Relation Component Travel History*/
        apiGateway -> travelHistoryControler "Request endpoints"
        travelHistoryControler -> travelHistoryQueryService "Call service method"
        travelHistoryControler -> travelHistoryCommandService "Call service method"
        
        travelHistoryQueryService -> travelHistoryQuery "Handle Query"
        travelHistoryQueryService -> travelHistoryRepository "Call repository method"
        travelHistoryQueryService -> travelHistoryEntity "User Entity"
        travelHistoryCommandService -> travelHistoryCommand "Handle"
        travelHistoryCommandService -> travelHistoryRepository "Call service method"
        travelHistoryCommandService -> travelHistoryEntity "Call service method"
        travelHistoryRepository -> travelHistoryEntity "User Entity"
        
        travelHistoryRepository -> database "Store, read, update and delete record"
        
        
    }
    
    views {
        systemContext travelSync "travelSyncSystemContext" {
            include *
            autoLayout
        }
        container travelSync "travelSyncContainer" {
            include *
            autoLayout
        }
        
        component  userRegisterBC " userRegisterBcComponent" {
            include *
            autoLayout
        }
        component  travelRegisterBC "travelRegisterBcComponent" {
            include *
            autoLayout
        }
        component  memberManagementeBC "memberManagementeBcComponent" {
            include *
            autoLayout
        }
         component  intineraryRegisterBC "itineraryRegisterBcComponent" {
            include *
            autoLayout
        }
        component  expenseCostBC " ExpenseCostBcComponent" {
            include *
            autoLayout
        }
         component  travelHistoryBC " TravelHistoryBcComponent" {
            include *
            autoLayout
        }
         component  paymentBC " PaymentBcComponent" {
            include *
            autoLayout
        }
        
        
        styles {
            element "Person" {
                shape Person
                background #394FBB
                color #2A2C33
            }
            element "TravelSync" {
                background #00E568
                color #2B332E
                shape RoundedBox
            }
            element "Software System" {
                background #E00084
                color #332B2F
            }
            element "LandingPage" {
                shape WebBrowser
                background #E65715
                color #FFFFFF
            }
            element "WebApplication" {
                shape MobileDevicePortrait
                background #15E6A8
                color #332B2F
                icon https://static.structurizr.com/themes/amazon-web-services-2020.04.30/Amazon-EC2_D2-Instance_light-bg@4x.png
            }
            element "ApiGateway" {
                shape Pipe
                background Orange
            }
            element "Container" {
                shape Hexagon
                background #661316
                color #FFFFFF
            }
            element "Database" {
                shape Cylinder
                background #306792
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
            
        }
    }
    configuration {
        scope softwaresystem
    }

}