#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

public final class SyslogDestination : PlaintextDestination {
    public override func log(_ message: String) {
        message.withCString { message in
            withVaList([message]) {
                vsyslog(0, "%s", $0)
            }
        }
    }
}
