workspace "Grow With Me - Landscape" "Customized landscape, context, container, and deployment diagrams" {

    model {
        // People
        farmer = person "Farmer" "Peruvian citizen who wants to manage a crop using IoT sensors."
        consultant = person "Consultant" "Peruvian citizen expert who provides technical advice to a farmer."
        admin = person "Admin" "System user with permissions to manage accounts, sensors, and data."

        // Systems
        growWithMe = softwareSystem "Grow With Me" "Platform for crop management with IoT support and technical assistance." {

            landingPage = container "Landing Page" "Entry point for users, with info and access to tools." "HTML/CSS/JS" "Web Application"
            webApp = container "Web Application" "Main interface for all users on desktop." "Angular/TypeScript" "Web Application"
            mobileApp = container "Mobile App" "Crop tracking and interaction on mobile." "Flutter" "Mobile App"
            singlePageApp = container "Single-Page App" "Dashboards and interactive views." "Angular" "Web Application"
            apiRest = container "API GATEWAY" "Handles all internal requests and coordinates business logic." "Spring Boot / REST API" "API REST"
            relationalDb = container "Relational Database" "Stores user profiles, crop data, and interactions." "MySQL" "Relational Database"
        cloudPlatform = container "Cloud Platform" "Provides infrastructure and cloud services for hosting applications and databases." "Cloud Platform" "Cloud Platform"
          cloudDb = container "Cloud Database" "Managed cloud database for persistence and scalability." "Cloud SQL / RDS / etc." "Relational Database"
  edgeNode = container "Edge Node" "Performs local data processing near sensors, enabling real-time decisions." "Embedded System" "Edge Node"
edgeDb = container "Edge DB" "Stores recent sensor data locally for quick access." "SQLite / Lightweight DB" "Edge DB"
embeddedSystem = container "Embedded System" "Controls and collects data from physical sensors and actuators in the field." "Microcontroller / C / RTOS" "Embedded System"
backend = container "Backend" "Core business logic and internal services for profiles, crops, devices, and notifications." "Spring Boot" "Backend Service"

fogNode = container "Fog Node" "Aggregates and filters data from edge nodes before sending to the cloud." "Node.js / Python" "Fog Node"
fogDb = container "Fog DB" "Stores preprocessed data and temporary backups from edge." "PostgreSQL / NoSQL" "Fog DB"

        }
        iotSystem = softwareSystem "GrowWithMe IoT" "Collects, analyzes, and synchronizes data from sensors connected to crops."
        crmSystem = softwareSystem "CRM System" "Stores and manages information about farmers, consultants, and activity logs."
        hardwareIOT = softwareSystem "Environmental Monitoring Hardware" "IoT sensors and actuators that provide real-time weather data for irrigation and planning support." "External System"
        weatherApi = softwareSystem "Weather Forecast API" "Provides weather data to support irrigation and planning decisions." "External System"
        growWithMe2 = softwareSystem "GrowWithMe" "Platform for crop management with IoT support and technical assistance." {
        webApp2 =       container "Web Application" "Main interface for all users on desktop." "Angular/TypeScript" "Web Application"
        mobileApp2 =    container "Mobile App" "Crop tracking and interaction on mobile." "Flutter" "Mobile App"
        apiRest2 =      container "API GATEWAY" "Handles all internal requests and coordinates business logic." "Spring Boot / REST API" "API REST"
        relationalDb2 = container "Relational Database" "Stores user profiles, crop data, and interactions." "MySQL" "Relational Database"
        }
        // System-level relationships
    farmer -> growWithMe "Monitors and manages crops\nViews data and interacts with sensors"
    consultant -> growWithMe "Provides technical advice to farmers\nAccesses agronomic information"
    admin -> growWithMe "Manages accounts, sensors, and system data"
    growWithMe -> weatherApi "Fetches weather data for agricultural planning"
apiRest -> cloudPlatform "Deployed on cloud infrastructure"
cloudPlatform -> cloudDb "Hosts managed database service"
hardwareIOT -> embeddedSystem "Provides temperature and humidity data"
apiRest -> backend "Delegates requests for internal processing"
backend -> relationalDb "Reads and writes domain data"

embeddedSystem -> edgeNode "Sends raw data and receives commands"
        growWithMe -> iotSystem "Uses"
        iotSystem -> crmSystem "Uses"
        // Local-only systems for container view
        weatherLocal = softwareSystem "Weather System" "Provides climate data for farmers and consultants." "External System"
edgeNode -> fogNode "Sends processed sensor data"
fogNode -> cloudPlatform "Uploads aggregated data"
edgeNode -> edgeDb "Reads and writes local sensor data"
fogNode -> fogDb "Reads and writes preprocessed data"

        // Container-level relationships
        farmer -> landingPage
        farmer -> webApp
        farmer -> mobileApp
        farmer -> singlePageApp
        weatherLocal -> farmer "Consults weather info"
webApp -> weatherLocal "Consults weather data"
mobileApp -> weatherLocal "Consults weather data"
        consultant -> landingPage
        consultant -> webApp
        consultant -> mobileApp
        consultant -> singlePageApp
        weatherLocal -> consultant "Consults weather info"

        admin -> landingPage
        admin -> webApp
        admin -> singlePageApp

        webApp -> apiRest "Sends internal operations"
        mobileApp -> apiRest "Sends internal operations"
        singlePageApp -> apiRest "Requests dashboard data"
        growWithMe -> hardwareIOT "Receives real-time weather data from sensors"
        webApp2 -> apiRest2 "API REQUEST"
        mobileApp2 -> apiRest2 "API REQUEST"
        apiRest2 -> relationalDb2 "Read from and write to"
        
    }

    views {
        // Landscape
        systemLandscape "growWithMeLandscape" {
            include farmer
            include consultant
            include admin
            include growWithMe
            include iotSystem
            include crmSystem
            autolayout lr
            title "System Landscape - Grow With Me"
        }

        // System Context
systemContext growWithMe "SystemContext" {
    include farmer
    include consultant
    include admin
    include growWithMe
    include hardwareIOT
    include weatherApi
    autolayout lr
    title "System Context - Grow With Me"
}


        // Container View
        container growWithMe "Containers" {
            include *
            include weatherLocal
            include cloudPlatform
            autolayout lr
            title "Container Diagram - Grow With Me"
        }
        container growWithMe "Deployment" {
            include webApp2
            include mobileApp2
            include apiRest2
            include relationalDb2
            autolayout
            title "Container Diagram - Grow With Me"
        }
styles {
    element "Person" {
        shape person
        background #B03A2E
        color #ffffff
    }

    element "Cloud Platform" {
        shape roundedbox
        background #0026FF
        color #ffffff
    }
element "Embedded System" {
        shape roundedbox
        background purple
        color #ffffff
    }

    element "Software System" {
        background #2874A6
        color #ffffff
        border dashed
    }
element "Edge Node" {
                shape RoundedBox
                background #f59e0b
                color #000000
            }
            element "Fog Node" {
                shape RoundedBox
                background #fb923c
                color #000000
            }
            element "Edge DB" {
                shape Cylinder
                background #f59e0b
                color #000000
            }
            element "Fog DB" {
                shape Cylinder
                background #fb923c
                color #000000
            }
    element "Container" {
        background #922B21
        color #ffffff
    }

    element "API REST" {
        background #7f1d1d
        shape Hexagon
        color #ffffff
    }

    element "Relational Database" {
        background #B03A2E
        shape Cylinder
        color #ffffff
    }

    element "Payment System" {
        background #707B7C
    }
element "Backend Service"{
    
    background #000000
}
    element "Weather API" {
        background #45B39D
    }

    element "stripe" {
        background #707B7C
        color #ffffff
        shape RoundedBox
    }

    element "Web Application" {
        background #0094FF
        color #ffffff
        shape WebBrowser
    }
element "External System" {
    background #808080
    color #ffffff
    border dashed
}

    element "Mobile App" {
        background #267F00
        color #ffffff
        shape MobileDevicePortrait
    }
}

}
}
