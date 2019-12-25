# Grails 4 + TimescaleDB (PostgreSQL 10 + Timescale) + GraphQL:
```bash 
grails create-app <app-name> --profile=react
```

This command creates a folder containing two gradle projects, one is to act as a client (React app) and the other as a server (Grails app), to build a server only the latter is necessary.

1. Add the following dependencies to server `build.gradle` for use of TimescaleDB

	```gradle
	// PostgreSQL
	compile group: 'org.postgresql', name: 'postgresql', version: '42.2.9'
	compile group: 'org.grails.plugins', name: 'postgresql-extensions', version: '7.0.0'
	```

2. Add the following dependencies to server gradle for use of PostGIS

	```gradle
	// PostGIS
	compile group: 'net.postgis', name: 'postgis-jdbc', version: '2.3.0'
	```
	    
3. Add the following dependencies to server gradle for use of Flyway

	```gradle
	// Flyway
	compile group: 'org.flywaydb', name: 'flyway-core', version: '6.1.3'
	compile group: 'org.grails.plugins', name: 'grails-flyway', version: '0.2'
	```

4. Add the following dependencies to server gradle for use of GraphQL

	```gradle
	// GraphQL
	compile group: 'org.grails', name: 'gorm-graphql', version: '1.0.2'
	compile group: 'org.grails.plugins', name: 'gorm-graphql', version: '1.0.2'
	```

5. Now you can just start defining gorm entities as usual, gorm-grahpql will expose them as graphql queries.

6. To set up a PostgreSQL datasource, configure application.yml as follows (to set up Flyway migrations use the options preceded by # flywayConfig):

	```yml
	hibernate:
	  cache:
	    queries: false
	    use_second_level_cache: false
	    use_query_cache: false
	  dialect: net.kaleidos.hibernate.PostgresqlExtensionsDialect
	
	dataSource:
	  pooled: true
	  jmxExport: true
	  driverClassName: org.postgresql.Driver
	  username: <username>
	  password: <password>
	  dbCreate: <dbCreate>
	
	environments:
	  development:
	    dataSource:
	      dbCreate: none
	      url: jdbc:postgresql://<host>:<port>/<database>
	    # flywayConfig
	    flyway.locations: db/migrations
	  test:
	    dataSource:
	      dbCreate: update
	      url: jdbc:postgresql://<host>:<port>/<database>
	    # flywayConfig
	    flyway.locations: db/migrations
	  production:
	    dataSource:
	      dbCreate: none
	      url: jdbc:postgresql://<host>:<port>/<database>
	      properties:
	         jmxEnabled: true
	         initialSize: 5
	         maxActive: 50
	         minIdle: 5
	         maxIdle: 25
	         maxWait: 10000
	         maxAge: 600000
	         timeBetweenEvictionRunsMillis: 5000
	         minEvictableIdleTimeMillis: 60000
	         validationQuery: SELECT 1
	         validationQueryTimeout: 3
	         validationInterval: 15000
	         testOnBorrow: true
	         testWhileIdle: true
	         testOnReturn: false
	         jdbcInterceptors: ConnectionState
	         defaultTransactionIsolation: 2 # TRANSACTION_READ_COMMITTED
	    # flywayConfig
	    flyway.locations: db/migrations

	# flywayConfig
	flyway:
	  enabled: true
	  baselineOnMigrate: true
	```

7. To setup the flyway spring bean setup resources.groovy as follows:

	```groovy
	package spring
	
	// Place your Spring DSL code here
	beans = {
	    if (application.config.flyway.enabled) {

		def sessionFactoryBeanDef = getBeanDefinition('sessionFactory')

		if (sessionFactoryBeanDef) {
		    // depends on flyway bean
		    sessionFactoryBeanDef.dependsOn = ['flyway'] as String[]
		}
	    }
	}
	```
