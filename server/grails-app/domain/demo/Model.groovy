package demo

class Model {

    String name

    static constraints = {
    }

    static mapping = {
        id generator: 'native', params: [sequence: 'model_sequence']
    }

    static graphql = true
}
