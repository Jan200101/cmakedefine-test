
// defined as "foo_content"
#cmakedefine foo "@HAVE_FOO@" 

// defined as 1
#cmakedefine01 bar

// defined as 0
#cmakedefine01 barfalse

// defined as 0
#cmakedefine01 barzero

// defined with no value
#cmakedefine foobar

// defined as 0
#cmakedefine01 barfoo

// undefined
#cmakedefine unfoo "@HAVE_FOO@"

// undefined
#cmakedefine unbar

// defined as 0
#cmakedefine01 unbarfoo
