

function affichageJour(){
	var aujourdhui=new Date();

	var jour=aujourdhui.getDate(); //"numéro" du jour
	var mois=aujourdhui.getMonth()+1; //"numéro" du jour
	var couleur="red";
	if(jour%2==0){
		couleur="RoyalBlue";
	}
	var texte='<p style="color :'+couleur+'"> Date du jour : '+jour+'/'+mois+'/'+aujourdhui.getFullYear()+' </p>';
	document.getElementById("date").innerHTML=texte;
	return(texte);
}

function afficherFooter(){
	var footer=document.getElementsByClassName("contact-footer")[0];
	console.log(footer);
	var texte="";
	texte='<ul>';
	texte+='<li><img src="images/email-icon.png" alt="E-mail" onclick="window.location.href=\'mailto:lea.mougel@sfr.fr\'"></li>';
	texte+='<li> <img src="images/linkedin-icon.png" alt="LinkedIn" onclick="window.location.href=\'https://linkedin.com/in/lea-mougel\'"></li>';
	texte+='<li><img src="images/adresse-icon.png" alt="Adresse" onclick="window.location.href=\'https://www.google.fr/maps/place/Reims/ \'"> <!--REIMS--></li>';
	texte+='</ul>'
	footer.innerHTML=texte;
}

function cliqueProjet(lien){
	window.location.href=lien;
}




/*

let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}
function showSlides(n) {
	let slides = document.getElementsByClassName('slides');
	let dots = document.getElementsByClassName('dot');
	
	if(n > slides.length) { slideIndex = 1 }
	
	if(n < 1 ) { slideIndex = slides.length }
	
	// Cacher toutes les slides
	for(let i = 0; i < slides.length; i++) {
	  slides[i].style.display = "none";
	}
	
	// Retirer "active" de tous les points
	for(let i = 0; i < dots.length; i++) {
	  dots[i].classList.remove('active');
	}
	
	// Afficher la slide demandée
	slides[slideIndex - 1].style.display = 'block';
	
	// Ajouter "active" sur le point cliqué
	dots[slideIndex - 1].classList.add('active');
  }*/