//
//  ContentView.swift
//  testest
//
//  Created by 林秀謙 on 2023/9/12.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \BloodPressure.mdate, ascending: false)],
        animation: .default)
    private var items: FetchedResults<BloodPressure>

    var body: some View {
        ZStack{
            NavigationView {
                ScrollView {
                    ForEach(items) { item in
                        NavigationLink {
                            DetailView(mdate: item.mdate!,sbp: item.sbp, dbp: item.dbp)
                        } label: {
                            ListView(mdate: item.mdate!,sbp: item.sbp, dbp: item.dbp)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                Text("Select an item")
            }
        }
    }
    private func addItem() {
        withAnimation {
            let newItem = BloodPressure(context: viewContext)
            newItem.mdate = Date()
            newItem.sbp = 120 + Int16.random(in: -20...20)
            newItem.dbp = 80 + Int16.random(in: -10...10)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//ZStack{
//    Color.blue
//        .ignoresSafeArea()
//    VStack{
//        HStack{
//
//            Button(action: {
//
//            }, label: {
//                Image(systemName: "arrowshape.left.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 30)
//                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
//
//
//            })
//            .padding(.leading,20)
//
//            Label("BloodPressure", systemImage: "")
//                .font(.title)
//                .foregroundColor(.white)
//                .padding(.leading, 26)
//
//            Button(action: {
//
//            }, label: {
//                Image(systemName: "plus")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 30)
//                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
//                    .padding(.leading, 26)
//
//
//            })
//
//
//            Spacer()
//
//        }
//
//        HStack{
//            Text("history")
//                .foregroundColor(.white)
//                .font(.headline)
//                .multilineTextAlignment(.leading)
//                .padding(.trailing, 105)
//
//        }
//        ZStack{
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color.secondary)
//                .frame(width:350, height: 50)
//            Text("Aug 25, 2023")
//                .foregroundColor(.white)
//                .font(.title2)
//        }
//        Spacer()
//
//        ScrollView{
//
//
//            VStack {
//                ForEach(BloodPressures){ item in
//                    ExtractedView(sbp: item.sbp, dbp: item.dbp, mdate: item.mdate!)
//                }
//            }
//            .padding(20)
////                    .background{
////
////                        RoundedRectangle(cornerRadius: 90)
////
////                            .fill(Color(red: 240/255, green: 240/255, blue: 240/255))
////                            .frame(width:395,  height: 700)
////                            .padding(.top, 150)
////                    }
//        }
//
//
//
//    }
//}
//
//
//
//    .navigationBarTitleDisplayMode(.inline)
//
//    .toolbar {
//
//        ToolbarItem(placement: .navigationBarLeading) {
//            Button(action: {}, label: {
//                Image(systemName: "arrowshape.left.fill")
//            })
//
//        }
//
//
//
//
//
//    }
//    //padding()
//
//
//
//}
