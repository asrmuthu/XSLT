<?php

$path = './InputSamples/';
$files = scandir($path);

// File path of the final result
$filepath = "mr.xml";

// Open the final XML file for writing
$out = fopen($filepath, "w");

// Write the XML declaration and root element
fwrite($out, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
fwrite($out, "<root>\n");

// Iterate through each file in the directory
foreach ($files as $file) {
    // Skip current and parent directory entries
    if ($file !== '.' && $file !== '..') {
        // Open the current file for reading
        $in = fopen($path . $file, "r");

        // Read each line from the file and write it to the final XML file
        while ($line = fgets($in)) {
            fwrite($out, $line);
        }

        // Close the current file
        fclose($in);
    }
}

// Write the closing root element
fwrite($out, "</root>");

// Close the final XML file
fclose($out);

echo "Base XML file created successfully.";

?>
