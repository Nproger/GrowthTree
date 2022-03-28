#calcul de fonction de repartition 

Fr<-function(x){
  if (x<=0) {
    return (0)
  }
  else if (x>pi/2) {
    return(1)
    
  }
  else
    return(1-cos(x))
  
}

#Calcul de l'inverse de la fonction de repartition
Ifr<-function(x){
  if(x>=0 & x<=2){
    return(acos(1-x))
  }
  
}

#Calcul de la fonction de densité

Fd<-function(x){
  
  if(x>0 & x<=90)
  {
    return(sin(x))
  }
  else{
    return(0)
  }
}

# Calcul des quantiles de la loi
Qf<-function(x)
  return(Ifr(x))

#Ecriture de la Fonction qui calcule la probabilite de la loi
Pf<-function(x)
   return(Fr(x))


#Ecriture de la Fonction qui génère les réalisations
Rfr <- function(n){
  # n : Nombre de valeurs à generer
  ans <- runif(n)
  for (i in seq(n)) 
    ans[i] <- Ifr(ans[i])
  return(ans)
}


#test des fonctions et  graphique

#fonction de densité

dens=seq(.1,90,length=100)
for (i in seq(100)) {
  dens[i]=Fd(dens[i])
  
}

plot(dens,type='l') #On remarque que notre courbe ressemble bien à celle de la fonction sinus



#CALCUL DE QUANTILLE


a=seq(.1,2,length=100)
for (i in seq(100)) {
  a[i]=Qf(a[i])
  
}

plot(a,type='l')


#CALCUL DE PROBABILITE

pro=seq(.1,90,length=100)
for (i in seq(100)) {
  pro[i]=Pf(pro[i])
  
}

plot(pro,type='l')


#simulation  des realisations du modèle de croissance de l"arbre

set.seed(11)
bruit=Rfr(50) 
X0=rnorm(1,10,1)
r=0.3
X=seq(51)
D=400^(1-exp(-r))

X[1]=X0

for (i in 2:51) {
  X[i]=D*X[i-1]^exp(-r)*bruit[i-1]
  
}

plot(X,type='l',ylab='diamètre(cm)',xlab='années')

#Simulation de 10 réalisations sur 50 années


for (j in 1:9) {
  bruit=Rfr(50) 
  X0=rnorm(1,10,1)
  X=seq(51)
  
  for (i in 2:51) {
    X[i]=D*X[i-1]^exp(-r)*bruit[i-1]
    
  }
  
  lines(X,type='l',col=j)
  
}





