
workspace "EmergySync" "Aplicativo movil para emergencias" {

    model {
        # persons
        usuario = person "Ciudadano" "Usuario de la aplicación" "Usuario"
        autoridad = person "Autoridad" "Autoridad del país" "Autoridad"
        servicioSalud = person "Servicio de Salud" "Servicios de Salud" "ServicioSalud"
        servicioSeguridad = person "Servicio de Seguridad" "Servicios de Seguridad" "ServicioSeguridad"
        servicioBomberos = person "Servicio de Bomberos" "Servicios de Bomberos" "ServicioBomberos"

        # External SoftwareSystem
        gMapApi = softwareSystem "Google Maps API" "Web service de Google Maps" "GMapApi"
        googleApi = softwareSystem "Google API" "Web service de Google" "GoogleApi"
        wsApi = softwareSystem "Whatsapp API" "Web service de Google" "GoogleApi"
        smsApi = softwareSystem "SMS API" "Web service de Google" "GoogleApi"
        solarWindApi = softwareSystem "SolarWind API" "Stats service de SloarWind" "SloarWindApi"
        oneSignalApi = softwareSystem "OneSignal API" "Push service de OneSignal" "OneSignalApi"
        streamChatApi = softwareSystem "StreamChat API" "Chat service de StreamChat" "StreamChatApi"
        peruNewsApi = softwareSystem "Peru News API" "Chat service de Peru News" "PeruNewsApi"
        

        
        # SoftwareSystem
        emergySync = softwareSystem "EmergySync" "Aplicativo informante de emergencias" "EmergySync" {
            mobileApp = container "Mobile App" "Mobile Application de EmergySync" "Flutter v8" "MobileApp"
            
            apiGateway = container "Api Gateway" "Routing los request de los Fronts UI" "api gateway" "ApiGateway" 

            database = container "Database" "Guarda información de las transacciones" "SQL Server v20" "Database"

            loginBC = container "LogIn management Bounded Context" "API RESTful of LogIn management" "JavaScript v6 / node.js" "LogInBC,BoundedContext" {
                group "user" {
                    userEntity = component "User Entity" "Class donde se registra los User" "Class" "UserEntity,Entity"
                    userRepository = component "User Repository" "Repository Interface de User Entity" "Interface / JavaScript v6 / node.js" "UserRepository,Repository"
                    userQuery = component "User Query" "Query for read entity User" "Record" "CourseQuery, Query"
                    userCommand = component "User Command" "Command for create, update and delete entity User" "Record" "UserCommand, Command"
                    userCommandService = component "User CommandService" "Business Logic de la Gestion del User" "Class / JavaScript v6 / node.js" "UserCommandService,Service"
                    userQueryService = component "User QueryService" "Business Logic del query del User" "Class / JavaScript v6 / node.js" "UserQueryService,Service"
                }
                group "gUser" {
                    gUserEntity = component "GUser Entity" "Class que contiene los GUser" "Class" "GUserEntity,Entity"
                    gUserRepository = component "GUser Repository" "Repository Interface de GUser Entity" "Interface / JavaScript v6 / node.js" "GUserRepository,Repository"
                    gUserQuery = component "GUser Query" "Query for read entity GUser" "Record" "GUserQuery, Query"
                    gUserCommand = component "GUser Command" "Command for create, update and delete entity GUser" "Record" "GUserCommand, Command"
                    gUserCommandService = component "GUser CommandService" "Business Logic de la Gestion del GUser" "Class / JavaScript v6 / node.js" "GUserCommandService,Service"
                    gUserQueryService = component "GUser QueryService" "Business Logic del query del GUser" "Class / JavaScript v6 / node.js" "GUserQueryService,Service"
                }
                group "info" {
                    infoEntity = component "Info Entity" "Class que contiene los Info del GUser" "Class" "InfoEntity,Entity"
                    infoRepository = component "Info Repository" "Repository Interface de Info Entity" "Interface / JavaScript v6 / node.js" "InfoRepository,Repository"
                }
                group "perfil" {
                    perfilEntity = component "Perfil Entity" "Class donde se registra los Perfil del GUser" "Class" "PerfilEntity,Entity"
                    perfilRepository = component "Perfil respository" "Repository Interface de Perfil Entity " "Interface / JavaScript v6 / node.js" "PerfilRepository,Repository"
                }

                gUserController = component "gUser Controller" "Api RESTfull Controller class del GUser" "Class / JavaScript v6 / node.js" "GUserController,Controller"
                userController = component "User Controller" "Api RESTfull Controller class del User" "Class / JavaScript v6 / node.js" "UserController,Controller"

                apiGateway -> gUserController "Endpoint request - gUser" "HTTP(S) / JSON"
                apiGateway -> userController "Endpoint request - User" "HTTP(S) / JSON" 

            }
            profileManagemetBC = container "Profile Bounded Context" "API RESTful of Profile" "JavaScript v6 / node.js" "ProfileBC,BoundedContext"{
                group "profile" {
                    profileEntity = component "Profile Entity" "Class donde se registra los Profile" "Class" "ProfileEntity,Entity"
                    profileRepository = component "Profile Repository" "Repository Interface de Profile Entity" "Interface / JavaScript v6 / node.js" "ProfileRepository,Repository"
                    profileQuery = component "Profile Query" "Query for read entity Profile" "Record" "ProfileQuery, Query"
                    profileCommand = component "Profile Command" "Command for create, update and delete entity Profile" "Record" "ProfileCommand, Command"
                    profileCommandService = component "Profile CommandService" "Business Logic de la Gestion del Profile" "Class / JavaScript v6 / node.js" "ProfileCommandService,Service"
                    profileQueryService = component "Profile QueryService" "Business Logic del query del Profile" "Class / JavaScript v6 / node.js" "ProfileQueryService,Service"
                }
                group "settings" {
                    settingsEntity = component "Settings Entity" "Class que contiene los Settings" "Class" "SettingsEntity,Entity"
                    settingsRepository = component "Settings Repository" "Repository Interface de Settings Entity" "Interface / JavaScript v6 / node.js" "SettingsRepository,Repository"
                    settingsQuery = component "Settings Query" "Query for read entity Settings" "Record" "SettingsrQuery, Query"
                    settingsCommand = component "Settings Command" "Command for create, update and delete entity Settings" "Record" "SettingsCommand, Command"
                    settingsCommandService = component "Settings CommandService" "Business Logic de la Gestion del Settings" "Class / JavaScript v6 / node.js" "SettingsCommandService,Service"
                    settingsQueryService = component "Settings QueryService" "Business Logic del query del Settings" "Class / JavaScript v6 / node.js" "SettingsQueryService,Service"
                }
                group "data" {
                    dataEntity = component "Data Entity" "Class que contiene los Data del GUser" "Class" "DataEntity,Entity"
                    dataRepository = component "Data Repository" "Repository Interface de Data Entity" "Interface / JavaScript v6 / node.js" "DataRepository,Repository"
                }

                profileController = component "profile Controller" "Api RESTfull Controller class del profile" "Class / JavaScript v6 / node.js" "ProfileController,Controller"
                settingsController = component "settings Controller" "Api RESTfull Controller class del settings" "Class / JavaScript v6 / node.js" "SettingsController,Controller"

                apiGateway -> settingsController "Endpoint request - settings" "HTTP(S) / JSON"
                apiGateway -> profileController "Endpoint request - profile" "HTTP(S) / JSON" 
            }
            emergencyMapBC = container "EmergencyMap Bounded Context" "API RESTful of Emergency Map" "JavaScript v6 / node.js" "EmergencyMapBC,BoundedContext"{
                group "map" {
                    mapEntity = component "Map Entity" "Class donde se registra los Map" "Class" "MapEntity,Entity"
                    mapRepository = component "Map Repository" "Repository Interface de Map Entity" "Interface / JavaScript v6 / node.js" "MapRepository,Repository"
                    mapQuery = component "Map Query" "Query for read entity Map" "Record" "MapQuery, Query"
                    mapCommand = component "Map Command" "Command for create, update and delete entity Map" "Record" "MapCommand, Command"
                    mapCommandService = component "Map CommandService" "Business Logic de la Gestion del Map" "Class / JavaScript v6 / node.js" "MapCommandService,Service"
                    mapQueryService = component "Map QueryService" "Business Logic del query del Map" "Class / JavaScript v6 / node.js" "MapQueryService,Service"
                }
                group "icons" {
                    iconsEntity = component "Icon Entity" "Class que contiene los Icon" "Class" "IconEntity,Entity"
                    iconsRepository = component "Icon Repository" "Repository Interface de Icon Entity" "Interface / JavaScript v6 / node.js" "IconRepository,Repository"
                    iconsQuery = component "Icon Query" "Query for read entity Icon" "Record" "IconQuery, Query"
                    iconsCommand = component "Icon Command" "Command for create, update and delete entity Icon" "Record" "IconCommand, Command"
                    iconsCommandService = component "Icon CommandService" "Business Logic de la Gestion del Icon" "Class / JavaScript v6 / node.js" "IconCommandService,Service"
                    iconsQueryService = component "Icon QueryService" "Business Logic del query del Icon" "Class / JavaScript v6 / node.js" "IconQueryService,Service"
                }
                group "emergency" {
                    emergencyEntity = component "Emergency Entity" "Class que contiene los Emergency" "Class" "EmergencyEntity,Entity"
                    emergencyRepository = component "Emergency Repository" "Repository Interface de Emergency Entity" "Interface / JavaScript v6 / node.js" "EmergencyRepository,Repository"
                    emergencyQuery = component "Emergency Query" "Query for read entity Emergency" "Record" "EmergencyQuery, Query"
                    emergencyCommand = component "Emergency Command" "Command for create, update and delete entity Emergency" "Record" "EmergencyCommand, Command"
                    emergencyCommandService = component "Emergency CommandService" "Business Logic de la Gestion del Emergency" "Class / JavaScript v6 / node.js" "EmergencyCommandService,Service"
                    emergencyQueryService = component "Emergency QueryService" "Business Logic del query del Emergency" "Class / JavaScript v6 / node.js" "EmergencyQueryService,Service"
                }
                group "mapInfo" {
                    mapInfoEntity = component "Map Information Entity" "Class que contiene los Map Information del Map" "Class" "MapInfoEntity,Entity"
                    mapInfoRepository = component "Map Information Repository" "Repository Interface de Map Information Entity" "Interface / JavaScript v6 / node.js" "MapInfoRepository,Repository"
                }
                group "route" {
                    routeEntity = component "Route Entity" "Class donde se registra los Route del GUser" "Class" "RouteEntity,Entity"
                    routeRepository = component "Route respository" "Repository Interface de Route Entity " "Interface / JavaScript v6 / node.js" "RouteRepository,Repository"
                }

                mapController = component "Map Controller" "Api RESTfull Controller class del Map" "Class / JavaScript v6 / node.js" "MapController,Controller"
                iconsController = component "Icons Controller" "Api RESTfull Controller class del Icons" "Class / JavaScript v6 / node.js" "IconsController,Controller"
                emergencyController = component "Emergency Controller" "Api RESTfull Controller class del Emergency" "Class / JavaScript v6 / node.js" "EmergencyController,Controller"

                apiGateway -> mapController "Endpoint request - gUser" "HTTP(S) / JSON"
                apiGateway -> iconsController "Endpoint request - User" "HTTP(S) / JSON" 
            }
            notificationBC = container "Notifications management Context" "API RESTful of Notification management" "JavaScript v6 / node.js" "NotificationBC,BoundedContext"{
                group "pop" {
                    popEntity = component "Pop Entity" "Class donde se registra los Pop" "Class" "PopEntity,Entity"
                    popRepository = component "Pop Repository" "Repository Interface de Pop Entity" "Interface / JavaScript v6 / node.js" "PopRepository,Repository"
                    popQuery = component "Pop Query" "Query for read entity Pop" "Record" "PopQuery, Query"
                    popCommand = component "Pop Command" "Command for create, update and delete entity Pop" "Record" "PopCommand, Command"
                    popCommandService = component "Pop CommandService" "Business Logic de la Gestion del Pop" "Class / JavaScript v6 / node.js" "PopCommandService,Service"
                    popQueryService = component "Pop QueryService" "Business Logic del query del Pop" "Class / JavaScript v6 / node.js" "PopQueryService,Service"
                }
                group "content" {
                    contentEntity = component "Content Entity" "Class que contiene los Content" "Class" "ContentEntity,Entity"
                    contentRepository = component "Content Repository" "Repository Interface de Content Entity" "Interface / JavaScript v6 / node.js" "ContentRepository,Repository"
                    contentQuery = component "Content Query" "Query for read entity Content" "Record" "ContentQuery, Query"
                    contentCommand = component "Content Command" "Command for create, update and delete entity Content" "Record" "ContentCommand, Command"
                    contentCommandService = component "Content CommandService" "Business Logic de la Gestion del Content" "Class / JavaScript v6 / node.js" "ContentCommandService,Service"
                    contentQueryService = component "Content QueryService" "Business Logic del query del Content" "Class / JavaScript v6 / node.js" "ContentQueryService,Service"
                }
                group "sound" {
                    soundEntity = component "Sound Entity" "Class que contiene los Sound del pop" "Class" "SoundEntity,Entity"
                    soundRepository = component "Sound Repository" "Repository Interface de Sound Entity" "Interface / JavaScript v6 / node.js" "SoundRepository,Repository"
                }
                popController = component "Pop Controller" "Api RESTfull Controller class del Pop" "Class / JavaScript v6 / node.js" "PopController,Controller"
                contentController = component "Content Controller" "Api RESTfull Controller class del content" "Class / JavaScript v6 / node.js" "ContentController,Controller"

                apiGateway -> popController "Endpoint request - pop" "HTTP(S) / JSON"
                apiGateway -> contentController "Endpoint request - content" "HTTP(S) / JSON" 
            }
            statisticsBC = container "Stats management Context" "API RESTful of Stats management" "JavaScript v6 / node.js" "StatsBC,BoundedContext"{
                group "colour" {
                    colourEntity = component "Colour Entity" "Class donde se registra los Colour" "Class" "ColourEntity,Entity"
                    colourRepository = component "Colour Repository" "Repository Interface de Colour Entity" "Interface / JavaScript v6 / node.js" "ColourRepository,Repository"
                    colourQuery = component "Colour Query" "Query for read entity Colour" "Record" "ColourQuery, Query"
                    colourCommand = component "Colour Command" "Command for create, update and delete entity Colour" "Record" "ColourCommand, Command"
                    colourCommandService = component "Colour CommandService" "Business Logic de la Gestion del Colour" "Class / JavaScript v6 / node.js" "ColourCommandService,Service"
                    colourQueryService = component "Colour QueryService" "Business Logic del query del Colour" "Class / JavaScript v6 / node.js" "ColourQueryService,Service"
                }
                group "graphic" {
                    graphicEntity = component "Graphic Entity" "Class que contiene los Graphic" "Class" "GraphicEntity,Entity"
                    graphicRepository = component "Graphic Repository" "Repository Interface de Graphic Entity" "Interface / JavaScript v6 / node.js" "GraphicRepository,Repository"
                    graphicQuery = component "Graphic Query" "Query for read entity Graphic" "Record" "IconQuery, Query"
                    graphicCommand = component "Graphic Command" "Command for create, update and delete entity Graphic" "Record" "GraphicCommand, Command"
                    graphicCommandService = component "Graphic CommandService" "Business Logic de la Gestion del Graphic" "Class / JavaScript v6 / node.js" "GraphicCommandService,Service"
                    graphicQueryService = component "Graphic QueryService" "Business Logic del query del Graphic" "Class / JavaScript v6 / node.js" "GraphicQueryService,Service"
                }
                group "dato" {
                    datoEntity = component "Dato Information Entity" "Class que contiene los Datos del graphic" "Class" "DatoInfoEntity,Entity"
                    datoRepository = component "Dato Information Repository" "Repository Interface de Dato Information Entity" "Interface / JavaScript v6 / node.js" "MapInfoRepository,Repository"
                }
                colourController = component "colour Controller" "Api RESTfull Controller class del colour" "Class / JavaScript v6 / node.js" "ColourController,Controller"
                graphicController = component "graphic Controller" "Api RESTfull Controller class del graphic" "Class / JavaScript v6 / node.js" "GraphicController,Controller"

                apiGateway -> ColourController "Endpoint request - pop" "HTTP(S) / JSON"
                apiGateway -> GraphicController "Endpoint request - content" "HTTP(S) / JSON" 
            }
            newsBC = container "News management Context" "API RESTful of News management" "JavaScript v6 / node.js" "NewsBC,BoundedContext"{
            group "header" {
                    headerEntity = component "Header Entity" "Class donde se registra los Header" "Class" "HeaderEntity,Entity"
                    headerRepository = component "Header Repository" "Repository Interface de Header Entity" "Interface / JavaScript v6 / node.js" "HeaderRepository,Repository"
                    headerQuery = component "Header Query" "Query for read entity Header" "Record" "HeaderQuery, Query"
                    headerCommand = component "Header Command" "Command for create, update and delete entity Header" "Record" "HeaderCommand, Command"
                    headerCommandService = component "Header CommandService" "Business Logic de la Gestion del Header" "Class / JavaScript v6 / node.js" "HeaderCommandService,Service"
                    headerQueryService = component "Header QueryService" "Business Logic del query del Header" "Class / JavaScript v6 / node.js" "HeaderQueryService,Service"
                }
                group "text" {
                    textEntity = component "Text Entity" "Class que contiene los Text" "Class" "TextEntity,Entity"
                    textRepository = component "Text Repository" "Repository Interface de Text Entity" "Interface / JavaScript v6 / node.js" "TextRepository,Repository"
                    textQuery = component "Text Query" "Query for read entity Text" "Record" "TextQuery, Query"
                    textCommand = component "Text Command" "Command for create, update and delete entity Text" "Record" "TextCommand, Command"
                    textCommandService = component "Text CommandService" "Business Logic de la Gestion del Text" "Class / JavaScript v6 / node.js" "TextCommandService,Service"
                    textQueryService = component "Text QueryService" "Business Logic del query del Text" "Class / JavaScript v6 / node.js" "TextQueryService,Service"
                }
                group "advice" {
                    adviceEntity = component "Advice Entity" "Class que contiene los Advice" "Class" "AdviceEntity,Entity"
                    adviceRepository = component "Advice Repository" "Repository Interface de Advice Entity" "Interface / JavaScript v6 / node.js" "AdviceRepository,Repository"
                    adviceQuery = component "Advice Query" "Query for read entity Advice" "Record" "AdviceQuery, Query"
                    adviceCommand = component "Advice Command" "Command for create, update and delete entity Advice" "Record" "AdviceCommand, Command"
                    adviceCommandService = component "Advice CommandService" "Business Logic de la Gestion del Advice" "Class / JavaScript v6 / node.js" "AdviceCommandService,Service"
                    adviceQueryService = component "Advice QueryService" "Business Logic del query del Advice" "Class / JavaScript v6 / node.js" "AdviceQueryService,Service"
                }
                group "link" {
                    linkEntity = component "Link Information Entity" "Class que contiene los Link del header" "Class" "LinkEntity,Entity"
                    linkRepository = component "Link Information Repository" "Repository Interface de Link Entity" "Interface / JavaScript v6 / node.js" "MapInfoRepository,Repository"
                }
                headerController = component "Header Controller" "Api RESTfull Controller class del colour" "Class / JavaScript v6 / node.js" "HeaderController,Controller"
                textController = component "Text Controller" "Api RESTfull Controller class del graphic" "Class / JavaScript v6 / node.js" "TextController,Controller"
                adviceController = component "Advice Controller" "Api RESTfull Controller class del advice" "Class / JavaScript v6 / node.js" "AdviceController,Controller"

                apiGateway -> headerController "Endpoint request - pop" "HTTP(S) / JSON"
                apiGateway -> textController "Endpoint request - content" "HTTP(S) / JSON"
                apiGateway -> adviceController "Endpoint request - content" "HTTP(S) / JSON"

                
            }
            messagingBC = container "Messaging management Context" "API RESTful of Messaging management" "JavaScript v6 / node.js" "MessagingBC,BoundedContext"{
                group "mensaje" {
                    mensajeEntity = component "Mensaje Entity" "Class donde se registra los Mensaje" "Class" "MensajeEntity,Entity"
                    mensajeRepository = component "Mensaje Repository" "Repository Interface de Mensaje Entity" "Interface / JavaScript v6 / node.js" "MensajeRepository,Repository"
                    mensajeQuery = component "Mensaje Query" "Query for read entity Mensaje" "Record" "MensajeQuery, Query"
                    mensajeCommand = component "Mensaje Command" "Command for create, update and delete entity Mensaje" "Record" "MensajeCommand, Command"
                    mensajeCommandService = component "Mensaje CommandService" "Business Logic de la Gestion del Mensaje" "Class / JavaScript v6 / node.js" "MensajeCommandService,Service"
                    mensajeQueryService = component "Mensaje QueryService" "Business Logic del query del Mensaje" "Class / JavaScript v6 / node.js" "MensajeQueryService,Service"
                }
                group "voz" {
                    vozEntity = component "Voz Entity" "Class que contiene los Voz" "Class" "VozEntity,Entity"
                    vozRepository = component "Voz Repository" "Repository Interface de Voz Entity" "Interface / JavaScript v6 / node.js" "VozRepository,Repository"
                    vozQuery = component "Voz Query" "Query for read entity Voz" "Record" "VozQuery, Query"
                    vozCommand = component "Voz Command" "Command for create, update and delete entity Voz" "Record" "VozCommand, Command"
                    vozCommandService = component "Voz CommandService" "Business Logic de la Gestion del Voz" "Class / JavaScript v6 / node.js" "VozCommandService,Service"
                    vozQueryService = component "Voz QueryService" "Business Logic del query del Voz" "Class / JavaScript v6 / node.js" "VozQueryService,Service"
                }
                group "call" {
                    callEntity = component "Call Entity" "Class que contiene los Call" "Class" "CallEntity,Entity"
                    callRepository = component "Call Repository" "Repository Interface de Call Entity" "Interface / JavaScript v6 / node.js" "CallRepository,Repository"
                    callQuery = component "Call Query" "Query for read entity Call" "Record" "CallQuery, Query"
                    callCommand = component "Call Command" "Command for create, update and delete entity Call" "Record" "CallCommand, Command"
                    callCommandService = component "Call CommandService" "Business Logic de la Gestion del Call" "Class / JavaScript v6 / node.js" "CallCommandService,Service"
                    callQueryService = component "Call QueryService" "Business Logic del query del Call" "Class / JavaScript v6 / node.js" "CallQueryService,Service"
                }
                group "font2" {
                    font2Entity = component "Font Entity" "Class que contiene los Mensajes del Font" "Class" "FontEntity,Entity"
                    font2Repository = component "Font Repository" "Repository Interface de Font Entity" "Interface / JavaScript v6 / node.js" "FontRepository,Repository"
                }
                group "size2" {
                    size2Entity = component "Size  Entity" "Class que contiene los Mensajes del Size" "Class" "SizeEntity,Entity"
                    size2Repository = component "Size  Repository" "Repository Interface de Size Entity" "Interface / JavaScript v6 / node.js" "SizeRepository,Repository"
                }
                mensajeController = component "Header Controller" "Api RESTfull Controller class del colour" "Class / JavaScript v6 / node.js" "HeaderController,Controller"
                vozController = component "Text Controller" "Api RESTfull Controller class del graphic" "Class / JavaScript v6 / node.js" "TextController,Controller"
                callController = component "Advice Controller" "Api RESTfull Controller class del advice" "Class / JavaScript v6 / node.js" "AdviceController,Controller"

                apiGateway -> mensajeController "Endpoint request - pop" "HTTP(S) / JSON"
                apiGateway -> vozController "Endpoint request - content" "HTTP(S) / JSON"
                apiGateway -> callController "Endpoint request - content" "HTTP(S) / JSON"
            }


            # Relationships between Person and Mobile
            usuario -> mobileApp "uses App"
            autoridad -> mobileApp "Gives assistance to needed users"
            servicioSalud -> mobileApp "Gives assistance to needed users"
            servicioSeguridad -> mobileApp "Gives assistance to needed users"
            servicioBomberos -> mobileApp "Gives assistance to needed users"


            # Relationships Mobile and ApiGateway
            mobileApp -> apiGateway "Endpoint request" "HTTP(S) / JSON"

            # Relationships between ApiGateway and Bounded Context
            apiGateway -> loginBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> profileManagemetBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> emergencyMapBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> statisticsBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> newsBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> messagingBC "Endpoint request" "HTTP(S) / JSON"


            # Relationships between Bounded Contexts
            notificationBC -> emergencyMapBC "Connect"
            notificationBC -> loginBC "Connect"
            notificationBC -> statisticsBC "Connect"
            notificationBC -> messagingBC "Connect"
            notificationBC -> newsBC "Connect"
            loginBC -> profileManagemetBC "Connect"
            loginBC -> messagingBC "Connect"

            # Relationships between Bounded Context and Database
            loginBC -> database "Store, fetch and update records" "Database Transaction" 
            profileManagemetBC -> database "Store, fetch and update records" "Database Transaction"
            notificationBC -> database "Store, fetch and update records" "Database Transaction"
            statisticsBC -> database "Store, fetch and update records" "Database Transaction"
            newsBC -> database "Store, fetch and update records" "Database Transaction"
            messagingBC -> database "Store, fetch and update records" "Database Transaction"


            # Relationships between Bounded Context and External softwareSystem
            loginBC -> googleApi "Query of person" "TCP/IP"
            emergencyMapBC -> gMapApi "Query of person" "TCP/IP"
            profileManagemetBC -> wsApi "Query of person" "TCP/IP"
            profileManagemetBC -> smsApi "Query of person" "TCP/IP"
            newsBC -> peruNewsApi "Query of person" "TCP/IP"
            statisticsBC -> solarWindApi "Query of person" "TCP/IP"
            notificationBC -> oneSignalApi "Query of person" "TCP/IP"

            
            # Relationships user group 
            userController -> userCommandService "Call service method"
            userController -> userQueryService "Call service method"
            
            userCommandService -> userCommand "Handle command"
            userCommandService -> userRepository "Call repository method"
            userCommandService -> userEntity "Use entity"
            
            userQueryService -> userQuery "Handle query"
            userQueryService -> userRepository "Call repository method"
            userQueryService -> userEntity "Use entity"
            
            userRepository -> userEntity "Methods call" "POO"
            userRepository -> database "Store, update, delete and fetch records - course" "Database Transaction"
            
            # Relationships gUser group 
            gUserController -> gUserCommandService "Call service method"
            gUserController -> gUserQueryService "Call service method"
            
            gUserCommandService -> gUserCommand "Handle command"
            gUserCommandService -> gUserRepository "Call repository method"
            gUserCommandService -> gUserEntity "Use entity"
            
            gUserQueryService -> gUserQuery "Handle query"
            gUserQueryService -> gUserRepository "Call repository method"
            gUserQueryService -> gUserEntity "Use entity"
            
            gUserRepository -> gUserEntity "Methods call" "POO"
            gUserRepository -> database "Store, update, delete and fetch records - gUser" "Database Transaction"
            
            # Relationships gUser info
            gUserCommandService -> infoRepository "Call repository method"
            gUserCommandService -> infoEntity "Use entity"
            gUserQueryService -> infoRepository "Call repository method"
            gUserQueryService -> infoEntity "Use entity"
            
            infoRepository -> infoEntity "Methods call" "POO"
            infoRepository -> database "Store, update, delete and fetch records - info" "Database Transaction"
            
            # Relationships gUser perfil
            gUserCommandService -> perfilRepository "Call repository method"
            gUserCommandService -> perfilEntity "Use entity"
            gUserQueryService -> perfilRepository "Call repository method"
            gUserQueryService -> perfilEntity "Use entity"
            
            perfilRepository -> perfilEntity "Methods call" "POO"
            perfilRepository -> database "Store, update, delete and fetch records - perfil" "Database Transaction"
            
            ########################################################################################################
            # Relationships profile group 
            profileController -> profileCommandService "Call service method"
            profileController -> profileQueryService "Call service method"
            
            profileCommandService -> profileCommand "Handle command"
            profileCommandService -> profileRepository "Call repository method"
            profileCommandService -> profileEntity "Use entity"
            
            profileQueryService -> profileQuery "Handle query"
            profileQueryService -> profileRepository "Call repository method"
            profileQueryService -> profileEntity "Use entity"
            
            profileRepository -> profileEntity "Methods call" "POO"
            profileRepository -> database "Store, update, delete and fetch records - profile" "Database Transaction"
            
            # Relationships settings group 
            settingsController -> settingsCommandService "Call service method"
            settingsController -> settingsQueryService "Call service method"
            
            settingsCommandService -> settingsCommand "Handle command"
            settingsCommandService -> settingsRepository "Call repository method"
            settingsCommandService -> settingsEntity "Use entity"
            
            settingsQueryService -> settingsQuery "Handle query"
            settingsQueryService -> settingsRepository "Call repository method"
            settingsQueryService -> settingsEntity "Use entity"
            
            settingsRepository -> settingsEntity "Methods call" "POO"
            settingsRepository -> database "Store, update, delete and fetch records - settings" "Database Transaction"
            
            # Relationships profile data
            profileCommandService -> dataRepository "Call repository method"
            profileCommandService -> dataEntity "Use entity"
            profileQueryService -> dataRepository "Call repository method"
            profileQueryService -> dataEntity "Use entity"
            
            dataRepository -> dataEntity "Methods call" "POO"
            dataRepository -> database "Store, update, delete and fetch records - info" "Database Transaction"
            
            # Relationships settings data
            settingsCommandService -> dataRepository "Call repository method"
            settingsCommandService -> dataEntity "Use entity"
            settingsQueryService -> dataRepository "Call repository method"
            settingsQueryService -> dataEntity "Use entity"
            
            #######################################################################################################
            # Relationships map group 
            mapController -> mapCommandService "Call service method"
            mapController -> mapQueryService "Call service method"
            
            mapCommandService -> mapCommand "Handle command"
            mapCommandService -> mapRepository "Call repository method"
            mapCommandService -> mapEntity "Use entity"
            
            mapQueryService -> mapQuery "Handle query"
            mapQueryService -> mapRepository "Call repository method"
            mapQueryService -> mapEntity "Use entity"
            
            mapRepository -> mapEntity "Methods call" "POO"
            mapRepository -> database "Store, update, delete and fetch records - map" "Database Transaction"
            
            # Relationships icons group 
            iconsController -> iconsCommandService "Call service method"
            iconsController -> iconsQueryService "Call service method"
            
            iconsCommandService -> iconsCommand "Handle command"
            iconsCommandService -> iconsRepository "Call repository method"
            iconsCommandService -> iconsEntity "Use entity"
            
            iconsQueryService -> iconsQuery "Handle query"
            iconsQueryService -> iconsRepository "Call repository method"
            iconsQueryService -> iconsEntity "Use entity"
            
            iconsRepository -> iconsEntity "Methods call" "POO"
            iconsRepository -> database "Store, update, delete and fetch records - icons" "Database Transaction"
            
            # Relationships emergency group 
            emergencyController -> emergencyCommandService "Call service method"
            emergencyController -> emergencyQueryService "Call service method"
            
            emergencyCommandService -> emergencyCommand "Handle command"
            emergencyCommandService -> emergencyRepository "Call repository method"
            emergencyCommandService -> emergencyEntity "Use entity"
            
            emergencyQueryService -> emergencyQuery "Handle query"
            emergencyQueryService -> emergencyRepository "Call repository method"
            emergencyQueryService -> emergencyEntity "Use entity"
            
            emergencyRepository -> emergencyEntity "Methods call" "POO"
            emergencyRepository -> database "Store, update, delete and fetch records - emergency" "Database Transaction"
            
            # Relationships map mapInfo
            mapCommandService -> mapInfoRepository "Call repository method"
            mapCommandService -> mapInfoEntity "Use entity"
            mapQueryService -> mapInfoRepository "Call repository method"
            mapQueryService -> mapInfoEntity "Use entity"
            
            mapInfoRepository -> mapInfoEntity "Methods call" "POO"
            mapInfoRepository -> database "Store, update, delete and fetch records - info" "Database Transaction"
            
            # Relationships emergency mapInfo
            emergencyCommandService -> mapInfoRepository "Call repository method"
            emergencyCommandService -> mapInfoEntity "Use entity"
            emergencyQueryService -> mapInfoRepository "Call repository method"
            emergencyQueryService -> mapInfoEntity "Use entity"
            
            # Relationships map route
            mapCommandService -> routeRepository "Call repository method"
            mapCommandService -> routeEntity "Use entity"
            mapQueryService -> routeRepository "Call repository method"
            mapQueryService -> routeEntity "Use entity"
            
            routeRepository -> routeEntity "Methods call" "POO"
            routeRepository -> database "Store, update, delete and fetch records - route" "Database Transaction"
            #################################################################################################################
             # Relationships content group 
            contentController -> contentCommandService "Call service method"
            contentController -> contentQueryService "Call service method"
            
            contentCommandService -> contentCommand "Handle command"
            contentCommandService -> contentRepository "Call repository method"
            contentCommandService -> contentEntity "Use entity"
            
            contentQueryService -> contentQuery "Handle query"
            contentQueryService -> contentRepository "Call repository method"
            contentQueryService -> contentEntity "Use entity"
            
            contentRepository -> contentEntity "Methods call" "POO"
            contentRepository -> database "Store, update, delete and fetch records - profile" "Database Transaction"
            
            # Relationships pop group 
            popController -> popCommandService "Call service method"
            popController -> popQueryService "Call service method"
            
            popCommandService -> popCommand "Handle command"
            popCommandService -> popRepository "Call repository method"
            popCommandService -> popEntity "Use entity"
            
            popQueryService -> popQuery "Handle query"
            popQueryService -> popRepository "Call repository method"
            popQueryService -> popEntity "Use entity"
            
            popRepository -> popEntity "Methods call" "POO"
            popRepository -> database "Store, update, delete and fetch records - settings" "Database Transaction"
            
            # Relationships pop sound
            popCommandService -> soundRepository "Call repository method"
            popCommandService -> soundEntity "Use entity"
            popQueryService -> soundRepository "Call repository method"
            popQueryService -> soundEntity "Use entity"
            
            soundRepository -> soundEntity "Methods call" "POO"
            soundRepository -> database "Store, update, delete and fetch records - info" "Database Transaction"
            #################################################################################################################
            
            # Relationships colour group 
            colourController -> colourCommandService "Call service method"
            colourController -> colourQueryService "Call service method"
            
            colourCommandService -> colourCommand "Handle command"
            colourCommandService -> colourRepository "Call repository method"
            colourCommandService -> colourEntity "Use entity"
            
            colourQueryService -> colourQuery "Handle query"
            colourQueryService -> colourRepository "Call repository method"
            colourQueryService -> colourEntity "Use entity"
            
            colourRepository -> colourEntity "Methods call" "POO"
            colourRepository -> database "Store, update, delete and fetch records - profile" "Database Transaction"
            
            # Relationships graphic group 
            graphicController -> graphicCommandService "Call service method"
            graphicController -> graphicQueryService "Call service method"
            
            graphicCommandService -> graphicCommand "Handle command"
            graphicCommandService -> graphicRepository "Call repository method"
            graphicCommandService -> graphicEntity "Use entity"
            
            graphicQueryService -> graphicQuery "Handle query"
            graphicQueryService -> graphicRepository "Call repository method"
            graphicQueryService -> graphicEntity "Use entity"
            
            graphicRepository -> graphicEntity "Methods call" "POO"
            graphicRepository -> database "Store, update, delete and fetch records - settings" "Database Transaction"
            
            # Relationships graphic dato
            graphicCommandService -> datoRepository "Call repository method"
            graphicCommandService -> datoEntity "Use entity"
            graphicQueryService -> datoRepository "Call repository method"
            graphicQueryService -> datoEntity "Use entity"
            
            datoRepository -> datoEntity "Methods call" "POO"
            datoRepository -> database "Store, update, delete and fetch records - dato" "Database Transaction"
            #################################################################################################################
             # Relationships header group 
            headerController -> headerCommandService "Call service method"
            headerController -> headerQueryService "Call service method"
            
            headerCommandService -> headerCommand "Handle command"
            headerCommandService -> headerRepository "Call repository method"
            headerCommandService -> headerEntity "Use entity"
            
            headerQueryService -> headerQuery "Handle query"
            headerQueryService -> headerRepository "Call repository method"
            headerQueryService -> headerEntity "Use entity"
            
            headerRepository -> headerEntity "Methods call" "POO"
            headerRepository -> database "Store, update, delete and fetch records - header" "Database Transaction"
            
            # Relationships text group 
            textController -> textCommandService "Call service method"
            textController -> textQueryService "Call service method"
            
            textCommandService -> textCommand "Handle command"
            textCommandService -> textRepository "Call repository method"
            textCommandService -> textEntity "Use entity"
            
            textQueryService -> textQuery "Handle query"
            textQueryService -> textRepository "Call repository method"
            textQueryService -> textEntity "Use entity"
            
            textRepository -> textEntity "Methods call" "POO"
            textRepository -> database "Store, update, delete and fetch records - text" "Database Transaction"
           
            # Relationships advice group 
            adviceController -> adviceCommandService "Call service method"
            adviceController -> adviceQueryService "Call service method"
            
            adviceCommandService -> adviceCommand "Handle command"
            adviceCommandService -> adviceRepository "Call repository method"
            adviceCommandService -> adviceEntity "Use entity"
            
            adviceQueryService -> adviceQuery "Handle query"
            adviceQueryService -> adviceRepository "Call repository method"
            adviceQueryService -> adviceEntity "Use entity"
            
            adviceRepository -> adviceEntity "Methods call" "POO"
            adviceRepository -> database "Store, update, delete and fetch records - advice" "Database Transaction"
            
            # Relationships a header link
            headerCommandService -> linkRepository "Call repository method"
            headerCommandService -> linkEntity "Use entity"
            headerQueryService -> linkRepository "Call repository method"
            headerQueryService -> linkEntity "Use entity"
            
            linkRepository -> linkEntity "Methods call" "POO"
            linkRepository -> database "Store, update, delete and fetch records - info" "Database Transaction"
            #################################################################################################################
           # Relationships mensaje group 
            mensajeController -> mensajeCommandService "Call service method"
            mensajeController -> mensajeQueryService "Call service method"
            
            mensajeCommandService -> mensajeCommand "Handle command"
            mensajeCommandService -> mensajeRepository "Call repository method"
            mensajeCommandService -> mensajeEntity "Use entity"
            
            mensajeQueryService -> mensajeQuery "Handle query"
            mensajeQueryService -> mensajeRepository "Call repository method"
            mensajeQueryService -> mensajeEntity "Use entity"
            
            mensajeRepository -> mensajeEntity "Methods call" "POO"
            mensajeRepository -> database "Store, update, delete and fetch records - header" "Database Transaction"
            
            # Relationships voz group 
            vozController -> vozCommandService "Call service method"
            vozController -> vozQueryService "Call service method"
            
            vozCommandService -> vozCommand "Handle command"
            vozCommandService -> vozRepository "Call repository method"
            vozCommandService -> vozEntity "Use entity"
            
            vozQueryService -> vozRepository "Call repository method"
            vozQueryService -> vozEntity "Use entity"
            
            vozRepository -> vozEntity "Methods call" "POO"
            vozRepository -> database "Store, update, delete and fetch records - text" "Database Transaction"
           
            # Relationships call group 
            callController -> callCommandService "Call service method"
            callController -> callQueryService "Call service method"
            
            callCommandService -> callCommand "Handle command"
            callCommandService -> callRepository "Call repository method"
            callCommandService -> callEntity "Use entity"
            
            callQueryService -> callQuery "Handle query"
            callQueryService -> callRepository "Call repository method"
            callQueryService -> callEntity "Use entity"
            
            callRepository -> callEntity "Methods call" "POO"
            callRepository -> database "Store, update, delete and fetch records - advice" "Database Transaction"
            
            # Relationships a mensaje font
            mensajeCommandService -> font2Repository "Call repository method"
            mensajeCommandService -> font2Entity "Use entity"
            mensajeQueryService -> font2Repository "Call repository method"
            mensajeQueryService -> font2Entity "Use entity"
            
            font2Repository -> font2Entity "Methods call" "POO"
            font2Repository -> database "Store, update, delete and fetch records - info" "Database Transaction
            
            # Relationships a mensaje size
            mensajeCommandService -> size2Repository "Call repository method"
            mensajeCommandService -> size2Entity "Use entity"
            mensajeQueryService -> size2Repository "Call repository method"
            mensajeQueryService -> size2Entity "Use entity"
            
            size2Repository -> size2Entity "Methods call" "POO"
            size2Repository -> database "Store, update, delete and fetch records - info" "Database Transaction"
            
        }

        #RelationShip
        usuario -> emergySync "Usuario usa la App"
        autoridad -> emergySync "Usa App"
        servicioSalud -> emergySync "Usa App"
        servicioSeguridad -> emergySync "Usa App"
        servicioBomberos -> emergySync "Usa App"
        emergySync -> googleApi "Consulta"
        emergencyMapBC -> gMapApi "Usa"
        statisticsBC -> solarWindApi "Usa"
    }
    views {
        systemContext emergySync "EmergySyncSystemContext" "App de emergencias" {
            include *
            autoLayout tb
        }
        container emergySync "EmergySyncContainer" "Diagrama de Contenedores" {
            include *
            autoLayout tb
        }
        component loginBC "loginComponent" "Diagrama de Componentes" {
            include *
            autoLayout tb
        }
        component profileManagemetBC "profileComponent" "Diagrama de Componentes" {
            include *
            autoLayout tb
        }
        component emergencyMapBC "emergencyMapComponent" "Diagrama de Componentes" {
            include *
            autoLayout tb
        }
        component notificationBC "notificationComponent" "Diagrama de Componentes" {
            include *
            autoLayout tb
        }
        component statisticsBC "statisticsComponent" "Diagrama de Componentes" {
            include *
            autoLayout tb
        }
        component newsBC "newsComponent" "Diagrama de Componentes" {
            include *
            autoLayout tb
        }
        component messagingBC "messagingComponent" "Diagrama de Componentes" {
            include *
            autoLayout tb
        }

        styles {
            element "Person" {
                shape Person
                background #5F04B4
                color #FFFFFF
            }
            element "Container" {
                background #002A8D
                color #FFFFFF
            }
            element "BoundedContext" {
                shape Component
            }
            element "WebApp" {
                shape WebBrowser
                background #3f47e1
            }
            element "MobileApp" {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element "ApiGateway" {
                shape Pipe
                background #884A39                
            }
            element "Database" {
                shape Cylinder
                background #CF0A0A
            }
            element "ComponentBC" {
                shape Component
                background #511991
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
            element "Container" {
                shape Hexagon
                background #805B17
                color #FFFFFF
            }
            element "Group:course" {
                color #FF0000
            }
            element "Group:syllabus" {
                color #0F9800
            }
            element "Group:book" {
                color #0000FF
            }
            element "Group:topic" {
                color #0000FF
            }
        }
    }

}
