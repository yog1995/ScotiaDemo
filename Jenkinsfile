node{
	echo "Jenkins Home ${env.JENKINS_HOME}"
        def buildNumber = BUILD_NUMBER
	def Maven = tool name: "Maven"
	
	stage('Code Checkout'){
		git branch: 'main', 
		credentialsId: 'GitHub', 
		url: 'https://github.com/yog1995/Scotia_Demo.git'
	}
	stage('Maven Build'){
		sh "${Maven}/bin/mvn clean package"
	}
	stage('Uploading to Nexus'){
		sh "${Maven}/bin/mvn deploy"
	}
	stage('Deploying to Tomcat'){
		sshagent(['Tomcat']) {
   			sh "scp -o StrictHostKeyChecking=no target/maven-web-application*.war ec2-user@18.190.154.239:/opt/apache-tomcat-9.0.52/webapps/"
		}
	}
	stage('Build Docker Image'){
		withCredentials([string(credentialsId: 'DockerHub', variable: 'DockerHub')]){
			sh "docker login -u yogi1995 -p ${DockerHub}"
		}
		sh "docker build -t yogi1995/scotiademo ."
	}
	stage('Image Push to DockerHub'){
		 bat "docker push yogi1995/scotiademo"
	}	
}
