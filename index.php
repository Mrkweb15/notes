

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form</title>
</head>
<body>
    <form action="process.php" method="POST">
        <div class="title">
            <h1>Enter Vehicle Information</h1>
        </div>
        <div class="vtype">
            <label for="vehicleType">Select Vehicle</label>
            <select name="vehicleType" id="vehicleType" onchange="toggleform()">
                <option value=""selected disable>Select</option>
                <option value="Car">Car</option>
                <option value="Motorcycle">Motorcycle</option>
            </select>
        </div>
        <div class="form" id="car" style="display: none;">
            <h2>Car Informaction</h2>
            <div class="data">
                <div class="brand">
                    <label for="brand">Brand</label>
                    <select name="brand" id="brand">
                        <option value="BMW">BMW</option>
                        <option value="Ford">Ford</option>
                        <option value="Volkswagen">Volkswagen</option>
                    </select>
                </div>
                <div class="engine">
                    <label for="engineType">Engine Type</label>
                    <select name="engineType" id="engineType">
                        <option value="Disel">Disel</option>
                        <option value="Gasoline">Gasoline</option>
                        <option value="Electric">Electric</option>
                    </select>
                </div>
                <div class="doors">
                    <label for="numberOfDoors">Number of Doors</label>
                    <input type="number" name="numberOfDoors" id="numberOfDoors">
                </div>
            </div>
        </div>

        <div class="form" id="motorcycle" style="display: none;">
            <h2>Motorcycle Information</h2>
            <div class="data">
                <div class="brand">
                    <label for="brand">Brand</label>
                    <select name="brand" id="brand">
                        <option value="Yamaha">Yamaha</option>
                        <option value="Suzuki">Suzuki</option>
                        <option value="Honda">Honda</option>
                        <option value="Ducati">Ducati</option>
                    </select>
                </div>
                <div class="engine">
                    <label for="engineType">Engine Type</label>
                    <select name="engineType" id="engineType">
                        <option value="Disel">Disel</option>
                        <option value="Gasoline">Gasoline</option>
                        <option value="Electric">Electric</option>
                    </select>
                </div>
                <div class="sidecar">
                    <label for="hasSideCar">With Sidecar?</label>
                    <select name="hasSideCar" id="hasSideCar">
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="btn">
            <input type="submit">
        </div>
    </form>

    <script>
        const car = document.getElementById("car");
        const motorcycle = document.getElementById("motorcycle");
        
        function toggleform(){
            var selected = document.getElementById("vehicleType").value;
            
            if (selected === "Car"){
                car.style.display = "block";
                motorcycle.style.display = "none";
            }else {
                car.style.display = "none";
                motorcycle.style.display = "block";
            }
        }


    </script>
</body>
</html>
