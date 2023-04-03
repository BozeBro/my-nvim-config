return {
    {
        "dcampos/nvim-sftp-sync",
        enabled = false,
        build = ":UpdateRemotePlugins",
        init = function()
            local server = {
                srv1 = {
                    local_path = "/Users/benedictozua/15213/malloc",
                    remote_path = "/afs/andrew.cmu.edu/usr23/bozua/private/15213/malloclab-s23-BozeBro",
                    host = "shark.ics.cs.cmu.edu",
                    username = "bozua",
                    password = "Przwmpya$2Lag",
                },
            }
            vim.g["sftp_sync_servers"] = server
        end,
    },
}
