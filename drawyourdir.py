import os
import argparse
import pathspec

def load_gitignore(gitignore_path='.gitignore'):
    """Load and parse the .gitignore file."""
    try:
        with open(gitignore_path, 'r') as file:
            gitignore = file.readlines()
    except FileNotFoundError:
        return None
    return pathspec.PathSpec.from_lines('gitwildmatch', gitignore)

def should_ignore(file_path, ignore, gitignore_spec):
    """Determine if a file or directory should be ignored."""
    if ignore and os.path.basename(file_path).startswith('.'):
        return True
    if gitignore_spec and gitignore_spec.match_file(file_path):
        return True
    return False

def draw_tree(path, levels, ignore, gitignore_spec, file_limit):
    """Print the directory tree with file size limits."""
    prefix = ' ' * 4
    file_count = {}

    for root, dirs, files in os.walk(path, topdown=True):
        level = root.replace(path, '').count(os.sep)
        indent = prefix * level
        subindent = prefix * (level + 1)

        # Apply .gitignore and hidden file filters to directories
        dirs[:] = [d for d in dirs if not should_ignore(os.path.join(root, d), ignore, gitignore_spec)]

        # Early exit for deep directories
        if level > levels:
            continue

        # Print current directory
        print('{}{}/'.format(indent, os.path.basename(root)))

        # Filter and sort files by size
        filtered_files = [(f, os.path.getsize(os.path.join(root, f))) for f in files
                          if not should_ignore(os.path.join(root, f), ignore, gitignore_spec)]
        sorted_files = sorted(filtered_files, key=lambda x: x[1], reverse=True)

        # Print files, respecting the file limit
        for i, (f, size) in enumerate(sorted_files, 1):
            if i > file_limit:
                print('{}|-- #####'.format(subindent))
                break
            print('{}|-- {} ({} )'.format(subindent, f, calc_size(size)))

def calc_size(size):
    """Convert bytes to human-readable format."""
    for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
        if size < 1024.0:
            break
        size /= 1024.0
    return '{:.2f} {}'.format(size, unit)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Draw a directory tree with various options.")
    parser.add_argument("-p", "--path", default='.', help="Directory path")
    parser.add_argument("-l", "--levels", type=int, default=4, help="Max directory depth")
    parser.add_argument("-i", "--ignore", action='store_true', help="Ignore hidden files")
    parser.add_argument("-g", "--git", action='store_true', help="Respect .gitignore")
    parser.add_argument("-f", "--files", type=int, default=float('inf'), help="Max files to list per directory")

    args = parser.parse_args()

    gitignore_spec = load_gitignore() if args.git else None

    draw_tree(args.path, args.levels, args.ignore, gitignore_spec, args.files)
