#include <iostream>
#include <unordered_set>
#include <string>
#include <vector>

/**
 * Checks if a string value is a duplicate.
 * @param hash_table Set of previously encountered string values.
 * @param hash_value The string value to check for duplication.
 * @return true if the value is a duplicate, false otherwise.
 */

bool deduplication(std::unordered_set<std::string>& hash_table, const std::string& hash_value) {
    
    if (hash_table.find(hash_value) != hash_table.end()) {
        return true; 
        
    } else {
        hash_table.insert(hash_value); 
        return false; 
    }
}

// int main() {
//     std::unordered_set<std::string> hash_table;  // To store unique string values
//     std::vector<std::string> inputs = {"apple", "banana", "apple", "orange", "banana"};  // Sample input

//     for (const std::string& hash_value : inputs) {
//         if (deduplication(hash_table, hash_value)) {
//             std::cout << "Duplicate found: " << hash_value << "\n";
//         } else {
//             std::cout << "New entry added: " << hash_value << "\n";
//         }
//     }

//     return 0;
// }
