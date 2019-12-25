package demo

import org.grails.gorm.graphql.entity.dsl.GraphQLMapping

class Vehicle {

    String name

    Make make
    Model model

    static belongsTo = [driver: Driver]

    static constraints = {
    }

    static mapping = {
        id generator: 'native', params: [sequence: 'vehicle_sequence']
    }

    static graphql = GraphQLMapping.build {

        property 'name', order: 1

        property('make') {
            order 2
            dataFetcher { Vehicle vehicle ->
                vehicle.make ?: [:]
            }
        }

        property('model') {
            order 3
            dataFetcher { Vehicle vehicle ->
                vehicle.model ?: [:]
            }
        }
    }
}
