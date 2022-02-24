import Models

struct SpecieCodable: Specie {
    let id: String
}

extension SpecieCodable: Decodable { }
