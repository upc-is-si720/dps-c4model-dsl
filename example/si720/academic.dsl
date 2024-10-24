workspace "Academic" "Sistema Académico de centros de enseñanza" {

    model {
        # persons
        student = person "Student" "Estudiante universitario" "Student"
        professor = person "Professor" "Profesor Universitario" "Professor"
        manager = person "Personal Administrativo" "Personal Administrativo de la Institución" "Manager"

        # External SoftwareSystem
        reniecApi = softwareSystem "Reniec API" "Web Service de RENIEC" "ReniecApi"
        
        # SoftwareSystem
        academic = softwareSystem "Academic" "Sistema Académico de centros de enseñanza" "Academic" {
            mobileApp = container "Mobile App" "Mobile Application del Sistema Academico" "Flutter v8" "MobileApp"
            webApp = container "Web Application" "Front in Browser" "React.js v18.2" "WebApp"
            landingPage = container "Landing Page" "Application marketing page" "Bootstrap v5.3.3" "LandingPage"
            
            apiGateway = container "Api Gateway" "Routing los request de los Fronts UI" "api gateway" "ApiGateway" 

            courseBC = container "Course management Bounded Context" "API RESTful of Course management" "JavaScript v6 / node.js" "CourseBC,BoundedContext" {

                curriculumController = component "Curriculum Controller" "Api RESTfull Controller class del Curriculum" "Class / JavaScript v6 / node.js" "CurriculumController,Controller"
                courseController = component "Course Controller" "Api RESTfull Controller class del Course" "Class / JavaScript v6 / node.js" "CourseController,Controller"
                syllabusController = component "Syllabus Controller" "Api RESTfull Controller class del Syllabus" "Class / JavaScript v6 / node.js" "SyllabusController,Controller"

                group "curriculum" {
                    curriculumRepository = component "Curriculum Repository" "Repository Interface de Curriculum" "Interface / JavaScript v6 / node.js" "CurriculumRepository,Repository"
                    curriculumQuery = component "Curriculum Query" "Query for read Curriculum" "Record" "CurriculumQuery, Query"
                    curriculumCommand = component "Curriculum Command" "Command for create, update and delete Curriculum" "Record" "CurriculumCommand, Command"
                    curriculumCommandService = component "Curriculum CommandService" "Business Logic de la Gestion del Curriculum" "Class / JavaScript v6 / node.js" "CurriculumCommandService,Service"
                    curriculumQueryService = component "Curriculum QueryService" "Business Logic del query del Curriculum" "Class / JavaScript v6 / node.js" "CurriculumQueryService,Service"
                }
                group "course" {
                    courseRepository = component "Course Repository" "Repository Interface de Course" "Interface / JavaScript v6 / node.js" "CourseRepository,Repository"
                    courseQuery = component "Course Query" "Query for read Course" "Record" "CourseQuery, Query"
                    courseCommand = component "Course Command" "Command for create, update and delete Course" "Record" "CourseCommand, Command"
                    courseCommandService = component "Course CommandService" "Business Logic de la Gestion del Course" "Class / JavaScript v6 / node.js" "CourseCommandService,Service"
                    courseQueryService = component "Course QueryService" "Business Logic del query del Course" "Class / JavaScript v6 / node.js" "CourseQueryService,Service"
                }
                group "syllabus" {
                    syllabusRepository = component "Syllabus Repository" "Repository Interface de Syllabus" "Interface / JavaScript v6 / node.js" "SyllabusRepository,Repository"
                    syllabusQuery = component "Syllabus Query" "Query for read Syllabus" "Record" "SyllabusQuery, Query"
                    syllabusCommand = component "Syllabus Command" "Command for create, update and delete Syllabus" "Record" "SyllabusCommand, Command"
                    syllabusCommandService = component "Syllabus CommandService" "Business Logic de la Gestion del Syllabus" "Class / JavaScript v6 / node.js" "SyllabusCommandService,Service"
                    syllabusQueryService = component "Syllabus QueryService" "Business Logic del query del Syllabus" "Class / JavaScript v6 / node.js" "SyllabusQueryService,Service"
                }
                group "book" {                    
                    bookQuery = component "Book Query" "Query for read Book" "Record" "BookQuery, Query"
                    bookCommand = component "Book Command" "Command for create, update and delete Book" "Record" "BookCommand, Command"
                }
                group "topic" {
                    topicQuery = component "Topic Query" "Query for read Topic" "Record" "TopicQuery, Query"
                    topicCommand = component "Topic Command" "Command for create, update and delete Topic" "Record" "TopicCommand, Command"
                }
                group "outboundservices" {
                    programExternalService = component "Program ExternalService" "External Business Logic de Program" "Class / JavaScript v6 / node.js" "ProgramExternalService,ExternalService"
                }
                group "inboundservices" {
                    courseContextFacade = component "Course ContextFacade" "Facade del Business Logic de Course" "Class / JavaScript v6 / node.js" "CourseContextFacade,ContextFacade"
                }

            }
            enrollmentBC = container "Enrollment Student Bounded Context" "API RESTful of Enrollment Student" "JavaScript v6 / node.js" "EnrollmentBC,BoundedContext"
            facultyBC = container "Faculty management Bounded Context" "API RESTful of Academic management" "JavaScript v6 / node.js" "FacultyBC,BoundedContext"
            scheduleBC = container "Schedule management Context" "API RESTful of Schedule management" "JavaScript v6 / node.js" "ScheduleBC,BoundedContext"

            group "databases" {
                courseDatabase = container "Course Database" "Guarda información de las transacciones" "SQL Server v20" "CourseDatabase, Database"
                enrollmentDatabase = container "Enrollment Database" "Guarda información de las transacciones" "SQL Server v20" "EnrollmentDatabase, Database"
                facultyDatabase = container "Faculty Database" "Guarda información de las transacciones" "SQL Server v20" "FacultyDatabase, Database"
                scheduleDatabase = container "Schedule Database" "Guarda información de las transacciones" "SQL Server v20" "ScheduleDatabase, Database"
            }            

            # Relationships container

            ## Relationships between Person and Mobile
            student -> mobileApp "Enrollment and Query"
            student -> webApp "Enrollment and Query"
            student -> landingPage "Visit"
            professor -> webApp "Query and Store grade and attendance"            
            professor -> landingPage "Visit"
            manager -> webApp "Manage the software"

            ## Relationships Mobile, Web, landing and ApiGateway
            mobileApp -> apiGateway "Endpoint request" "HTTP(S) / JSON"
            webApp -> apiGateway "Endpoint request" "HTTP(S) / JSON"
            landingPage -> webApp "Redirect"

            ## Relationships between ApiGateway and Bounded Context
            apiGateway -> courseBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> enrollmentBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> facultyBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> scheduleBC "Endpoint request" "HTTP(S) / JSON"

            ## Relationships between Bounded Contexts
            scheduleBC -> facultyBC "Connect"
            scheduleBC -> courseBC "Connect"
            enrollmentBC -> scheduleBC "Connect"
            enrollmentBC -> facultyBC "Connect"
            courseBC -> facultyBC "Connect"            

            ## Relationships between Bounded Context and Databases
            courseBC -> courseDatabase "Store, fetch and update records" "Database Transaction" 
            enrollmentBC -> enrollmentDatabase "Store, fetch and update records" "Database Transaction"
            facultyBC -> facultyDatabase "Store, fetch and update records" "Database Transaction"
            scheduleBC -> scheduleDatabase "Store, fetch and update records" "Database Transaction"

            ## Relationships between Bounded Context and External softwareSystem
            enrollmentBC -> reniecApi "Query of person" "TCP/IP"
            
            # Relationships Course Bounded Context

            ## Relationships between Api Gateway and Controllers
            apiGateway -> curriculumController "Endpoint request - Curriculum" "HTTP(S) / JSON" 
            apiGateway -> courseController "Endpoint request - Course" "HTTP(S) / JSON" 
            apiGateway -> syllabusController "Endpoint request - Syllabus" "HTTP(S) / JSON"   

            ## Relationships curriculum group 
            curriculumController -> curriculumCommandService "Call service method"
            curriculumController -> curriculumQueryService "Call service method"            
            
            curriculumCommandService -> curriculumCommand "Handle command"
            curriculumCommandService -> curriculumRepository "Call repository method"
            
            curriculumQueryService -> curriculumQuery "Handle query"
            curriculumQueryService -> curriculumRepository "Call repository method"
            
            curriculumRepository -> courseDatabase "Store, update, delete and fetch records - curriculum" "Database Transaction"

            ## Relationships course group 
            courseController -> courseCommandService "Call service method"
            courseController -> courseQueryService "Call service method"
            
            courseCommandService -> courseCommand "Handle command"
            courseCommandService -> courseRepository "Call repository method"
            
            courseQueryService -> courseQuery "Handle query"
            courseQueryService -> courseRepository "Call repository method"
            
            courseRepository -> courseDatabase "Store, update, delete and fetch records - course" "Database Transaction"
            
            ## Relationships syllabus group 
            syllabusController -> syllabusCommandService "Call service method"
            syllabusController -> syllabusQueryService "Call service method"
            
            syllabusCommandService -> syllabusCommand "Handle command"
            syllabusCommandService -> syllabusRepository "Call repository method"
            
            syllabusQueryService -> syllabusQuery "Handle query"
            syllabusQueryService -> syllabusRepository "Call repository method"
            
            syllabusRepository -> courseDatabase "Store, update, delete and fetch records - syllabus" "Database Transaction"

            ## Relationships syllabus and book group 
            syllabusCommandService -> bookCommand "Handle command"
            syllabusQueryService -> bookQuery "Handle query"

            ## Relationships syllabus and topic group 
            syllabusCommandService -> topicCommand "Handle command"
            syllabusQueryService -> topicQuery "Handle query"

            # Relationships outboundservices between ExternalService and External Bounded Context 
            curriculumController -> programExternalService "Call external service method"
            curriculumCommandService -> programExternalService "Call external service method"
            curriculumQueryService -> programExternalService "Call external service method"

            programExternalService -> facultyBC "Call service method"

            # Relationships inboundservices between ContextFacade, Services and External Bounded Context 
            courseContextFacade -> courseCommandService "Call service method"
            courseContextFacade -> courseQueryService "Call service method"
            scheduleBC -> courseContextFacade "Call service method"
        }

        # RelationShip systemContext
        student -> academic "Usa App"
        professor -> academic "Usa App"
        manager -> academic "Usa App"
        academic -> reniecApi "Consulta"

    }
    views {
        systemContext academic "AcademicSystemContext" "Sistema Académico" {
            include *
            autoLayout tb
        }
        container academic "AcademicContainer" "Diagrama de Contenedores" {
            include *
            autoLayout tb
        }
        component courseBC "CourseComponent" "Diagrama de Componentes" {
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
            element "MobileApp" {
                shape MobileDevicePortrait
                background #f2f6ff
                color #3f47e1
            }
            element "WebApp" {
                shape WebBrowser
                background #2067F5
                color #FFFFFF
                icon https://static.structurizr.com/themes/amazon-web-services-2020.04.30/Amazon-EC2_D2-Instance_light-bg@4x.png
            }
            element "LandingPage" {
                shape WebBrowser
                background #048000
                color #FFFFFF
            }
            element "ApiGateway" {
                shape Pipe
                background #884A39                
            }
            element "Database" {
                shape Cylinder
                background #CF0A0A
            }
            element "Service" {
                shape Hexagon
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
            element "ExternalService" {
                shape Folder
                background #785ba1
                color #FFFFFF
            }
            element "ContextFacade" {
                shape Folder
                background #9710b1
                color #FFFFFF
            }
            element "Container" {
                shape Hexagon
                background #805B17
                color #FFFFFF
            }
            element "Group" {
                color #9a0000
            }
        }
    }

}
