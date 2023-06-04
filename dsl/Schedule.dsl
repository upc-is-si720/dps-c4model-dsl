workspace "Schedule" "System to Schedule appointments at the University" {

    model {
        student = person "University Student" "Person who books or requests an appointment" "Student"
        teacher = person "University Teacher" "Person attends the appointment" "Teacher"
        manager = person "Manager System" "Person who administers and supports the system" "Manager"

        scheduleSystem = softwareSystem "Schedule UPC" "System to Schedule appointments at the University" "ScheduleSystem" {
            webApplication = container "Web Application" "Frontend of Application"
            apiApplication = container "Api REST Ful" "backend of Application"
            databaseApplication = container "Database" "Database of Application"
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
        webApplication -> apiApplication "Call the endpoint fron API REST"
        apiApplication -> databaseApplication "Store, view, update, delete record"
        apiApplication -> gmailSystem "Register and Authenticate user"
        apiApplication -> emailSystem "Send email to student"

    }
    views {
        systemcontext scheduleSystem "SystemContext" {
            include *
            animation {
                student
                scheduleSystem
            }
            autoLayout
        }
        container scheduleSystem "ContainerSystem" {
            include *
            animation {
                student
                webApplication
                apiApplication
                databaseApplication
            }
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
        }
    }




}





