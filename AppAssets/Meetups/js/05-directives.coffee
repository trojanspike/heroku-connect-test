angular.module "MobileApp"
.directive 'appTemplate', ->
	restrict : 'E'
	replace : true
	template : do ->
		HTML = ''
		HTML+='<script type="text/ng-template" id="#tpl.html"><ion-view hide-back-button="false" title="Awesome"><ion-content padding="true"><h1>Main app here {{name}}</h1></ion-content></ion-view></script>'