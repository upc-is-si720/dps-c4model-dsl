workspace "VitalPath" "Sistema de citación médica y monitoreo de pacientes" {

    model {
        # Person
        paciente = person "Paciente" "Persona que reserva citas médicas y se le monitoreo su salud" "Paciente"
        profesional = person "Profesional de la Salud" "Persona que recete tratamientos médicos y atiende citas médicas" "Paciente"

        # softwareSystem 
        vitalPath = softwareSystem "VitalPath" "Software de citación médica y monitoreo de paciente" "VitalPath" {
            mobileApp = container "Mobile Application" "App de Citas Médicas y Monitoreo" "Samsung / Android / Kotlin 2.0.21" "MobileApp"
            
            apiGateway = container "Api Gateway" "Propocionador de acceso seguro a servicios de backend mediante una API de REST" "Cloudflare API Gateway" "ApiGateway"
            
            #Django / Python v3.13.0
            
            # SoportePaciente Bounded Context
            soportePacienteBC = container "Soporte para el paciente Bunded Context" "Soporte confiable en el que paciente encontrará asistencia en su tratamiento" "Django / Python v3.13.0" "SearchAndSelectBC,BoundedContext" {
                soporteController = component "Soporte Controller" "RESTful API Controller class del Soporte" "Class / Django / Python v3.13.0" "SoporteEmocionalController,Controller"
                centroSaludController = component "Centro de Salud Controller" "RESTful API Controller class del Centro de Salud" "Class / Django / Python v3.13.0" "CentroSaludController,Controller"
                group "Soporte" {
                    soporteRepository = component "Soporte Repository" "Repository Interface de Soporte" "Interface / Django / Python v3.13.0" "SoporteRepository,Repository"
                    soporteQuery = component "Soporte Query" "Query for read Soporte" "Record" "SoporteQuery, Query"
                    soporteCommand = component "Soporte Command" "Command for create, update and delete Soporte" "Record" "SoporteCommand, Command"
                    soporteCommandService = component "Soporte CommandService" "Business Logic del Command del Soporte" "Class / Django / Python v3.13.0" "SoporteCommandService,Service"
                    soporteQueryService = component "Soporte QueryService" "Business Logic del query del Soporte" "Class / Django / Python v3.13.0" "SoporteQueryService,Service"
                }
                group "CentroSalud" {
                    centroSaludRepository = component "Centro de Salud Repository" "Repository Interface de Centro de Salud" "Interface / Django / Python v3.13.0" "CentroSaludRepository,Repository"
                    centroSaludQuery = component "Centro de Salud Query" "Query for read Centro de Salud" "Record" "CentroSaludQuery, Query"
                    centroSaludCommand = component "Centro de Salud Command" "Command for create, update and delete Centro de Salud" "Record" "CentroSaludCommand, Command"
                    centroSaludCommandService = component "Centro de Salud CommandService" "Business Logic del Command del Soporte" "Class / Django / Python v3.13.0" "CentroSaludCommandService,Service"
                    centroSaludQueryService = component "Centro de Salud QueryService" "Business Logic del query del Centro de Salud" "Class / Django / Python v3.13.0" "CentroSaludQueryService,Service"
                }
                group "Mensaje" {
                    mensajeQuery = component "Mensaje Query" "Query for read Mensaje" "Record" "MensajeQuery, Query"
                    mensajeCommand = component "Mensaje Command" "Command for create, update and delete Mensaje" "Record" "MensajeCommand, Command"
                }
                group "Comentario" {
                    comentarioQuery = component "Comentario Query" "Query for read Comentario" "Record" "ComentarioQuery, Query"
                    comentarioCommand = component "Comentario Command" "Command for create, update and delete Comentario" "Record" "ComentarioCommand, Command"
                }
                group "outboundservices" {
                    monitoreoSaludExternalService = component "Monitoreo de la salud ExternalService" "External Business Logic del monitoreo de la salud" "Class / Django / Python v3.13.0" "MonitoreoSaludExternalService,ExternalService"
                    notificacionesExternalService = component "Alertas y Notificaciones ExternalService" "External Business Logic de las alertas y notificaciones" "Class / Django / Python v3.13.0" "NotificacionesExternalService,ExternalService"
                    sistemaLlamadasExternalService = component "Sistema de llamadas ExternalService" "External Business Logic del sistema de llamadas" "Class / Django / Python v3.13.0" "SistemaLlamadasExternalService,ExternalService"
                }
            }
            
            # AlertasNotificaciones Bounded Context
            alertasNotificacionesBC = container "Alertas y notificaciones Bunded Context" "Permite y alerta al paciente acerca de las citas médicas programadas" "Django / Python v3.13.0" "AlertasNotificacionesBC,BoundedContext" {
                notificadorController = component "Notificador Controller" "RESTful API Controller class de Notificador" "Class / Django / Python v3.13.0" "NotificadorController,Controller"
                configuracionController = component "Configuracion Controller" "RESTful API Controller class de Configuracion" "Class / Django / Python v3.13.0" "ConfiguracionController,Controller"
                group "Notificador" {
                    notificadorRepository = component "Notificador Repository" "Repository Interface de Notificador" "Interface / Django / Python v3.13.0" "NotificadorRepository,Repository"
                    notificadorQuery = component "Notificador Query" "Query for read Notificador" "Record" "NotificadorQuery, Query"
                    notificadorCommand = component "Notificador Command" "Command for create, update and delete Notificador" "Record" "NotificadorCommand, Command"
                    notificadorCommandService = component "Notificador CommandService" "Business Logic del Command del Notificador" "Class / Django / Python v3.13.0" "NotificadorCommandService,Service"
                    notificadorQueryService = component "Notificador QueryService" "Business Logic del query del Notificador" "Class / Django / Python v3.13.0" "NotificadorQueryService,Service"
                }
                group "Notificacion" {
                    notificacionQuery = component "Notificacion Query" "Query for read Notificacion" "Record" "NotificacionQuery, Query"
                    notificacionCommand = component "Notificacion Command" "Command for create, update and delete Notificacion" "Record" "NotificacionCommand, Command"
                }
                 group "Configuracion" {
                    configuracionRepository = component "Configuracion Repository" "Repository Interface de Configuracion" "Interface / Django / Python v3.13.0" "ConfiguracionRepository,Repository"
                    configuracionQuery = component "Configuracion Query" "Query for read CoConfiguracion" "Record" "ConfiguracionQuery, Query"
                    configuracionCommand = component "Configuracion Command" "Command for create, update and delete CoConfiguracion" "Record" "ConfiguracionCommand, Command"
                    configuracionCommandService = component "Configuracion CommandService" "Business Logic del Command del Configuracion" "Class / Django / Python v3.13.0" "ConfiguracionCommandService,Service"
                    configuracionQueryService = component "Configuracion QueryService" "Business Logic del query del Configuracion" "Class / Django / Python v3.13.0" "ConfiguracionQueryService,Service"
                }
                 group "Horario" {
                    horarioQuery = component "Horario Query" "Query for read Horario" "Record" "HorarioQuery, Query"
                    horarioCommand = component "Horario Command" "Command for create, update and delete Horario" "Record" "HorarioCommand, Command"
                }
                 group "Medicamento" {
                    medicamentoQuery = component "Medicamento Query" "Query for read Medicamento" "Record" "MedicamentoQuery, Query"
                    medicamentoCommand = component "Medicamento Command" "Command for create, update and delete Medicamento" "Record" "MedicamentoCommand, Command"
                }
               group "inboundservices" {
                    soporteContextFacade = component "Soporte para el Paciente ContextFacade" "Facade Business Logic de soporte para el paciente" "Class / Django / Python v3.13.0" "SoporteContextFacade,ContextFacade"
                    gestionContextFacade = component "Gestión de citas médicas ContextFacade" "Facade Business Logic de gestión de citas médicas" "Class / Django / Python v3.13.0" "GestionContextFacade,ContextFacade"
                }
                group "outboundservices" {
                    monitoreoExternalService = component "Monitoreo de la salud ExternalService" "External Business Logic del monitoreo de la salud" "Class / Django / Python v3.13.0" "MonitoreoSaludExternalService,ExternalService"
                }
            }
            
            # GestionCitas Bounded Context
            gestionCitasBC = container "Gestion de citas médicas Bunded Context" "Gestiona el proceso de atención al paciente y agenda las citas médicas" "Django / Python v3.13.0" "GestionCitasBC,BoundedContext" {
                registroCitasController = component "Registro de Citas Controller" "RESTful API Controller class de Registro de Citas" "Class / Django / Python v3.13.0" "RegistroCitasController,Controller"
                group "RegistroCitas" {
                    registroCitasRepository = component "Registro de Citas Repository" "Repository Interface de Registro de Citas" "Interface / Django / Python v3.13.0" "RegistroCitasRepository,Repository"
                    registroCitasQuery = component "Registro de Citas Query" "Query for read Registro de Citas" "Record" "RegistroCitasQuery, Query"
                    registroCitasCommand = component "Registro de Citas Command" "Command for create, update and delete Registro de Citas" "Record" "RegistroCitasCommand, Command"
                    registroCitasCommandService = component "Registro de Citas CommandService" "Business Logic del Command del Registro de Citas" "Class / Django / Python v3.13.0" "RegistroCitasCommandService,Service"
                    registroCitasQueryService = component "Registro de Citas QueryService" "Business Logic del query del Registro de Citas" "Class / Django / Python v3.13.0" "RegistroCitasQueryService,Service"
                }
                group "Cita" {
                    citaQuery = component "Cita Query" "Query for read Cita" "Record" "CitaQuery, Query"
                    citaCommand = component "Cita Command" "Command for create, update and delete Cita" "Record" "CitaCommand, Command"
                }
                group "Recordatorio" {
                    recordatorioQuery = component "Recordatorio de Cita Query" "Query for read Recordatorio" "Record" "RecordatorioQuery, Query"
                    recordatorioCommand = component "Recordatorio de Cita Command" "Command for create, update and delete Recordatorio" "Record" "RecordatorioCommand, Command"
                }
                group "outboundservices" {
                    sistemaLlamadaExternalService = component "Sistema de llamada ExternalService" "External Business Logic del sistema de llamada" "Class / Django / Python v3.13.0" "SistemaLlamadaExternalService,ExternalService"
                    alertasExternalService = component "Alertas y Notificaciones ExternalService" "External Business Logic de las alertas y notificaciones" "Class / Django / Python v3.13.0" "NotificacionesExternalService,ExternalService"
                }
                group "inboundservices" {
                    apartadoEducativoContextFacade = component "Apartado Educativo ContextFacade" "Facade Business Logic del apartado educativo" "Class / Django / Python v3.13.0" "ApartadoEducativoContextFacade,ContextFacade"
                }
            }
            
            # ApartadoEducativo Bounded Context
            apartadoEducativoBC = container "Apartado Educativo Bunded Context" "provee un espacio educativo donde los pacientes acceden a información confiable sobre enfermedades crónicas" "Django / Python v3.13.0" "ApartadoEducativoBC,BoundedContext" {
                educacionController = component "Educacion Controller" "RESTful API Controller class de Educacion" "Class / Django / Python v3.13.0" "EducacionController,Controller"
                instruccionController = component "Instruccion Controller" "RESTful API Controller class de Instruccion" "Class / Django / Python v3.13.0" "InstruccionController,Controller"
                group "Educacion" {
                    educacionRepository = component "Educacion Repository" "Repository Interface de Educacion" "Interface / Django / Python v3.13.0" "EducacionRepository,Repository"
                    educacionQuery = component "Educacion Query" "Query for read Educacion" "Record" "EducacionQuery, Query"
                    educacionCommand = component "Educacion Command" "Command for create, update and delete Educacion" "Record" "EducacionCommand, Command"
                    educacionCommandService = component "Educacion CommandService" "Business Logic del Command de Educacion" "Class / Django / Python v3.13.0" "EducacionCommandService,Service"
                    educacionQueryService = component "Educacion QueryService" "Business Logic del query de Educacion" "Class / Django / Python v3.13.0" "EducacionQueryService,Service"
                }
                 group "Instruccion" {
                    instruccionRepository = component "Instruccion Repository" "Repository Interface de Instruccion" "Interface / Django / Python v3.13.0" "InstruccionRepository,Repository"
                    instruccionQuery = component "Instruccion Query" "Query for read Instruccion" "Record" "InstruccionQuery, Query"
                    instruccionCommand = component "Instruccion Command" "Command for create, update and delete Instruccion" "Record" "InstruccionCommand, Command"
                    instruccionCommandService = component "Instruccion CommandService" "Business Logic del Command de Instruccion" "Class / Django / Python v3.13.0" "InstruccionCommandService,Service"
                    instruccionQueryService = component "Instruccion QueryService" "Business Logic del query de Instruccion" "Class / Django / Python v3.13.0" "InstruccionQueryService,Service"
                }
                 group "Pregunta" {
                    preguntaQuery = component "Pregunta Query" "Query for read Pregunta" "Record" "PreguntaQuery, Query"
                    preguntaCommand = component "Pregunta Command" "Command for create, update and delete Pregunta" "Record" "PreguntaCommand, Command"
                }
                group "Opinion" {
                    opinionQuery = component "Opinion Query" "Query for read Opinion" "Record" "OpinionQuery, Query"
                    opinionCommand = component "Opinion Command" "Command for create, update and delete Opinion" "Record" "OpinionCommand, Command"
                }
                group "Imagen" {
                    imagenQuery = component "Imagen Query" "Query for read Imagen" "Record" "ImagenQuery, Query"
                    imagenCommand = component "Imagen Command" "Command for create, update and delete Imagen" "Record" "ImagenCommand, Command"
                }
                group "outboundservices" {
                    gestionCitasExternalService = component "Gestión de citas médicas ExternalService" "External Business Logic de la gestión de cita médicas" "Class / Django / Python v3.13.0" "GestionCitasExternalService,ExternalService"
                    adobeAPIExternalService = component "Adobe API ExternalService" "External Business Logic de exportación de archivos PDF" "Class / Django / Python v3.13.0" "AdobeAPIExternalService,ExternalService"
                    youtubeDataAPIExternalService = component "Youtube Data API ExternalService" "External Business Logic de alojamiento de videos informativos en Youtube" "Class / Django / Python v3.13.0" "YoutubeDataAPIExternalService,ExternalService"
                }
            }
            
            # MonitoreoSalud Bounded Context
            monitoreoSaludBC = container "Monitoreo de la salud Bunded Context" "Registra y monitorea activamente la salud del paciente" "Django / Python v3.13.0" "MonitoreoSaludBC,BoundedContext" {
                monitoreoController = component "Monitoreo Controller" "RESTful API Controller class de Monitoreo" "Class / Django / Python v3.13.0" "MonitoreoController,Controller"
                group "Monitoreo" {
                    monitoreoRepository = component "Monitoreo Repository" "Repository Interface de Monitoreo" "Interface / Django / Python v3.13.0" "MonitoreoRepository,Repository"
                    monitoreoQuery = component "Monitoreo Query" "Query for read Monitoreo" "Record" "MonitoreoQuery, Query"
                    monitoreoCommand = component "Monitoreo Command" "Command for create, update and delete Monitoreo" "Record" "MonitoreoCommand, Command"
                    monitoreoCommandService = component "Monitoreo CommandService" "Business Logic del Command de Monitoreo" "Class / Django / Python v3.13.0" "MonitoreoCommandService,Service"
                    monitoreoQueryService = component "Monitoreo QueryService" "Business Logic del query de Monitoreo" "Class / Django / Python v3.13.0" "MonitoreoQueryService,Service"
                }
                group "RangoSignoVital" {
                    rangoSignoVitalQuery = component "Rango de Signo Vital Query" "Query for read Rango de Signo Vital" "Record" "RangoSignoVitalQuery, Query"
                    rangoSignoVitalCommand = component "Rango de Signo Vital Command" "Command for create, update and delete Rango de Signo Vital" "Record" "RangoSignoVitalCommand, Command"
                }
                group "Emergencia" {
                    emergenciaQuery = component "Emergencia Query" "Query for read Emergencia" "Record" "EmergenciaQuery, Query"
                    emergenciaCommand = component "Emergencia Command" "Command for create, update and delete Emergencia" "Record" "EmergenciaCommand, Command"
                }
                group "GraficoTendencia" {
                    graficoTendenciaQuery = component "Grafico de Tendencia Query" "Query for read Rango de Grafico de Tendencia" "Record" "GraficoTendenciaQuery, Query"
                    graficoTendenciaCommand = component "Grafico de Tendencia Command" "Command for create, update and delete Rango de Grafico de Tendencia" "Record" "GraficoTendenciaCommand, Command"
                }
                group "outboundservices" {
                    dispositivoMedicoExternalService = component "Dispositivo médico ExternalService" "External Business Logic del dispositivo médico permitido" "Class / Django / Python v3.13.0" "DispositivoMedicoExternalService,ExternalService"
                    googleMapsAPIExternalService = component "Google Maps API ExternalService" "External Business Logic de alojamiento de enlaces de ubicaciones geologicas en google maps" "Class / Django / Python v3.13.0" "GoogleMapsAPIExternalService,ExternalService"
                }
                group "inboundservices" {
                    soportePacienteContextFacade = component "Soporte para el Paciente ContextFacade" "Facade Business Logic de soporte para el paciente" "Class / Django / Python v3.13.0" "SoportePacienteContextFacade,ContextFacade"
                    notificacionesContextFacade = component "Alertas y notificaciones ContextFacade" "Facade Business Logic de las alertas y notificaciones" "Class / Django / Python v3.13.0" "NotificacionesContextFacade,ContextFacade"    
                }
            }
            
            # Databases
            group "Databases" {
                soportePacienteDB = container "Soporte para el paciente Database" "Guardar nuevas instrucciones y mensajes motivacionales" "Oracle Database v23ai" "SoportePacienteDB,Database"
                alertasNotificacionesDB = container "Alertas y notificaciones Database" "Registrar cita en horario personalizado" "Oracle Database v23ai" "AlertasNotificacionesDB,Database"
                gestionCitasDB = container "Gestion de citas médicas Database" "Acceso al registro de citas médicas" "Oracle Database v23ai" "GestionCitasDB,Database"
                apartadoEducativoDB = container "Apartado Educativo Database" "Acceso a los enlaces de los recursos audiovisuales" "Oracle Database v23ai" "ApartadoEducativoDB,Database"
                monitoreoSaludDB = container "Monitoreo de la salud Database" "Guardar Copia de seguridad" "Oracle Database v23ai" "MonitoreoSaludDB,Database"
            }
        }

        # External System
        sistemaLlamadas = softwareSystem "Sistema de Llamadas" "Sistema de comunicación por celular" "SistemaLlamadas,ExternalSystem"
        adobeAPI = softwareSystem "Adobe API" "API que permite exportar archivos PDF" "AdobeAPI,ExternalSystem"
        youtubeDataAPI = softwareSystem "Youtube Data API" "API para cargar videos en la plataforma de Youtube" "YoutubeDataAPI,ExternalSystem"
        googleMapsAPI = softwareSystem "Google Maps API" "API que dministra datos geoespaciales en Google Cloud" "GoogleMapsAPI,ExternalSystem"
        dispositivoMedico = softwareSystem "Dispositivo Médico" "Dispositivo médico que registra y monitorea los signos vitales" "DispositivoMedico,ExternalSystem"
        
        # Relationship systemContext
        paciente -> vitalPath "Reserva cita médica"
        profesional -> vitalPath "Atiende citas médicas"
        
        vitalPath -> adobeAPI "Descargar PDF"
        vitalPath -> sistemaLlamadas "Llamar al centro de salud"
        vitalPath -> sistemaLlamadas "Contactar profesionales de la salud"
        vitalPath -> googleMapsAPI "Solicitar enlace de la ubicación del paciente"
        vitalPath -> youtubeDataAPI "Visualizar videos informativos"
        vitalPath -> dispositivoMedico "Registrar signos vitales"
        adobeAPI -> vitalPath "PDF descargado"
        youtubeDataAPI -> vitalPath "Videos informativos mostrados"
        
        # Relationship container
        paciente -> mobileApp "Reservar cita médica"
        paciente -> mobileApp "Vincular dispositivo médico"
        
        profesional -> mobileApp "Registrar receta médica"
        
        mobileApp -> apiGateway "HTTP Request / API"
        
        apiGateway -> soportePacienteBC "Endpoint request" "HTTPS / Json"
        apiGateway -> alertasNotificacionesBC "Endpoint request" "HTTPS / Json"
        apiGateway -> gestionCitasBC "Endpoint request" "HTTPS / Json"
        apiGateway -> apartadoEducativoBC "Endpoint request" "HTTPS / Json"
        apiGateway -> monitoreoSaludBC "Endpoint request" "HTTPS / Json"
        
        soportePacienteBC -> alertasNotificacionesBC "Solicitud de notificación de mensaje motivacional" "ACL"
        gestionCitasBC -> alertasNotificacionesBC "Registro de cita médica" "ACL"
        apartadoEducativoBC -> gestionCitasBC "Instruciones mostradas" "ACL"
        monitoreoSaludBC -> alertasNotificacionesBC "Enviar alertas de caso crítico" "ACL"
        alertasNotificacionesBC -> monitoreoSaludBC "Alertar posible riesgo por consumo de medicamento" "ACL"
        soportePacienteBC -> monitoreoSaludBC "Mensajes motivacionales enviados" "ACL"
        
        soportePacienteBC -> soportePacienteDB "Guardar y recupera datos" "SQL Commands"
        alertasNotificacionesBC -> alertasNotificacionesDB "Guardar y recupera datos" "SQL Commands"
        gestionCitasBC -> gestionCitasDB "Guardar y recupera datos" "SQL Commands"
        apartadoEducativoBC -> apartadoEducativoDB "Guardar y recupera datos" "SQL Commands"
        monitoreoSaludBC -> monitoreoSaludDB "Guardar y recupera datos" "SQL Commands"
        
        apartadoEducativoBC -> youtubeDataAPI "Visualizar videos informativos"
        youtubeDataAPI -> apartadoEducativoBC "Videos informativos mostrados"
        apartadoEducativoBC -> adobeAPI "Descargar pdf"
        soportePacienteBC -> sistemaLlamadas "Llamar al centro de salud"
        gestionCitasBC -> sistemaLlamadas "Contactar profesionales de la salud"
        monitoreoSaludBC -> dispositivoMedico "Registrar signos vitales"
        monitoreoSaludBC -> googleMapsAPI "Solicitar enlace de la ubicación del paciente"
        
        # Relationships SoportePaciente Bounded Context
        apiGateway -> soporteController "Request GET, POST, PUT del endpoint del soporte para pacientes"
        apiGateway -> centroSaludController "Request GET, POST, PUT del endpoint del centro de salud"
        
        soporteController -> soporteQueryService "Call service method"
        soporteController -> soporteCommandService "Call service method"
        centroSaludController -> centroSaludQueryService "Call service method"
        centroSaludController -> centroSaludCommandService "Call service method"
        
        soporteQueryService -> soporteQuery "Handle query"
        soporteQueryService -> mensajeQuery "Handle query"
        soporteQueryService -> comentarioQuery "Handle query"
        soporteQueryService -> soporteRepository "Call repository method"
        
        centroSaludQueryService -> centroSaludQuery "Handle query"
        centroSaludQueryService -> centroSaludRepository "Call repository method"

        soporteCommandService -> soporteCommand "Handle command"
        soporteCommandService -> mensajeCommand "Handle command"
        soporteCommandService -> comentarioCommand "Handle command"
        soporteCommandService -> soporteRepository "Call repository method"
        soporteCommandService -> monitoreoSaludExternalService "Call external service method"
        soporteCommandService -> notificacionesExternalService "Call external service method"
        
        centroSaludCommandService -> centroSaludCommand "Handle command"
        centroSaludCommandService -> centroSaludRepository "Call repository method"
        centroSaludCommandService -> sistemaLlamadasExternalService "Call external service method"

        soporteRepository -> soportePacienteDB "Store, update, delete and fetch records - Soporte del Paciente" "SQL transaction"
        centroSaludRepository -> soportePacienteDB "Store, update, delete and fetch records - Centro de salud" "SQL transaction"

        notificacionesExternalService -> soporteContextFacade "Solicitud de notificación de mensaje motivacional"
        monitoreoSaludExternalService -> soportePacienteContextFacade "Mensajes motivacionales enviados"
        sistemaLlamadasExternalService -> sistemaLlamadas "Llamar al centro de salud"
        
        # Relationships AlertasNotificaciones Bounded Context
        apiGateway -> notificadorController "Request GET del endpoint de las notificaciones"
        apiGateway -> configuracionController "Request GET del endpoint de la configuracion"
        
        notificadorController -> notificadorQueryService "Call service method"
        notificadorController -> notificadorCommandService "Call service method"
        configuracionController -> configuracionQueryService "Call service method"
        configuracionController -> configuracionCommandService "Call service method"
        
        notificadorQueryService -> notificadorQuery "Handle query"
        notificadorQueryService -> notificacionQuery "Handle query"
        notificadorQueryService -> horarioQuery "Handle query"
        notificadorQueryService -> medicamentoQuery "Handle query"
        notificadorQueryService -> notificadorRepository "Call repository method"
        configuracionQueryService -> configuracionQuery "Handle query"
        configuracionQueryService -> configuracionRepository "Call repository method"
        
        notificadorCommandService -> notificadorCommand "Handle command"
        notificadorCommandService -> notificacionCommand "Handle command"
        notificadorCommandService -> horarioCommand "Handle command"
        notificadorCommandService -> medicamentoCommand "Handle command"
        notificadorCommandService -> notificadorRepository "Call repository method"
        notificadorCommandService -> monitoreoExternalService "Call external service method"
        configuracionCommandService -> configuracionCommand "Handle command"
        configuracionCommandService -> configuracionRepository "Call repository method"
        
        notificadorRepository -> alertasNotificacionesDB "Store, update, delete and fetch records - Alertas y Notificaciones" "SQL transaction"
        configuracionRepository -> alertasNotificacionesDB "Store, update, delete and fetch records - Configuracion" "SQL transaction"
        
        soporteContextFacade -> notificadorCommandService "Call service method"
        gestionContextFacade -> notificadorCommandService "Call service method"
        monitoreoExternalService -> notificacionesContextFacade "Alertar posible riesgo por consumo de medicamento"
        
        # Relationships GestionCitas Bounded Context
        apiGateway -> registroCitasController "Request GET, POST, PUT, DELETE del endpoint de las citas médicas"
        
        registroCitasController -> registroCitasQueryService "Call service method"
        registroCitasController -> registroCitasCommandService "Call service method"
        
        registroCitasQueryService -> registroCitasQuery "Handle query"
        registroCitasQueryService -> citaQuery "Handle query"
        registroCitasQueryService -> recordatorioQuery "Handle query"
        registroCitasQueryService -> registroCitasRepository "Call repository method"
        
        registroCitasCommandService -> registroCitasCommand "Handle command"
        registroCitasCommandService -> citaCommand "Handle command"
        registroCitasCommandService -> recordatorioCommand "Handle command"
        registroCitasCommandService -> registroCitasRepository "Call repository method"
        registroCitasCommandService -> alertasExternalService "Call external service method"
        registroCitasCommandService -> sistemaLlamadaExternalService "Call external service method"
        
        registroCitasRepository -> gestionCitasDB "Store, update, delete and fetch records - Gestion de Citas" "SQL transaction"
        
        apartadoEducativoContextFacade -> registroCitasCommandService "Call service method"
        alertasExternalService -> gestionContextFacade "Registro de cita médica"
        sistemaLlamadaExternalService -> sistemaLlamadas "Contactar profesionales de la salud"
        
        # Relationships ApartadoEducativo Bounded Context
        apiGateway -> educacionController "Request POST del endpoint del Apartado Educativo"
        apiGateway -> instruccionController "Request POST del endpoint de las instrucciones"
        
        educacionController -> educacionQueryService "Call service method"
        educacionController -> educacionCommandService "Call service method"
        instruccionController -> instruccionQueryService "Call service method"
        instruccionController -> instruccionCommandService "Call service method"
        
        educacionQueryService -> educacionQuery "Handle query"
        educacionQueryService -> preguntaQuery "Handle query"
        educacionQueryService -> opinionQuery "Handle query"
        educacionQueryService -> imagenQuery "Handle query"
        educacionQueryService -> educacionRepository "Call repository method"
        instruccionQueryService -> instruccionQuery "Handle query"
        instruccionQueryService -> instruccionRepository "Call repository method"
        
        educacionCommandService -> educacionCommand "Handle command"
        educacionCommandService -> preguntaCommand "Handle command"
        educacionCommandService -> opinionCommand "Handle command"
        educacionCommandService -> imagenCommand "Handle command"
        educacionCommandService -> educacionRepository "Call repository method"
        educacionCommandService -> gestionCitasExternalService "Call external service method"
        educacionCommandService -> adobeAPIExternalService "Call external service method"
        educacionCommandService -> youtubeDataAPIExternalService "Call external service method"
        instruccionCommandService -> instruccionCommand "Handle command"
        instruccionCommandService -> instruccionRepository "Call repository method"
        
        educacionRepository -> apartadoEducativoDB "Store, update, delete and fetch records - Apartado Educativo" "SQL transaction"
        instruccionRepository -> apartadoEducativoDB "Store, update, delete and fetch records - Instrucciones" "SQL transaction"
        
        gestionCitasExternalService -> apartadoEducativoContextFacade "Instruciones mostradas"
        instruccionCommandService -> gestionCitasExternalService "Call external service method"
        adobeAPIExternalService -> adobeAPI "Descargar pdf"
        youtubeDataAPIExternalService -> youtubeDataAPI "Visualizar videos informativos"
        youtubeDataAPI -> youtubeDataAPIExternalService "Videos informativos mostrados"
        
        # Relationships MonitoreoSalud Bounded Context
        apiGateway -> monitoreoController "Request GET, POST, PUT del endpoint del monitoreo de salud"
        
        monitoreoController -> monitoreoQueryService "Call service method"
        monitoreoController -> monitoreoCommandService "Call service method"
        
        monitoreoQueryService -> monitoreoQuery "Handle query"
        monitoreoQueryService -> rangoSignoVitalQuery "Handle query"
        monitoreoQueryService -> emergenciaQuery "Handle query"
        monitoreoQueryService -> graficoTendenciaQuery "Handle query"
        monitoreoQueryService -> monitoreoRepository "Call repository method"
        
        monitoreoCommandService -> monitoreoCommand "Handle command"
        monitoreoCommandService -> rangoSignoVitalCommand "Handle command"
        monitoreoCommandService -> emergenciaCommand "Handle command"
        monitoreoCommandService -> graficoTendenciaCommand "Handle command"
        monitoreoCommandService -> monitoreoRepository "Call repository method"
        monitoreoCommandService -> dispositivoMedicoExternalService "Call external service method"
        monitoreoCommandService -> googleMapsAPIExternalService "Call external service method"
        
        monitoreoRepository -> monitoreoSaludDB "Store, update, delete and fetch records - Monitoreo de Salud" "SQL transaction"
        
        soportePacienteContextFacade -> monitoreoCommandService "Call service method"
        notificacionesContextFacade -> monitoreoCommandService "Call service method"
        dispositivoMedicoExternalService -> dispositivoMedico "Registrar signos vitales"
        googleMapsAPIExternalService -> googleMapsAPI "Ubicación del paciente obtenida"
    }
    views {
        systemContext vitalPath "VitalPathSystemContext" "Software de citación médica y monitoreo de pacientes" {
            include *
            autoLayout tb
        }
        
        container vitalPath "VitalPathContainer" "Container del Software de citación médica y monitoreo de pacientes" {
            include *
            autoLayout tb
        }
        
        component soportePacienteBC "soportePacienteComponent" "Diagrama de Componentes SoportePacienteBC" {
            include *
            autoLayout tb
        }
        
        component alertasNotificacionesBC "alertasNotificacionesComponent" "Diagrama de Componentes AlertasNotificacionesBC" {
            include *
            autoLayout tb
        }
        
        component gestionCitasBC "gestionCitasComponent" "Diagrama de Componentes GestionCitasBC" {
            include *
            autoLayout tb
        }
        
        component apartadoEducativoBC "apartadoEducativoComponent" "Diagrama de Componentes ApartadoEducativoBC" {
            include *
            autoLayout tb
        }
        
        component monitoreoSaludBC "monitoreoSaludComponent" "Diagrama de Componentes MonitoreoSaludBC" {
            include *
            autoLayout tb
        }
        
        styles {
            element "Person" {
                shape Person
                background #A272F2
                color #FFFFFF
            }
            element "Container" {
                background #002A8D
                color #FFFFFF
            }
            element "ExternalSystem" {
                background #FABB32
            }
            element "BoundedContext" {
                shape Component
                background #1C6314
            }
            element "VitalPath" {
                color #ffffff
                background #FA0F0F
                fontSize 22
                shape RoundedBox
            }
            element "ExternalSystem" {
                background #FA8B0F
            }
            element "MobileApp" {
                shape MobileDevicePortrait
                background #0FAFFA
                color #FFFFFF
                icon https://static.structurizr.com/themes/google-cloud-platform-v1.5/Cloud_Mobile_App.png
            }
            element "ApiGateway" {
                shape Pipe
                background #884A39
            }
            element "Database" {
                shape Cylinder
                background #621414
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

    configuration {
        scope softwaresystem
    }
}