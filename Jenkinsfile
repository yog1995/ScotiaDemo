node{
	def Maven = tool name: "Maven"
	
	stage('Code Checkout'){
		git branch: 'main', credentialsId: 'GitHub', url: 'https://github.com/yog1995/Scotia_Demo.git'
	}
	
	stage('Maven Build'){
		sh "${Maven}/bin/mvn clean package"
	}
	
	stage('SonarQube Report'){
		sh "${Maven}/bin/mvn sonar:sonar"
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
		sh "docker push yogi1995/scotiademo"
	}
	
	stage('Deployment in Docker server'){
		sshagent(['Docker']) {
    			sh "ssh -o StrictHostKeyChecking=no ubuntu@18.218.3.189 docker rm -f maven || true"
			sh "ssh -o StrictHostKeyChecking=no ubuntu@18.218.3.189 docker rmi -f yogi1995/scotiademo:latest || true"
			sh "ssh -o StrictHostKeyChecking=no ubuntu@18.218.3.189 docker run -d -p 8082:8080 --name maven yogi1995/scotiademo"
		}
	}
	
	stage('Deploy to K8 Cluster'){
		kubernetesDeploy (
			configs: 'maven.yml', 
			kubeConfig: [path: ''], 
			kubeconfigId: 'K8-config', 
			secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], 
			textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
		)
	}
}
