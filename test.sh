# Define directories and files
directory="/home/rohit/ISRO"
input_file="$directory/Sitereport.dat"
output_file="$directory/converted.sec"

# Ensure the input file exists
if [[ -f "$input_file" ]]; then
    echo "Input file '$input_file' found."

    # Clear the output file if it exists
    > "$output_file"

    echo "Processing lines in a for loop..."
    while IFS= read -r line; do
        # Check if the line matches the pattern
        if [[ "$line" =~ ^[[:space:]]+[0-9]{4} ]]; then

            #formatted_line=$(echo "$line" | awk '{printf "%s%s%s%s%s%s%s%.3f%.3f%.2f\n", $2, $3, $4, $5, $6, $7, $8, $9, $10}')
            #echo "hello $forformatted_line"
            # Remove leading spaces and append to the output file
            #data=$(${line#"${line%%[![:space:]]*}"})
            #echo "${line#"${line%%[![:space:]]*}"}" >> "$output_file"
            #echo "hi $data"
                        # Remove leading spaces and append to the output file
            data=$(echo "$line" | sed 's/^[[:space:]]*//')

            # Print the data without leading spaces
            #echo "$data"
            formatted_data=$(echo "$line" | awk '{printf "%s%s%s%s%s%s%s%.3f%.3f%.2f", $2, $3, $4, $5, $6, $7, $8, $9, $10}')

            # Display the formatted data
            echo "Formatted data: $formatted_data"
            # You can append the data to the output file here if needed
            # echo "$data" >> "$output_file"
        fi
    done < "$input_file"

    echo "Data successfully appended to '$output_file' without leading spaces."
    echo "Contents of '$output_file':"i
    #cat "$output_file"
else
    echo "Input file '$input_file' not found."
fi
