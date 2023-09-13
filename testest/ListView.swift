import SwiftUI
import CoreData

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var mdate: Date?
    @State var sbp: Int16
    @State var dbp: Int16

    var body: some View {
        VStack{
            Text("\(mdate!, formatter: itemFormatter)")
                .font(.title)
            Text("\(sbp) / \(dbp)")
                .font(.title)
            
        }
        
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(mdate: Date(), sbp: 120, dbp: 80)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
