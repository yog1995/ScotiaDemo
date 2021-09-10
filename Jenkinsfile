node{
    def MavenHome = tool name: 'Maven_Home', type: 'maven'
    stage('Code Checkout'){
        git branch: 'main', credentialsId: '6ef0006c-d7d9-49c8-b989-f532c8415713', url: 'https://github.com/yog1995/Scotia_Demo.git'
    }
    stage('Maven Package'){
        bat "${MavenHome}/bin/mvn clean package"
    }
    stage('Upload to Nexus'){
        bat "${MavenHome}/bin/mvn deploy"
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
