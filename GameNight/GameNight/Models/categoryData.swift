//
//  categoryData.swift
//  GameNight
//
//  Created by Lawrence Kwok on 11/4/22.
//

import Foundation

// placeholder for obtaining the categories (as of 11/04/22)
struct categoryData {
    static let categories: [String] = ["18XX", "4x", "80s", "Abstract", "Accessory", "Adult", "Adventure", "Aerial Warfare", "Age of Reason", "Aliens", "Alternate History", "American History", "American West", "Ancient", "Animals", "Apocalyptic", "Arabian", "Art", "Asymmetric", "Aviation", "Banking", "Battle Royale", "Bluffing", "Book", "Campaign", "Card Game", "Children's Game", "Christian", "Christmas", "City Building", "Civil War", "Civilization", "Cold war", "Collectible Components", "Colonial", "Combat", "Comic Book / Strip", "Competitive", "Cooperative", "Crime", "Cube Rail", "Cyberpunk", "Deduction", "Deluxe Edition", "Dexterity", "Dice", "Dinosaurs", "Drawing", "Drinking", "Dungeon Crawl", "Economic", "Educational", "Electronic", "Environmental", "Escape Room", "Espionage", "Expansion", "Exploration", "Family Game", "Fan Made", "Fantasy", "Farming", "Fighting", "Finance", "Food", "Game System", "Gamefound", "Gulf War", "Historic", "Horror", "Humor", "Industry/Manufacturing", "Kickstarter", "Korean War", "Law", "Legacy", "Letters", "Mad Scientist", "Mafia", "Math", "Mature / Adult", "Maze", "Medical", "Medieval", "Memory", "Mental Health", "Miniatures", "Modern Warfare", "Movies / TV / Radio theme", "Murder", "Murder/Mystery", "Music", "Mystery", "Mythology", "Napoleonic", "Nature", "Nautical", "Negotiation", "Ninjas", "Novel-based", "Number", "One vs Many", "Paranormal", "Party Game", "Pike and Shot", "Pirates", "Plants/Gardening", "Point Salad", "Political", "Post-Apocalyptic", "Post-Napoleonic", "Prehistoric", "Print & Play", "Prison Escape", "Promo", "Puzzle", "RPG", "Racing", "Real-time", "Religious", "Renaissance", "Resource Management", "Robots", "Roman Empire", "Romance", "Route Building", "Safari", "Sandbox", "Sci-Fi", "Screen Printed Meeples", "Semi-Cooperative", "Solo / Solitaire", "Space Exploration", "Spies/Secret Agents", "Sports", "Steampunk", "Storytelling", "Strategic-Level", "Tactical-Level", "Technology", "Territory Building", "Theme Park", "Tile Placement", "Time Travel", "Trains", "Transportation", "Travel", "Trivia", "Two player Only Game", "Undersea", "Video Game Theme", "Vietnam War", "Viking", "Wargame", "Werewolves", "Western", "Word Game", "World War I", "World War II", "World War III", "Writing / Dry Erase", "Zodiac", "Zombies", "Zone Control"]
    
    static let ids: [String] = ["2bdFPJUvFo", "85OKv8p5Ow", "FMKgeuNEII", "hBqZ3Ar4RJ", "GtuMb7ei27", "OE07lsfVqf", "KUBCKBkGxV", "DjAhqEHOD0", "20iDvpbh7A", "tJxatX2ZbW", "nWDac9tQzt", "dghLhwyxVb", "4mOtRRwSoj", "a8NM5cugJX", "MWoxgHrOJD", "eFaACC6y2c", "CBboNLI1Uj", "k0dglq5j6N", "Bq6M0TJyg7", "QB4sEpx1Uu", "wpItJuRDiz", "pwt9HAzEa6", "PinhJrhnxU", "wLpYxHBexW", "fW5vusE96B", "eX8uuNlQkQ", "HKaYVNIxAJ", "36WFElclV3", "3Y1dIDLCRw", "ODWOjWAJj3", "w8XD66FUZ2", "329DxyFL9D", "bVMxJo31bS", "vXxLT0FDTZ", "bSzUpE5oOZ", "gscaL52VDG", "G5kfqnPBP6", "pacCjl7His", "ge8pIhEUGE", "7DfHn28Pcf", "nfQONtMbDU", "Ef4oYLHNhI", "bCBXJy9qDw", "fh4V5SOLFj", "bKrxqD9mYc", "mavSOM8vjH", "42pmul4oHH", "JMM0TG2MSe", "We3MM46qBr", "g2Hwv8t0Y5", "N0TkEGfEsF", "B3NRLMK4xD", "crxgUzJSEz", "gsekjrPJz0", "pflvcNyHPe", "u5ZiYctU6T", "v4SfYtS2Lr", "yq6hVlbM2R", "7rV11PKqME", "ctumBZyj5l", "ZTneo8TaIO", "Wr8uXcoR9p", "upXZ8vNfNO", "ELg06sncRX", "YrDuNj8lvr", "JvIs75sWte", "cQnyClrGPU", "Eyuf8PzjDo", "KzEQIwIub7", "cAIkk5aLdQ", "TYnxiuiI3X", "zqFmdU4Fp2", "rrvd68LjOR", "3souLOXUqI", "AGKGd3txp9", "XeYUw9159M", "HZ7kUiqEbs", "GCwXmvBCvA", "pIMmuVYnQp", "POlqwScVxD", "ZhlfIPxYsw", "ruQAhyLfum", "AeWXMxbm91", "QAYkTHK1Dd", "AujCle9cUq", "Cc10AY9UX5", "FC6ElKI9tk", "L6NUwNdblq", "Sod2YBWMKi", "1e709CZ42V", "Kk70K0524Z", "herNFAxMdz", "BBZb2d0ePt", "MHkqIVxwtx", "IpcJzp0TVC", "o5dH2ssbuu", "vqZ5XzGWQD", "jZEDOpx07e", "rtslXnT90O", "dO9HVl2TW7", "9r6mtYVCAZ", "TCYEfWLB8c", "SE2CndXU4V", "X8J7RM6dxX", "UL3b9M86gA", "9EIayX6n5a", "vRbkg1W0AB", "3EjfGzCuWE", "TKQncFVX74", "8Z7nWG2kOw", "5APB1MWk6X", "YyszHun1HP", "ov6sEmlkiC", "dAyk5NtNTV", "AlrfWcR5aT", "WVMOS3s2pb", "2Gu62aKdma", "tQGLgwdbYH", "PzWI2uaif0", "DRqeVkXWqX", "nuHYRFmMjU", "zyj9ZK3mHB", "oojGpMQQ2l", "KSBdPfxs6F", "E5rYwP0Ybr", "SzUZdSjCN2", "UH3xvKjaCQ", "2m6sfYeeGI", "3B3QpKvXD3", "UjUO40mmeL", "WCMkyAqVlf", "VzyslQJGrG", "0MdRqhkNpw", "Hc6vcim5DS", "hShsL2DktG", "4hZlqoitAY", "jGXefW0E2i", "alkjFhA58S", "loGUMKV9K9", "knFtS8LntM", "buDTYyPw4D", "XN9Byxf3MK", "BHxvD7ZjfA", "2KVQJ2k60k", "JwHcKqxh33", "CWYOF9xu7O", "TR4CiP8Huj", "YGHGDjahKY", "a2eMKxxlVW", "oHSL7C6i9y", "djokexoK0U", "jS8aA9kDFW", "muDQil3Mkb", "jX8asGGR6o", "uJgSEPT6zE", "mw3nPNWqs0", "rHvAx4hH2f", "wTLJSVEbm6", "fl3TogdUzX", "OlkGBmu4Va", "djZWzjCZhM", "30B899LSDs", "FmGV9rVu1c", "B1N2QOByCl"]
    
    static var displayableCategories: [String] {
        self.categories
    }
    static var categoryId: [String] {
        self.ids
    }
}