# Trabalho final ##
## carlos henrique tonhatti
#########################
require(ape)
require(pegas)


# Carregar os dados
mol.index <- function(nomearq,formato="fasta"){

require(ape)
require(pegas)

pop<-read.dna(nomearq, format=formato)


resul <- list()

#tamanho da amostra (numero de individuos
n.ind<-length(labels(pop))
	resul$individuos <-n.ind 

#comprimento das seq
sitios <- length(pop[1,])
	resul$sitios<- sitios

# sitios polimorficos
sitios.seg.p <- seg.sites(pop) # localização dos sitios polimorficos
	resul$sitios.seg.pos <-sitios.seg.p 
sitios.seg<-length(seg.sites(pop)) # o numero de sitios 
	resul$sitios.seg <- sitios.seg

#numero de haplotipos
hap<-haplotype(pop, labels=NULL)
	resul$haplotipos <- hap
hap.l <- attr(hap,"index")
nh <- length(hap.l)
	resul$nh <- nh


#diversidade genetica
#heterozigosidade esperada
freq <- rep(NA,length(hap.l))
for(i in 1:length(hap.l)){
	freq[i] <- length(hap.l[[i]])
	}
	resul$freq.hap <- freq

HE <- heterozygosity(freq, variance=T)
	resul$diver.haplo <- HE

#diversidade nucleotidica
#pi 
nd <- nuc.div(pop, variance=T)
	resul$diver.nuc <-nd 


# thetaS
thes <- theta.s(s=sitios.seg,n=n.ind, variance= T)
thep <- theta.pi<- nuc.div(pop)*sitios
	resul$theta.s <- thes
	resul$theta.pi <- c(thep,nd[2])

         return(resul)}


plot.mol.index <- function(lista){
	temp <-rep(1,lista$sitios.seg)
	par(mfrow=c(2,1))

	plot(lista$sitios.seg.pos,temp,ann=FALSE, axes=F,cex=1,
	     col="blue",pch=20,
	     xlim=c(0,lista$sitios))
	    mtext("Posição dos sitios segregantes", cex=1.5)
	    axis(1)

	plot(lista$haplotipos)
		mtext("Frequência dos haplótipos",cex=1.5)
	
}


