for xml_file in *.xml; 
do
    java -jar /tnq/in-workflow/app/Tnq/InWorkflow/lib/xml-transformation/bin/jar/saxon9he.jar -s:$xml_file -xsl:test.xsl -o:${xml_file%.xml}_output.xml
done

