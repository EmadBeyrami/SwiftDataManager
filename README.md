# User Default Property Wrapper (Data Manager) in Swift
A best practice codebase for saving data in in user defaults using a `@propertywrapper`
you can save any types of data into user defaults using this code

## Feature
- **Codable Friendly**
- **Generic**
- **Clean**
- **Much less code**

# Usage
1. Copy these two swift files in your project.
2. add values you want to save in DataManager file.
3. add a setter like the example.
4. for getting a value you can either write a getter or just call the variable you add like:
``` swift
let data = DataManager.shared.dataYouWantToSave
```
