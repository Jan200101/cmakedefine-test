// cmakedefine

// undefined
#cmakedefine noval unreachable

// 1
#cmakedefine trueval 1

// undefined
#cmakedefine falseval unreachable

// undefined
#cmakedefine zeroval unreachable

// 1
#cmakedefine oneval 1

// 1
#cmakedefine tenval 1

// 1
#cmakedefine stringval 1


// cmakedefine01

// 0
#cmakedefine01 boolnoval

// 1
#cmakedefine01 booltrueval

// 0
#cmakedefine01 boolfalseval

// 0
#cmakedefine01 boolzeroval

// 1
#cmakedefine01 booloneval

// 1
#cmakedefine01 booltenval

// 1
#cmakedefine01 boolstringval


// @ substition

// undefined variable, removed
// @undefval@

// no value, removed
// @noval@

// 1
// @trueval@

// 0
// @falseval@

// 0
// @zeroval@

// 1
// @oneval@

// 10
// @tenval@

// test
// @stringval@


// curly brackets substition

// removal
// ${noval}

// 1
// ${trueval}

// 0
// ${falseval}

// 0
// ${zeroval}

// 1
// ${oneval}

// 10
// ${tenval}

// test
// ${stringval}


// wrapping tests

// becomes TEXT
#define @STRING@
#define ${STRING}

// becomes `at`TEXT`at`
#define @${STRING}@
#define @@STRING@@

// becomes TRAP
#define ${@STRING@}

// becomes `dollar sign`{STRING}
#define $@STRING_CURLY@
#define $${STRING_CURLY}

// becomes `dollar sign`{STRING}
#define @STRING_VAR@
#define ${STRING_VAR}

// becomes `dollar sign`{TEXT}
#define ${DOLLAR}{${STRING}}
#define @DOLLAR@{${STRING}}

// becomes `at`STRING`at`
#define ${STRING_AT}
#define @STRING_AT@

#define \@STRING_VAR\@
#define \${STRING_VAR}
#define $\{STRING_VAR}


// sigil test (no changes)
#define AT @
#define ATAT @@
#define ATATAT @@@
#define ATATATAT @@@@


// stack test (NEST_UNDERSCORE_PROXY)
#define NEST_UNDERSCORE_PROXY ${NEST${UNDERSCORE}PROXY}
#define NEST_UNDERSCORE_PROXY ${NEST${${NEST_UNDERSCORE${UNDERSCORE}PROXY}}PROXY}