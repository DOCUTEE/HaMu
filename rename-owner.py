import os
import json

def rename_user_in_file(file_path, old_username, new_username):
    """Read a file, replace occurrences of the old username with the new one, and save changes."""
    try:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as file:
            content = file.read()
        new_content = content.replace(old_username, new_username)
        if new_content != content:
            with open(file_path, 'w', encoding='utf-8') as file:
                file.write(new_content)
            print(f"Updated username in: {file_path}")
    except Exception as e:
        print(f"Error processing file {file_path}: {e}")

def rename_user_in_all_files(root_folder, old_username, new_username, requiredFiles):
    for path in requiredFiles:
        file_path = os.path.join(root_folder, path)
        rename_user_in_file(file_path, old_username, new_username)

def CanReadAndWriteAllFiles(root_folder, requiredFiles):
    for path in requiredFiles:
        file_path = os.path.join(root_folder, path)
        if not os.path.exists(file_path):
            print(f"Error: File does not exist {file_path}")
            return False
        if not os.access(file_path, os.R_OK):
            print(f"Error: Couldn't read file {file_path}")
            return False
        if not os.access(file_path, os.W_OK):
            print(f"Error: Couldn't write to file {file_path}")
            return False
    return True

def main():
    """Main function to get user input and start the renaming process."""
    try:
        # load json file
        with open('hamu-config.json', 'r', encoding='utf-8') as f:
            data = json.load(f)
    except Exception as e:
        print(f"Error loading JSON file: {e}")
        return

    requiredFiles = data.get('requiredFiles', [])
    
    if not requiredFiles:
        print("Error: No required files specified in hamu-config.json")
        return

    # get the root folder
    root_folder = os.getcwd() 
    
    # get the old username
    old_username = data.get('ownerName', "").strip()
    
    if not old_username:
        print("Error: Couldn't retrieve the old username.")
        return  

    new_username = input("Enter the new username: ").strip()
    
    if not new_username:
        print("Error: New username cannot be empty.")
        return

    canAccess = CanReadAndWriteAllFiles(root_folder, requiredFiles)
    print(canAccess)
    
    if not canAccess:
        print("Error: Couldn't access required files.")
        return
    
    rename_user_in_all_files(root_folder, old_username, new_username, requiredFiles)
    print("Done!")

if __name__ == "__main__":
    main()
