php mr.php
java -jar saxon8.jar -o output.xml mr.xml post.xsl
java -jar saxon8.jar -o merge.xml output.xml duplicate_tag_remove.xsl
