#### Shell script to automatically generate htmls
#### by Whyjay Zheng 
#### created in 2016, last updated on Jul 26 2022

# Generate .pot files (template files with all strings to be translated into each language) 
# this is equivalent to  `sphinx-build -b gettext -a docs docs/_build/gettext` if conf.py is present.
jupyter book build --builder custom --custom-builder gettext docs --all

# Update translated .po files 
# If an existing and translated string is modified in .pot, the old translated text will either be fuzzily matched or commented out depending on the similarity.
# Now we only update the en_US (en) locale.
sphinx-intl update -p docs/_build/gettext -d docs/locale -l en_US

# Generate HTML files in the native language
jupyter book build docs --all

# Generate HTML files in the designated language (here in English)
# jupyter Book's CLI does not allow the -D option, so we have to generate a config.py and use sphinx-build to do the step.
jupyter book config sphinx docs
sphinx-build -b html -a -D language=en docs docs/_build/html/en

# Custom decorations/links/settings for the HTML files
./decorate.bash
