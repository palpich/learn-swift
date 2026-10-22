#!/usr/bin/env bash
# ./check.sh           — проверить свои решения (start-файлы) по всему курсу
# ./check.sh solution  — проверить эталонные решения (для автора курса и CI)
set -u

cd "$(dirname "$0")"

mode="${1:-start}"
if [ "$mode" != "start" ] && [ "$mode" != "solution" ]; then
    echo "Использование: ./check.sh [start|solution]"
    exit 2
fi

route="
lessons/01-first-program
lessons/02-constants-and-types
lessons/03-strings
lessons/04-conditionals
lessons/05-loops
projects/01-guess-the-number
lessons/06-arrays
lessons/07-dictionaries-and-sets
lessons/08-optionals
projects/02-hangman
lessons/09-functions
lessons/10-closures
lessons/11-enumerations
lessons/12-structures
lessons/13-classes
lessons/14-protocols
lessons/15-errors
projects/03-calculator
lessons/16-generics
projects/04-notes
lessons/17-extensions
lessons/18-equatable-hashable-comparable
lessons/19-result-defer-access-control
lessons/20-arc-and-memory
lessons/21-codable
lessons/22-concurrency
lessons/23-dates-and-formatting
lessons/24-networking
lessons/25-userdefaults
projects/05-json-client
lessons/26-swiftui-basics
lessons/27-swiftdata
lessons/28-testing
lessons/29-spm-modules
projects/06-final-app
"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# In solution mode packages are checked in a temporary copy with solution/ files put in place.
package_dir() {
    local dir="$1"
    if [ "$mode" = "start" ]; then
        echo "$dir"
        return
    fi
    local work="$tmp/$(basename "$dir")"
    rm -rf "$work"
    cp -R "$dir" "$work"
    rm -rf "$work/.build"
    for f in "$work"/solution/*.swift; do
        local target
        target=$(find "$work" -path "$work/solution" -prune -o -name "$(basename "$f")" -print | head -1)
        if [ -n "$target" ]; then
            cp "$f" "$target"
        fi
    done
    echo "$work"
}

check_step() {
    local dir="$1"
    case "$dir" in
        lessons/26-*|lessons/27-*)
            return 2
            ;;
        lessons/28-*|projects/06-*)
            local work
            work=$(package_dir "$dir")
            (cd "$work" && swift test) >/dev/null 2>&1
            ;;
        lessons/29-*)
            local work
            work=$(package_dir "$dir")
            (cd "$work" && swift run App 2>/dev/null) | grep -q "Last: second, left: 1"
            ;;
        *)
            (cd "$dir" && swift "$mode.swift" check) >/dev/null 2>&1
            ;;
    esac
}

how_to_run() {
    case "$1" in
        lessons/28-*|projects/06-*) echo "cd $1 && swift test" ;;
        lessons/29-*) echo "cd $1 && swift run App" ;;
        *) echo "cd $1 && swift $mode.swift check" ;;
    esac
}

passed=0
total=0
next=""

for dir in $route; do
    check_step "$dir"
    result=$?
    if [ $result -eq 2 ]; then
        echo "· $dir — проверяется в Xcode"
        continue
    fi
    total=$((total + 1))
    if [ $result -eq 0 ]; then
        passed=$((passed + 1))
        echo "✓ $dir"
    else
        echo "✗ $dir"
        if [ -z "$next" ]; then
            next="$dir"
        fi
    fi
done

echo
echo "Пройдено $passed из $total."
if [ -n "$next" ]; then
    echo "Следующий шаг: $next"
    echo "Запуск: $(how_to_run "$next")"
    exit 1
fi
echo "Всё пройдено!"
