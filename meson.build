project('test', ['c'])

conf_data = configuration_data()
conf_data.set10('foo', true)
conf_data.set('HAVE_FOO', 'foo_content')

conf_data.set10('trueval', true)
conf_data.set10('falseval', false)
conf_data.set('zeroval', 0)
conf_data.set('oneval', 1)
conf_data.set('tenval', 10)
conf_data.set('stringval', 'test')

conf_data.set10('booltrueval', true)
conf_data.set10('boolfalseval', false)
conf_data.set('boolzeroval', 0)
conf_data.set('booloneval', 1)
conf_data.set('booltenval', 10)
conf_data.set('boolstringval', 'test')

conf_data.set('DOLLAR', '$')
conf_data.set('TEXT', 'TRAP')
conf_data.set('STRING', 'TEXT')
conf_data.set('STRING_AT', '@STRING@')
conf_data.set('STRING_CURLY', '{STRING}')
conf_data.set('STRING_VAR', '${STRING}')

conf_data.set('UNDERSCORE', '_')
conf_data.set('NEST_UNDERSCORE_PROXY', 'UNDERSCORE')
conf_data.set('NEST_PROXY', 'NEST_UNDERSCORE_PROXY')

configure_file(
    input : 'test.h.cmake',
    output : 'test.h',
    format : 'cmake',
    configuration : conf_data
)
