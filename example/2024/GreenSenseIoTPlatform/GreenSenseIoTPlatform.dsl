workspace "GreenSense IoT Platform" "Container Diagram for Environmental Monitoring and Control" {

    model {
        // People
        facilityManager = person "Facility Manager" "Configures zones, sets optimal CO₂ and temperature thresholds, and analyzes analytics dashboards."
        fieldTechnician = person "Field Technician" "Validates station status, responds to alerts, and performs in-situ corrections."
        maintenancePartner = person "Maintenance Partner" "Manages preventive/corrective tasks via web and mobile platforms."
        supplyPartner = person "Supply Partner" "Monitors filters and devices, plans replenishment and replacement."
        inspector = person "Sustainability Auditor" "Audits compliance with environmental and sustainability standards."

        // Software System
        greenSense = softwareSystem "GreenSense IoT Platform" "End-to-end system for monitoring and controlling environmental conditions in institutional buildings." {

            // Applications
            webApp = container "Web Platform" "Web portal for configuration, alert management, and analytics visualization." "Vue.js / HTML" "Web Platform"
            mobileApp = container "Mobile App" "Field app for technicians to validate sensors, receive alerts, and log actions." "Flutter" "Mobile App"
            apiRest = container "REST API" "Backbone of the platform. Enables communication between apps, cloud, and external systems." "Spring Boot" "REST API"

            // Embedded & Edge
            embeddedController = container "Embedded Controller (ESP32)" "Reads sensor data, controls actuators (servos), and sends data to Edge Node." "C++" "Embedded Controller"
            sensors = container "Environmental Sensors" "DHT-22 (Temperature & Humidity), MH-Z19B (CO₂)" "Field Hardware"
            actuators = container "Actuators (Ventilation & Servos)" "Smart control of air flow through motorized windows and fans." "Field Hardware"

            edgeNode = container "Edge Node" "Receives data from ESP32, performs preprocessing, and communicates with Fog Node." "Python" "Edge Node"
            edgeDB = container "Edge DB" "Stores recent sensor data and fallback config locally." "TinyDB / SQLite" "Edge DB"

            // Fog
            fogNode = container "Fog Node" "Aggregates edge data, performs buffering and local analytics if needed." "Docker / Linux" "Fog Node"
            fogDB = container "Fog DB" "Stores temporary and batch data before cloud upload." "PostgreSQL / InfluxDB" "Fog DB"

            // Cloud
            cloudPlatform = container "Cloud Platform" "Processes data for analytics, prediction, and global alerts." "AWS Lambda / EC2" "Cloud Platform"
            cloudDB = container "Cloud DB" "Stores long-term sensor data, events, alerts, and reports." "PostgreSQL" "Cloud DB"

            // External Systems
            inventorySystem = container "Inventory System (External)" "External ERP of partner for inventory sync (via API)." "ERP System"
            maintenanceSystem = container "Service Order System" "Receives and manages maintenance tasks through API." "3rd Party"
        }

        // Relationships
        facilityManager -> webApp "Configures environmental parameters and views analytics"
        fieldTechnician -> mobileApp "Validates stations and receives alerts"
        inspector -> webApp "Audits environmental data and compliance"
        maintenancePartner -> webApp "Manages assigned maintenance tasks"
        supplyPartner -> webApp "Reviews device conditions and plans supplies"

        mobileApp -> apiRest "Uses for alerts and station sync"
        webApp -> apiRest "Uses for reports, control, and data queries"
        apiRest -> cloudPlatform "Delegates analytics and system logic"
        cloudPlatform -> cloudDB "Stores sensor data and events"
        cloudPlatform -> maintenanceSystem "Syncs maintenance events and feedback"
        cloudPlatform -> inventorySystem "Syncs filter/component needs"

        // Embedded interactions
        embeddedController -> sensors "Reads data from temperature, humidity, CO₂ sensors"
        embeddedController -> actuators "Sends control signals to servos and fans"
        embeddedController -> edgeNode "Sends preprocessed values via WiFi"
        edgeNode -> edgeDB "Reads/Writes temporary local data"
        edgeNode -> fogNode "Sends aggregated data periodically"
        fogNode -> fogDB "Temporarily stores pre-uploaded data"
        fogNode -> cloudPlatform "Sends processed environmental metrics to the cloud"
    }

    views {
        container greenSense "container-view-greensense" {
            include *
            autoLayout lr
        }

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Web Platform" {
                shape WebBrowser
                background #3b82f6
                color #ffffff
            }
            element "Mobile App" {
                shape MobileDevicePortrait
                background #0d9488
                color #ffffff
            }
            element "REST API" {
                shape Hexagon
                background #7f1d1d
                color #ffffff
            }
            element "Embedded Controller" {
                shape RoundedBox
                background #8e44ad
                color #ffffff
            }
            element "Edge Node" {
                shape RoundedBox
                background #f59e0b
            }
            element "Fog Node" {
                shape RoundedBox
                background #fb923c
            }
            element "Cloud Platform" {
                background #1d4ed8
                color #ffffff
            }
            element "Cloud DB" {
                shape Cylinder
                background #991b1b
                color #ffffff
            }
            element "Edge DB" {
                shape Cylinder
                background #d97706
            }
            element "Fog DB" {
                shape Cylinder
                background #f97316
            }
        }
    }
}
