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


// #include <unordered_map>
// #include <string>

// bool deduplication(std::unordered_map<std::string, uint32_t>& hash_table, 
//                    const std::string& hash_value, uint32_t& deDup_header) {
//     auto it = hash_table.find(hash_value);

//     if (it == hash_table.end()) {
//         // new chunk
//         uint32_t newIndex = static_cast<uint32_t>(hash_table.size());
//         hash_table[hash_value] = newIndex;
//         deDup_header = (newIndex << 1); // 新数据块，最低位为 0
//         return false; // 表示新数据
//     } else {
//         // duplicate chunk
//         deDup_header = (it->second << 1) | 1u; // 重复数据，最低位为 1
//         return true; // 表示重复数据
//     }
// }


// #include <iostream>
// #include <unordered_map>
// #include <string>

// // 假设 deduplication 函数已定义

// int main() {
//     std::unordered_map<std::string, uint32_t> hash_table;
//     uint32_t deDup_header;

//     // 模拟两个哈希值
//     std::string hash1 = "abc123";
//     std::string hash2 = "xyz789";

//     // 第一次插入，返回 false 表示新值
//     if (deduplication(hash_table, hash1, deDup_header)) {
//         std::cout << "Hash value " << hash1 << " is a duplicate. Header: " << deDup_header << std::endl;
//     } else {
//         std::cout << "Hash value " << hash1 << " is new. Header: " << deDup_header << std::endl;
//     }

//     // 再次插入相同值，返回 true 表示重复
//     if (deduplication(hash_table, hash1, deDup_header)) {
//         std::cout << "Hash value " << hash2 << " is a duplicate. Header: " << deDup_header << std::endl;
//     } else {
//         std::cout << "Hash value " << hash2 << " is new. Header: " << deDup_header << std::endl;
//     }

//     // 插入另一个新值
//     if (deduplication(hash_table, hash1, deDup_header)) {
//         std::cout << "Hash value " << hash1 << " is a duplicate. Header: " << deDup_header << std::endl;
//     } else {
//         std::cout << "Hash value " << hash1 << " is new. Header: " << deDup_header << std::endl;
//     }
//     if (deduplication(hash_table, hash2, deDup_header)) {
//         std::cout << "Hash value " << hash2 << " is a duplicate. Header: " << deDup_header << std::endl;
//     } else {
//         std::cout << "Hash value " << hash2 << " is new. Header: " << deDup_header << std::endl;
//     }

//     return 0;
// }
