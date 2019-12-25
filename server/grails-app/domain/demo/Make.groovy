package demo

class Make {

    String name

    static constraints = {
    }

    static mapping = {
        id generator: 'native', params: [sequence: 'make_sequence']
    }

    static graphql = true
}
