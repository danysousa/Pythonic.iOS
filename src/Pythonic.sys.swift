// Python docs: https://docs.python.org/2/library/sys.html
//
// Most frequently used:
//  339 sys.path
//  331 sys.argv
//  273 sys.exit
//  144 sys.stdout
//  121 sys.stderr
//  116 sys.exc_info
//   98 sys.platform
//   93 sys.prefix
//   83 sys.version_info
//   64 sys.modules
//
// >>> filter(lambda s: not s.startswith("_"), dir(sys))
//   api_version
//   argv: Implemented.
//   builtin_module_names
//   byteorder
//   call_tracing
//   callstats
//   copyright
//   displayhook
//   dont_write_bytecode
//   exc_clear
//   exc_info
//   exc_type
//   excepthook
//   exec_prefix
//   executable
//   exit: Implemented.
//   exitfunc
//   flags
//   float_info
//   float_repr_style
//   getcheckinterval
//   getdefaultencoding
//   getdlopenflags
//   getfilesystemencoding
//   getprofile
//   getrecursionlimit
//   getrefcount
//   getsizeof
//   gettrace
//   hexversion
//   last_traceback
//   last_type
//   last_value
//   long_info
//   maxint
//   maxsize
//   maxunicode
//   meta_path
//   modules
//   path: TODO.
//   path_hooks
//   path_importer_cache
//   platform: TODO.
//   prefix
//   ps1
//   ps2
//   py3kwarning
//   real_prefix
//   setcheckinterval
//   setdlopenflags
//   setprofile
//   setrecursionlimit
//   settrace
//   stderr: Implemented.
//   stdin: Implemented.
//   stdout: Implemented.
//   subversion
//   version: TODO.
//   version_info
//   warnoptions

import Foundation

public class sys {
    public static var assignedArgv: [String]?

    public class var argv: [String] {
        get {
            return assignedArgv ?? Process.arguments
        }
        set {
            assignedArgv = newValue
        }
    }

    public class var stdin: NSFileHandle {
        get {
            return NSFileHandle.fileHandleWithStandardInput()
        }
    }

    public class var stdout: NSFileHandle {
        get {
            return NSFileHandle.fileHandleWithStandardOutput()
        }
    }

    public class var stderr: NSFileHandle {
        get {
            return NSFileHandle.fileHandleWithStandardError()
        }
    }

    public class var platform: String {
        return "darwin"
    }

    public class func exit(exitCode: Int = 0) {
        Darwin.exit(Int32(exitCode))
    }
}
