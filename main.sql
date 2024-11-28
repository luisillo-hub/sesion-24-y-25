-- Crear la tabla
CREATE TABLE Restaurantes (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Ubicacion VARCHAR(100) NOT NULL
);

-- Crear otra tabla
CREATE TABLE Comidas (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  Precio DECIMAL(10, 2) NOT NULL,
  Restaurante_ID INT,
  FOREIGN KEY (Restaurante_ID) REFERENCES Restaurantes(ID) ON DELETE CASCADE
);

-- insertar datos en la tabla
INSERT INTO Restaurantes (Nombre, Ubicacion)
VALUES
('La Cocina Italiana','Centro'),
('Sabor Tropical','Norte'),
('Delicias del Mar','Sur');

-- insertar datos en la otra tabla
INSERT INTO Comidas (Nombre, Tipo, Precio, Restaurante_ID)
VALUES
('Pizza Margarita', 'Italiana', 20.502, 1),
('Lasaña de Carne', 'Italiana', 25.00, 1),
('Arepa de Queso', 'Colombiana', 5.00, 2),
('Cazuela de Mariscos', 'Mariscos', 30.00, 3),
('Sancocho de Pescado', 'Mariscos', 18.00, 3);

-- Obtener los platos con precio mayor a $20.00 dolares
SELECT Nombre, Tipo, Precio
FROM Comidas
WHERE Precio < 20.00;

-- Obtener todos los platos de un restaurante
SELECT Comidas.Nombre, Comidas.Tipo, Comidas.Precio 
FROM Comidas 
JOIN Restaurantes ON Comidas.Restaurante_ID = Restaurantes.ID 
WHERE Restaurantes.Nombre = 'La Cocina Italiana';

-- Obtener los restaurantes que ofrecen mas de un tipo de comida
SELECT Restaurantes.Nombre, COUNT(Comidas.ID) AS Cantidad_Comidas
FROM Comidas
JOIN Restaurantes ON Comidas.Restaurante_ID = Restaurantes.ID
GROUP BY Restaurantes.Nombre
HAVING Cantidad_Comidas > 1;

-- Actualizar el tipo de comida
UPDATE Comidas
SET Tipo = 'Fusión'
WHERE Nombre = 'Pizza Margarita';

-- Eliminar primero los platos en la tabla comidas
DELETE FROM Restaurantes
WHERE Nombre = 'Sabor Tropical';

-- Muestra todos los datos de la tabla
SELECT *FROM Comidas;
