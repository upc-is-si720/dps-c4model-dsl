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
            
            apiGateway = container "Api Gateway" "Routing los request de los Fronts UI" "api gateway" "ApiGateway" 

            database = container "Database" "Guarda información de las transacciones" "SQL Server v20" "Database"

            syllabusBC = container "Syllabus management Bounded Context" "API RESTful of Syllabus management" "JavaScript v6 / node.js" "SyllabusBC,BoundedContext" {
                group "course" {
                    courseEntity = component "Course Entity" "Class donde se registra los cursos" "Class" "CourseEntity,Entity"
                    courseRepository = component "Course Repository" "Repository Interface de Course Entity" "Interface / JavaScript v6 / node.js" "CourseRepository,Repository"
                    courseQuery = component "Course Query" "Query for read entity Course" "Record" "CourseQuery, Query"
                    courseCommand = component "Course Command" "Command for create, update and delete entity Course" "Record" "CourseCommand, Command"
                    courseCommandService = component "Course CommandService" "Business Logic de la Gestion del Course" "Class / JavaScript v6 / node.js" "CourseCommandService,Service"
                    courseQueryService = component "Course QueryService" "Business Logic del query del Course" "Class / JavaScript v6 / node.js" "CourseQueryService,Service"
                }
                group "syllabus" {
                    syllabusEntity = component "Syllabus Entity" "Class que contiene los Syllabus" "Class" "SyllabusEntity,Entity"
                    syllabusRepository = component "Syllabus Repository" "Repository Interface de Syllabus Entity" "Interface / JavaScript v6 / node.js" "SyllabusRepository,Repository"
                    syllabusQuery = component "Syllabus Query" "Query for read entity Syllabus" "Record" "SyllabusQuery, Query"
                    syllabusCommand = component "Syllabus Command" "Command for create, update and delete entity Syllabus" "Record" "SyllabusCommand, Command"
                    syllabusCommandService = component "Syllabus CommandService" "Business Logic de la Gestion del Syllabus" "Class / JavaScript v6 / node.js" "SyllabusCommandService,Service"
                    syllabusQueryService = component "Syllabus QueryService" "Business Logic del query del Syllabus" "Class / JavaScript v6 / node.js" "SyllabusQueryService,Service"
                }
                group "book" {
                    bookEntity = component "Book Entity" "Class que contiene los Books del Syllabus" "Class" "BookEntity,Entity"
                    bookRepository = component "Book Repository" "Repository Interface de Book Entity" "Interface / JavaScript v6 / node.js" "BookRepository,Repository"
                }
                group "topic" {
                    topicEntity = component "Topic Entity" "Class donde se registra los Topics del Syllabus" "Class" "TopicEntity,Entity"
                    topicRepository = component "Topic respository" "Repository Interface de Topic Entity " "Interface / JavaScript v6 / node.js" "TopicRepository,Repository"
                }

                syllabusController = component "Syllabus Controller" "Api RESTfull Controller class del Syllabus" "Class / JavaScript v6 / node.js" "SyllabusController,Controller"
                courseController = component "Course Controller" "Api RESTfull Controller class del Course" "Class / JavaScript v6 / node.js" "CourseController,Controller"

                apiGateway -> syllabusController "Endpoint request - Syllabus" "HTTP(S) / JSON"
                apiGateway -> courseController "Endpoint request - Syllabus" "HTTP(S) / JSON" 

            }
            enrollmentBC = container "Enrollment Student Bounded Context" "API RESTful of Enrollment Student" "JavaScript v6 / node.js" "EnrollmentBC,BoundedContext"
            facultyBC = container "Faculty management Bounded Context" "API RESTful of Academic management" "JavaScript v6 / node.js" "FacultyBC,BoundedContext"
            scheduleBC = container "Schedule management Context" "API RESTful of Schedule management" "JavaScript v6 / node.js" "ScheduleBC,BoundedContext"

            # Relationships between Person and Mobile
            student -> mobileApp "Enrollment and Query"
            professor -> mobileApp "Query and Store grade and attendance"
            manager -> mobileApp "Manage the software"

            # Relationships Mobile and ApiGateway
            mobileApp -> apiGateway "Endpoint request" "HTTP(S) / JSON"

            # Relationships between ApiGateway and Bounded Context
            apiGateway -> syllabusBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> enrollmentBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> facultyBC "Endpoint request" "HTTP(S) / JSON"
            apiGateway -> scheduleBC "Endpoint request" "HTTP(S) / JSON"

            # Relationships between Bounded Contexts
            scheduleBC -> facultyBC "Connect"
            scheduleBC -> syllabusBC "Connect"
            scheduleBC -> enrollmentBC "Connect"
            syllabusBC -> facultyBC "Connect"
            enrollmentBC -> facultyBC "Connect"

            # Relationships between Bounded Context and Database
            syllabusBC -> database "Store, fetch and update records" "Database Transaction" 
            enrollmentBC -> database "Store, fetch and update records" "Database Transaction"
            facultyBC -> database "Store, fetch and update records" "Database Transaction"
            scheduleBC -> database "Store, fetch and update records" "Database Transaction"

            # Relationships between Bounded Context and External softwareSystem
            enrollmentBC -> reniecApi "Query of person" "TCP/IP"
            
            # Relationships course group 
            courseController -> courseCommandService "Call service method"
            courseController -> courseQueryService "Call service method"
            
            courseCommandService -> courseCommand "Handle command"
            courseCommandService -> courseRepository "Call repository method"
            courseCommandService -> courseEntity "Use entity"
            
            courseQueryService -> courseQuery "Handle query"
            courseQueryService -> courseRepository "Call repository method"
            courseQueryService -> courseEntity "Use entity"
            
            courseRepository -> courseEntity "Methods call" "POO"
            courseRepository -> database "Store, update, delete and fetch records - course" "Database Transaction"
            
            # Relationships syllabus group 
            syllabusController -> syllabusCommandService "Call service method"
            syllabusController -> syllabusQueryService "Call service method"
            
            syllabusCommandService -> syllabusCommand "Handle command"
            syllabusCommandService -> syllabusRepository "Call repository method"
            syllabusCommandService -> syllabusEntity "Use entity"
            
            syllabusQueryService -> syllabusQuery "Handle query"
            syllabusQueryService -> syllabusRepository "Call repository method"
            syllabusQueryService -> syllabusEntity "Use entity"
            
            syllabusRepository -> syllabusEntity "Methods call" "POO"
            syllabusRepository -> database "Store, update, delete and fetch records - syllabus" "Database Transaction"
            
            # Relationships syllabus book
            syllabusCommandService -> bookRepository "Call repository method"
            syllabusCommandService -> bookEntity "Use entity"
            syllabusQueryService -> bookRepository "Call repository method"
            syllabusQueryService -> bookEntity "Use entity"
            
            bookRepository -> bookEntity "Methods call" "POO"
            bookRepository -> database "Store, update, delete and fetch records - book" "Database Transaction"
            
            # Relationships syllabus topic
            syllabusCommandService -> topicRepository "Call repository method"
            syllabusCommandService -> topicEntity "Use entity"
            syllabusQueryService -> topicRepository "Call repository method"
            syllabusQueryService -> topicEntity "Use entity"
            
            topicRepository -> topicEntity "Methods call" "POO"
            topicRepository -> database "Store, update, delete and fetch records - topic" "Database Transaction"
        }

        #RelationShip
        student -> academic "Estudiante usa la App"
        professor -> academic "Usa App"
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
        component syllabusBC "SyllabusComponent" "Diagrama de Componentes" {
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
