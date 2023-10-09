//
//  SearchView.swift
//  Stocks
//
//  Created by VT on 10/6/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: "magnifynngclass")
            
            TextField("Search", text: $searchTerm)
                .foregroundColor(.primary)
                .padding(10)
            
            Spacer()
        }
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}
