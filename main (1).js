//Cambia a la base de datos MusicaVallenata
use MusicaVallenata;
db.Canciones.insertMany([
    {
        _id:1,
        titulo: "La Gota Fría",
        artista: "Carlos Vives",
        autor: "Emiliano Zuleta",
        album: "Clásicos de la Provincia",
        anio: 1993,
        genero: "Vallenato",
        duracion: "4:25",
        letra: "Me lleva él o me lo llevo yo...",
        reproducciones: 1500000
    },
    {
        _id:2,
        titulo: "La Gota Fría",
        artista: "Carlos Vives",
        autor: "Emiliano Zuleta",
        album: "Clásicos de la Provincia",
        anio: 1993,
        genero: "Vallenato",
        duracion: "4:25",
        letra: "Me lleva él o me lo llevo yo...",
        reproducciones: 1500000 
    },
    {
         _id:3,
        titulo: "Obsesión",
        artista: "Jorge Celedón",
        autor: "Iván Calderón",
        album: "Sencillo",
        anio: 2002,
        genero: "Vallenato",
        duracion: "3:40",
        letra: "Ya no comprendo por qué no me hablas...",
        reproducciones: 2000000
    }
]);


db.Canciones.find({ anio: 1993 })
db.Canciones.find({ reproducciones: { $gt: 1800000 } })

db.Canciones.find({ genero: "Vallenato", duracion: { $gte: "4:00" } })

db.Canciones.updateOne(
    {_id: 1 },
    { $set: { reproducciones: 1600000 }}
)
db.Canciones.updateMany(
    { genero: "Vallenato" },
    { $inc: { reproducciones: 1000000}}
)
db.Canciones.find();

db.Canciones.deleteOne({ _id: 1 })
db.Canciones.deleteMany({ artista: "Carlos Vives" })
