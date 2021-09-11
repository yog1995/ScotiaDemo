node{
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
			
}
