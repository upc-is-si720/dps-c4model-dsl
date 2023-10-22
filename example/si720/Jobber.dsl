workspace "Jobber" "System to connect students and companies" {

    model {

        student = person "University student" "person who wants to find a job" "Student"
        company = person "Businessman" "person who has a company and wants a worker" "Businessman"
        manager = person "Manager system" "Person who administers and supports the system" "Manager"

        jobberSystem = softwareSystem "Jobber" "System to connect students and companies" "JobberSystem" {

            webApplication = container "Web Application" "Frontend of application" "CSS/Java Script" "WebApp"
            mobileApp = container "Mobile Application" "Android & iOS mobile" "Kotlin / Swift" "MobileApp"
            database = container "Database" "Database of Application" "SQL Server" "Database"

            dataManagementBC = container "Data Management Context" "Api RESTful of Manage data of the Enterprise" "Java v17 / Spring v3" "DataManagement,BoundedContext"{

                usermnController = component "User controller" "REST Controller ofor Account" "Java v17 / Spring Web" "UsermnController,Controller"
                usermnService = component "User Service" "Business Login for Account" "Java v17 / Spring Data" "UsermnService,Service"
                usermnPublications = component "Business Publicacitons" "Job Postings " "Java v17 / Spring Data" "UsermnPublications,Repository"

                studentmnRepository = component "Student Repository" "Method for Access to Student Table" "Java v17 / Spring Data" "StudentmnRepository,Repository"
                exammnRepository = component "Examn Repository" "Method for Access to Examns Table" "Java v17 / Spring Data" "ExammnRepository,Repository"
            }

            evaluationProcessBC = container "Evaluation Process Context" "Api RESTful of How the Enterprise make his evaluations" "Java v17 / Spring v3" "EvaluationProcess,BoundedContext"{

                userevController = component "User evaluation controller" "REST Controller ofor Process" "Java v17 / Spring Web" "UserevController,Controller"
                userevService = component "User evaluation Service" "Business Login for Account" "Java v17 / Spring Data" "UserevService,Service"
                businessevRepository = component "Business Repository" "Method for Access to Business Table" "Java v17 / Spring Data" "BusinessevRepository,Repository"
                examRepository = component "Exam Repository" "Method for acces to Exam Table" "Java v17 / Spring Data" "ExamRepository,Repository"
                testRepository = component "Test Repository" "Method for acces to Test Table" "Java v17 / Spring Data" "TestRespository,Repository"

            }
            postulationProcessBC = container "Postulation Process Context" "Api RESTful of How the students make his postulations process" "Java v17 / Spring v3" "PostulationProcess,BoundedContext"{
                userpostController = component "User Postulation controller" "REST Controller ofor Process" "Java v17 / Spring Web" "UserevController,Controller"
                userpostService = component "User Postulation Service" "Business Login for Account" "Java v17 / Spring Data" "UserevService,Service"
                studentpostRepository = component "Student Repository" "Method for Access to Student Table" "Java v17 / Spring Data" "StudentpostRepository,Repository"
                searchRepository = component "Search for job offers Repository" "Method for Access to Search for offers Table" "Java v17 / Spring Data" "SearchRepository,Repository"
                requestRepository = component "Job Application Repository" "Method for Access to Job Application Table" "Java v17 / spring Data" "RequestRepository,Repository"
            }
            apiGateway = container "Api Gateway" "General Access Control for API Calls" "Spring Cloud Gateway" "ApiGateway"
            signUpProcessBC = container "Sign Up and Sign In Process Context" "Api RESTful of How to Sign Up and Sign In" "Java v17 / Spring v3" "SignUpProcess,BoundedContext"{

                userinController = component "User controller" "REST Controller ofor Account" "Java v17 / Spring Web" "UserinController,Controller"
                userinService = component "User Service" "Business Login for Account" "Java v17 / Spring Data" "UserinService,Service"
                userinRepository = component "User Repository" "Method for Access to User Table" "Java v17 / Spring Web" "UserinRepository,Repository"
                gmailinComponent  = component "Gmail Component" "Gmail User" "Java v17" "GmailinComponent"

                studentinRepository = component "Student Repository" "Method for Access to Student Table" "Java v17 / Spring Data" "StudentRepository,Repository"
                businessinRepository = component "Business Repository" "Method for Access to Business Table" "Java v17 / Spring Data" "BusinessRepository,Repository"

            }

        }

        # APIs for Jobber | System Context

        gmailSystem = softwareSystem "Gmail" "Gmail user" "Gmail"
        photosSystem = softwareSystem "Photos" "Google Photos" "Photos"
        storageSystem = softwareSystem "Indexeddb" "Save data" "Indexeddb"
        excelSystem = softwareSystem "Excel" "View data" "Excel"
        adobeSystem = softwareSystem "Adobe" "PDF reader" "Adobe"
        googleMapsSystem = softwareSystem "Google Maps" "Maps view" "GoogleMaps"

        # Relationships between user and software systems | System Context

        student -> jobberSystem "postulate and find job vacancies"
        company -> jobberSystem "create job vacancies and find workers"
        manager -> jobberSystem "manage and configure the system"


        # Relationships between APIs and software systems | System Context

        jobberSystem -> gmailSystem "Register and Authenticate user"
        jobberSystem -> photosSystem "Save pictures from the students"
        jobberSystem -> storageSystem "Save data from students"
        jobberSystem -> excelSystem "View data from students"
        jobberSystem -> adobeSystem "View PDF from students"
        jobberSystem -> googleMapsSystem "View GPS for students"


        # Relationships between user and application | Jobber Container

        student -> webApplication "Use the web Application"
        company -> webApplication "Use the web"
        manager -> webApplication "Use the web for manager"
        student -> mobileApp "use the mobile app" "Http/Https"
        company -> mobileApp "use the mobile app" "Http/Https"


        # Applications | Jobber Container

        webApplication -> apiGateway "Call the endpoint from API REST"
        mobileApp -> apiGateway "Call the endpoint from API REST"


        # Process | Jobber Container

        apiGateway -> dataManagementBC "Call the endpoints of BC"
        apiGateway -> evaluationProcessBC "Call the endpoints of BC"
        apiGateway -> postulationProcessBC "Call the endpoints of BC"
        apiGateway -> signUpProcessBC "Call the endpoints of BC"


        # Relationships between Process and APIs

        signUpProcessBC -> database "Store,view, update and delete record"
        signUpProcessBC -> gmailSystem "Validate information"
        signUpProcessBC -> photosSystem "Save photos"

        dataManagementBC -> database "Store, view, update and delete record"
        dataManagementBC -> storageSystem "Save data"
        dataManagementBC -> excelSystem "View data"
        dataManagementBC -> adobeSystem "View PDF"

        evaluationProcessBC -> database "Store, view, update and delete record"
        evaluationProcessBC -> adobeSystem "View PDF"

        postulationProcessBC -> database "Store, view, update and delete record"
        postulationProcessBC -> googleMapsSystem "View GPS for students"


        # signUpAndInProcessBC
        apiGateway -> userinController "Endpoint call" "JSON / HTTPS"
        userinController -> userinService "Call methods"
        userinService -> studentinRepository "Call methods"
        userinService -> businessinRepository "Call methods"
        userinService -> gmailinComponent "Call methods"
        gmailinComponent -> gmailSystem "Validate and get perfil information"
        userinService -> userinRepository "Call methods"
        userinRepository -> database "Store, view, update and delete record for user and Validate and get perfil information"
        studentinRepository -> database "Store, view, update and delete record for user and Validate and get perfil information"
        businessinRepository -> database "Store, view, update and delete record for user and Validate and get perfil information"

        # evaluationProcessBC
        apiGateway -> userevController "Endpoint call" "JSON / HTTPS"
        userevController -> userevService "Call methods"
        userevService -> examRepository "Call methods"
        userevService -> testRepository "Call methods"
        userevService -> businessevRepository "Call methods"
        testRepository -> adobeSystem "View in PDF Case Testing"
        businessevRepository -> database "Get record for business"
        examRepository -> database "Get record for Exams"
        testRepository -> database "Get record for Case Testing"

        # postulationProcessBC
        apiGateway -> userpostController "Endpoint call" "JSON / HTTPS"
        userpostController -> userpostService "Call methods"
        userpostService -> searchRepository "Call methods"
        userpostService -> requestRepository "Call methods"
        userpostService -> studentpostRepository "Call methods"
        searchRepository -> googleMapsSystem "View GPS for filter"
        studentpostRepository -> database "Get record for business"
        searchRepository -> database "Get record for Exams"
        requestRepository -> database "Get record for Case Testing"

        # dataManagementBC

        apiGateway -> usermnController "Endpoint call" "JSON / HTTPS"
        usermnController -> usermnService "Call methods"
        usermnService -> usermnPublications  "Call methods"
        usermnPublications -> exammnRepository "Call methods"
        usermnPublications -> studentmnRepository "Call methods"
        exammnRepository -> database "Store, view, update and delete record for user and Validate and get perfil information"
        studentmnRepository -> adobeSystem "View PDF from students"
        studentmnRepository -> excelSystem "View data from students"
        studentmnRepository -> storageSystem "View data from students"
        studentmnRepository -> googleMapsSystem "Maps View"
        studentmnRepository -> database "Store, view, update and delete record for user and Validate and get perfil information"


    }
    views {
        systemcontext jobberSystem "SystemContext"{
            include *
            animation {
                student
                jobberSystem
            }
            autoLayout
        }
        container jobberSystem "ContainerSystem"{
            include *
            animation {
                student
                webApplication
                apiGateway
                database
            }
            autoLayout
        }
        component signUpProcessBC "signUpProcessBC"{
            include *
            autoLayout
        }
        component evaluationProcessBC "evaluationProcessBC"{
            include *
            autoLayout
        }
        component postulationProcessBC "postulationProcessBC"{
            include *
            autoLayout
        }
        component dataManagementBC "dataManagementBC"{
            include *
            autoLayout
        }
        styles {
            element "Person"{
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Controller"{
                background #F8C471
            }
            element "Service" {
                background #D6EAF8
            }
            element "Repository" {
                background #D7BDE2
            }
            element "Student" {
                background #2f2a4b
            }
            element "Businessman" {
                background #124652
            }
            element "Manager" {
                background #ac000d
                shape Robot
            }
            element JobberSystem {
                color #ffffff
                background #385170
            }
            element AccountBC {
                background #50BCDC
                shape folder
            }
            element SignUpProcess {
                background #50BCDC
                shape folder
            }
            element EvaluationProcess {
                background #50BCDC
                shape folder
            }
            element DataManagement {
                background #50BCDC
                shape folder
            }
            element PostulationProcess {
                background #50BCDC
                shape folder
            }
            element EvaluationProcess {
                background #50BCDC
                shape folder
            }
            element Database {
                background #2EA642
                color #ffffff
            }
            element ApiGateway {
                background #4BEAA2
            }
            element WebApp {
                background #3B3BE7
                color #ffffff
                shape WebBrowser
            }
            element MobileApp {
                background #3B3BE7
                color #ffffff
                shape MobileDevicePortrait
            }
            element "Gmail"{
                background #F0FF00
                color #000000
            }
            element "Photos"{
                background #233ADD
                color #ffffff
            }
            element "Indexeddb" {
                background #000000
                color #ffffff
            }
            element "Excel"{
                background #31A338
                color #ffffff
            }
            element "Adobe"{
                background #E22828
                color #ffffff

            }
            element "GoogleMaps"{
                background #2D9524
                color #ffffff
            }
            element *{
                background #000000
            }
        }
    }
}