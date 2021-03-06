sudo apt update


if [[ -n $(java -version| grep "Command 'java' not found") ]]
then
     sudo apt install default-jre -y
     sudo apt install default-jdk -y 
else
    echo "You have java"
fi



curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y

sudo systemctl start jenkins

if [[ -n $(sudo systemctl status jenkins | grep "active") ]]
then
    echo "Your Jenkins is inactive"
else
    sudo ufw allow 8080

    sudo ufw allow OpenSSH
    sudo ufw enable
    sudo ufw status
fi



