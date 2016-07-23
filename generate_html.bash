# routine to generate htmls
# by Whyjay, Jul 13 2016

make gettext
sphinx-intl update -p _build/locale -l en
make html
make -e SPHINXOPTS="-D language='en'" BUILDSURFIX="/en" html
./decorate.bash
cp -u favicon.ico _build/html/