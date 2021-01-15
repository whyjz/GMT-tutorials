# routine to generate htmls
# by Whyjay, Jul 13 2016

# make gettext
# sphinx-intl update -p _build/locale -l en
# zanata-cli push
zanata-cli pull
make html
make -e SPHINXOPTS="-D language='en_US'" BUILDSURFIX="/en" html
./decorate.bash
cp -u favicon.ico _build/html/
