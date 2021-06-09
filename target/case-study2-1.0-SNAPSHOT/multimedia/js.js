window.onscroll = function() {myFunction()};
var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;
function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
function activeSlide(){
	let slide = document.getElementsByClassName('slide');
	let actived = document.getElementsByClassName('active');
	for(let i=0; i<slide.length;i++){
		slide[i].addEventListener('click',function(){
			actived[0].className = actived[0].className.replace('active','');
			slide[i].className += ' active';
		})
	}
}
class slideImg{
	constructor(image,title,circle,content){
		this.image = image;
		this.title=title;
		this.circle = circle;
		this.content = content;
	}
}
let producSlide1 = new slideImg('multimedia/image/img1-slide-footer.jpg','Kaffee-Röstungen: So röstet man Bohnen weltweit am liebsten','04<br>Mrz','Heute nehme ich euch mit auf eine kleine, gedankliche Weltreise, denn: Wenn wir schon nicht...');
let producSlide2 = new slideImg('multimedia/image/img2-slide-footer.jpg','Faschings-Krapfen mit Kaffeefüllung','16<br>Feb','Auch, wenn wir Fasching dieses Jahr etwas anders feiern als sonst – wir finden: Faschings-Krapfen...');
let producSlide3 = new slideImg('multimedia/image/img3-slide-footer.jpg','3 Möglichkeiten, um eure Liebe mit Kaffee zu zeigen','08<br>Feb','Es ist wieder soweit, der Valentinstag steht vor der Türe! Für den Tag der Liebenden...');
let producSlide4 = new slideImg('multimedia/image/img4-slide-footer.jpg','Millionaire’s Mule Cocktail mit Cold Brew Sparkling Ginger Lemon','29<br>Jan','Happy Friday, liebe Kaffeeliebhaber:innen! Wenn wir nicht in die Bar können, kommt die Bar einfach...');
let producSlide5 = new slideImg('multimedia/image/img5-slide-footer.jpg','Unsere Kaffeetrends 2021','22<br>Jan','Auch wenn die meisten Cafés gerade geschlossen haben oder Coffee To Go anbieten, hat sich...');
let producSlide6 = new slideImg('multimedia/image/img6-slide-footer.jpg','Black Coffee Week: Der perfekte Espresso','23<br>Nov','Hoch die Espresso-Tassen, diese Woche zelebrieren wir bei J. Hornig die Black Coffee Week! Bis...');
let producSlide7 = new slideImg('multimedia/image/img7-slide-footer.jpg','Wir feiern den Tee: Ein bisschen Melancholie aus der Tasse','04<br>Nov','Unsere neuen biologisch abbaubaren Kapseln sind nicht nur von außen hübsch: Die verschiedenen bunten Zertifizierungen,...');
let producSlide8 = new slideImg('multimedia/image/img8-slide-footer.jpg','Die Zertifizierungen für unsere J. Hornig Kapseln: Was steckt dahinter?','28<br>Okt','Unsere neuen biologisch abbaubaren Kapseln sind nicht nur von außen hübsch: Die verschiedenen bunten Zertifizierungen,...');
let producSlide9 = new slideImg('multimedia/image/img9-slide-footer.jpg','Kaffee-Röstungen: So röstet man Bohnen weltweit am liebsten','04<br>Mrz','Heute nehme ich euch mit auf eine kleine, gedankliche Weltreise, denn: Wenn wir schon nicht...');
let productSlide = [producSlide1,producSlide2,producSlide3,producSlide4,producSlide5,producSlide6,producSlide7,producSlide8,producSlide9];
function slideRow9(){
	let slideArea = document.getElementsByClassName('row9-slide')[0];
	productSlide.forEach(function(item){
		slideArea.innerHTML += `
								<div class="mySlides">
									<img src="multimedia/image/img1.jpg">
									<h3>${item.title}</h3>
									<span>${item.circle}</span>
									<div class="line-slide"></div>
									<a><p>${item.content}</p></a>
								</div>
								`
	})
}
class textProduct{
	constructor(title,text){
		this.title = title;
		this.text = text;
	}
}
let textProduct1 = new textProduct('KAFFEE & TEE ONLINE BESTELLEN','Bei J. Hornig kannst du deinen Lieblingskaffee rund um die Uhr online bestellen. Egal ob ganze Kaffeebohnen, Mahlkaffee, Cold Brew oder Kaffeekapseln. Und auch in Sachen Tee wirst du bei J. Hornig fündig: Doppelkammer- und Bio-Triangel-Tees in vielen verschiedenen Sorten findest du in unserem Online Shop. In Österreich und Deutschland versenden wir deine Kaffee-Bestellung außerdem ab einem Bestellwert von € 20 versandkostenfrei.');
let textProduct2 = new textProduct('KAFFEE FÜRS BÜRO','Wir wissen, wie wichtig guter Kaffee am Arbeitsplatz ist. Deshalb bringen wir euch mit unseren J. Hornig Büropaketen das perfekte Kaffeeerlebnis direkt ins Büro. Vom passenden Jura-Vollautomaten über Kaffeebohnen unserer exklusiven Röstmeister-Linie bis hin zu den Kaffeetassen – wir kümmern uns um alles, was das Kaffeeherz begehrt. Ihr fokussiert euch auf das wirklich Wichtige und wir erledigen den Rest – wir nennen es Coffee as a Service.');
let textProduct3 = new textProduct('MACHT MEHR AUS ZEIT','Wir bei J. Hornig glauben, dass Dinge richtig gut werden, wenn man sie sorgfältig und mit viel Liebe zum Detail macht. Wir rösten unseren Kaffee – mit einem entscheidenden Unterschied zur Konkurrenz: Wir nehmen uns Zeit. Unter Einsatz der schonenden Langzeitröstung bekommt jede unserer Bohnen genau so viel Zeit, wie sie braucht, um den perfekten Geschmack zu entfalten. Und das schmeckt man auch.');
let textProduct4 = new textProduct('J. HORNIG SPEZIALITÄTENKAFFEES','J. Hornig bietet dir eine Reihe von Single Origin Spezialitätenkaffees zur Auswahl. Ganz ohne Umwege kommt der Kaffee direkt vom Bauern zu uns nach Graz zur Röstung. Das garantiert höchste Kaffee-Qualität und bessere Bedingungen für unsere Farmer.');
let listTextProduct = [textProduct1,textProduct2,textProduct3,textProduct4];
function textFooter(){
	let text = document.getElementById('content-footer');
	listTextProduct.forEach(function(item){
		text.innerHTML += `
							<div class="text-footer">
								<h2>${item.title}</h2>
								<div class="line-footer"></div>
								<p>${item.text}</p>
							</div>
						  `
	})
}
var slideIndex = 3;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
	 var x = document.getElementsByClassName("mySlides");
	if (n > x.length) {slideIndex = 1}
	if (n < 1) {slideIndex = x.length}
	for (let i = 0; i < x.length; i++) {
		x[i].style.display = "none";
		x[slideIndex-3].style.display = "block";
		x[slideIndex-2].style.display = "block";
		x[slideIndex-1].style.display = "block"; 
	}	 
}
function main(){
	textFooter();
	activeSlide();
	slideRow9();
}
main();
