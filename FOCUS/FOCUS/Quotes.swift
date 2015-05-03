//
//  Quotes.swift
//  FOCUS
//
//  Created by Adrien Villez on 5/2/15.
//  Copyright (c) 2015 AdrienVillez. All rights reserved.
//

import UIKit

class Quotes: NSObject
{
    var quote: String = String()
    var author: String = String()
 
    init(quote: String, author: String)
    {
        self.quote = quote
        self.author = author
    }
}
