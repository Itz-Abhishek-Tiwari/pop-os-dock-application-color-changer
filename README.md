# Pop!_OS Dock & Application Colour Changer 🔥

Welcome to the Pop!_OS Dock & Application Colour Changer! This bash script allows you to change the background color of the default dock and the Applications menu in the Pop!_OS Cosmic desktop environment.

🎨 Simply select a color using the color-picker dialog box, and the script will modify the settings accordingly.

💡 The script displays information messages using the "zenity" tool to guide you through the process.

📝 Please note that this script requires sudo access to modify certain settings.

🔧 Developed with Bash scripting, the script is designed to be easily customizable and adaptable to your needs.

💻 Tested on Pop!_OS Cosmic and may work on other GNOME-based desktop environments.

## 🚀 Instructions

Required packages: `dbus-x11`
installation : `sudo apt-get update &&
               sudo apt-get install dbus-x11`


👉 To use the Pop!_OS Dock & Application Colour Changer:

1️⃣ Clone the repository or download the bash script.

2️⃣ Open the terminal and navigate to the directory where the script is located.

3️⃣ Make the script executable by running the command: `chmod +x pop_os_bg_changer.sh`

4️⃣ Run the script with sudo privileges by typing: `sudo ./pop_os_bg_changer.sh`

5️⃣ The script will prompt you to select a color using a color-picker dialog box. Choose your desired color and click "OK".

6️⃣ The script will modify the settings accordingly and display a message indicating that the changes have been made successfully.

7️⃣ Log out and log back in to reload the COSMIC desktop environment and see the changes.

🎨 Screenshots:

📷 Dock -
![image](https://user-images.githubusercontent.com/69257109/230791207-8843121d-1271-4a21-90d2-e762ee7df23f.png)

📷 Applications Menu - 
![image](https://user-images.githubusercontent.com/69257109/230791221-47a50e6d-a0d5-4e75-b79a-0480d6cf1d61.png)

📷 Transparent application menu -
![image](https://user-images.githubusercontent.com/69257109/230859056-4288bb94-2c4c-4e5a-bbc9-6b7227b3171c.png)

📝 To-Do:
    
    📏 Allow users to change the size of the Applications menu
    
    📝 Update the script documentation to include the new features
        
    🛠️ Refactor the script for better readability and maintainability
    
    ❌ Add error handling for cases where the required tools or files are missing
    
    🖥️ Create a user-friendly GUI for the script using Zenity or a similar tool
   


