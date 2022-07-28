#!/bin/bash
#### Do the following things in the output html files generated by Jupyter Book / Sphinx:
#### 1. Insert Google webfont HTML code (for using Varela Round)
#### 2. Insert Justfont javascript between the </head> and <body> tag (for using customized Chinese font)
#### 3. Insert Disqus javascript before the footer-content div class (for displaying Disqus widget)
#### 4. Insert Language menu in the left navigation bar, under the search box (matched with ^<\/form>). (for displaying and switching language options)
#### 5. Replace the title of the book with different language, and replace `zzz_replace_token` (just a placeholder) with correct language name.  
#### by Whyjay Zheng
#### created on 2016/1/12, last updated on 2022/07/28
#### - Temporarily disabled Justfont settings; use Google Font (Noto Sans) instead

html_files=$(ls docs/_build/html/*.html   docs/_build/html/main/*.html   docs/_build/html/en/*.html   docs/_build/html/en/main/*.html)

google_fonts=$(cat docs/_addons/google_fonts.txt)
# jf_string=$(cat docs/_addons/jf_code.txt)
disqus_string=$(cat docs/_addons/disqus_code.txt)
localemenu=$(cat docs/_addons/localemenu.txt)

# refer to the escape characters...
# http://unix.stackexchange.com/questions/32907/what-characters-do-i-need-to-escape-when-using-sed-in-a-sh-script
google_fonts=${google_fonts//\\/\\\\}     # changes all "\" to "\\"
google_fonts=${google_fonts//\[/\\\[}     # changes all "[" to "\["
google_fonts=${google_fonts//\]/\\\]}     # changes all "]" to "\]"
google_fonts=${google_fonts//\$/\\\$}     # changes all "$" to "\$"
google_fonts=${google_fonts//\./\\\.}     # changes all "." to "\."
google_fonts=${google_fonts//\*/\\\*}     # changes all "*" to "\*"
google_fonts=${google_fonts//\^/\\\^}     # changes all "^" to "\^"
google_fonts=${google_fonts//\//\\\/}     # changes all "/" to "\/"
google_fonts=${google_fonts//\"/\\\"}     # changes all '"' to '\"'

# jf_string=${jf_string//\\/\\\\}     # changes all "\" to "\\"
# jf_string=${jf_string//\[/\\\[}     # changes all "[" to "\["
# jf_string=${jf_string//\]/\\\]}     # changes all "]" to "\]"
# jf_string=${jf_string//\$/\\\$}     # changes all "$" to "\$"
# jf_string=${jf_string//\./\\\.}     # changes all "." to "\."
# jf_string=${jf_string//\*/\\\*}     # changes all "*" to "\*"
# jf_string=${jf_string//\^/\\\^}     # changes all "^" to "\^"
# jf_string=${jf_string//\//\\\/}     # changes all "/" to "\/"
# jf_string=${jf_string//\"/\\\"}     # changes all '"' to '\"'

disqus_string=${disqus_string//\\/\\\\}     # changes all "\" to "\\"
disqus_string=${disqus_string//\[/\\\[}     # changes all "[" to "\["
disqus_string=${disqus_string//\]/\\\]}     # changes all "]" to "\]"
disqus_string=${disqus_string//\$/\\\$}     # changes all "$" to "\$"
disqus_string=${disqus_string//\./\\\.}     # changes all "." to "\."
disqus_string=${disqus_string//\*/\\\*}     # changes all "*" to "\*"
disqus_string=${disqus_string//\^/\\\^}     # changes all "^" to "\^"
disqus_string=${disqus_string//\//\\\/}     # changes all "/" to "\/"
disqus_string=${disqus_string//\"/\\\"}     # changes all '"' to '\"'

localemenu=${localemenu//\\/\\\\}     # changes all "\" to "\\"
localemenu=${localemenu//\[/\\\[}     # changes all "[" to "\["
localemenu=${localemenu//\]/\\\]}     # changes all "]" to "\]"
localemenu=${localemenu//\$/\\\$}     # changes all "$" to "\$"
localemenu=${localemenu//\./\\\.}     # changes all "." to "\."
localemenu=${localemenu//\*/\\\*}     # changes all "*" to "\*"
localemenu=${localemenu//\^/\\\^}     # changes all "^" to "\^"
localemenu=${localemenu//\//\\\/}     # changes all "/" to "\/"
localemenu=${localemenu//\"/\\\"}     # changes all '"' to '\"'
localemenu=${localemenu//\&/\\\&}     # changes all '&' to '\&'  (required to properly display the inverted triangle)

# ==== Jobs 1-3 ====

for html_f in $html_files
do
    # ==== Attaching google fonts code ====
    if grep -q 'googleapis' $html_f; then
        echo skip ${html_f##*/} - already attached the google fonts code
    else
        echo ----- Attaching google fonts code to ${html_f##*/} ...
        # insert a new line before the pygments.css line
        sed -i "/pygments.css/i\ $google_fonts" $html_f
    fi
    # # ==== Attaching jf code ====
    # if grep -q 'jf.push' $html_f; then
    #     echo skip ${html_f##*/} - already attached the jf code
    # else
    #     echo ----- Attaching jf code to ${html_f##*/} ...
    #     # insert a new line after </head> tag
    #     sed -i "/<\/head>/a\ $jf_string" $html_f
    # fi
    # ==== Attaching disqus code ====
    if grep -q 'disqus_thread' $html_f; then
        echo skip ${html_f##*/} - already attached the disqus code
    else
        echo ----- Attaching disqus code to ${html_f##*/} ...
        dyn_id=${html_f##*/}
        dyn_id=${dyn_id%%.*}
        unique_disqus_string=${disqus_string//DYNAMIC_ID/$dyn_id}
        # insert a new line before the footer-content div class
        sed -i "/footer-content/i\ $unique_disqus_string" $html_f
    fi
done

# ==== Add locale menu (Job 4) ====

for html_f in $html_files
do
    if grep -q 'clearfix' $html_f; then
        echo skip ${html_f##*/} - locale already added
    else
        html_name=${html_f##*/}
        echo ----- Adding locale to $html_name ...
        #### This is to deal with different TOC structure
        # en/main/ has to be linked with ../../main/
        if ( echo $html_f | grep -q '/en/main/' ); then
            localemenu_each=${localemenu/LinkToChinese/\\.\\.\\\/\\.\\.\\\/main\\\/${html_name/./\\.}}
            localemenu_each=${localemenu_each/LinkToEnglish/${html_name/./\\.}}
        # en/ has to be linked with ../
        elif ( echo $html_f | grep -q '/en/' ); then
            localemenu_each=${localemenu/LinkToChinese/\\.\\.\\\/${html_name/./\\.}}
            localemenu_each=${localemenu_each/LinkToEnglish/${html_name/./\\.}}
        # main/ has to be linked with ../en/main/
        elif ( echo $html_f | grep -q '/main/' ); then
            localemenu_each=${localemenu/LinkToChinese/${html_name/./\\.}}
            localemenu_each=${localemenu_each/LinkToEnglish/\\.\\.\\\/en\\\/main\\\/${html_name/./\\.}}
        # ./ has to be linked with en/
        else
            localemenu_each=${localemenu/LinkToChinese/${html_name/./\\.}}
            localemenu_each=${localemenu_each/LinkToEnglish/en\\\/${html_name/./\\.}}
        fi
        
        # Finally, add locale menu body after the ^</form> flag (search box)
        sed -i "s/^<\/form>/& $localemenu_each \n/" $html_f
    fi
done

# ==== Replace project name in Chinese with English, and replace the zzz_replace_token placeholder (Job 5) ====

en_html_files=$(ls docs/_build/html/en/*.html   docs/_build/html/en/main/*.html)

for html_f in $en_html_files
do
    if grep -q 'zzz_replace_token' $html_f; then
        echo ----- Finalizing English Locale of ${html_f##*/} ...
        sed -i -e 's/GMT 教學手冊/GMT Tutorials /g' $html_f
        sed -i -e 's/zzz_replace_token/English/g' $html_f
    else
        echo skip ${html_f##*/} - button caption already replaced
    fi
done

zhtw_html_files=$(ls docs/_build/html/*.html   docs/_build/html/main/*.html)

for html_f in $zhtw_html_files
do
    if grep -q 'zzz_replace_token' $html_f; then
        echo ----- Finalizing Zhtw Locale of ${html_f##*/} ...
        sed -i -e 's/zzz_replace_token/中文 (台灣)/g' $html_f
    else
        echo skip ${html_f##*/} - button caption already replaced
    fi
done
