// ===============================
// 1. Abstract Class
// ===============================
abstract class TransportService {
  double calculateFare(double distance);
}

// ===============================
// Custom Exception (Optional Extension)
// ===============================
class InvalidVehicleTypeException implements Exception {
  final String message;
  InvalidVehicleTypeException(this.message);

  @override
  String toString() => "InvalidVehicleTypeException: $message";
}

// ===============================
// 2. Base Class: Vehicle
// ===============================
class Vehicle {
  String brand;
  String model;
  double _fuelLevel; // Encapsulation (private variable)

  // Static counter (Optional Extension)
  static int totalVehicles = 0;

  // Generative Constructor
  Vehicle(this.brand, this.model, double fuel)
      : _fuelLevel = fuel {
    totalVehicles++;
  }

  // Refuel Method
  void refuel(double amount) {
    if (amount <= 0) {
      throw Exception("Refuel amount must be positive.");
    }
    _fuelLevel += amount;
  }

  // Consume Fuel Method
  void consumeFuel(double amount) {
    if (amount <= 0) {
      throw Exception("Fuel consumption must be positive.");
    }

    if (amount > _fuelLevel) {
      throw Exception("Not enough fuel.");
    }

    _fuelLevel -= amount;
  }

  // Getter
  double getFuelLevel() {
    return _fuelLevel;
  }

  // Factory Constructor
  factory Vehicle.fromMap(Map<String, dynamic> data) {
    String type = data["type"].toString().toLowerCase();
    String brand = data["brand"];
    String model = data["model"];
    double fuel = data["fuel"].toDouble();

    switch (type) {
      case "car":
        return Car(brand, model, fuel);
      case "bike":
        return Bike(brand, model, fuel);
      case "bus":
        return Bus(brand, model, fuel);
      default:
        throw InvalidVehicleTypeException("Vehicle type '$type' is not valid.");
    }
  }

  // Optional toMap()
  Map<String, dynamic> toMap() {
    return {
      "brand": brand,
      "model": model,
      "fuel": _fuelLevel,
    };
  }
}

// ===============================
// 3. Child Classes
// ===============================

class Car extends Vehicle implements TransportService {
  Car(String brand, String model, double fuel)
      : super(brand, model, fuel);

  @override
  double calculateFare(double distance) {
    return 20 * distance;
  }
}

class Bike extends Vehicle implements TransportService {
  Bike(String brand, String model, double fuel)
      : super(brand, model, fuel);

  @override
  double calculateFare(double distance) {
    return 10 * distance;
  }
}

class Bus extends Vehicle implements TransportService {
  Bus(String brand, String model, double fuel)
      : super(brand, model, fuel);

  @override
  double calculateFare(double distance) {
    return 5 * distance;
  }
}

// ===============================
// 5. Main Function (Polymorphism)
// ===============================

void main() {
  List<Map<String, dynamic>> vehicleData = [
    {"type": "car", "brand": "Toyota", "model": "Corolla", "fuel": 50},
    {"type": "bike", "brand": "Honda", "model": "CG125", "fuel": 30},
    {"type": "bus", "brand": "Daewoo", "model": "Express", "fuel": 100}
  ];

  double distance = 10;

  // Polymorphism
  List<TransportService> vehicles = [];

  for (var data in vehicleData) {
    vehicles.add(Vehicle.fromMap(data) as TransportService);
  }

  for (var vehicle in vehicles) {
    Vehicle v = vehicle as Vehicle;

    print("Vehicle: ${v.brand} ${v.model}");

    double fare = vehicle.calculateFare(distance);
    print("Fare: ${fare.toInt()}");

    // Consume fuel (example logic)
    if (v is Car) {
      v.consumeFuel(5);
    } else if (v is Bike) {
      v.consumeFuel(2);
    } else if (v is Bus) {
      v.consumeFuel(10);
    }

    print("Fuel Remaining: ${v.getFuelLevel().toInt()}");
    print("-----------------------");
  }

  print("Total Vehicles Created: ${Vehicle.totalVehicles}");
}