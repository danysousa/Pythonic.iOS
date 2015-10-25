import Foundation

public class shutil {
    public class func copyFile(src: String, _ dst: String) {
        do {
            try NSFileManager().copyItemAtPath(src, toPath: dst)
        } catch _ {
        }
    }

    public class func copyfile(src: String, _ dst: String) {
        return copyFile(src, dst)
    }
}
