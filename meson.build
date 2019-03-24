project('valabb', 'c', 'vala')

dependencies = [
	dependency('glib-2.0'),
	dependency('gobject-2.0'),
	dependency('gio-2.0'),
	dependency('libsoup-2.4'),
	dependency('vsgi-0.3'),
	dependency('valum-0.3')
]

sources = files(
	'src/Application.vala',
	'src/Controller/IndexController.vala',
	'src/Controller/Admin/IndexController.vala',
)

executable('valabb', sources, dependencies: dependencies)
