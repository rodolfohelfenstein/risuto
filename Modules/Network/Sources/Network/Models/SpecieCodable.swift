import Models

struct SpecieCodable: Specie {
    let id: String
    var name: String
    var classification: String
}

extension SpecieCodable: Decodable { }
