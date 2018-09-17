# useful-bash-cmds
# 15 Jun 2017 (Thu)

# paste multi line into single CSV line
paste -d, -s file

#change private ssh password
ssh-keygen -f ~/.ssh/id_dsa -p

# remove all .DS_Stores for directory + sub-dirs
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch

# http://vim.wikia.com/wiki/Bulk_rename_files_with_Vim
\ls | vim -
:%s/.*/mv -i & &/g
:w !sh

# Humble Bundle
# https://gist.github.com/graymouser/a33fbb75f94f08af7e36
# click all download buttons on webpage
# rmb to manually change target dir and disable prompt in Chrome Settings
# $("a[data-web*='pdf']").click() depreciated as HB changed their website
$('span.label:contains(EPUB)').click()


# youtube-dl playlist
rightclick on playlist and copy link
youtube-dl -i -o output.flv --yes-playlist <link>

# Look for files including string
egrep -lir --include=*.{php,html,js} "string" .

# Restoring db from pg_restore dump
# Specifying --no-owner allows less errors when restoring from shahram's dump file
pg_restore -C --no-owner --role dtan -d odb odb.dump

# download sub-repo from a git repo without cloning
# replace tree/master with trunk
svn checkout <repo>/trunk/<folder>
