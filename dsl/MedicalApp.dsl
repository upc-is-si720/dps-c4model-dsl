workspace "MedicalApp" "Practica calificada Número02, 2023 - 02" {

    model {
        // actors
        paciente = person "Usuario paciente" "personas que requieren de una consulta médica ambulatoria" "Client"
        farmacia = person "Farmarcia" "Empresas que venden los medicamentos recetados por el Médico" "Farmacia"
        administrationUser = person "Administration User" "Persona que gestiona y da soporte a la aplicación." "AdministrationUser"
        clinicasConsultorios = person "Empresas que requieren ampliar su alcance de atención" "CLinicasConsultorios"


        medicalApp = softwareSystem "MedicalApp Software" "Sistema para realizar pedidos" "EnterpriseSoftware" {
            mobileApplication = container "Mobile App" "Proporciona un conjunto de funciones de Internet a los clientes a través de su dispositivo móvil." "Flutter" "MobileApplication"

            apiGateway = container "API Gateway" "Componente que se encuentra entre los clientes y los servicios y proporciona un manejo centralizado de la comunicación API entre ellos" "ApiGateway"
            # aqui van los microoservicios (bounded context)
            registroCitas = container "Registro de citas BC" "Api RESTful de registro de cias" "Java v20 / Spring" "registroCitas, BC" {
                registroCitaController = component "registro Cita Controller" "REST controller for registro Cita" "Java v17 / Spring Web"
                registroCitaService = component "registro Cita Servicew" "Business Logic class for User Login" "Java v17 / Spring Web"
                citaRepositorio = component "Cita repositorio" "Repositorio interfaz de cita repositorio" "Java v17 / Spring Web"
                medicoRepositorio = component "Medico repositorio" "Repositorio interfaz de medico Repositorio" "Java v17 / Spring Web"
                usuarioRepositorio = component "Usuario repositorio" "Repositorio interfaz de usuario Repositorio" "Java v17 / Spring Web"
                googleCalendarComponent = component "Google Calendar component" "Componente para conectar con Google Calendar API" "Java v17 / Spring Web" "GoogleCalendarComponent"
                teamsComponent = component "Micro Teams component" "Componente para conectar con Micro Teams API" "Java v17 / Spring Web" "MicrosoftTeams"
            }

            pagosSistema = container "Sistema de pago BC" "Api RESTful de Pagos sistema" "Java v20 / Spring" "PagoSistema, BC" {
                pagoSistemaController = component "pago sistema Controller" "REST controller for pago sistema" "Java v17 / Spring Web"
                pagoSistemaCitaService = component "pago sistema Servicew" "Business Logic class for pago sistema" "Java v17 / Spring Web"
                pacienteRepositorio = component "Paciente repositorio" "Repositorio interfaz de cita repositorio" "Java v17 / Spring Web"
                bancoRepositorio = component "Banco repositorio" "Repositorio interfaz de medico Repositorio" "Java v17 / Spring Web"
                culquiSystemComponent = component "Spreedly system component" "Componente para conectar con Spreedly API" "Java v17 / Spring Web"
            }


            busquedaClinica = container "Busqueda Clininica" "Api RESTful de busqueda clinica" "Java v20 / Spring" "BusquedaClinica, BC" {
                busquedaController = component "busquedaServiceController" "REST controller for busquedaService" "Java v17 / Spring Web"
                busquedaService = component "busquedaService Servicew" "Business Logic class for busquedaService" "Java v17 / Spring Web"
                clinicaRepositorio = component "Paciente repositorio" "Repositorio interfaz de cita repositorio" "Java v17 / Spring Web"
                usuarioRepositorio2  = component "Usuario repositorio" "Repositorio interfaz de usuario Repositorio" "Java v17 / Spring Web"
                googleMapsComponent = component "googleMaps component" "Componente para conectar con Spreedly API" "Java v17 / Spring Web"
            }

            busquedaMedico = container "Busqueda Medico" "Api RESTful de busqueda Medico" "Java v20 / Spring" "BusquedaMedico, BC"

            logeoUsuario = container "Logueo Usuario" "Api RESTful de busqueda Medico" "Java v20 / Spring" "LogeoUsuario, BC" {
                loginController = component "Login service Controller" "REST controller for Login service " "Java v17 / Spring Web"
                loginService = component "Login service Service" "Business Logic class for Login service " "Java v17 / Spring Web"
                medicoRepositorio20 = component "medico repositorio" "Repositorio interfaz de cita repositorio" "Java v17 / Spring Web"
                usuarioRepositorio3  = component "Usuario repositorio" "Repositorio interfaz de usuario Repositorio" "Java v17 / Spring Web"
                gmailComponent = component "gmailComponent component" "Componente para conectar con gmailComponent API" "Java v17 / Spring Web"
            }

            databaseApplication = container "Base de datos no relacional" "Almacena y actualiza información, credenciales de autenticación hash, registros de acceso, etc." "MongoDB" "RelationalDatabase"
        }

        # sistema externos a utilizar
        colegioMedicoSoftware = softwaresystem "Colegio Medico Peru Software" "ColegioMedicoSoftware"
        googleGmail = softwareSystem "Gmail" "Servicio que permite acceder a los buzones de Gmail y enviar correos electrónicos." "GoogleGmail"
        qulqiSystem = softwareSystem "Qulqi" "App que acepta pagos con tarjetas de débito y crédito" "QulqiSystem"
        microsoftTeam = softwareSystem "Microsoft team" "Plataforma para hacer videollamadas en vivo" "MicrosoftTeam"
        googleMaps = softwareSystem "Google Maps" "Es una plataforma de mapeo web y ofrece imágenes satelitales, fotografía aérea y mapas de calles." "GoogleMaps"
        googleCalendar = softwareSystem "Google Calendar" "Agenda y calendario electrónico desarrollado por Google" "Google Calendar"

        # realaciones entre person y software system
        administrationUser -> medicalApp "Gestiona y da soporte a la aplicación"
        farmacia -> medicalApp "Vende, ofrece medicamentos recetados por el medico"
        clinicasConsultorios -> medicalApp "Ofrece servicios medicos"
        paciente -> medicalApp "Crea, modifica, solicita consultas medicas"

        medicalApp -> colegioMedicoSoftware "Valida la colegiatura de los medicos registrados"
        medicalApp -> googleGmail "Recibe las notificaciones de los pagos y las citas agendadas"
        medicalApp -> qulqiSystem "Registra la información de la tarjeta, pague y valide el pago"
        medicalApp -> microsoftTeam "Crea citas medicas por videollamada"
        medicalApp -> googleMaps "Obtiene la ubicacion de las clinicas cercanas al usuario"
        medicalApp -> googleCalendar "Registra las citas medicas"


        #relaciones entre contenedores
        paciente -> mobileApplication "Descripcion"
        administrationUser -> mobileApplication "Descripcion"
        farmacia -> mobileApplication Descripcion"
        clinicasConsultorios -> mobileApplication Descripcion"

        #mobile owo
        mobileApplication -> apiGateway "Endpoint call" "JSON / HTTPS"

        // relaciones entre bc y api gateway
        apiGateway -> registroCitas "Endpoint call" "JSON / HTTPS"
        apiGateway -> pagosSistema "Endpoint call" "JSON / HTTPS"
        apiGateway -> busquedaClinica "Endpoint call" "JSON / HTTPS"
        apiGateway -> busquedaMedico "Endpoint call" "JSON / HTTPS"
        apiGateway -> logeoUsuario "Endpoint call" "JSON / HTTPS"

        // relaciones bc y database
        registroCitas -> databaseApplication "Store, get, update and delete record" "JDBC"
        pagosSistema -> databaseApplication "Store, get, update and delete record" "JDBC"
        busquedaClinica -> databaseApplication "Store, get, update and delete record" "JDBC"
        busquedaMedico -> databaseApplication "Store, get, update and delete record" "JDBC"
        logeoUsuario -> databaseApplication "Store, get, update and delete record" "JDBC"

        #relaciones sistemas externos y bc
        registroCitas -> googleCalendar "Endpoint call" "JSON / HTTPS"
        registroCitas -> colegioMedicoSoftware "Endpoint call" "JSON / HTTPS"
        registroCitas -> microsoftTeam "Endpoint call" "JSON / HTTPS"
        pagosSistema -> qulqiSystem "Endpoint call" "JSON / HTTPS"
        busquedaClinica -> googleMaps "Endpoint call" "JSON / HTTPS"
        busquedaMedico -> googleGmail "Endpoint call" "JSON / HTTPS"
        busquedaMedico -> googleMaps "Endpoint call" "JSON / HTTPS"
        logeoUsuario -> googleGmail "Endpoint call" "JSON / HTTPS"

        #relaciones registrocitasBC
        apiGateway -> registroCitaController "Methods Call" "POO"
        registroCitaController -> registroCitaService "Methods Call" "POO"
        registroCitaService -> googleCalendarComponent "Methods Call" "POO"
        registroCitaService -> citaRepositorio "Methods Call" "POO"
        registroCitaService -> medicoRepositorio "Methods Call" "POO"
        registroCitaService -> usuarioRepositorio "Methods Call" "POO"
        registroCitaService -> teamsComponent "Methods Call" "POO"
        teamsComponent -> microsoftTeam "Methods Call" "POO"
        googleCalendarComponent -> googleCalendar "Endpoints Call" "JSON / XML / HTTPS"
        citaRepositorio -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        medicoRepositorio -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        usuarioRepositorio -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"


        #relaciones pagosistemaBC
        apiGateway -> pagoSistemaController  "Methods Call" "POO"
        pagoSistemaController -> pagoSistemaCitaService "Methods Call" "POO"
        pagoSistemaCitaService -> culquiSystemComponent "Methods Call" "POO"
        pagoSistemaCitaService -> pacienteRepositorio  "Methods Call" "POO"
        pagoSistemaCitaService -> bancoRepositorio  "Methods Call" "POO"

        culquiSystemComponent  -> qulqiSystem "Endpoints Call" "JSON / XML / HTTPS"
        pacienteRepositorio -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        bancoRepositorio -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"

        #relaciones pagosistemaBC
        apiGateway -> busquedaController   "Methods Call" "POO"
        busquedaController  -> busquedaService  "Methods Call" "POO"
        busquedaService  -> clinicaRepositorio   "Methods Call" "POO"
        busquedaService -> usuarioRepositorio2     "Methods Call" "POO"
        busquedaService -> googleMapsComponent   "Methods Call" "POO"
        googleMapsComponent  -> googleMaps "Endpoints Call" "JSON / XML / HTTPS"
        clinicaRepositorio  -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        usuarioRepositorio2   -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"

        # xdxdd
        apiGateway -> loginController    "Methods Call" "POO"
        loginController  -> loginService   "Methods Call" "POO"
        loginService  -> medicoRepositorio20    "Methods Call" "POO"
        loginService -> usuarioRepositorio3       "Methods Call" "POO"
        loginService -> gmailComponent   "Methods Call" "POO"
        gmailComponent  -> googleGmail "Endpoints Call" "JSON / XML / HTTPS"
        medicoRepositorio20  -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
        usuarioRepositorio3   -> databaseApplication "Store, get, update and delete record" "JDBC/SQL Transactional"
    }

    views {
        systemContext medicalApp "SystemContext" {
            include *
            animation {
                medicalApp
                administrationUser
                clinicasConsultorios
                paciente
                farmacia
            }
            autoLayout
        }
        container medicalApp "ContainerSystem" {
            include *
            animation {
                paciente
                apiGateway
                databaseApplication
            }
            autoLayout
        }

        component registroCitas "RegistroCitas" {
            include *
            autoLayout
        }

        component pagosSistema "PagoSistema" {
            include *
            autoLayout
        }

        component busquedaClinica "BusquedaClinica" {
            include *
            autoLayout
        }

        component logeoUsuario "LogeoUsuario" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                color #000000
                background #F24C3D
                fontSize 22
                shape Person
            }
            element "AdministrationUser" {
                shape Robot
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "MobileApplication" {
                shape MobileDevicePortrait
            }
            element "WebApplication" {
                shape WebBrowser
            }
            element "ApiGateway" {
                shape RoundedBox
                background #7E1717
            }
        }
    }

}