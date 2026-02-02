use zed_extension_api as zed;

struct Idris2 {}

impl zed::Extension for Idris2 {
    fn new() -> Self
    where
        Self: Sized,
    {
        Idris2 {}
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        let lsp_command = worktree
            .which("idris2-lsp")
            .ok_or_else(|| "idris2-lsp not in PATH")?;
        Ok(zed::Command {
            command: lsp_command,
            args: vec![],
            env: worktree.shell_env(),
        })
    }
}

zed::register_extension!(Idris2);
