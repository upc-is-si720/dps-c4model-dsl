workspace "MindCare" "La aplicación es una herramienta de apoyo para la salud mental de los estudiantes universitarios." {

    model {
    
        universityStudent = person "University Student" "Un estudiante universitario que busca mejorar y cuidar su salud mental " "University Student"
        psychologist = person "Psychologist" "Psicologos que busca ofrecer sus servios para ayudarles a mejorar y cuidar de salud mental"
        
        mindCare = softwareSystem "MindCare" "La aplicación es una herramienta de apoyo para la salud mental de los estudiantes universitarios." "MindCare"{
            mobilApp = container "Mobile App" "Proporciona un conjunto de funciones de tratamiento a los estudiantes a través de su dispositivo móvil." "Flutter 3.24.0" "MobileApp" 
            landingPage = container "Landing Page" "Pagina de información de nuestro producto" "Tailwindcss v3.0" "LandingPage"
            apiGateway = container "APIGateway" "Controlador de tráfico de solicitudes de API entrantes de Backend" " Azure API Gateway" "ApiGateway"
            
            perfilUsuarioBC = container "PerfilUsuario Bounded Context" "Registrar usuario" "Django/Python v3.13.0" {
                group "UniversityStudent" {
                    universityStudentRepository = component "University Student Repository" "Interfaz del repositorio para la entidad UniversityStudent" "UniversityStudentRepository, Repository"
                    universityStudentQueryService = component "University Student QueryService" "Lógica de negocio para las consultas de UniversityStudent" "UniversityStudentQueryService, Query"
                    universityStudentCommandService = component "University Student CommandService" "Lógica de negocio para los comandos de UniversityStudent" "UniversityStudent, Service"
                    universityStudentQuery = component "University Student Query" "Consulta para leer una entidad UniversityStudent" "UniversityStudent, Query"
                    universityStudentCommand = component "University Student Command" "Comando para crear, actualizar y eliminar una entidad UniversityStudent" "UniversityStudent, Command"
                }
                group "Psychologist" {
                    psychologistRepository = component "Psychologist Repository" "Interfaz del repositorio para la entidad Psychologist" "PsychologistRepository, Repository"
                    psychologistQueryService = component "Psychologist QueryService" "Lógica de negocio para las consultas de Psychologist" "Psychologist,Query"
                    psychologistCommandService = component "Psychologist CommandService" "Lógica de negocio para los comandos de Psychologist" "Psychologist,Service"
                    psychologistQuery = component "Psychologist Query" "Consulta para leer una entidad Psychologist" "Psychologist,Query"
                    psychologistCommand = component "Psychologist Command" "Comando para crear, actualizar y eliminar una entidad Psychologist" "Psychologist,Command"
                }
                universityStudentBCController = component "UniversityStudentBC Controller" "API RESTful para UniversityStudent" "UniversityStudent,Controller"
                psychologistBCController = component "PsychologistBC Controller" "API RESTful para Psychologist" "Psychologist,Controller"
                
                perfilUsuarioFacade = component "Fachada del Perfil de Usuario" "Proporciona acceso a la información del perfil, incluyendo el ID del psicólogo" "Clase / Django/Python v3.13.0" "PerfilUsuarioFacade,ContextFacade"
            }
                        
            testInitialBC = container "Test Initial BC" "BC que muestra un test Incial al ingresar por primera vez" "Django/Python v3.13.0" "testInitialBC"{
                 group "Test" {
                        testRepository = component "Test Repository" "Interfaz del repositorio para la entidad Test" "TestRepository, Repository"
                        testQueryService = component "Test QueryService" "Lógica de negocio para las consultas del Test" "TestQueryService, Query"
                        testCommandService = component "Test CommandService" "Lógica de negocio para los comandos del Test" "TestCommandService, Service"
                        testQuery = component "Test Query" "Consulta para leer una entidad Test" "TestQuery, Query"
                        testCommand = component "Test Command" "Comando para crear, actualizar y eliminar una entidad Test" "TestCommand, Command"
                }
                testBCController = component "TestBC Controller" "API RESTful para el Test" "TestBCController, Controller"
            }
            
            emotionalStateBC = container "Emotional State BC" "BC que muestra el resumen del estado emocial del estudiante" "Django/Python v3.13.0" "emotionalStateBC" {
                group "EmotionalState" {
                    emotionalStateRepository = component "Emotional State Repository" "Interfaz del repositorio para la entidad Emotional State" "EmotionalStateRepository, Repository"
                    emotionalStateQueryService = component "Emotional State QueryService" "Lógica de negocio para las consultas del estado emocional" "EmotionalStateQueryService, Query"
                    emotionalStateCommandService = component "Emotional State CommandService" "Lógica de negocio para los comandos del estado emocional" "EmotionalStateCommandService, Service"
                    emotionalStateQuery = component "Emotional State Query" "Consulta para leer una entidad de estado emocional" "EmotionalStateQuery, Query"
                    emotionalStateCommand = component "Emotional State Command" "Comando para crear, actualizar y eliminar una entidad de estado emocional" "EmotionalStateCommand, Command"
                }
                emotionalStateBCController = component "EmotionalStateBC Controller" "API RESTful para gestionar el estado emocional del estudiante" "EmotionalStateBCController, Controller"
            } 
            
            dailyEvaluationBC = container "Daily Evaluations BC" "BC que gestiona y muestra las evaluaciones diarias" "Django/Python v3.13.0" "dailyEvaluationBC" {
                
                autoevaluacionController = component "Autoevaluación Controller" "RESTful API Controller para la gestión de autoevaluaciones" "Class / Django/Python v3.13.0" "AutoevaluacionController,Controller"
                horarioController = component "Horario Controller" "RESTful API Controller para la gestión de horarios de autoevaluaciones" "Class / Django/Python v3.13.0" "HorarioController,Controller"
                preguntaController = component "Pregunta Controller" "RESTful API Controller para la gestión de autoevaluaciones" "Class / Django/Python v3.13.0" "PreguntaController,Controller"
                resultadoController = component "Resultado Controller" "RESTful API Controller para la gestión de horarios de autoevaluaciones" "Class / Django/Python v3.13.0" "ResultadoController,Controller"
            
                group "Autoevaluaciones" {
                    autoevaluacionRepository = component "Autoevaluación Repository" "Repository Interface para Autoevaluaciones" "Interface / Django/Python v3.13.0" "AutoevaluacionRepository,Repository"
                    autoevaluacionQuery = component "Autoevaluación Query" "Query para leer Autoevaluaciones" "Record" "AutoevaluacionQuery,Query"
                    autoevaluacionCommand = component "Autoevaluación Command" "Command para crear, actualizar y eliminar Autoevaluaciones" "Record" "AutoevaluacionCommand,Command"
                    autoevaluacionCommandService = component "Autoevaluación CommandService" "Lógica de negocio de los comandos de Autoevaluaciones" "Class / Django/Python v3.13.0" "AutoevaluacionCommandService,Service"
                    autoevaluacionQueryService = component "Autoevaluación QueryService" "Lógica de negocio de las consultas de Autoevaluaciones" "Class / Django/Python v3.13.0" "AutoevaluacionQueryService,Service"
                }
            
                group "Horarios" {
                    horarioRepository = component "Horario Repository" "Repository Interface para Horarios" "Interface / Django/Python v3.13.0" "HorarioRepository,Repository"
                    horarioQuery = component "Horario Query" "Query para leer Horarios de Autoevaluaciones" "Record" "HorarioQuery,Query"
                    horarioCommand = component "Horario Command" "Command para crear, actualizar y eliminar Horarios" "Record" "HorarioCommand,Command"
                    horarioCommandService = component "Horario CommandService" "Lógica de negocio de los comandos de Horarios" "Class / Django/Python v3.13.0" "HorarioCommandService,Service"
                    horarioQueryService = component "Horario QueryService" "Lógica de negocio de las consultas de Horarios" "Class / Django/Python v3.13.0" "HorarioQueryService,Service"
                }
            
                group "BancoPreguntas" {
                    preguntaRepository = component "Pregunta Repository" "Repository Interface para Banco de Preguntas" "Interface / Django/Python v3.13.0" "PreguntaRepository,Repository"
                    preguntaQuery = component "Pregunta Query" "Query para leer Preguntas" "Record" "PreguntaQuery,Query"
                    preguntaCommand = component "Pregunta Command" "Command para crear, actualizar y eliminar Preguntas" "Record" "PreguntaCommand,Command"
                    preguntaCommandService = component "Pregunta CommandService" "Lógica de negocio de los comandos de Preguntas" "Class / Django/Python v3.13.0" "PreguntaCommandService,Service"
                    preguntaQueryService = component "Pregunta QueryService" "Lógica de negocio de las consultas de Preguntas" "Class / Django/Python v3.13.0" "PreguntaQueryService,Service"
                }
            
                group "Resultados" {
                    resultadoRepository = component "Resultado Repository" "Repository Interface para Resultados" "Interface / Django/Python v3.13.0" "ResultadoRepository,Repository"
                    resultadoQuery = component "Resultado Query" "Query para leer Resultados de Autoevaluaciones" "Record" "ResultadoQuery,Query"
                    resultadoCommand = component "Resultado Command" "Command para crear, actualizar y eliminar Resultados" "Record" "ResultadoCommand,Command"
                    resultadoCommandService = component "Resultado CommandService" "Lógica de negocio de los comandos de Resultados" "Class / Django/Python v3.13.0" "ResultadoCommandService,Service"
                    resultadoQueryService = component "Resultado QueryService" "Lógica de negocio de las consultas de Resultados" "Class / Django/Python v3.13.0" "ResultadoQueryService,Service"
                }
                
                group "Notificaciones" {
                    notificacionService = component "Notificación Service" "Servicio para enviar recordatorios y alertas críticas" "Class / Spring Boot / Java 17" "NotificacionService,Service"
                }
            
                group "Inbound Services" {
                    autoevaluacionContextFacade = component "Autoevaluación ContextFacade" "Fachada de lógica de negocio de Autoevaluaciones" "Class / Django/Python v3.13.0" "AutoevaluacionContextFacade,ContextFacade"
                }
            }
            
            treatmentPlanBC = container "Treatment Plan BC" "BC genera y muestra el plant de tratamiento" "Django/Python v3.13.0" "treatmentPlanBC" {
                
                tratamientoController = component "Controlador de Planes de Tratamiento" "Controlador API RESTful para gestionar los planes de tratamiento" "Clase / Django/Python v3.13.0" "TratamientoController,Controller"
                recomendacionController = component "Controlador de Recomendaciones" "Controlador API RESTful para gestionar recomendaciones y comentarios" "Clase / Django/Python v3.13.0" "RecomendacionController,Controller"
                recursoExternoController = component "Controlador de Recursos Externos" "Controlador API RESTful para gestionar recursos externos (videos, imágenes, enlaces)" "Clase / Django/Python v3.13.0" "RecursoExternoController,Controller"
            
                group "Tratamientos" {
                    tratamientoRepository = component "Repositorio de Planes de Tratamiento" "Repositorio para la persistencia de planes de tratamiento" "Interface / Django/Python v3.13.0" "TratamientoRepository,Repository"
                    tratamientoQuery = component "Consulta de Planes de Tratamiento" "Consulta para leer planes de tratamiento por ID del estudiante y psicólogo" "Registro" "TratamientoQuery,Query"
                    tratamientoCommand = component "Comando de Planes de Tratamiento" "Comando para crear, actualizar y eliminar planes de tratamiento" "Registro" "TratamientoCommand,Command"
                    tratamientoCommandService = component "Servicio de Comandos de Planes de Tratamiento" "Lógica de negocio para comandos de planes de tratamiento" "Clase / Django/Python v3.13.0" "TratamientoCommandService,Service"
                    tratamientoQueryService = component "Servicio de Consultas de Planes de Tratamiento" "Lógica de negocio para consultas de planes de tratamiento" "Clase / Django/Python v3.13.0" "TratamientoQueryService,Service"
                }
            
                group "Recomendaciones" {
                    recomendacionRepository = component "Repositorio de Recomendaciones" "Repositorio para la persistencia de recomendaciones y comentarios del psicólogo" "Interface / Django/Python v3.13.0" "RecomendacionRepository,Repository"
                    recomendacionQuery = component "Consulta de Recomendaciones" "Consulta para leer recomendaciones y comentarios" "Registro" "RecomendacionQuery,Query"
                    recomendacionCommand = component "Comando de Recomendaciones" "Comando para crear, actualizar y eliminar recomendaciones" "Registro" "RecomendacionCommand,Command"
                    recomendacionCommandService = component "Servicio de Comandos de Recomendaciones" "Lógica de negocio para comandos de recomendaciones y comentarios" "Clase / Django/Python v3.13.0" "RecomendacionCommandService,Service"
                    recomendacionQueryService = component "Servicio de Consultas de Recomendaciones" "Lógica de negocio para consultas de recomendaciones y comentarios" "Clase / Django/Python v3.13.0" "RecomendacionQueryService,Service"
                }
            
                group "Recursos Externos" {
                    recursoExternoRepository = component "Repositorio de Recursos Externos" "Repositorio para la persistencia de recursos externos (videos, imágenes, enlaces)" "Interface / Django/Python v3.13.0" "RecursoExternoRepository,Repository"
                    recursoExternoQuery = component "Consulta de Recursos Externos" "Consulta para leer recursos externos" "Registro" "RecursoExternoQuery,Query"
                    recursoExternoCommand = component "Comando de Recursos Externos" "Comando para crear, actualizar y eliminar recursos externos" "Registro" "RecursoExternoCommand,Command"
                    recursoExternoCommandService = component "Servicio de Comandos de Recursos Externos" "Lógica de negocio para comandos de recursos externos" "Clase / Django/Python v3.13.0" "RecursoExternoCommandService,Service"
                    recursoExternoQueryService = component "Servicio de Consultas de Recursos Externos" "Lógica de negocio para consultas de recursos externos" "Clase / Django/Python v3.13.0" "RecursoExternoQueryService,Service"
                }
            
                group "Servicios de Entrada" {
                    planDeTratamientoFacade = component "Fachada del Plan de Tratamiento" "Fachada para encapsular la lógica de planes de tratamiento" "Clase / Django/Python v3.13.0" "PlanDeTratamientoFacade,FachadaDeContexto"
                }
            
                group "Notificaciones" {
                    servicioDeNotificaciones = component "Servicio de Notificaciones" "Servicio para notificar al estudiante sobre actualizaciones del plan de tratamiento" "Clase / Django/Python v3.13.0" "ServicioDeNotificaciones,Service"
                }
            }
            
            patternDetectionBC = container "Pattern Detection BC" "BC que gestiona los patrones de desteccion del estudiante" "Django/Python v3.13.0" "patternDetectionBC" {
                 group "PatternDetection" {
                    patternDetectionRepository = component "Pattern Detection Repository" "Interfaz del repositorio para la entidad Pattern Detection" "PatternDetectionRepository, Repository"
                    patternDetectionQueryService = component "Pattern Detection QueryService" "Lógica de negocio para las consultas de patrones de detección" "PatternDetectionQueryService, Query"
                    patternDetectionCommandService = component "Pattern Detection CommandService" "Lógica de negocio para los comandos de patrones de detección" "PatternDetectionCommandService, Service"
                    patternDetectionQuery = component "Pattern Detection Query" "Consulta para leer una entidad de patrón de detección" "PatternDetectionQuery, Query"
                    patternDetectionCommand = component "Pattern Detection Command" "Comando para crear, actualizar y eliminar una entidad de patrón de detección" "PatternDetectionCommand, Command"
                }
                patternDetectionBCController = component "PatternDetectionBC Controller" "API RESTful para gestionar los patrones de detección" "PatternDetectionBCController, Controller"
            }
            
            emergencyManagementBC = container "Emergency Management BC" "BC que se encarga la gestion del llamado de emergencia " "Django/Python v3.13.0" "emergencyManagementBC" {
                 group "EmergencyManagement" {
                        emergencyManagementRepository = component "Emergency Management Repository" "Interfaz del repositorio para la entidad Emergency Management" "EmergencyManagementRepository, Repository"
                        emergencyManagementQueryService = component "Emergency Management QueryService" "Lógica de negocio para las consultas de gestión de emergencias" "EmergencyManagementQueryService, Query"
                        emergencyManagementCommandService = component "Emergency Management CommandService" "Lógica de negocio para los comandos de gestión de emergencias" "EmergencyManagementCommandService, Service"
                        emergencyManagementQuery = component "Emergency Management Query" "Consulta para leer una entidad de gestión de emergencia" "EmergencyManagementQuery, Query"
                        emergencyManagementCommand = component "Emergency Management Command" "Comando para crear, actualizar y eliminar una entidad de gestión de emergencia" "EmergencyManagementCommand, Command"
                    }
                    emergencyManagementBCController = component "EmergencyManagementBC Controller" "API RESTful para gestionar el llamado de emergencia" "EmergencyManagementBCController, Controller"
            }
            
            schedulesettingBC = container "Schedule Settings BC" "BC que configura los horarios de atencion del psicologo" "Django/Python v3.13.0" "schedulesettingBC" {
                group "ScheduleSetting" {
                    scheduleSettingRepository = component "Schedule Setting Repository" "Interfaz del repositorio para la entidad Schedule Setting" "ScheduleSettingRepository, Repository"
                    scheduleSettingQueryService = component "Schedule Setting QueryService" "Lógica de negocio para las consultas de configuración de horarios" "ScheduleSettingQueryService, Query"
                    scheduleSettingCommandService = component "Schedule Setting CommandService" "Lógica de negocio para los comandos de configuración de horarios" "ScheduleSettingCommandService, Service"
                    scheduleSettingQuery = component "Schedule Setting Query" "Consulta para leer una entidad de configuración de horario" "ScheduleSettingQuery, Query"
                    scheduleSettingCommand = component "Schedule Setting Command" "Comando para crear, actualizar y eliminar una entidad de configuración de horario" "ScheduleSettingCommand, Command"
                }
                scheduleSettingBCController = component "ScheduleSettingBC Controller" "API RESTful para gestionar la configuración de horarios" "ScheduleSettingBCController, Controller"
            }
            
            appointmentBC = container "Appointment BC" "BC que se encarga la reservacion de citas " "Django/Python v3.13.0"  "appointmentBC" {
                         group "Appointment" {
                appointmentRepository = component "Appointment Repository" "Interfaz del repositorio para la entidad Appointment" "AppointmentRepository, Repository"
                appointmentQueryService = component "Appointment QueryService" "Lógica de negocio para las consultas de reservaciones de citas" "AppointmentQueryService, Query"
                appointmentCommandService = component "Appointment CommandService" "Lógica de negocio para los comandos de reservaciones de citas" "AppointmentCommandService, Service"
                appointmentQuery = component "Appointment Query" "Consulta para leer una entidad de reservación de cita" "AppointmentQuery, Query"
                appointmentCommand = component "Appointment Command" "Comando para crear, actualizar y eliminar una entidad de reservación de cita" "AppointmentCommand, Command"
            }
            appointmentBCController = component "AppointmentBC Controller" "API RESTful para gestionar la reservación de citas" "AppointmentBCController, Controller"
            }
            
            messagingSystemBC = container "Messaging System BC" "BC que se encarga de la comunicaion entre el psicologo y el estudiante" "Django/Python v3.13.0" "messagingSystemBC" {
                group "MessagingSystem" {
                    messagingRepository = component "Messaging Repository" "Interfaz del repositorio para la entidad de Mensajes" "MessagingRepository, Repository"
                    messagingQueryService = component "Messaging QueryService" "Lógica de negocio para las consultas de mensajes" "MessagingQueryService, Query"
                    messagingCommandService = component "Messaging CommandService" "Lógica de negocio para los comandos de mensajes" "MessagingCommandService, Service"
                    messagingQuery = component "Messaging Query" "Consulta para leer una entidad de mensaje" "MessagingQuery, Query"
                    messagingCommand = component "Messaging Command" "Comando para crear, actualizar y eliminar una entidad de mensaje" "MessagingCommand, Command"
                }
                messagingSystemBCController = component "MessagingSystemBC Controller" "API RESTful para gestionar la comunicación de mensajes" "MessagingSystemBCController, Controller"
            }
            
            paymentMethodBC = container "Payment Methods BC" "BC que se encarga de crear los metodos de pago y pagar" "Django/Python v3.13.0" "paymentMethodBC" {
                group "Card" {
                    cardRepository = component "Card Repository" "Interfaz del repositorio para la entidad Card" "CardRepository, Repository"
                    cardQueryService = component "Card QueryService" "Lógica de negocio para las consultas de métodos de pago con tarjeta" "CardQueryService, Query"
                    cardCommandService = component "Card CommandService" "Lógica de negocio para los comandos de métodos de pago con tarjeta" "CardCommandService, Service"
                    cardQuery = component "Card Query" "Consulta para leer una entidad de método de pago con tarjeta" "CardQuery, Query"
                    cardCommand = component "Card Command" "Comando para crear, actualizar y eliminar una entidad de método de pago con tarjeta" "CardCommand, Command"
                }
                paymentMethodBCController = component "PaymentMethodBC Controller" "API RESTful para gestionar los métodos de pago" "PaymentMethodBCController, Controller"
            }
            
            group DataBase {
                perfilUsuarioDB = container "Perfil Usuario DB" "Register user, guarda los datos de los usuarios" "MariaDB Database v11.7.0" "PerfilUsuarioDB,DataBase"
                testInitialDB = container "Test Initial DB" "DB que guarda las respuestas del test inicial" "MariaDB Database v11.7.0" "TestInitialDB,DataBase"
                emotionalStateDB = container "Emotional State DB" "DB del historial de resumen de estados " "MariaDB Database v11.7.0" "EmotionalStateDB,DataBase"
                dailyEvaluationDB = container "Daily Evaluations DB" "DB que guarda los datos de los autoevaluaciones" "MariaDB Database v11.7.0" "DailyEvaluationDB,DataBase"
                treatmentPlanDB = container "Treatment Plan DB" "DB que guarda los datos de los tratamiento personalizados" "MariaDB Database v11.7.0" "TreatmentPlanDB,DataBase"
                patternDetectionDB = container "Pattern Detection DB" "DB que guarda los patrones de incidencia" "MariaDB Database v11.7.0" "PatternDetectionDB,DataBase"
                emergencyManagementDB = container "Emergency Management DB" "DB que guarda las escalas de severidad " "MariaDB Database v11.7.0" "EmergencyManagementDB,DataBase"
                schedulesettingDB = container "Schedule Settings DB" "DB que guarda los horaios de los psicologos" "MariaDB Database v11.7.0" "SchedulesettingDB,DataBase"
                appointmentDB = container "Appointment DB" "DB que gurad el registro de citas" "MariaDB Database v11.7.0"  "AppointmentDB,DataBase"
                messagingSystemDB = container "Messaging System DB" "DB que guarda las conversaciones de los usuarios" "MariaDB Database v11.7.0" "MessagingSystemDB,DataBase"
                paymentMethodDB = container "Payment Methods DB" "DB que guarda los pagos de la reservaciones" "MariaDB Database v11.7.0" "PaymentMethodDB,DataBase"
            }
            
            
        }
        notificacionSystem = softwareSystem "Api" "Se encargara de las notifiaciones" "NotificacionSystem-API"
        googleApi = softwareSystem "Google-API" "vinculacion de cuenta con Google" "Google-API"
        abstractAPI = softwareSystem "AbstractAPI" "Se encarga de la validacion o recuperacion de la cuenta" "AbstractAPI"
        cashPaymentApi = softwareSystem "Cash Payment Api" "Electronic wallet via token" "cashPaymentApi"
        visaApi = softwareSystem "Visa Api" "Electronic wallet via token" "visaApi"
        masterCardApi = softwareSystem "Master Card Api" "Electronic wallet via token" "masterCardApi"
        
        
        universityStudent -> mindCare "Use"
        psychologist -> mindCare "Use"
        mindCare -> googleApi "Request to Gmail"
        mindCare -> abstractAPI "Request to abstractAPI"
        mindCare -> cashPaymentApi "Request to cashPaymentApi"
        mindCare -> visaApi "Request to visaApi"
        mindCare -> masterCardApi "Request to visaApi"
        
        universityStudent -> landingPage "Visita Landing page"
        universityStudent -> mobilApp "Use"
        psychologist -> mobilApp "Use" 
        landingPage -> mobilApp "Redirect"
        
        mobilApp -> apiGateway "solicitudes Http/Api"
        
        apiGateway -> perfilUsuarioBC "Solicitud de endpoint" "Https/Json"
        apiGateway -> testInitialBC "Endpoint request" "Https/Json"
        apiGateway -> emotionalStateBC "Endpoint request" "Https/Json"
        apiGateway -> dailyEvaluationBC "Endpoint request" "Https/Json"
        apiGateway -> treatmentPlanBC "Endpoint request" "Https/Json"
        apiGateway -> patternDetectionBC "Endpoint request" "Https/Json"
        apiGateway -> emergencyManagementBC "Endpoint request" "Https/Json"
        apiGateway -> schedulesettingBC "Endpoint request" "Https/Json"
        apiGateway -> appointmentBC "Endpoint request" "Https/Json"
        apiGateway -> messagingSystemBC "Endpoint request" "Https/Json"
        apiGateway -> paymentMethodBC "Endpoint request" "Https/Json"
        
        
        perfilUsuarioBC -> perfilUsuarioDB "Guardar y recupera datos" "SQL Commands"
        testInitialBC -> testInitialDB "Guardar y recupera datos" "SQL Commands"
        emotionalStateBC -> emotionalStateDB "Guardar y recupera datos" "SQL Commands"
        dailyEvaluationBC -> dailyEvaluationDB "Guardar y recupera datos" "SQL Commands"
        treatmentPlanBC -> treatmentPlanDB "Guardar y recupera datos" "SQL Commands"
        patternDetectionBC -> patternDetectionDB "Guardar y recupera datos" "SQL Commands"
        emergencyManagementBC -> emergencyManagementDB "Guardar y recupera datos" "SQL Commands"
        schedulesettingBC -> schedulesettingDB "Guardar y recupera datos" "SQL Commands"
        appointmentBC -> appointmentDB "Guardar y recupera datos" "SQL Commands"
        messagingSystemBC -> messagingSystemDB "Guardar y recupera datos" "SQL Commands"
        paymentMethodBC -> paymentMethodDB "Guardar y recupera datos" "SQL Commands"
        
        perfilUsuarioBC -> googleApi "Generación de token"
        perfilUsuarioBC -> abstractAPI "Get"
        paymentMethodBC -> cashPaymentApi Generación de token"
        paymentMethodBC -> visaApi Generación de token"
        paymentMethodBC -> masterCardApi  Generación de token"
        
        testInitialBC -> treatmentPlanBC "Completa el test emocional inicial"
        dailyEvaluationDB -> treatmentPlanBC "Generar Plan de Tratamiento Personalizado"
        
        #Relations perfilUsuarioBC

        apiGateway -> universityStudentBCController "Request GET, POST, PUT, DELETE del endpoint del carrito de compras"
        apiGateway -> psychologistBCController "Request GET, POST, PUT, DELETE del endpoint del carrito de compras"
    
        universityStudentBCController -> universityStudentQueryService "Llama al método del servicio de consultas"
        universityStudentBCController -> universityStudentCommandService "Llama al método del servicio de comandos"
        universityStudentQueryService -> universityStudentQuery "Maneja la consulta"
        universityStudentQueryService -> universityStudentRepository "Llama al método del repositorio"
        universityStudentCommandService -> universityStudentCommand "Maneja el comando"
        universityStudentCommandService -> universityStudentRepository "Llama al método del repositorio"
        universityStudentRepository -> perfilUsuarioDB "Guarda, actualiza, elimina y recupera registros - UniversityStudent" "Comandos SQL"
        
        psychologistBCController -> psychologistQueryService "Llama al método del servicio de consultas"
        psychologistBCController -> psychologistCommandService "Llama al método del servicio de comandos"
        psychologistQueryService -> psychologistQuery "Maneja la consulta"
        psychologistQueryService -> psychologistRepository "Llama al método del repositorio"
        psychologistCommandService -> psychologistCommand "Maneja el comando"
        psychologistCommandService -> psychologistRepository "Llama al método del repositorio"
        psychologistRepository -> perfilUsuarioDB "Guarda, actualiza, elimina y recupera registros - Psychologist" "Comandos SQL"
        
        
        
        # Relaciones para el TestInitialBC
        apiGateway -> testBCController "Request GET, POST, PUT, DELETE del endpoint del test inicial"
        
        testBCController -> testQueryService "Llama al método del servicio de consultas"
        testBCController -> testCommandService "Llama al método del servicio de comandos"
        testQueryService -> testQuery "Maneja la consulta"
        testQueryService -> testRepository "Llama al método del repositorio"
        testCommandService -> testCommand "Maneja el comando"
        testCommandService -> testRepository "Llama al método del repositorio"
        testRepository -> testInitialDB "Guarda, actualiza, elimina y recupera registros - Test" "Comandos SQL"
        
        # Relaciones para el EmotionalStateBC
        apiGateway -> emotionalStateBCController "Request GET, POST, PUT, DELETE del endpoint del estado emocional"
        
        emotionalStateBCController -> emotionalStateQueryService "Llama al método del servicio de consultas"
        emotionalStateBCController -> emotionalStateCommandService "Llama al método del servicio de comandos"
        emotionalStateQueryService -> emotionalStateQuery "Maneja la consulta"
        emotionalStateQueryService -> emotionalStateRepository "Llama al método del repositorio"
        emotionalStateCommandService -> emotionalStateCommand "Maneja el comando"
        emotionalStateCommandService -> emotionalStateRepository "Llama al método del repositorio"
        emotionalStateRepository -> emotionalStateDB "Guarda, actualiza, elimina y recupera registros - Emotional State" "Comandos SQL"
        
        # Relaciones para el DailyEvaluationBC
        
        apiGateway -> autoevaluacionController "Request GET, POST, PUT del endpoint de autoevaluaciones"
        apiGateway -> horarioController "Request GET, POST, PUT del endpoint de horarios"
        apiGateway -> preguntaController "Request GET, POST del endpoint de banco de preguntas"
        apiGateway -> resultadoController "Request GET, POST del endpoint de resultados"

        autoevaluacionController -> autoevaluacionQueryService "Call service method"
        autoevaluacionController -> autoevaluacionCommandService "Call service method"
        autoevaluacionQueryService -> autoevaluacionQuery "Handle query"
        autoevaluacionQueryService -> autoevaluacionRepository "Call repository method"
        autoevaluacionQueryService -> preguntaQueryService "Call pregunta query service"
        autoevaluacionCommandService -> autoevaluacionCommand "Handle command"
        autoevaluacionCommandService -> autoevaluacionRepository "Call repository method"
        autoevaluacionCommandService -> resultadoCommandService "Call resultado command service"
        
        autoevaluacionRepository -> dailyEvaluationDB "Store, update, delete and fetch records - autoevaluaciones" "SQL transaction"
        
        horarioController -> horarioQueryService "Call service method"
        horarioController -> horarioCommandService "Call service method"
        horarioQueryService -> horarioQuery "Handle query"
        horarioQueryService -> horarioRepository "Call repository method"
        horarioCommandService -> horarioCommand "Handle command"
        horarioCommandService -> horarioRepository "Call repository method"
        horarioCommandService -> notificacionService "Trigger notification scheduling"
        
        horarioRepository -> dailyEvaluationDB "Store, update, delete and fetch records - horarios" "SQL transaction"
        
        preguntaController -> preguntaQueryService "Call service method"
        preguntaController -> preguntaCommandService "Call service method"
        preguntaQueryService -> preguntaQuery "Handle query"
        preguntaQueryService -> preguntaRepository "Call repository method"
        
        preguntaCommandService -> preguntaCommand "Handle command"
        preguntaCommandService -> preguntaRepository "Call repository method"
        
        preguntaRepository -> dailyEvaluationDB "Store, update, delete and fetch records - preguntas" "SQL transaction"
        
        resultadoController -> resultadoQueryService "Call service method"
        resultadoController -> resultadoCommandService "Call service method"
        resultadoQueryService -> resultadoQuery "Handle query"
        resultadoQueryService -> resultadoRepository "Call repository method"
        
        resultadoCommandService -> resultadoCommand "Handle command"
        resultadoCommandService -> resultadoRepository "Call repository method"
        resultadoCommandService -> notificacionService "Trigger high severity alert"
        
        resultadoRepository -> dailyEvaluationDB "Store, update, delete and fetch records - resultados" "SQL transaction"
        notificacionService -> notificacionSystem "Send notifications and alerts"
        
        
        
        # Relaciones para el TreatmentPlanBC
        apiGateway -> tratamientoController "Request GET, POST, PUT, DELETE del endpoint del plan de tratamiento"
        apiGateway -> recomendacionController "Request GET, POST, PUT, DELETE del endpoint del plan de tratamiento"
        apiGateway -> recursoExternoController "Request GET, POST, PUT, DELETE del endpoint del plan de tratamiento"
        
        tratamientoController -> tratamientoQueryService "Request para obtener planes de tratamiento"
        tratamientoController -> tratamientoCommandService "Request para crear, actualizar o eliminar planes de tratamiento"
        tratamientoQueryService -> tratamientoQuery "Procesa consultas de planes de tratamiento"
        tratamientoQueryService -> tratamientoRepository "Accede al repositorio para leer planes de tratamiento"
        tratamientoCommandService -> tratamientoCommand "Procesa comandos de planes de tratamiento"
        tratamientoCommandService -> tratamientoRepository "Accede al repositorio para actualizar planes de tratamiento"

        recomendacionController -> recomendacionQueryService "Request para obtener recomendaciones y comentarios"
        recomendacionController -> recomendacionCommandService "Request para crear, actualizar o eliminar recomendaciones y comentarios"
        recomendacionQueryService -> recomendacionQuery "Procesa consultas de recomendaciones"
        recomendacionQueryService -> recomendacionRepository "Accede al repositorio para leer recomendaciones y comentarios"
        recomendacionCommandService -> recomendacionCommand "Procesa comandos de recomendaciones"
        recomendacionCommandService -> recomendacionRepository "Accede al repositorio para actualizar recomendaciones y comentarios"
        
        recursoExternoController -> recursoExternoQueryService "Request para obtener recursos externos"
        recursoExternoController -> recursoExternoCommandService "Request para crear, actualizar o eliminar recursos externos"
        recursoExternoQueryService -> recursoExternoQuery "Procesa consultas de recursos externos"
        recursoExternoQueryService -> recursoExternoRepository "Accede al repositorio para leer recursos externos"
        recursoExternoCommandService -> recursoExternoCommand "Procesa comandos de recursos externos"
        recursoExternoCommandService -> recursoExternoRepository "Accede al repositorio para actualizar recursos externos"
        
        tratamientoCommandService -> servicioDeNotificaciones "Notifica actualizaciones del plan de tratamiento"
        recomendacionCommandService -> servicioDeNotificaciones "Notifica cambios en recomendaciones"
        recursoExternoCommandService -> servicioDeNotificaciones "Notifica cambios en recursos externos"
        
        planDeTratamientoFacade -> autoevaluacionContextFacade "Consulta resultados procesados de las autoevaluaciones para generar el plan de tratamiento"
        autoevaluacionContextFacade -> resultadoQueryService "Solicita los resultados procesados de las autoevaluaciones"
        resultadoQueryService -> resultadoRepository "Accede al repositorio de resultados para leer las respuestas procesadas y alertas"
        planDeTratamientoFacade -> tratamientoCommandService "Envía los resultados procesados para generar el plan de tratamiento"
        tratamientoCommandService -> tratamientoCommand "Procesa el comando para crear el plan de tratamiento"
        tratamientoCommandService -> tratamientoRepository "Guarda el plan de tratamiento generado basado en los resultados"
        
        planDeTratamientoFacade -> perfilUsuarioFacade "Solicita el ID del psicólogo asociado al estudiante"
        perfilUsuarioFacade -> psychologistQueryService "Consulta el ID del psicólogo"
        psychologistQueryService -> psychologistRepository "Accede al repositorio del perfil para obtener datos del psicólogo"
        planDeTratamientoFacade -> tratamientoCommandService "Genera o actualiza el plan de tratamiento con el ID del psicólogo"
        tratamientoCommandService -> tratamientoRepository "Guarda el plan de tratamiento asociado al psicólogo"
        
        # Relaciones para el PatternDetectionBC
        apiGateway -> patternDetectionBCController "Request GET, POST, PUT, DELETE del endpoint de patrones de detección"
        
        patternDetectionBCController -> patternDetectionQueryService "Llama al método del servicio de consultas"
        patternDetectionBCController -> patternDetectionCommandService "Llama al método del servicio de comandos"
        patternDetectionQueryService -> patternDetectionQuery "Maneja la consulta"
        patternDetectionQueryService -> patternDetectionRepository "Llama al método del repositorio"
        patternDetectionCommandService -> patternDetectionCommand "Maneja el comando"
        patternDetectionCommandService -> patternDetectionRepository "Llama al método del repositorio"
        patternDetectionRepository -> patternDetectionDB "Guarda, actualiza, elimina y recupera registros - Pattern Detection" "Comandos SQL"
        
        # Relaciones para el EmergencyManagementBC
        apiGateway -> emergencyManagementBCController "Request GET, POST, PUT, DELETE del endpoint de gestión de emergencias"
        
        emergencyManagementBCController -> emergencyManagementQueryService "Llama al método del servicio de consultas"
        emergencyManagementBCController -> emergencyManagementCommandService "Llama al método del servicio de comandos"
        emergencyManagementQueryService -> emergencyManagementQuery "Maneja la consulta"
        emergencyManagementQueryService -> emergencyManagementRepository "Llama al método del repositorio"
        emergencyManagementCommandService -> emergencyManagementCommand "Maneja el comando"
        emergencyManagementCommandService -> emergencyManagementRepository "Llama al método del repositorio"
        emergencyManagementRepository -> emergencyManagementDB "Guarda, actualiza, elimina y recupera registros - Emergency Management" "Comandos SQL"
        
        # Relaciones para el ScheduleSettingBC
        apiGateway -> scheduleSettingBCController "Request GET, POST, PUT, DELETE del endpoint de configuración de horarios"
        
        scheduleSettingBCController -> scheduleSettingQueryService "Llama al método del servicio de consultas"
        scheduleSettingBCController -> scheduleSettingCommandService "Llama al método del servicio de comandos"
        scheduleSettingQueryService -> scheduleSettingQuery "Maneja la consulta"
        scheduleSettingQueryService -> scheduleSettingRepository "Llama al método del repositorio"
        scheduleSettingCommandService -> scheduleSettingCommand "Maneja el comando"
        scheduleSettingCommandService -> scheduleSettingRepository "Llama al método del repositorio"
        scheduleSettingRepository -> scheduleSettingDB "Guarda, actualiza, elimina y recupera registros - Schedule Setting" "Comandos SQL"
        
        # Relaciones para el AppointmentBC
        apiGateway -> appointmentBCController "Request GET, POST, PUT, DELETE del endpoint de reservación de citas"
        
        appointmentBCController -> appointmentQueryService "Llama al método del servicio de consultas"
        appointmentBCController -> appointmentCommandService "Llama al método del servicio de comandos"
        appointmentQueryService -> appointmentQuery "Maneja la consulta"
        appointmentQueryService -> appointmentRepository "Llama al método del repositorio"
        appointmentCommandService -> appointmentCommand "Maneja el comando"
        appointmentCommandService -> appointmentRepository "Llama al método del repositorio"
        appointmentRepository -> appointmentDB "Guarda, actualiza, elimina y recupera registros - Appointment" "Comandos SQL"
        
        # Relaciones para el MessagingSystemBC
        apiGateway -> messagingSystemBCController "Request GET, POST, PUT, DELETE del endpoint de mensajes"
        
        messagingSystemBCController -> messagingQueryService "Llama al método del servicio de consultas"
        messagingSystemBCController -> messagingCommandService "Llama al método del servicio de comandos"
        messagingQueryService -> messagingQuery "Maneja la consulta"
        messagingQueryService -> messagingRepository "Llama al método del repositorio"
        messagingCommandService -> messagingCommand "Maneja el comando"
        messagingCommandService -> messagingRepository "Llama al método del repositorio"
        messagingRepository -> messagingSystemDB "Guarda, actualiza, elimina y recupera registros - Mensajes" "Comandos SQL"
        
        # Relaciones para el PaymentMethodBC
        apiGateway -> paymentMethodBCController "Request GET, POST, PUT, DELETE del endpoint de métodos de pago"
        
        paymentMethodBCController -> cardQueryService "Llama al método del servicio de consultas"
        paymentMethodBCController -> cardCommandService "Llama al método del servicio de comandos"
        cardQueryService -> cardQuery "Maneja la consulta"
        cardQueryService -> cardRepository "Llama al método del repositorio"
        cardCommandService -> cardCommand "Maneja el comando"
        cardCommandService -> cardRepository "Llama al método del repositorio"
        cardRepository -> paymentMethodDB "Guarda, actualiza, elimina y recupera registros - Card" "Comandos SQL"
    }
    
    views {
        systemContext mindCare "mindCareSystemContext" {
            include *
            autolayout
        }
        container mindCare  "mindCareSystemContainer" {
            include *
            autolayout
        }
        
        component perfilUsuarioBC  "perfilUsuarioComponent" "Diagrama de componentes PerfilUsuarioBC" {
            include *
            autolayout
        }
        
        component testInitialBC  "testInitialComponent" "Diagrama de componentes TestInitialBC" {
            include *
            autolayout
        }
        
        component emotionalStateBC  "emotionalStateComponent" "Diagrama de componentes EmotionalStateBC" {
            include *
            autolayout
        }
        
         component dailyEvaluationBC  "dailyEvaluationComponent" "Diagrama de componentes DailyEvaluationBC" {
            include *
            autolayout
        }
        
        component treatmentPlanBC  "treatmentPlanComponent" "Diagrama de componentes TreatmentPlanBC" {
            include *
            autolayout
        }
        
        component patternDetectionBC  "patternDetectionComponent" "Diagrama de componentes PatternDetectionBC" {
            include *
            autolayout
        }
        
        component emergencyManagementBC  "emergencyManagementComponent" "Diagrama de componentes EmergencyManagementBC" {
            include *
            autolayout
        }
        
        component scheduleSettingBC  "scheduleSettingComponent" "Diagrama de componentes ScheduleSettingBC" {
            include *
            autolayout
        }
        
        component appointmentBC  "appointmentComponent" "Diagrama de componentes AppointmentBC" {
            include *
            autolayout
        }
        
        component messagingSystemBC  "messagingSystemComponent" "Diagrama de componentes MessagingSystemBC" {
            include *
            autolayout
        }
        
        component paymentMethodBC  "paymentMethodComponent" "Diagrama de componentes PaymentMethodBC" {
            include *
            autolayout
        }
        
        
        
        
        
        
        styles {
            
            element "Person" {
                shape Person
                background #394FBB
                color #2A2C33
            }
            element "MindCare" {
                background #00E568
                color #2B332E
                shape RoundedBox
            }
            element "Software System" {
                background #E00084
                color #332B2F
            }
            element "LandingPage" {
                shape WebBrowser
                background #E65715
                color #FFFFFF
            }
            element "MobileApp" {
                shape MobileDevicePortrait
                background #15E6A8
                color #332B2F
                icon https://static.structurizr.com/themes/amazon-web-services-2020.04.30/Amazon-EC2_D2-Instance_light-bg@4x.png
            }
            element "ApiGateway" {
                shape Pipe
                background Orange
            }
            element "Container" {
                shape Hexagon
                background #661316
                color #FFFFFF
            }
            element "DataBase" {
                shape Cylinder
                background #306792
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
            
        }
    }

    configuration {
        scope softwaresystem
    }

}