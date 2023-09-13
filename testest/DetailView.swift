import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var mdate: Date?
    @State var sbp: Int16
    @State var dbp: Int16

    
    
    var body: some View {
        Text("\(mdate!, formatter: itemFormatter), \(sbp) / \(dbp)")
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(mdate: Date(), sbp: 120, dbp: 80)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
