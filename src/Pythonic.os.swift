// Python docs: https://docs.python.org/2/library/os.html
//
// Most frequently used:
// 3040 os.path
//      1362 os.path.join
//       431 os.path.exists
//       343 os.path.dirname
//       215 os.path.abspath
//       145 os.path.basename
//       106 os.path.isdir
//        66 os.path.isfile
//        62 os.path.realpath
//        27 os.path.splitext
//        27 os.path.split
//  235 os.environ
//   94 os.unlink
//   87 os.mkdir
//   77 os.makedirs
//   68 os.remove
//   64 os.listdir
//   35 os.rename
//   32 os.sep
//   32 os.close
//
// >>> filter(lambda s: re.match("[a-z]", s), dir(os))
//   abort
//   access
//   altsep
//   chdir
//   chflags
//   chmod
//   chown
//   chroot
//   close
//   closerange
//   confst
//   confstr_names
//   ctermid
//   curdir
//   defpath
//   devnull
//   dup
//   dup2
//   environ: TODO (frequently used).
//   errno
//   error
//   execl
//   execle
//   execlp
//   execlpe
//   execv
//   execve
//   execvp
//   execvpe
//   extsep
//   fchdir
//   fchmod
//   fchown
//   fdopen
//   fork
//   forkpty
//   fpathconf
//   fstat
//   fstatvfs
//   fsync
//   ftruncate
//   getcwd
//   getcwdu
//   getegid
//   getenv
//   geteuid
//   getgid
//   getgroups
//   getloadavg
//   getlogin
//   getpgid
//   getpgrp
//   getpid
//   getppid
//   getsid
//   getuid
//   initgroups
//   isatty
//   kill
//   killpg
//   lchflags
//   lchmod
//   lchown
//   linesep
//   link
//   listdir
//   lseek
//   lstat
//   major
//   makedev
//   makedirs: TODO (frequently used).
//   minor
//   mkdir
//   mkfifo
//   mknod
//   name
//   nice
//   open
//   openpty
//   pardir
//   path: TODO (frequently used).
//   pathconf
//   pathconf_names
//   pathsep
//   pipe
//   popen
//   popen2: Added.
//   popen3: Added.
//   popen4
//   putenv
//   read
//   readlink
//   remove
//   removedirs
//   rename: TODO (frequently used).
//   renames
//   rmdir
//   sep
//   setegid
//   seteuid
//   setgid
//   setgroups
//   setpgid
//   setpgrp
//   setregid
//   setreuid
//   setsid
//   setuid
//   spawnl
//   spawnle
//   spawnlp
//   spawnlpe
//   spawnv
//   spawnve
//   spawnvp
//   spawnvpe
//   stat
//   stat_float_times
//   stat_result
//   statvfs
//   statvfs_result
//   strerror
//   symlink
//   sys
//   sysconf
//   sysconf_names
//   system: Added.
//   tcgetpgrp
//   tcsetpgrp
//   tempnam
//   times
//   tmpfile
//   tmpnam
//   ttyname
//   umask
//   uname
//   unlink: TODO (frequently used).
//   unsetenv
//   urandom: TODO (frequently used).
//   utime
//   wait
//   wait3
//   wait4
//   waitpid
//   walk
//   write

import Foundation

public class os {
    public class path {
        public class func exists(path: String) -> Bool {
            return NSFileManager.defaultManager().fileExistsAtPath(path)
        }
        public class func join(path: String...) -> String {
            var result = "";
            for pathItem in path {
                result = result.stringByAppendingPathComponent(pathItem)
            }
            return result;
        }
    }

    public class func getcwd() -> String {
        return NSFileManager.defaultManager().currentDirectoryPath
    }

    public class func remove(path: String) {
        return os.unlink(path)
    }

    public class func unlink(path: String) {
        NSFileManager.defaultManager().removeItemAtPath(path, error: nil)
    }

    public class func system(command: String) -> Int {
        var parts = command.split(" ")
        if len(parts) == 0 {
            return 0
        }
        let task = NSTask()
        // TODO: Use .pop() when we no longer have to work around compiler bug.
        if let first = parts.first {
            task.launchPath = first
        }
        parts = Array(dropFirst(parts))
        if len(parts) > 0 {
            task.arguments = parts
        }
        task.launch()
        task.waitUntilExit()
        return Int(task.terminationStatus)
    }

    public class func popen2(command: String) -> (NSFileHandle, NSFileHandle) {
        let (stdin, stdout, stderr) = os.popen3(command)
        return (stdin, stdout)
    }

    public class func popen3(command: String) -> (NSFileHandle, NSFileHandle, NSFileHandle) {
        var parts = command.split(" ")
        assert(len(parts) > 0)
        let task = NSTask()
        if let first = parts.first {
            task.launchPath = first
        }
        parts = Array(dropFirst(parts))
        if len(parts) > 0 {
            task.arguments = parts
        }
        let stdinPipe = NSPipe()
        task.standardInput = stdinPipe
        let stdin = stdinPipe.fileHandleForWriting
        let stdoutPipe = NSPipe()
        task.standardOutput = stdoutPipe
        let stdout = stdoutPipe.fileHandleForReading
        let stderrPipe = NSPipe()
        task.standardError = stderrPipe
        let stderr = stderrPipe.fileHandleForReading
        task.launch()
        return (stdin, stdout, stderr)
    }
}
