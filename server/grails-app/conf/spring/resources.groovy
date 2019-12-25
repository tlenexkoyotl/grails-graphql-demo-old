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
