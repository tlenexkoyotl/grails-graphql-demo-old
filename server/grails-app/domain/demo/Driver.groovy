package demo

import org.grails.gorm.graphql.entity.dsl.GraphQLMapping

class Driver {

    String name

    static hasMany = [vehicles: Vehicle]

    static constraints = {
        vehicles nullable: true
    }

    static mapping = {
        id generator: 'native', params: [sequence: 'driver_sequence']
    }

    static graphql = GraphQLMapping.build {

        property 'name', order: 1

        property('vehicles') {
            order 2
            dataFetcher { Driver driver ->
                driver.vehicles ?: []
            }
        }
    }
}
