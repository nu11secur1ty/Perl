# WiFinder-Perl-nu11secur1ty

A Perl-based implementation of the Wi-Fi password recovery tool for Windows 11. This version uses native Win32 API calls and PowerShell elevation to retrieve saved network credentials.

## 🚀 Features
*   **Zero-Dependency Elevation**: Uses native Windows PowerShell `RunAs` verb to request Administrator privileges without requiring extra CPAN modules.
*   **Windows Encoding Support**: Fully supports `cp1251` (Cyrillic/Bulgarian) to correctly parse network SSIDs and password labels.
*   **Cross-Language Parsing**: Handles both English (`Key Content`) and Bulgarian (`Съдържание на ключа`) system outputs.
*   **Clean Table UI**: Displays results in a structured format directly in the terminal.

## 🛠 Prerequisites
*   **OS**: Windows 10 or Windows 11.
*   **Perl**: [Strawberry Perl](https://strawberryperl.com/) is recommended for Windows environments.
*   **Rights**: Requires UAC confirmation for password decryption.

## 📂 Installation & Usage

1. **Navigate to your directory**:
   ```powershell
   perl wifinder.py
   ```
