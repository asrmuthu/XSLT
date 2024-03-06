#/bin/bash

for file in $(find ./InputSamples/ -iname '*.xml')

do
#find -name 'package.xml' -type f -exec rm -f {} +
#dir=/tnq/local/QCTOOL/base_xml_creation/basexml;
#echo "\n$file\n" >> $dir/result.log;
    #rm $dir/newFile.xml
    #rm $dir/temp.xml


    java -jar saxon8.jar -o $file $file xsl/list_xml_tags.xsl

    # --------------- Remove duplicates tags from source file ---------------

    java -jar saxon8.jar -o $file $file xsl/duplicate_tag_remove.xsl

    # --------------- List the difference between Source File with Base file (unsupported elemets)---------------

   #java -jar $dir/saxon8.jar $file $dir/xsl/diff.xsl +pSpecific=$dir/goldenbase.xml 2>> $dir/1.xml
   
   
   # list_xml_tags
#java -jar /tnq/in-workflow/app/Tnq/InWorkflow/lib/xml-transformation/bin/saxonvalidator.jar -f $file $file -s /tnq/in-workflow/app/Tnq/InWorkflow/lib/xml-transformation/src/xsl/QCTOOL/list_xml_tags.xsl -o -nodtd > /tnq/local/run/main1_qctool.xml

# duplicate_tag_remove
#java -jar /tnq/in-workflow/app/Tnq/InWorkflow/lib/xml-transformation/bin/jar/saxon8.jar -o /tnq/local/run/main2.xml /tnq/local/run/main1.xml /tnq/in-workflow/app/Tnq/InWorkflow/lib/xml-transformation/src/xsl/QCTOOL/duplicate_tag_remove.xsl 2> /tnq/local/run/main2_qctool.xml

# diff
#java -jar /tnq/in-workflow/app/Tnq/InWorkflow/lib/xml-transformation/bin/jar/saxon8.jar /tnq/local/run/main2.xml /tnq/in-workflow/app/Tnq/InWorkflow/lib/xml-transformation/src/xsl/QCTOOL/diff.xsl +pSpecific='/tnq/in-workflow/app/Tnq/InWorkflow/lib/xml-transformation/src/xsl/QCTOOL/tud/base.xml' 2> /tnq/local/run/error_qctool.xml
   
   



done
