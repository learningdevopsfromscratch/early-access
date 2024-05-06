import argparse
import datetime

def add_row_to_table(file_name, tag):

    with open(file_name, 'r') as f:
        lines = f.readlines()

    start_line = None
    for i, line in enumerate(lines):
        if '|' in line:
            start_line = i
            break

    if start_line is not None:

        # Makes assumption we have a header
        insert_line = start_line + 2

        # Construct the new row
        new_row = f"| {tag} | {datetime.datetime.now()} |\n"


        lines.insert(insert_line, new_row)

        with open(file_name, 'w') as f:
            f.writelines(lines)
        
        print("Row added to the Markdown table.")
    else:
        print("No Markdown table found in the file.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Add a row to an existing Markdown table")
    parser.add_argument("file", help="Path to Markdown file")
    parser.add_argument("tag", help="Image Tag")

    args = parser.parse_args()

    add_row_to_table(args.file, args.tag)

