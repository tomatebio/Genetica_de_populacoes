mol.index                     package:<none>                    R Documentation

		
Indices moleculares

Description:
	
	Retorna os indices moleculares a partir de um conjunto de sequencias de DNA.


Usage:
   mol.index(nomearq,formato="fasta")

   plot.mol.index(x)

Arguments:

	nomearq é o nome da arquivo que contem as sequencias. As sequencias devem 
	estar alinhadas.
	formato é o formato do arquivo das sequencias. Por padrão é fasta, mais
	detalhes veja read.dna.
         x é um lista gerada por mol.index.

Details:

	mol.index retorna uma lista dos seguintes paramentros:numero de
	individuos(individuos),comprimento das sequencias(sitios),
	posição dos sitios segregantes(stios.seg.pos),
	numero de sitios segregantes (sitios.seg),lista de haplotipos
	(haplotipos),numero de haplotipos(nh),frequencia de haplotipos
	(freq.hap),diversidade haplotipica (diver.haplo),
	diversidade nucleotidica(diver.nuc), theta s (theta.s),
	theta pi (theta.pi).

Value:

     Lista com os parametros estimados o um conjunto de sequencias.

Author:
	Carlos Henrique Tonhatti (carlostomate@gmail.com)

References:
        Nei, M. (1987) _Molecular evolutionary genetics_. New York:
     Columbia University Press.

See Also:
	pegas,read.dna,ape,seqinr

Example:

## Criando os dados em fasta
	cat("> No305",
	"NTTCGAAAAACACACCCACTACTAAAANTTATCAGTCACT",
	"> No304",
	"ATTCGAAAAACACACCCACTACTAAAAATTATCAACCACT",
	"> No306",
	"ATTCGAAAAACACACCCACTACTAAAAATTATCAATCACT",
	"> No306",
	"ATTCGAAAAACACACCCACTACTAAAAATTATCAATCACT",
	file = "exdna.txt", sep = "\n")

#Executando a função

a<-mol.index("exdna.txt")
plot.mol.index(a)

