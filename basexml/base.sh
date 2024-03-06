sh element.sh
php mr.php
java -jar saxon8.jar -o output.xml mr.xml post.xsl
java -jar saxon8.jar -o base.xml output.xml duplicate_tag_remove.xsl
