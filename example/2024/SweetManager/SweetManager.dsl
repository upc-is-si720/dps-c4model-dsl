workspace "SweetManager" "Hotel system for tasks automated" {
    model {
        user_guest = person "Guest" "People looking for hotels that suit their preferences and comfort needs They compare options, make reservations easily and securely, and personalize their experience" "User"
        user_admin_hotel = person "Hotel admin" "Manages guest reservations, check-in/check-out, and communicates with hotel owners to resolve incidents" "User"
        user_owner_hotel = person "Hotel owner" "Manages resources, suppliers, income, payments and supervises hotel operations regularly" "User"
        
        sweet_manager_system = softwareSystem "SweetManager System" "Manages guest reservations, registered hotels, messaging, and financial oversight. Integrates with IoT for in-room experiences." "EnterpriseSoftware" {
            landing_page = container "Landing Page" "Public-facing page to consult and explore the app and plans" "Static HTML/CSS/JS" "LandingPage"
            web_container = container "SweetManager Website" "Serves the SweetManager's web application content" "Javascript, Vue.js" "Contenedor"
            web_app = container "SweetManager Web Client App" "User experience and internal features for SweetManager executed in the user's brower" "Javascript / Vue.js" "WebApplication"
            mobile_app = container "Mobile App" "Mobile version for SweetManager users" "Flutter" "MobileApplication"
            
            # monolithic architecture
            web_api = container "Web API" "Handles requests from the SPA and mobile app, provides data access and business logic" "C# / .NET 8" "WebAPI" {
                iam_component = component "IAM Component" "Manages authentication and authorization" "C# / .NET 8"
                communication_component = component "Communication Component" "Manages internal messages and notifications" "C# / .NET 8"
                inventory_component = component "Inventory Component" "Handles hotel inventory and suppliers" "C# / .NET 8"
                commerce_component = component "Commerce Component" "Manages subscriptions and payments" " / .NET 8"
                reservations_component = component "Reservations Component" "Handles reservations and room availability" "C# / .NET 8"
                org_mgmt_component = component "Organizational Management Component" "Handles user-hotel assignments" "C# / .NET 8" 
            }
            
            edge_api = container "Edge Node" "Interacts with IoT devices and manages data storage" "C++" "WebAPI" 
            iot_app = container "Embedded Application" "Manages communication and data collection from IoT devices" "C++" "Contenedor"
            fog_api = container "Fog API" "Process the data and emit decisions" "C++" "WebAPI"

            # database
            database = container "Database Relational SQL" "Stores and updates the information" "MySQL 8.0" "Database"
            fog_database = container "Fog Database" "Stores, persists the data" "SQLite" "Database"
            edge_database = container "Edge Database" "Stores, persists the data" "SQLite" "Database"
        }
        
        # web app
        web_container -> web_app "Delivers PWA files"
        web_app -> web_container "Fetches PWA files"
        
        # iot context
        iot_devices = softwareSystem "IoT Devices Hardware" "Smart devices that receive guest preferences and adjust the room before arrival." "IoTSystem"
        
        # sweetManager system with IoT
        // sweet_manager_system -> iot_gateway "Using and consume IoT data"
        // iot_gateway -> iot_devices "Send data"
        // sweet_manager_system -> iot_devices "Use and send directly"
        
        edge_api -> fog_api "Communicates with"
        fog_api -> web_api "Communicates with"
        iot_app -> edge_api  "Communicates with"
        
        # external systems
        payment_service = softwaresystem "Payment Service" "External system for processing payments in the subscriptions" "PaymentService"
        email_service = softwaresystem "Email Service" "External API for managing outgoing emails (SMTP)" "EmailService"
        
        # users with the sweetManager system
        user_guest -> sweet_manager_system "Book a room and create global preferences"
        user_admin_hotel -> sweet_manager_system "Manage bookings and communication"
        user_owner_hotel -> sweet_manager_system "Manage the resources, subscriptions and organization"
        
        # sweetManager system communicates with external systems
        sweet_manager_system -> payment_service "Uses for payment transactions and subscriptions"
        sweet_manager_system -> email_service "Uses to notificate new user's events"
        
        # users with the apps
        user_admin_hotel -> landing_page "Visits the SweetManager services"
        user_guest -> landing_page ""
        user_owner_hotel -> landing_page "Consults the plan subscriptions"
        user_guest -> mobile_app "Uses for make reservations and personalize his preferences"
        user_guest -> web_container "Uses for make reservations and personalize his preferences"
        user_admin_hotel -> web_container "Uses for manage bookings"
        user_owner_hotel -> web_container "Uses for hotel organizational management"
        
        # API communicates with apps
        mobile_app -> web_api "Endpoint call JSON / HTTPS"
        web_app -> web_api "Endpoint call JSON / HTTPS"
        
        # API communicates with external systems
        web_api -> payment_service "API Request HTTPS"
        web_api -> email_service "API Request HTTPS"
        
        # API uses the database
        web_api -> database "Store, update, get data"
        edge_api -> edge_database "Store, get data"
        fog_api -> fog_database "Store, get data"
        
        iot_devices -> iot_app "Sends data"
    }
    
    
    views {
        systemLandscape {
            include user_admin_hotel
        include user_owner_hotel
        include sweet_manager_system
        include payment_service
        include email_service
        autolayout lr
        }
    
        systemContext sweet_manager_system {
            include *
            autolayout lr
        }
    
        container sweet_manager_system {
            include *
            autolayout lr
        }
    
        styles {
            element "User" {
                color #FFFFFF
                background #08427b
                fontSize 22
                shape Person
            }
            
            element "EnterpriseSoftware" {
                background #77B0AA
                color #FFFFFF
            }
            
            element "MobileApplication" {
                shape MobileDevicePortrait
                background #A86523
                color #ffffff
            }
            
            element "WebApplication" {
                shape WebBrowser
                background #BC7FCD
            }
            
            element "LandingPage" {
                background #3D90D7
                color #ffffff
            }
            
            element "Database" {
                shape cylinder
                background #7E1717
                color #FFFFFF
            }
            
            element "PaymentService" {
                background #F4F4F4
            }
            
            element "EmailService" {
                background #F4F4F4
            }
            
            element "WebAPI" {
                background #3D90D7
                color #ffffff
            }
            element "Contenedor" {
                background #3D90D7
                color #ffffff
            }
            
            element "IoTSystem" {
                background #F4F4F4
                border dashed
                color #333333
            }
        }
    }
    
    configuration {
        scope softwaresystem
    }
}