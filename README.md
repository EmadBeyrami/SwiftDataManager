# User Default Property Wrapper (DATA MANAGER) in Swift
A best practice codebase for saving data in in user defaults
you can save any types of data into user defaults using this code

- codable Friendly
- Generic type
- Clean
- much less code

# Usage
Copy these two swift files in your project.
add values you want to save in DataManager file.
add a setter like the example.
for getting a value you can either write a getter or just call the variable you add like:

- let data = DataManager.shared.dataYouWantToSave
