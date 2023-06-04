workspace "TaxiChurro" "This is an Diagram for TaxiChurro Service" {

    model {
        driver = person "Taxi Driver" "A customer business of the Taxi." "Driver"
        passenger = person "Taxi Passenger" "A customer of the Taxi." "Passenger"

        paymentSoftware = softwaresystem "Payment System" "Allows customers pay with cards." "Existing System"

        taxiChurroSoftware = softwaresystem "TaxiChurro Software" "Allows customers to take a taxi and make payments with cards" {
            mobileApp = container "Mobile App" "Provides a set of the Internet functionality to customers via their mobile device." "Kotlin" "Mobile App"
            apiApplication = container "API Application" "Provides Internet functionality via a JSON/HTTPS API." "Java"
            database = container "Database" "Stores information, hashed authentication credentials, access logs, etc." "postgreSQL Database Schema" "Database"
        }

        # relationships between people and software systems
        driver -> taxiChurroSoftware "Driver taxi, and receive payments"
        passenger -> taxiChurroSoftware "Take taxi, and make payments"
        taxiChurroSoftware -> paymentSoftware "Process payments"

        # relationships to/from containers
        driver -> mobileApp "Views taxi information, Driver taxi, and receive payments"
        passenger -> mobileApp "Views taxi information, Take taxi, and make payments"
        mobileApp -> apiApplication "Makes API calls to" "JSON/HTTPS"
        apiApplication -> database "Reads from and writes to" "JDBC"

    }
    views {
        systemcontext taxiChurroSoftware "SystemContext" {
            include *
            animation {
                taxiChurroSoftware
                driver
                passenger
                paymentSoftware
            }
            autoLayout
        }
        container taxiChurroSoftware "Containers" {
            include *
            animation {
                driver
                passenger
                mobileApp
                apiApplication
                database
            }
            autoLayout
        }

        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Driver" {
                background #08427b
            }
            element "Passenger" {
                background #08427b
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Mobile App" {
                shape MobileDevicePortrait
            }
            element "Database" {
                shape Cylinder
            }
        }
    }


}
