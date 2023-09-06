import CoreData

struct PersistenceController { static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
//        let result = PersistenceController()
        let result = PersistenceController(inMemory: false)

        let viewContext = result.container.viewContext
        let sampleURLString = "https://www.example.com"
        
        for index in 0..<6 {
            let newBook = Book(context: viewContext)
            newBook.title = "titletitletitletitletitletitletitle\(index + 1)"
            newBook.coverImageURL = URL(string: sampleURLString)!
            newBook.createdAt = Date()
            newBook.url = URL(string: sampleURLString)!
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

//    let container: NSPersistentContainer
//
//    init(inMemory: Bool = false) {
//
//        container = NSPersistentContainer(name: "PDF_Viewer_CoreData")
//        if inMemory {
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
//
//
////      よくわからんがChatGPTの指示通り、デフォルトのloadPersistentStoresの箇所を下記のとおりに変更したら、CoreDataの新規モデル変更後に出たマイグレーション関係のエラーが解消した模様。
//        let description = NSPersistentStoreDescription()
//        //setting coreData type to SQLite so that it persist the data after the app's ternmination.
//        description.type = NSSQLiteStoreType
//        description.shouldInferMappingModelAutomatically = true
//        description.shouldMigrateStoreAutomatically = true
//        container.persistentStoreDescriptions = [description]
//
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        container.viewContext.automaticallyMergesChangesFromParent = true
//    }
    
    
    let container: NSPersistentContainer

        init(inMemory: Bool = false) {
            // MARK: 下1行はEntityの設定によって違う
            container = NSPersistentContainer(name: "PDF_Viewer_CoreData")
            if inMemory {
                container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            }
            container.loadPersistentStores(completionHandler: { _, error in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            container.viewContext.automaticallyMergesChangesFromParent = true
        }
    
    
}
