//
//  PokemonManager.swift
//  PokedexSwiftUI
//
//  Created by Fernando Gnadt de Oliveira on 24/10/22.
//

import Foundation

class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, completion:@escaping (DetailPokemon) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/1/", model: DetailPokemon.self){
            data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
