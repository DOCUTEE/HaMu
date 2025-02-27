import os

def rename_user_in_file(file_path, old_username, new_username):
    """Read a file, replace occurrences of the old username with the new one, and save changes."""
    try:
        with open(file_path, 'r') as file:
            content = file.read()
        new_content = content.replace(old_username, new_username)
        if new_content != content:
            with open(file_path, 'w') as file:
                file.write(new_content)
            print(f"Updated username in: {file_path}")
    except Exception as e:
        print(f"Error processing file {file_path}: {e}")

def rename_user_in_all_files(root_folder, old_username, new_username):
    """Recursively search for files in the root directory and replace the old username."""
    for root, dirs, files in os.walk(root_folder):
        # Skip .git directory
        if '.git' in dirs:
            dirs.remove('.git')
        if '.gitignore' in dirs:
            dirs.remove('.gitignore')
        if 'README.md' in dirs:
            dirs.remove('README.md')
        if 'LICENSE' in dirs:
            dirs.remove('LICENSE')
        if '.all-contributorsrc' in dirs:
            dirs.remove('.all-contributorsrc')
        for file in files:
            file_path = os.path.join(root, file)
            rename_user_in_file(file_path, old_username, new_username)

def get_old_username_from_file():
    """Read the old username from OwnerName.txt."""
    try:
        with open("./OwnerName.txt", "r") as file:
            return file.read().strip()
    except FileNotFoundError:
        print("Error: OwnerName.txt not found.")
        return None
    

def main():
    """Main function to get user input and start the renaming process."""
    root_folder = os.getcwd()  # Get the current working directory
    
    old_username = get_old_username_from_file()
    
    if not old_username:
        print("Error: Couldn't retrieve the old username.")
        return  # Exit if the old username couldn't be retrieved

    new_username = input("Enter the new username: ").strip()

    rename_user_in_all_files(root_folder, old_username, new_username)
    print("Done!")

if __name__ == "__main__":
    main()
