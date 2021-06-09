$(document).ready(function(){
    $('.count1').prop('enable', true);
    $(document).on('click','.plus',function(){
        $('.count1').val(parseInt($('.count1').val()) + 1 );
    });
    $(document).on('click','.minus',function(){
        $('.count1').val(parseInt($('.count1').val()) - 1 );
        if ($('.count1').val() == 0) {
            $('.count1').val(1);
        }
    });
});
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
function addCart(){
    let showCart = document.getElementById('showCart');
    let productCart = document.getElementsByClassName('footer-product');
    for(let i=0;i<productCart.length;i++){
        productCart[i].addEventListener('click',function(){
            showCart.innerHTML += `
									<div class="product-cart">
										<img src="${productList[i].image}">
										<div class='titleCart'><p>${productList[i].title}</p><div>
									</div>
									`
            cart();
        })
    }
}
var count =0;
var countNumber = document.getElementById('count');
function cart(){

    if(count==0){
        countNumber.style.display = 'none';
    }
    else{
        countNumber.style.display = 'block';
        countNumber.innerHTML = count;
    }
    count++;
    return count;
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
function main(){
    textFooter();
    cart();
    addCart();
}
main();
