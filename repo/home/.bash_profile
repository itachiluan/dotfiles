for file in ~/.dotfiles/.{bash_prompt,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#set -o vi
# Directory for sublime
export PATH=$PATH:~/bin

# Directory for JAVA
#export JAVA_HOME=$(/usr/libexec/java_home)
#export JDK_HOME=$(/usr/libexec/java_home)

# Path for Maven
#export PATH=/Users/itachiluan/Documents/apache-maven-3.3.3/bin:$PATH

# Setting system language fonts
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
