//
//  ContentView.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 31/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var projs = [Projects]()
    @State private var toBeDeleted: IndexSet?
    @State private var showingDeleteAlert = false

    var body: some View {
        if (projs.isEmpty) {
            NavigationView {
                VStack {
                    List {
                        ForEach(filteredProjects) { p in HomeCardsView(projects: p).frame(width: .infinity).listRowInsets(EdgeInsets())
                            .alert(isPresented: self.$showingDeleteAlert) {
                                Alert(title: Text("Delete Confirmation"), message: Text("Are you sure to delete \(p.title)"), primaryButton: .destructive(Text("Delete")) {
                                    for index in self.toBeDeleted ?? [] {
                                        projs.remove(at: index)
                                    }
                                    self.toBeDeleted = nil
                                }, secondaryButton: .cancel {
                                    self.toBeDeleted = nil
                                })
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    .scrollContentBackground(.hidden)
                    .overlay(Group {
                        if filteredProjects.isEmpty {
                            Text("No Project Found")
                        }
                    })
                    Spacer()
                }
                .navigationTitle("Projects")
                .toolbar {
                    ToolbarItem {
                        MainHeaderView()
                    }
                }
            }
            .autocorrectionDisabled(true)
            .onAppear(perform: runSearch)
        } else {
            NavigationView {
                VStack {
                    List {
                        ForEach(filteredProjects) { p in HomeCardsView(projects: p).frame(width: .infinity).listRowInsets(EdgeInsets())
                            .alert(isPresented: self.$showingDeleteAlert) {
                                Alert(title: Text("Delete Confirmation"), message: Text("Are you sure to delete \(p.title)"), primaryButton: .destructive(Text("Delete")) {
                                    for index in self.toBeDeleted ?? [] {
                                        projs.remove(at: index)
                                    }
                                    self.toBeDeleted = nil
                                }, secondaryButton: .cancel {
                                    self.toBeDeleted = nil
                                })
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    .scrollContentBackground(.hidden)
                    .overlay(Group {
                        if filteredProjects.isEmpty {
                            Text("No Project Found")
                        }
                    })
                    Spacer()
                }
                .navigationTitle("Projects")
                .toolbar {
                    ToolbarItem {
                        MainHeaderView()
                    }
                }
            }
            .searchable(text: $searchText)
            .autocorrectionDisabled(true)
            .onAppear(perform: runSearch)
        }
    }

    func delete(at offsets: IndexSet) {
        toBeDeleted = offsets // store rows for delete
        showingDeleteAlert = true
    }

    var filteredProjects: [Projects] {
        if searchText.isEmpty {
            return projs
        } else {
            return projs.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.description.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func runSearch() {
        Task {
            projs = Projects.sampleData
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
