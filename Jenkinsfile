node{
    def MavenHome = tool name: 'Maven_Home', type: 'maven'
    def buildNumber = BUILD_NUMBER
	
	stage('Code Checkout'){
        git branch: 'main', 
		credentialsId: '6ef0006c-d7d9-49c8-b989-f532c8415713', 
		url: 'https://github.com/yog1995/Scotia_Demo.git'
    }
    
	stage('Maven Package'){
        bat "${MavenHome}/bin/mvn clean package"
    }
    
	stage('Upload to Nexus'){
        bat "${MavenHome}/bin/mvn deploy"
    }
	
	stage('Build Docker Image'){
		bat "docker login -u yogi1995 -p 9100732718Y@c"
        bat "docker build -t yogi1995/scotiademo:${buildNumber} ."
	}
	
	stage('Image Push to DockerHub'){
		 bat "docker push yogi1995/scotiademo:${buildNumber}"
	}
	
	stage('Tomcat Push'){
        sshPublisher(publishers: [sshPublisherDesc(configName: 'Tomcat', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/opt/apache-tomcat-9.0.52/webapps', remoteDirectorySDF: false, removePrefix: 'target/', sourceFiles: '**/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
    }
    stage('Sending war file to Docker server'){
        sshPublisher(
	        publishers: [
		        sshPublisherDesc(
			        configName: 'Docker', 
			        transfers: [
				        sshTransfer(
					        cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, 
					        makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', 
					        remoteDirectory: '/opt/docker/', remoteDirectorySDF: false, 
					        removePrefix: 'target/', sourceFiles: '**/target/*.war'
				        )
			        ], 
			        usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false
		        )
	        ]
        )
    }

}
