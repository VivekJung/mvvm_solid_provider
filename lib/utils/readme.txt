this directory contains UTILITIES - repeated app functions
    - this is to avoid duplication of code
    - mostly used by following KISS principle with SOLID principle

    KISS    - keep it simple stupid
    SOLID   - single responsibility principle (a class should have one and only reason to change)
                - open-closed principle (extend class behaviour without modifying it - open for extension, closed for modification)
                    - Liksov substitution principle ( derived class extends the base class witout changing behaviour)
                        - Interface segregation principle ( making fine grained interfaces that are client-specific.
                        Clients should not be forced to implement interfaces they do not use.)
                            - dependecy inversion principle (high level modules should not depend on low level modules. Both should depend on details. Details should depend upon abstractions.)
        - this is an object oriented design
        - main goal is to reduce dependencies so that while editing one part, another remains unaffected.
        - making agile software, build adaptive (scalable), effective

* All files are exported via utils.dart file.
