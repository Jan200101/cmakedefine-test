
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

// no body
#cmakedefine barint

// undefined, does not exist
#cmakedefine BARINT

// undefined, does not exist
#cmakedefine unfoo "@HAVE_FOO@"

// undefined, does not exist
#cmakedefine unbar

// defined as 0, does not exist
#cmakedefine01 unbarfoo

// defined as (int)22
#cmakedefine foo (int)@barint@
