import os

def list_files_in_directory(directory):
    try:
        items = os.listdir(directory)
        for item in items:
            if item == ".git":
                continue
            item_path = os.path.join(directory, item)
            if os.path.isdir(item_path):
                print(f"Directory: {item_path}")
                list_files_in_directory(item_path)
            else:
                print(f"File: {item_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    directory = os.path.dirname(os.path.abspath(__file__))
    list_files_in_directory(directory)

