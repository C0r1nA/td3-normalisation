-- 1. Création ENUM
CREATE TYPE dish_type AS ENUM ('START', 'MAIN', 'DESSERT');
CREATE TYPE ingredient_category AS ENUM ('VEGETABLE', 'MEAT', 'OTHER');
CREATE TYPE unit_type AS ENUM ('PCS', 'KG', 'L');

-- 2. Nouvelle table Dish
CREATE TABLE Dish (
                      id SERIAL PRIMARY KEY,
                      name VARCHAR(255) NOT NULL,
                      dish_type dish_type NOT NULL,
                      selling_price NUMERIC NULL
);

-- 3. Nouvelle table Ingredient
CREATE TABLE Ingredient (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(255) NOT NULL,
                            price NUMERIC NOT NULL,
                            category ingredient_category NOT NULL
);

-- 4. Table DishIngredient (ManyToMany)
CREATE TABLE DishIngredient (
                                id SERIAL PRIMARY KEY,
                                id_dish INT NOT NULL REFERENCES Dish(id),
                                id_ingredient INT NOT NULL REFERENCES Ingredient(id),
                                quantity_required NUMERIC NOT NULL,
                                unit unit_type NOT NULL
);
