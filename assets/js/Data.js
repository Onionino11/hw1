
let data = {
    offerte: [
        {
            link: 'https://static.xmenu.it/api/img/resize?image_uri=uploads%2Fpromotions%2F2195%2FIMG_7744.jpeg&w=800',
            validita: 'Tutti i Venerdì',
            Titolo: 'Offerta 1',
            text: 'Torna la Super BFF del Venerdì! Ordinando due menù, il PANINO meno caro lo paghi la metà! Lo sconto verrà applicato in cassa.',
            disponibile: 'Tutti gli ordini'
        },
        {
            link: 'https://static.xmenu.it/api/img/resize?image_uri=uploads%2Fpromotions%2F830%2FWhatsApp+Image+2022-10-10+at+12.45.20.jpeg&w=800',
            validita: 'Tutti i Giovedì',
            Titolo: 'Offerta 2',
            text: 'Tutti i Giovedì consegna a domicilio "AGGRATIS" Ordine minimo 10€',
            disponibile: 'Consegna a domicilio'
        }
    ],

    categorie: [
        {
            nome: 'PER INIZIARE',
            descrizione: 'Come fai a non farti tentare? I migliori prodotti fritti in olio di semi di girasole Altoleico',
            immagine: 'Classiche.jpg',
            prodotti: 9,
            burger: false,
            chips: false,
            drink: false
        },
        {
            nome: 'MALU PROMO MENU\'',
            descrizione: 'MENU COMPLETO BURGER CONTORNO E BEVANDA\'',
            immagine: 'Classico.jpeg',
            prodotti: 14,
            burger: true,
            chips: true,
            drink: true,
            bestseller: true
        },
        {
            nome: 'MALU BURGER (SOLO PANINO)',
            descrizione: 'Piccolo = 100gr / Medio = 180gr / Malu = Tutto doppio',
            immagine: 'Pistacchioso.jpeg',
            prodotti: 16,
            burger: true,
            chips: false,
            drink: false
        },
        {
            nome: 'MALU LIGHT',
            descrizione: 'Insalate Hamburger Veg. Piatti Leggeri ma dal Gusto Malu',
            immagine: 'MaluLight.jpeg',
            prodotti: 5,
            burger: false,
            chips: false,
            drink: false
        },
        {
            nome: 'DA BERE',
            descrizione: '',
            immagine: 'DaBere.jpeg',
            prodotti: 13,
            burger: false,
            chips: false,
            drink: true
        },
        {
            nome: 'DOLCI',
            descrizione: 'Per finire in bellezza una Cena Malu',
            immagine: 'Dolci.jpg',
            prodotti: 1,
            burger: false,
            chips: false,
            drink: false
        }
    ],

    periniziare: [
        {
            nome: 'ANELLI DI CIPOLLA SPECIAL',
            descrizione: 'Anelli di Cipolla pastellati alla birra*',
            immagine: 'anelli-di-cipolla.jpg',
            prezzo: 3.40
        },
        {
            nome: 'PATATINE CLASSICHE',
            descrizione: 'Patatine Fritte (Really Crunch Lambweston)*',
            immagine: 'patatine-classiche.jpg',
            varianti: [
                {
                    tipo: 'Classiche',
                    prezzo: 2.00
                },
                {
                    tipo: 'Twister',
                    prezzo: 2.40
                }
            ]
        },
        {
            nome: 'AMERICANE',
            descrizione: 'Patatine Fritte*, Würstel e Salsa Cheddar',
            immagine: 'americane.jpg',
            varianti: [
                {
                    tipo: 'Classiche',
                    prezzo: 4.90
                },
                {
                    tipo: 'Twister',
                    prezzo: 5.30
                }
            ]
        },
        {
            nome: 'FORMAGGIO E BACON',
            descrizione: 'Patatine Lambweston*, Salsa Cheddar e Bacon croccante',
            immagine: 'formaggio-e-bacon.jpg',
            varianti: [
                {
                    tipo: 'Classiche',
                    prezzo: 4.90
                },
                {
                    tipo: 'Twister',
                    prezzo: 5.30
                }
            ]
        },
        {
            nome: 'PATATINE AL FORMAGGIO',
            descrizione: 'Patatine Lambweston*, Salsa Cheddar',
            immagine: 'patatine-al-formaggio.jpg',
            varianti: [
                {
                    tipo: 'Classiche',
                    prezzo: 4.70
                },
                {
                    tipo: 'Twister',
                    prezzo: 5.10
                }
            ]
        },
        {
            nome: 'AMERICAN PULLED PORK',
            descrizione: 'Patatine Lambweston*, American Pulled Pork, Salsa Barbecue e Salsa Cheddar',
            immagine: 'american-pulled-pork.jpg',
            varianti: [
                {
                    tipo: 'Classiche',
                    prezzo: 4.90
                },
                {
                    tipo: 'Twister',
                    prezzo: 5.30
                }
            ]
        },
        {
            nome: 'PISTACCHIO E MORTADELLA',
            descrizione: 'Patatine Lambweston*, Mortadella, Salsa al Pistacchio e granella di Pistacchio',
            immagine: 'pistacchio-e-mortadella.jpg',
            varianti: [
                {
                    tipo: 'Classiche',
                    prezzo: 4.90
                },
                {
                    tipo: 'Twister',
                    prezzo: 5.30
                }
            ]
        },
        {
            nome: 'CROCCHETTE DI PATATE',
            descrizione: 'Crocchette di Patate*',
            immagine: 'crocchette-di-patate.jpg',
            prezzo: 2.50
        },
        {
            nome: 'NUGGETS DI POLLO (BIRBE)',
            descrizione: 'Birbe di pollo croccanti*',
            immagine: 'nuggets-di-pollo.jpg',
            prezzo: 4.40
        }
    ]
};