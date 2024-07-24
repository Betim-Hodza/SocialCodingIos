//
//  Events.swift
//  SocialCodingIos
//
//  Created by Betim Hodza on 6/1/24.
//

import SwiftUI

//webscraping
import Foundation
import SwiftSoup

//data struct
struct Event {
    let title: String
    let date: String
    let location: String
    let time: String
    let description: String
}

class WebScraper {
    //asks for url to scrape for Events on mobi page
    func scrapeEvents(from url: String, completion: @escaping ([Event]?) ->Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let html = String(data: data, encoding: .utf8) ?? ""
                let doc: Document = try SwiftSoup.parse(html)
                
                //adjust these selectors based on structure of website scraped
                let eventElements = try doc.select("div.event") //to be changed (TBC)
                
                var events: [Event] = []
                
                for element in eventElements {
                    let title = try element.select("h1").first()?.text() ?? "No Title" //grab the title from h1 bracket
                    
                    let paragraphs = try element.select("p")
                    var date = ""
                    var location = ""
                    var time = ""
                    var description = ""
                    
                    //goes through each paragraph to look for emoji's to grab the elements (was a tough solution to think of)
                    for p in paragraphs {
                        let text = try p.text()
                        if text.contains("🗓️") {
                            date = text.replacingOccurrences(of: "🗓️", with: "")
                        } else if text.contains("🗺️") {
                            location = text.replacingOccurrences(of: "🗺️", with: "")
                        } else if text.contains("🕕") {
                            time = text.replacingOccurrences(of: "🕕", with: "")
                        } else if !text.contains("📍") && !text.contains("Join our Twitch Stream here") {
                            description += text + " "
                        }
                    }
                    
                    let event = Event(title: title, date: date, location: location, time: time, description: description)
                    events.append(event)
                }
                
                completion(events)
            } catch {
                print("Error: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
}

struct Events: View {
    
    @Binding var presentSideMenu: Bool
    
    // web scraping state vars
    @State private var events: [Event] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image("Menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
                
            }
            
            Spacer()
            Text("MOBI's Events")
            Spacer()
            
            if isLoading {
                ProgressView()
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                List(events, id: \.title) { event in
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.headline)
                        Text(event.date)
                            .font(.subheadline)
                        Text(event.description)
                            .font(.body)
                    }
                }
            }
            
        }
        .padding(.horizontal, 24)
        .onAppear(perform: loadEvents)
    }
    
    private func loadEvents() {
        isLoading = true
        errorMessage = nil
        
        let scraper = WebScraper()
        scraper.scrapeEvents(from: "https://codewith.mobi/src/events/events.html") { scrapedEvents in
            DispatchQueue.main.async {
                isLoading = false
                if let scrapedEvents = scrapedEvents {
                    self.events = scrapedEvents
                } else {
                    errorMessage = "Failed to scrape Events."
                }
            }
        }
        
    }
    
}



