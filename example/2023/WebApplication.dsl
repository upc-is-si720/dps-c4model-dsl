workspace {

    model {
        user = person "User"

        softwareSystem = softwareSystem "Software System"{

            webapp = container "Web Application"

            service1 = group "Service 1" {
                service1Api = container "Service 1 API" {
                    tags "Service 1" "Service API"
                }
                service1Database = container "Service 1 Database" {
                    tags "Service 1" "Database"
                }
                service1Api -> service1Database "Reads from and writes to"
            }

            service2 = group "Service 2" {
                service2Api = container "Service 2 API" {
                    tags "Service 2" "Service API"
                }
                service2Database = container "Service 2 Database" {
                    tags "Service 2" "Database"
                }
                service2Api -> service2Database "Reads from and writes to"
            }

            service3 = group "Service 3" {
                service3Api = container "Service 3 API" {
                    tags "Service 3" "Service API"
                }
                service3Database = container "Service 3 Database" {
                    tags "Service 3" "Database"
                }
                service3Api -> service3Database "Reads from and writes to"
            }

            service4 = group "Service 4" {
                service4Api = container "Service 4 API" {
                    tags "Service 4" "Service API"
                }
                service4Database = container "Service 4 Database" {
                    tags "Service 4" "Database"
                }
                service4Api -> service4Database "Reads from and writes to"
            }
        }

        user -> webapp "Uses"
        webapp -> service1Api "Uses"
        service1Api -> service2Api "Uses"
        webapp -> service3Api "Uses"
        service3Api -> service4Api "Uses"
    }

    views {
        container softwareSystem "Containers_All" "All containers" {
            include *
            autolayout
        }

        container softwareSystem "Containers_Service1" "Service 1" {
            include user ->service1->
            autolayout
        }

        styles {
            element "Person" {
                shape Person
            }
            element "Service API" {
                shape hexagon
            }
            element "Database" {
                shape cylinder
            }
            element "Service 1" {
                background #91F0AE
            }
            element "Service 2" {
                background #EDF08C
            }
            element "Service 3" {
                background #8CD0F0
            }
            element "Service 4" {
                background #F08CA4
            }
        }
    }

}