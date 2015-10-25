import Foundation

public class shutil {
    public class func copyFile(src: String, _ dst: String) {
        let fileManager = NSFileManager()
        try! fileManager.copyItemAtPath(src, toPath: dst)
    }

    public class func copyfile(src: String, _ dst: String) {
        return copyFile(src, dst)
    }
}
