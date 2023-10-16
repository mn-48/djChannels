# World Ehsan Social SIte

1. **Teams**
   - *FrontEnd (React.js)*
     - [Md Rajibul Islam](https://www.facebook.com/rayhan.hasan1)
     - [Munna Bhai MBBS](https://www.facebook.com/mohimenol.munna)
   - *Backend (Python Django and REST framework)*
     - [Md Fahad Hossain](https://www.facebook.com/fahad.cse16)
2. **Description**
   - *Subprojects*
     - JobPortal
     - Matrimony Site
     - Social Site
     - SellBuy Site
     - News Portal
## Run Using Docker 
Place .env File First
create folder named "log" and make a file named "djangolog.log".
##### Step 1 : First Install docker & docker-compose (if already installed then skip this step)
```
sudo apt update
sudo apt upgrade
sudo apt install docker.io
```
<b> Install Docker compose </b>
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

##### Step 2 : To run the app using docker aslo  Everytime after pulling any error shows up

```
docker-compose build
docker-compose up
sudo chown -R $USER:$USER .
docker exec front npm run build
```
##### To perform any operation/command on docker container 
```
docker ps
```
copy your required image Name
```
docker exec imagename1 your-command
docker exec front npm run build
docker exec back python manage.py migrate
docker exec back python manage.py collectstatic
```


## Run Manually 
Place .env File First
create folder named "log" and make a file named "djangolog.log".
##### Step 1 : Run these command after cloning (React)
```
npm i
npm  start
```
##### Step 2 : Run these command after cloning (Django)
```
python -m venv venv
source venv/bin/activate 

```
for windows OS: `venv/Scripts/activate `
```
pip install -r requirements.txt
```
If any error occurs then run 
```
pip install -r requirements_copy.txt
```
##### Step 3 : Follow the instructions same as DockerBased running Step 1 and step 2

##### Step 4 : Start Docker and enter the following command to enable it after every time the system reboots.
```
sudo systemctl enable --now docker
```
###### To disable it again, simply type in the following command.
```
sudo systemctl disable --now docker
```
##### Step 5 : Set user Privilages
```
sudo usermod -aG docker YourUsername
sudo chmod 666 /var/run/docker.sock
docker run -p 6379:6379 -d redis:5
```
###### if any error shows up then run this command
```
sudo apt-get install net-tools
sudo netstat -pna | grep 6379 
docker run -p 6379:6379 -d redis:5
```
##### Step 6 : Start react Server 
```
npm start
```
##### Step 7 : Start Django Server 
```
npm run build
python manage.py runserver

```
##### Everytime after pulling any error shows up then after activating virtualenv
```
pip install -r requirements.txt
npm run build
python manage.py runserver
```
### Environment Setup
-   Create `.env` file in the root directory of this repository and update  it's content according to your project. List of required environment variable list are given in the `.env.example` file. Follow the [python-decouple](https://pypi.org/project/python-decouple/) packeg's rules for more customisations.

