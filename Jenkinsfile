node{
    def MavenHome = tool name: 'Maven_Home', type: 'maven'
    def buildNumber = BUILD_NUMBER
	
	stage('Code Checkout'){
		git branch: 'main', 
		credentialsId: 'GitHub', 
		rl: 'https://github.com/yog1995/Scotia_Demo.git'
	}
		
}
