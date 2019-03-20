[Flags()]
enum ComRight {
    Read             = 1
    LocalLaunch      = 2
    RemoteLaunch     = 4
    LocalActivation  = 8
    RemoteActivation = 16
    All              = 31
}