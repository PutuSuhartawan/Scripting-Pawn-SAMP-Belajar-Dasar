stock IsValidRoleplayName(const name[], short_name_len = 3) {
    new 
        len = strlen(name),
        underscore_pos = strfind(name, "_", true);

    // The name is empty
    if (name[0] == 0) return false;

    // Underscore not found
    if (underscore_pos == -1) return false;
    
    // Firstname and lastname is not capital
    #define isupper(%0) (%0 != (%0 | 0x20))
    if (!isupper(name[0]) || !isupper(name[underscore_pos + 1])) return false;

    // Firstname is too short
    if (underscore_pos < short_name_len) return false;

    // Lastname is too short
    if (((len - 1) - underscore_pos) < short_name_len) return false;

    // Invalid characters
    for (new i; i != len; i ++) {
        switch (name[i]) {
            case 'A'..'Z', 'a'..'z', '_': continue;
            default: {
                return false;
            }
        }
    }
    return true;
}

/*
Usage:

#include <a_samp>

main() {
    if (IsValidRoleplayName("Slamet_Riyadi")) {
        print("Namanya valid");
    }
   print("Namanya tidak valid");
}
*/
