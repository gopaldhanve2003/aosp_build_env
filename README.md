**AOSP Build Environment Setup Script**

This script is designed to automate the setup of a build environment for AOSP on Ubuntu systems. It includes steps for installing essential packages, downloading and installing Repo, installing GitHub CLI, and optionally setting up Git credentials.

***"This script was meticulously crafted by yours truly, leveraging the cutting-edge capabilities of Bard's AI technology. 🚀 Embark on an effortless AOSP setup journey with this powerful tool. ✨"***

**Script Functionality**

The script performs the following tasks:
1. **Updates and Upgrades Ubuntu Packages:** Ensures a stable base system by updating and upgrading all Ubuntu packages.

2. **Installs Essential Packages:** Installs a comprehensive list of essential packages required for AOSP build tasks, including git, gnupg, flex, bison, build-essential, zip, curl, zlib1g-dev, libc6-dev-i386, libncurses5, x11proto-core-dev, libx11-dev, lib32z1-dev, libgl1-mesa-dev, libxml2-utils, xsltproc, unzip, and fontconfig. Additionally, it installs some useful tools like rsync.

3. **Downloads and Installs Repo:** Installs Repo, a tool specifically designed for managing Git repositories, which is essential for working with AOSP source code.

4. **Installs GitHub CLI:** Installs GitHub CLI, a command-line interface for interacting with GitHub repositories, simplifying the process of cloning and working with AOSP repositories.

5. **Optional Git Credential Setup:** Provides an option to set up Git credentials, allowing you to seamlessly clone and work with AOSP repositories without manually entering credentials each time.

**Usage**

1. **Clone the Repo:** Clone the `aosp_build_env.sh` and `gitcred.sh` scripts to your desired location using the following commands:

   ```bash
   git clone https://github.com/gopaldhanve2003/aosp_build_env
   ```

2. **Make the Scripts Executable:** Open a terminal window, navigate to the directory containing the scripts, and execute the following command to make them executable:

   ```bash
   chmod +x aosp_build_env.sh gitcred.sh
   ```

3. **Run the Script:** Execute the `aosp_build_env.sh` script using the following command:

   ```bash
   ./aosp_build_env.sh
   ```
   or
   
   ```bash
   bash aosp_build_env.sh
   ```

4. **Follow Prompts:** Follow the prompts and provide any necessary information, such as Git credentials if you choose to set them up.
   

**Additional Resource:**

If you encounter any issues during the setup process, please refer to the official AOSP documentation for further assistance: [https://source.android.com/docs/setup](https://source.android.com/docs/setup)
