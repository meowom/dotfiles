chezmoi_add_all() {
    # Run `chezmoi status` and store the output in a variable
    local output=$(chezmoi status)

    # Iterate over each line in the output
    echo "$output" | while IFS= read -r line; do
        # Check if the line starts with 'MM'
        if [[ $line == MM* ]]; then
            # Get the file path after 'MM' and add it with chezmoi
            local file_path=$(echo "$line" | awk '{print $2}')
            chezmoi add "$HOME/$file_path"
        fi
    done
}

alias cmaa='chezmoi_add_all'

