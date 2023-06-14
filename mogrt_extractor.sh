for f in "$@"
do
    # Extract the directory and filename from the file path
    dir=$(dirname "$f")
    file=$(basename "$f")

    # Change to the directory containing the .mogrt file
    cd "$dir"

    # Check if the file is a .mogrt file
    if [[ $file == *.mogrt ]]
    then
        # Extract the mogrt file
        unzip "$file" -d "${file%.*}"

        # Check if "project.aegraphic" exists in the unzipped folder
        if [[ -f "${file%.*}/project.aegraphic" ]]
        then
            # If "project.aegraphic" exists, change its extension to .zip
            mv "${file%.*}/project.aegraphic" "${file%.*}/project.zip"

            # Create a new folder for the contents of project.aegraphic
            mkdir -p "${file%.*}/project.aegraphic"

            # Unzip the .zip file to the new folder
            unzip "${file%.*}/project.zip" -d "${file%.*}/project.aegraphic"

            # Remove the .zip file
            rm "${file%.*}/project.zip"
        fi
    fi
done
