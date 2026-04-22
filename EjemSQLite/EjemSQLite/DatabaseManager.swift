//
//  DatabaseManager.swift
//  EjemSQLite
//
//  Created by Alumno on 22/04/26.
//

import Foundation
import SQLite3

class DatabaseManager {
    
    var db: OpaquePointer?
    
    // Ruta de la base de datos
    func getDatabasePath() -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory.appendingPathComponent("miBD.sqlite").path
    }
    
    // Abrir conexión
    func openDatabase() {
        if sqlite3_open(getDatabasePath(), &db) == SQLITE_OK {
            print("Conectado correctamente")
        } else {
            print("Error al conectar")
        }
    }
    
    // Crear tabla
    func createTable() {
        let query = """
        CREATE TABLE IF NOT EXISTS usuarios(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT
        );
        """
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Tabla creada")
            }
        }
        sqlite3_finalize(statement)
    }
    
    // Insertar dato
    func insert(nombre: String) {
        let query = "INSERT INTO usuarios (nombre) VALUES (?);"
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            
            sqlite3_bind_text(statement, 1, (nombre as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Dato insertado")
            }
        }
        sqlite3_finalize(statement)
    }
    
    // Consultar datos
    func fetch() -> [String] {
        let query = "SELECT nombre FROM usuarios;"
        var statement: OpaquePointer?
        var nombres: [String] = []
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            
            while sqlite3_step(statement) == SQLITE_ROW {
                let nombre = String(cString: sqlite3_column_text(statement, 0))
                nombres.append(nombre)
            }
        }
        sqlite3_finalize(statement)
        
        return nombres
    }
}
