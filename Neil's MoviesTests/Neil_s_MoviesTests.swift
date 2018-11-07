//
//  Neil_s_MoviesTests.swift
//  Neil's MoviesTests
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import XCTest
@testable import Neil_s_Movies

class Neil_s_MoviesTests: XCTestCase {
    

    func loadJSONAsData(fromFile name:String) -> Data? {
        guard let path = Bundle(for: type(of: self)).path(forResource: name, ofType: "json") else {
            return nil
        }
        
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        } catch {
            return nil
        }
        
    }
    
    func testNowPlayingModel() {
        let jsonData:Data? = loadJSONAsData(fromFile: "nowplaying")
        XCTAssertTrue(jsonData != nil, "JSON file should exist")
        
        do {
            let model = try JSONDecoder().decode(NowPlayingModel.self, from: jsonData!)
            XCTAssertEqual(model.nowPlayingMovies.count, 20)
            for nowPlayingItem in model.nowPlayingMovies {
                XCTAssertTrue(nowPlayingItem.identifier > 0)
            }
            
            XCTAssertEqual(model.nowPlayingMovies.first?.title, "Venom")
            XCTAssertEqual(model.nowPlayingMovies.last?.title, "Papillon")
            
            return
        } catch _ {
            XCTFail("Cannot decode JSON")
        }
    }
    
    func testMovieModel() {
        let jsonData:Data? = loadJSONAsData(fromFile: "movie")
        XCTAssertTrue(jsonData != nil, "JSON file should exist")
        
        do {
            let model = try JSONDecoder().decode(MovieModel.self, from: jsonData!)
            XCTAssertEqual(model.title, "The Lord of the Rings")
            XCTAssertEqual(model.belongsToCollection?.identifier, 141290)
            return
        } catch _ {
            XCTFail("Cannot decode JSON")
        }
    }
    
    func testCollectionModel() {
        let jsonData:Data? = loadJSONAsData(fromFile: "collection")
        XCTAssertTrue(jsonData != nil, "JSON file should exist")
        
        do {
            let model = try JSONDecoder().decode(CollectionModel.self, from: jsonData!)
            XCTAssertEqual(model.parts.count, 3)
            XCTAssertEqual(model.parts.first?.identifier, 1361)
            return
        } catch _ {
            XCTFail("Cannot decode JSON")
        }
    }
    
}
