project('test', ['c'])

conf_data = configuration_data()
conf_data.set10('foo', true)
conf_data.set('HAVE_FOO', 'foo_content')
conf_data.set('bar', 'test')
conf_data.set('barfalse', false)
conf_data.set('barzero', 0)
conf_data.set('barint', 22)
conf_data.set('foobar', 'value')
conf_data.set10('barfoo', false)

configure_file(
    input : 'test.h.cmake',
    output : 'test.h',
    format : 'cmake@',
    configuration : conf_data
)