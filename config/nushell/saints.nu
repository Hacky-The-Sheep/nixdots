# Get current date details
let now = (date now)
let month = ($now | format date "%B")
let day = ($now | format date "%d" | str replace /^0/ "") # Removes leading zero if necessary

# Open file and navigate safely
let data = (open saints.json)

if ($month in $data) and ($day in ($data | get $month)) {
    $data | get $month | get $day
} else {
    "No entry found for today."
}
