workspace "Viewer" "Manage software projects" {

    model {
        //#Person
        teamLider = person "Team Lider" "Person who guide a group of people" "TeamLider"
        teamMember = person "Team Member" "Person who manage the project with the lider indications" "TeamMember"
        
        
        //#Application
        viewer = softwareSystem "Viewer" "Software that allows manage the diferents software projects" "Viewer" {
        
            webApplication = container "WebApplication" "Front in browser" "React.js v18.2" "WebApplication"
            landingPage = container "Landing Page" "Application marketing page" "Bootstrap v5.3.3" "LandingPage"
            
            apiGateway = container "Api Gateway" "Manager that accepts all API calls" "Amazon Api Gateway" "ApiGateway"
            
            //////////////////////////////////////////
            //////////////////////////////////////////
            loginBc = container "Login Bounded Context" "Sign in, Sign Up, sign out and login App" "Express.js v4.19.2" "LoginBoundedContext" {
                registrationController = component "Registration Controller" "User Login and registration process" "Express.js v4.19.2" "RegistrationController, Controller"
                group "user"{
                    userEntity = component "User" "Entity for User" "Class" "UserEntity, Entity"
                    userRepository = component "User Repository" "Abstract for reposity User" "Interface" "UserRepository, Repository"
                    userQuery = component "User Query" "Query for read entity User" "Record" "UserQuery, Query"
                    userCommand = component "User Command" "Comand for create, update and delete entity User" "Record" "UserCommand, Command"
                    userCommandService = component "User CommandService" "Business Login for create, update and delete entity User" "Interface and Class" "UserCommandService, Service"
                    userQueryService = component "User QueryService" "Business Login for read entity User" "Interface and Class" "UserQueryService, Service"
                }
                group "project"{
                    projectEntity = component "Project" "Entity for Project" "Class" "ProjectEntity, Entity"
                    projectRepository_2 = component "Project Repository" "Abstract for reposity Project" "Interface" "ProjectRepository, Repository"
                }
                repositoryVerification = component "Repository Verification" "Method for access to manager table"
                #database_1 = component "Database"
            }
            
            ///////////////////////////////////////////
            //////////////////////////////////////////
            userProfileBc = container "User Profile Bounded Context" "User data page" "Express.js v4.19.2" "UserProfileBoundedContext"{
                profileController = component "Profile Controller" "User edit an information of profile" "Express.js v4.19.2" "ProfileController, Controller"
                group "user"{
                    userEntity_2 = component "User" "Entity for User" "Class" "UserEntity, Entity"
                    userRepository_2 = component "User Repository" "Abstract for reposity User" "Interface" "UserRepository, Repository"
                    userQuery_2 = component "User Query" "Query for read entity User" "Record" "UserQuery, Query"
                    userCommand_2 = component "User Command" "Comand for create, update and delete entity User" "Record" "UserCommand, Command"
                    userCommandService_2 = component "User CommandService" "Business Login for create, update and delete entity User" "Interface and Class" "UserCommandService, Service"
                    userQueryService_2 = component "User QueryService" "Business Login for read entity User" "Interface and Class" "UserQueryService, Service"
                }
            }
            
            //////////////////////////////////////////
            //////////////////////////////////////////
            dashboardBc = container "Dashboard Bounded Context" "Main menu" "Express.js v4.19.2" "DashboarBoundedContext"{
                dashboardController = component "DashBoard Controller" "Search process" "Express.js v4.19.2" 
                group "board"{
                    boardEntity_1 = component "Board" "Entity for Board" "Class" "BoardEntity, Entity"
                    boardRepository_1 = component "Board Repository" "Abstract for reposity Board" "Interface" "BoardRepository, Repository"
                    boardQuery_1 = component "Board Query" "Query for read entity Board" "Record" "BoardQuery, Query"
                    boardQueryService_1 = component "Board QueryService" "Business Login for read entity Board" "Interface and Class" "BoardQueryService, Service"
                }
                group "boardContent"{
                    boardContentEntity = component "BoardContent" "Entity for BoardContent" "Class" "BoardContent, Entity"
                }
                group "project"{
                    projectEntity_1 = component "Project" "Entity for Project" "Class" "ProjectEntity, Entity"
                    projectRepository_1 = component "Project Repository" "Abstract for reposity Project" "Interface" "ProjectRepository, Repository"
                    projectQuery_1 = component "Project Query" "Query for read entity Project" "Record" "ProjectQuery, Query"
                    projectQueryService_1 = component "Project QueryService" "Business Login for read entity Project" "Interface and Class" "ProjectQueryService, Service"
                }
                group "user"{
                    userEntity_1 = component "User" "Entity for User" "Class" "UserEntity, Entity"
                    userRepository_1 = component "User Repository" "Abstract for reposity User" "Interface" "UserRepository, Repository"
                    userQuery_1 = component "User Query" "Query for read entity User" "Record" "UserQuery, Query"
                    userQueryService_1 = component "User QueryService" "Business Login for read entity User" "Interface and Class" "UserQueryService, Service"
                }
                group "meeting"{
                    meetingEntity_1 = component "Meeting" "Entity for Meeting" "Class" "MeetingEntity, Entity"
                    meetingRepository_1 = component "Meeting Repository" "Abstract for reposity Meeting" "Interface" "MeetingRepository, Repository"
                    meetingQuery_1 = component "Meeting Query" "Query for read entity Meeting" "Record" "MeetingQuery, Query"
                    meetingQueryService_1 = component "Meeting QueryService" "Business Login for read entity Meeting" "Interface and Class" "MeetingQueryService, Service"
                }
                group "ReunionOption"{
                    reunionOptionEntity = component "ReunionOption" "Entity for ReunionOption" "Class" "ReunionOption, Entity"
                }
                #database_2 = component "Database"
            }
            
            //////////////////////////////////////////
            //////////////////////////////////////////
            projectGenerationBc = container "Project Generation Bounded Context" "Pages to generate a project management board" "Express.js v4.19.2" "ProjectGenerationBoundedContext"{
                projectGenerationBcController = component "Project Generation Controller" "REST of Register Controller" "Express.js v4.19.2"
                group "board"{
                    boardEntity = component "Board" "Entity for Board" "Class" "BoardEntity, Entity"
                    boardRepository = component "Board Repository" "Abstract for reposity Board" "Interface" "BoardRepository, Repository"
                    boardQuery = component "Board Query" "Query for read entity Board" "Record" "BoardQuery, Query"
                    boardCommand = component "Board Command" "Comand for create, update and delete entity Board" "Record" "BoardCommand, Command"
                    boardCommandService = component "Board CommandService" "Business Login for create, update and delete entity Board" "Interface and Class" "BoardCommandService, Service"
                    boardQueryService = component "Board QueryService" "Business Login for read entity Board" "Interface and Class" "BoardQueryService, Service"
                }
                group "project"{
                    projectEntity_0 = component "Project" "Entity for Project" "Class" "ProjectEntity, Entity"
                    projectRepository = component "Project Repository" "Abstract for reposity Project" "Interface" "ProjectRepository, Repository"
                    projectQuery = component "Project Query" "Query for read entity Project" "Record" "ProjectQuery, Query"
                    projectCommand = component "Project Command" "Comand for create, update and delete entity Project" "Record" "ProjectCommand, Command"
                    projectCommandService = component "Project CommandService" "Business Login for create, update and delete entity Project" "Interface and Class" "ProjectCommandService, Service"
                    projectQueryService = component "Project QueryService" "Business Login for read entity Project" "Interface and Class" "ProjectQueryService, Service"
                }
                group "user"{
                    userEntity_4 = component "User" "Entity for User" "Class" "UserEntity, Entity"
                    userRepository_4 = component "User Repository" "Abstract for reposity User" "Interface" "UserRepository, Repository"
                    userQuery_4 = component "User Query" "Query for read entity User" "Record" "UserQuery, Query"
                    userQueryService_4 = component "User QueryService" "Business Login for read entity User" "Interface and Class" "UserQueryService, Service"
                }
                group "team"{
                    teamEntity_5 = component "Team" "Entity for Team" "Class" "TeamEntity, Entity"
                    teamRepository_5 = component "Team Repository" "Abstract for reposity Team" "Interface" "TeamRepository, Repository"
                    teamQuery_5 = component "Team Query" "Query for read entity Team" "Record" "TeamQuery, Query"
                    teamQueryService_5 = component "Team QueryService" "Business Login for read entity Team" "Interface and Class" "TeamQueryService, Service"
                    teamCommand_5 = component "Team Command" "Comand for create, update and delete entity Team" "Record" "TeamCommand, Command"
                    teamCommandService_5 = component "Team CommandService" "Business Login for create, update and delete entity Project" "Interface and Class" "TeamCommandService, Service"
                }
                #database = component "Database"
            }
            
            //////////////////////////////////////////
            //////////////////////////////////////////
            projectDevelopmentBc = container "Project Development Bounded Context" "Board for work with the projetcs management" "Express.js v4.19.2" "ProjectDevelopmentBoundedContext"{
                projectDevelopmentController = component "Project Development Controller" "REST of Register Controller" "Express.js v4.19.2"
                 group "board"{
                    boardEntity_4 = component "Board" "Entity for Board" "Class" "BoardEntity, Entity"
                    boardRepository_4 = component "Board Repository" "Abstract for reposity Board" "Interface" "BoardRepository, Repository"
                    boardQuery_4 = component "Board Query" "Query for read entity Board" "Record" "BoardQuery, Query"
                    boardQueryService_4 = component "Board QueryService" "Business Login for read entity Board" "Interface and Class" "BoardQueryService, Service"
                }
                group "boardContent"{
                    boardContentRepository_4 = component "BoardContent Repository" "Abstract for reposity Project" "Interface" "BoardContent, Repository"
                    boardContentEntity_4 = component "BoardContent" "Entity for BoardContent" "Class" "BoardContent, Entity"
                }
                group "project"{
                    projectEntity_4 = component "Project" "Entity for Project" "Class" "ProjectEntity, Entity"
                    projectRepository_4 = component "Project Repository" "Abstract for reposity Project" "Interface" "ProjectRepository, Repository"
                    projectQuery_4 = component "Project Query" "Query for read entity Project" "Record" "ProjectQuery, Query"
                    projectQueryService_4 = component "Project QueryService" "Business Login for read entity Project" "Interface and Class" "ProjectQueryService, Service"
                    projectCommand_4 = component "Project Command" "Comand for create, update and delete entity Project" "Record" "ProjectCommand, Command"
                    projectCommandService_4 = component "Project CommandService" "Business Login for create, update and delete entity Project" "Interface and Class" "ProjectCommandService, Service"
                }
                group "team"{
                    teamEntity_4 = component "Team" "Entity for Team" "Class" "TeamEntity, Entity"
                    teamRepository_4 = component "Team Repository" "Abstract for reposity Team" "Interface" "TeamRepository, Repository"
                    teamQuery_4 = component "Team Query" "Query for read entity Team" "Record" "TeamQuery, Query"
                    teamQueryService_4 = component "Team QueryService" "Business Login for read entity Team" "Interface and Class" "TeamQueryService, Service"
                    teamCommand_4 = component "Team Command" "Comand for create, update and delete entity Team" "Record" "TeamCommand, Command"
                    teamCommandService_4 = component "Team CommandService" "Business Login for create, update and delete entity Project" "Interface and Class" "TeamCommandService, Service"
                }
                
                #database_4 = component "Database"
            }
            
            //////////////////////////////////////////
            //////////////////////////////////////////
            ProjectImplementBc = container "Project Implement Bounded Context" "Last board for look revision of projects" "Express.js v4.19.2" "ProjectImplementBoundedContext" {
                projectImplementController = component "Project Implement Controller" "Monitor and document project progress" "Express.js v4.19.2" "ProjectImplementController, Controller"
                group "evaluation"{
                    evaluationEntity = component "EvaluationProject" "Entity for Evaluation" "Class" "EvaluationProjectEntity, Entity"
                    evaluationRepository = component "EvaluationProject Repository" "Abstract for reposity Evaluation" "Interface" "EvaluationProjectRepository, Repository"
                    evaluationQuery = component "EvaluationProject Query" "Query for read entity Evaluation" "Record" "EvaluationProjectQuery, Query"
                    evaluationCommand = component "EvaluationProject Command" "Comand for create, update and delete entity Evaluation" "Record" "EvaluationProjectCommand, Command"
                    evaluationCommandService = component "EvaluationProject CommandService" "Business Login for create, update and delete entity Evaluation" "Interface and Class" "EvaluationProjectCommandService, Service"
                    evaluationQueryService = component "EvaluationProject QueryService" "Business Login for read entity Evaluation" "Interface and Class" "EvaluationProjectQueryService, Service"
                }
                group "user"{
                    userEntity_3 = component "User" "Entity for User" "Class" "UserEntity, Entity"
                    userRepository_3 = component "User Repository" "Abstract for reposity User" "Interface" "UserRepository, Repository"
                    userQuery_3 = component "User Query" "Query for read entity User" "Record" "UserQuery, Query"
                    userQueryService_3 = component "User QueryService" "Business Login for read entity User" "Interface and Class" "UserQueryService, Service"
                }
                group "project"{
                    projectEntity_3 = component "Project" "Entity for Project" "Class" "ProjectEntity, Entity"
                    projectRepository_3 = component "Project Repository" "Abstract for reposity Project" "Interface" "ProjectRepository, Repository"
                    projectQuery_3 = component "Project Query" "Query for read entity Project" "Record" "ProjectQuery, Query"
                    projectCommand_3 = component "Project Command" "Comand for create, update and delete entity Project" "Record" "ProjectCommand, Command"
                    projectCommandService_3 = component "Project CommandService" "Business Login for create, update and delete entity Project" "Interface and Class" "ProjectCommandService, Service"
                    projectQueryService_3 = component "Project QueryService" "Business Login for read entity Project" "Interface and Class" "ProjectQueryService, Service"
                }
                group "Requeriment"{
                    requerimentEntity_3 = component "Requeriment" "Entity for Requeriment" "Class" "RequerimentEntity, Entity"
                    requerimentRepository_3 = component "Requeriment Repository" "Abstract for reposity Requeriment" "Interface" "RequerimentRepository, Repository"
                }
                group "Incident"{
                    incidentEntity_3 = component "Incident" "Entity for Incident" "Class" "IncidentEntity, Entity"
                    incidentRepository_3 = component "Incident Repository" "Abstract for reposity Incident" "Interface" "IncidentRepository, Repository"
                }
                #database_3 = component "Database"
            }

            
            database = container "Database" "Store data of App" "MySQL v8.0.37" "Database"
        }
        
        googleApi = softwareSystem "Google Api" "Api that return form of register" "GoogleApi"
        outlookApi = softwareSystem "Outlook Api" "Api that return form of register" "OutlookApi"
        zoomApi = softwareSystem "Zoom Api" "Api to generate an online meeting" "ZoomApi"
        googleMeetApi = softwareSystem "Google Meet Api" "Api to generate an online meeting" "GoogleMeetApi"
        youtubeApi = softwareSystem "Youtube Api" "Api that allows watch videos on youtube" "YoutubeApi"
        
        #Context
            //usr - soft Sys
        teamLider -> viewer "Work a with projects for a digital board"
        teamMember -> viewer "Manage the page where members gonna work"
            //soft Sys to
        viewer -> googleApi "Get a register method for user"
        viewer -> outlookApi "Get a register method for user"
        viewer -> zoomApi "obtain a link to online meeting sesion"
        viewer -> googleMeetApi "Get a link to online meeting sesion"
        viewer -> youtubeApi "Get links for videos from youtube"
        
        
        #Container
            //Usr to web
        teamLider -> webApplication "Work a with projects for a digital board"
        teamMember -> webApplication "Work a with projects for a digital board"
        teamMember -> landingPage "Use"
        
            //web to ApiGateway
        webApplication -> apiGateway "Call Api" "JSON / HTTPS"
        landingPage -> webApplication "Redirect"
        
            //apiGateway and BoundedContext
        apiGateway -> loginBc "Call Api" "JSON / HTTPS"
        apiGateway -> userProfileBc "Call Api" "JSON / HTTPS"
        apiGateway -> dashboardBc "Call Api" "JSON / HTTPS"
        apiGateway -> projectGenerationBc "Call Api" "JSON / HTTPS"
        apiGateway -> projectDevelopmentBc "Call Api" "JSON / HTTPS"
        apiGateway -> ProjectImplementBc "Call Api" "JSON / HTTPS"
        
            //BC to BC
        loginBc -> dashboardBc "Call Api" "JSON / HTTPS"
        dashboardBc -> userProfileBc "Call Api" "JSON / HTTPS"
        dashboardBc -> projectGenerationBc "Call Api" "JSON / HTTPS"
        projectGenerationBc -> projectDevelopmentBc "Call Api" "JSON / HTTPS"
        projectDevelopmentBc -> ProjectImplementBc "Call Api" "JSON / HTTPS"
        ProjectImplementBc -> projectDevelopmentBc "Call Api" "JSON / HTTPS"
        
            //BoundedContext and Database
        loginBc -> database "Store, get, update and delete record" "MySQL"
        userProfileBc -> database "Store, get, update and delete record" "MySQL"
        dashboardBc -> database "Store, get, update and delete record" "MySQL"
        projectGenerationBc -> database "Store, get, update and delete record" "MySQL"
        projectDevelopmentBc -> database "Store, get, update and delete record" "MySQL"
        ProjectImplementBc -> database "Store, get, update and delete record" "MySQL"
        
            //BoundedContext and external software systems
        loginBc -> googleApi "Call Api" "JSON / HTTPS"
        loginBc -> outlookApi "Call Api" "JSON / HTTPS"
        dashboardBc -> zoomApi "Call Api" "JSON / HTTPS"
        dashboardBc -> googleMeetApi "Call Api" "JSON / HTTPS"
        projectDevelopmentBc -> youtubeApi "Call Api" "JSON / HTTPS"
        
        
        
        #Complements
            //Login Bonded Context
        apiGateway -> registrationController "Request endpoints"
        
        registrationController -> userQueryService "Call service Method"
        registrationController -> userCommandService "Call service Method"
        registrationController -> repositoryVerification "Call Method"
        
        userCommandService -> userCommand "Handle comand"
        userCommandService -> userRepository "Call repository method"
        userCommandService -> userEntity "Use entity"
        
        userQueryService -> userQuery "Handle query"
        userQueryService -> userRepository "Call repository method"
        userQueryService -> userEntity "Use entity"
        
        userQuery -> userRepository "Call repository method"
        userQuery -> projectRepository_2 "Call repository method"
        userCommand -> userEntity "Use entity"
        
        userRepository -> database "Store, read, update and delete record"
        userRepository -> userEntity "Use entity"
        
        projectRepository_2 -> database "Store, read, update and delete record"
        projectRepository_2 -> projectEntity "Use entity"
        
        userQueryService -> googleApi "Call Api"
        userQueryService -> outlookApi "Call Api"
        
            //Profile Bounded Context
        apiGateway -> profileController  "Request endpoints"
        
        profileController -> userQueryService_2 "Call service Method"
        profileController -> userCommandService_2 "Call service Method"
        
        userCommandService_2 -> userCommand_2 "Handle comand"
        userCommandService_2 -> userRepository_2 "Call repository method"
        userCommandService_2 -> userEntity_2 "Use entity"
        
        userQueryService_2 -> userQuery_2 "Handle query"
        userQueryService_2 -> userRepository_2 "Call repository method"
        userQueryService_2 -> userEntity_2 "Use entity"
        
        userCommand_2 -> userEntity_2 "Use entity"
        
        userRepository_2 -> database "Store, read, update and delete record"
        userRepository_2 -> userEntity_2 "Use entity"
        
        
            //Product Creation Bounded Context
        apiGateway -> projectGenerationBcController "Request endpoints"
        
        projectGenerationBcController -> boardQueryService "Call service Method"
        projectGenerationBcController -> boardCommandService "Call service Method"
        projectGenerationBcController -> projectQueryService "Call service Method"
        projectGenerationBcController -> projectCommandService "Call service Method"
        projectGenerationBcController -> userQueryService_4 "Call service Method"
        projectGenerationBcController -> teamQueryService_5 "Call service Method"
        projectGenerationBcController -> teamCommandService_5 "Call service Method"
        
        boardCommandService -> boardCommand "Handle comand"
        boardCommandService -> boardRepository "Call repository method"
        boardCommandService -> boardEntity "Use entity"
        
        teamCommandService_5 -> teamCommand_5 "Handle comand"
        teamCommandService_5 -> teamRepository_5 "Call repository method"
        teamCommandService_5 -> teamEntity_5 "Use entity"
        
        boardQueryService -> boardQuery "Handle query"
        boardQueryService -> boardRepository "Call repository method"
        boardQueryService -> boardEntity "Use entity"
        
        userQueryService_4 -> userQuery_4 "Handle query"
        userQueryService_4 -> userRepository_4 "Call repository method"
        userQueryService_4 -> userEntity_4 "Use entity"
        
        teamQueryService_5 -> teamQuery_5 "Handle query"
        teamQueryService_5 -> teamRepository_5 "Call repository method"
        teamQueryService_5 -> teamEntity_5 "Use entity"
        
        boardCommand -> boardEntity "Use entity"
        
        boardRepository -> database "Store, read, update and delete record"
        boardRepository -> boardEntity "Use entity"
        
        userRepository_4 -> database "Store, read, update and delete record"
        userRepository_4 -> userEntity_4 "Use entity"
        
        teamRepository_5 -> database "Store, read, update and delete record"
        teamRepository_5 -> teamEntity_5 "Use entity"
        
        #project logic
        projectCommandService -> projectCommand "Handle comand"
        projectCommandService -> projectRepository "Call repository method"
        projectCommandService -> projectEntity_0 "Use entity"
        
        projectQueryService -> projectQuery "Handle query"
        projectQueryService -> projectRepository "Call repository method"
        projectQueryService -> projectEntity_0 "Use entity"
        
        projectCommand -> projectEntity_0 "Use entity"
        
        projectRepository -> database "Store, read, update and delete record"
        projectRepository -> projectEntity_0 "Use entity"
        
        
        
            //Dashboard BC
        apiGateway -> dashboardController "Request endpoints"
        
        dashboardController -> boardQueryService_1 "Call service Method"
        dashboardController -> userQueryService_1 "Call service Method"
        dashboardController -> projectQueryService_1 "Call service Method"
        dashboardController -> meetingQueryService_1 "Call service Method"
        
        projectQueryService_1 -> projectQuery_1 "Handle query"
        projectQueryService_1 -> projectRepository_1 "Call repository method"
        projectQueryService_1 -> projectEntity_1 "Use entity"
        
        userQueryService_1 -> userQuery_1 "Handle query"
        userQueryService_1 -> userRepository_1 "Call repository method"
        userQueryService_1 -> userEntity_1 "Use entity"
        
        boardQueryService_1 -> boardQuery_1 "Handle query"
        boardQueryService_1 -> boardRepository_1 "Call repository method"
        boardQueryService_1 -> boardEntity_1 "Use entity"
        
        meetingQueryService_1 -> meetingQuery_1 "Handle query"
        meetingQueryService_1 -> meetingRepository_1 "Call repository method"
        meetingQueryService_1 -> meetingEntity_1 "Use entity"
        
        boardRepository_1 -> database "Store, read, update and delete record"
        boardRepository_1 -> boardEntity_1 "Use entity"
        
        userRepository_1 -> database "Store, read, update and delete record"
        userRepository_1 -> userEntity_1 "Use entity"
        
        meetingRepository_1 -> database "Store, read, update and delete record"
        meetingRepository_1 -> meetingEntity_1 "Use entity"
        
        projectRepository_1 -> database "Store, read, update and delete record"
        projectRepository_1 -> projectEntity_1 "Use entity"
        
        meetingQueryService_1 -> googleMeetApi "Call Api"
        meetingQueryService_1 -> zoomApi "Call Api"
        
        meetingQuery_1 -> reunionOptionEntity "Use entity"
        boardQuery_1 -> boardContentEntity "Use entity"
        
            //Project Development
        apiGateway -> projectDevelopmentController "Request endpoints"
        
        projectDevelopmentController -> boardQueryService_4 "Call service Method"
        projectDevelopmentController -> projectCommandService_4 "Call service Method"
        projectDevelopmentController -> projectQueryService_4 "Call service Method"
        projectDevelopmentController -> teamQueryService_4 "Call service Method"
        projectDevelopmentController -> teamCommandService_4 "Call service Method"
        
        projectQueryService_4 -> projectQuery_4 "Handle query"
        projectQueryService_4 -> projectRepository_4 "Call repository method"
        projectQueryService_4 -> projectEntity_4 "Use entity"
        
        teamCommandService_4 -> teamCommand_4 "Handle comand"
        teamCommandService_4 -> teamRepository_4 "Call repository method"
        teamCommandService_4 -> teamEntity_4 "Use entity"
        
        teamQueryService_4 -> teamQuery_4 "Handle query"
        teamQueryService_4 -> teamRepository_4 "Call repository method"
        teamQueryService_4 -> teamEntity_4 "Use entity"
        
        projectCommandService_4 -> projectCommand_4 "Handle comand"
        projectCommandService_4 -> projectRepository_4 "Call repository method"
        projectCommandService_4 -> projectEntity_4 "Use entity"
        
        boardQueryService_4 -> boardQuery_4 "Handle query"
        boardQueryService_4 -> boardRepository_4 "Call repository method"
        boardQueryService_4 -> boardEntity_4 "Use entity"
        boardQueryService_4 -> youtubeApi "Call Api"
        
        boardRepository_4 -> database "Store, read, update and delete record"
        boardRepository_4 -> boardEntity_4 "Use entity"
        
        projectRepository_4 -> database "Store, read, update and delete record"
        projectRepository_4 -> projectEntity_4 "Use entity"
        
        teamRepository_4 -> database "Store, read, update and delete record"
        teamRepository_4 -> teamEntity_4 "Use entity"
        
        projectCommand_4 -> projectEntity_4 "Use entity"
        
        boardQuery_4 -> boardContentRepository_4 "Call repository method"
        boardContentRepository_4 -> boardContentEntity_4 "Use entity"
        
        boardContentRepository_4 -> database "Store, read, update and delete record"
        
            //Project Implement Bc
        apiGateway -> projectImplementController "Request endpoints"
        
        projectImplementController -> evaluationQueryService "Call service Method"
        projectImplementController -> evaluationCommandService "Call service Method"
        projectImplementController -> userQueryService_3 "Call service Method"
        projectImplementController -> projectQueryService_3 "Call service Method"
        projectImplementController -> projectCommandService_3 "Call service Method"
        
         
        evaluationQueryService -> evaluationQuery "Handle query"
        evaluationQueryService -> evaluationRepository "Call repository method"
        evaluationQueryService -> evaluationEntity "Use entity"
        
        evaluationCommandService -> evaluationCommand "Handle comand"
        evaluationCommandService -> evaluationRepository "Call repository method"
        evaluationCommandService -> evaluationEntity "Use entity"
        evaluationCommand -> evaluationEntity "Use entity"
        
        evaluationRepository -> evaluationEntity "Use entity"
        evaluationRepository -> database "Store, read, update and delete record"
        
        userQueryService_3 -> userQuery_3 "Handle query"
        userQueryService_3 -> userRepository_3 "Call repository method"
        userQueryService_3 -> userEntity_3 "Use entity"
        
        userRepository_3 -> userEntity_3 "Use entity"
        userRepository_3 -> database "Store, read, update and delete record"
       
        projectQueryService_3 -> projectQuery_3 "Handle query"
        projectQueryService_3 -> projectRepository_3 "Call repository method"
        projectQueryService_3 -> projectEntity_3 "Use entity"
        
        projectCommandService_3 -> projectCommand_3 "Handle comand"
        projectCommandService_3 -> projectRepository_3 "Call repository method"
        projectCommandService_3 -> projectEntity_3 "Use entity"
        
        projectCommand_3 -> projectEntity_3 "Use entity"
        
        projectRepository_3 -> projectEntity_3 "Use entity"
        projectRepository_3 -> database "Store, read, update and delete record"
        
        incidentRepository_3 -> incidentEntity_3 "Use entity"
        incidentRepository_3 -> database "Store, read, update and delete record"
        
        requerimentRepository_3 -> requerimentEntity_3 "Use entity"
        requerimentRepository_3 -> database "Store, read, update and delete record"
        
        evaluationQuery -> incidentRepository_3 "Call repository method"
        evaluationQuery -> requerimentRepository_3 "Call repository method"
        
    }
    
    views viewer {
        systemContext viewer "ViewerSystemContext" {
            include * 
            autolayout
        }
        
        
        container Viewer "ViewerContainer" {
            include * 
            autolayout
        }
        
        
        
        component projectGenerationBc "projectGenerationBc" {
            include *
            autolayout 
        }
        component loginBc "loginBcComponent"{
            include *
            autolayout
        }
        component dashboardBc "DashboardBcComponent"{
            include *
            autolayout
        }
        component userProfileBc "UserProfileBcComponent"{
            include *
            autolayout
        }
        component projectImplementBc "ProjectImplementComponent"{
            include *
            autolayout
        }
        component projectDevelopmentBc "ProjectDevelopmentComponent"{
            include *
            autolayout
        }
        
        styles {
            element "Component"{
                background #445566   
            }
            element "Element" {
                color #ffffff
            }
            element "TeamMember" {
                shape person
                background #124652
            }
            element "TeamLider" {
                shape person
                background #000000
            }
            element "Software System" {
                shape circle
                color #ffffff
            }
            element "OutlookApi"{
                background #000055
            }
            element "GoogleApi"{
                background #005500
            }
            element "Viewer"{
                background #FFAB2B
                shape webBrowser
            }
            element "Database"{
                background #aa0000
                shape Cylinder
            }
            element "ApiGateway"{
                background #0e553d
                shape pipe
            }
            element "WebApplication"{
                background #FFAB2B
                shape webBrowser
            }
            element "LandingPage" {
                background #0d0083
            }
            element "LoginBoundedContext" {
                background #196486
                shape Hexagon
            }
            element "UserProfileBoundedContext" {
                background #196486
                shape Hexagon
            }
            element "DashboarBoundedContext" {
                background #196486
                shape Hexagon
            }
            element "ProjectGenerationBoundedContext" {
                background #196486
                shape Hexagon
            }
            element "ProjectDevelopmentBoundedContext" {
                background #196486
                shape Hexagon
            }
            element "ProjectImplementBoundedContext" {
                background #196486
                shape Hexagon
            }
            element "ZoomApi" {
                background #0000ff
                shape circle
            }
            element "GoogleMeetApi" {
                background #00aa00
                shape circle
            }
            element "YoutubeApi" {
                background #ff0000
                shape circle
            }
             element "AdministrationUser" {
                background #ac000d
                shape Robot
            }
            element "Repository"{
                shape Diamond
                background #E6E220
                color #000000
            }
            element "Service"{
                background #BE8719
                shape Folder
            }
            element "Entity"{
                background #64A62F
            }
            element "Command"{
                shape Ellipse
                background #E6764B
            }
            element "Query"{
                shape Ellipse
                background #3FCBE5
            }
            element "Controller"{
                background #88A5E6
            }
            element "Group:board" {
                color #2DA285
            }
            element "Group:user" {
                color #1A1A88
            }
            element "Group:project" {
                color #C14C38
            }
            element "Group:api" {
                color #A048DB
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}