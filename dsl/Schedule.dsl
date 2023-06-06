workspace "Schedule" "System to Schedule appointments at the University" {

    model {
        student = person "University Student" "Person who books or requests an appointment" "Student"
        teacher = person "University Teacher" "Person attends the appointment" "Teacher"
        manager = person "Manager System" "Person who administers and supports the system" "Manager"
        
        # Esto es un comentario
        scheduleSystem = softwareSystem "Schedule UPC" "System to Schedule appointments at the University" "ScheduleSystem" {
            webApplication = container "Web Application" "Frontend of Application" "Angular/Typescript" "WebApplication"
            mobileApp = container "Mobile Application" "Android and iOS Mobile" "Kotlin / Swift" "MobileApp"
            database = container "Database" "Database of Application" "SQL Server" "Database"
            
            accountBC = container "Account Bounded Context" "Api RESTful of Manage user account" "Java v17 / Spring v3" "AccountBC,BoundedContext" {
                userController = component "User Controller" "REST Controller ofor Account" "Java v17 / Spring Web" "UserController,Controller"
                userService = component "User Service" "Business Login for Account" "Java v17 / Spring Data" "UserService,Service"
                userRepository = component "User Repository" "Method for access to user table" "Java v17 / Spring Data" "UserRepository,Repository"
                gmailComponent = component "Gmail Component" "Gmail user" "Java v17" "GmailComponent"
                
                studentRepository  = component "Student Repository" "Method for access to student table" "Java v17 / Spring Data" "StudentRepository,Repository"
                teacherRepository  = component "Teacher Repository" "Method for access to teacher table" "Java v17 / Spring Data" "TeacherRepository,Repository"
            }
            crudPeopleBC = container "CRUD People Bounded Context" "Api RESTful of Manage crud of Student and Teacher" "Java v17 / Spring v3" "CrudPeopleBC,BoundedContext" 
            
            crudOtherBC = container "CRUD Othes Bounded Context" "Api RESTful of Manage crud of other class" "Java v17 / Spring v3" "CrudOtherBC,BoundedContext"
            coreScheduleBC = container "Schedule Bounded Context" "Api RESTful of Business Core of Schedule process" "Java v17 / Spring v3" "coreScheduleBC,BoundedContext"
            apiGateway = container "Api Gateway" "General access control for API calls" "Spring Cloud Gateway" "ApiGateway"
        }
        gmailSystem = softwareSystem "Gmail" "Gmail user" "Gmail"
        emailSystem = softwareSystem "Email provider" "Send email to student" "Email"

        student -> scheduleSystem "Book, cancel, reschedule appointments"
        teacher -> scheduleSystem "View, accept and cancel appointments"
        manager -> scheduleSystem "manage and configure the system"

        scheduleSystem -> gmailSystem "Register and Authenticate user"
        scheduleSystem -> emailSystem "Send email to student"

        student -> webApplication "Use the web Application for appointment"
        teacher -> webApplication "Use the web Application"
        manager -> webApplication "Use the web Application for manager"
        student -> mobileApp "use the Mobile App" "Http/Https"
        teacher -> mobileApp "use the Mobile App" "Http/Https"
        
        webApplication -> apiGateway "Call the endpoint from API REST"
        mobileApp -> apiGateway "Call the endpoint from API REST"
        
        apiGateway -> accountBC "Call the endpoints of BC"
        apiGateway -> crudPeopleBC "Call the endpoints of BC"
        apiGateway -> crudOtherBC "Call the endpoints of BC"
        apiGateway -> coreScheduleBC "Call the endpoints of BC"
        
        accountBC -> database "Store, view, update, delete record"
        accountBC -> gmailSystem "Validate and get Perfil information"
        crudPeopleBC -> database "Store, view, update, delete record"
        crudOtherBC -> database "Store, view, update, delete record"
        coreScheduleBC -> database "Store, view, update, delete record"
        coreScheduleBC -> emailSystem "Send email for notification"
        
        userController -> userService "Call methods" 
        userService -> userRepository "Call methods"
        userService -> studentRepository "Call methods"
        userService -> teacherRepository "Call methods"
        userRepository -> database "Store, view, update, delete record for user"
        studentRepository -> database "Get record for student"
        teacherRepository -> database "Get record for teacher"
        
        userService -> gmailComponent "Call methods"
        gmailComponent -> gmailSystem "Validate and get Perfil information"
    }
    views {
        systemcontext scheduleSystem "SystemContext" {
            include *
            autoLayout
        }
        container scheduleSystem "ContainerSystem" {
            include *
            autoLayout
        }
        component accountBC "AccountBC" {
            include *
            autoLayout
        }
        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Student" {
                background #2f2a4b
            }
            element "Teacher" {
                background #124652
            }
            element "Manager" {
                background #ac000d
                shape Robot
            }
            element "ScheduleSystem" {
                color #ffffff
                background #1d87c7
            }
            element "Container" {
                color #ffffff
                background #1d87c7
            }
            element "WebApplication" {
                shape WebBrowser
            }
            element "MobileApp" {
                shape MobileDevicePortrait
            }
            element "ApiGateway" {
                shape RoundedBox
                background #7E1717
            }
            element "BoundedContext" {
                shape Hexagon
            }
            element "Database" {
                shape Cylinder
                background #1B9C85
            }
            
            
        }
    }

}





