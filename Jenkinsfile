pipeline {
 agent any
 tools {
  maven  'Maven_Home'
 }
 
 stages{
  stage("Maven Build"){
        steps{
         sh 'mvn clean package'
        }
        }
  
          }
}
