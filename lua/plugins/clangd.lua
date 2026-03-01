-- Ensure compile_commands.json is discoverable for CMake preset builds.
-- CMake presets put compile_commands.json in build/<preset>/ but clangd only
-- searches one level deep (build/compile_commands.json). This autocmd creates
-- a symlink at the project root pointing to the most recently modified one.
-- cmake-tools.nvim also does this after CMakeGenerate via its default
-- "soft_link" option, but this handles pre-existing builds.

local function link_compile_commands(root)
  local root_cc = root .. "/compile_commands.json"

  local lstat = vim.uv.fs_lstat(root_cc)
  if lstat then
    if lstat.type ~= "link" then
      return -- real file, don't touch it
    end
    -- existing symlink — check if target is still valid
    if vim.uv.fs_stat(root_cc) then
      return -- valid symlink, nothing to do
    end
    -- dangling symlink, remove it
    vim.uv.fs_unlink(root_cc)
  end

  local build_dir = root .. "/build"
  if not vim.uv.fs_stat(build_dir) then
    return
  end
  local handle = vim.uv.fs_scandir(build_dir)
  if not handle then
    return
  end

  local newest_path, newest_mtime = nil, 0
  while true do
    local name, type = vim.uv.fs_scandir_next(handle)
    if not name then
      break
    end
    if type == "directory" then
      local cc = build_dir .. "/" .. name .. "/compile_commands.json"
      local cc_stat = vim.uv.fs_stat(cc)
      if cc_stat and cc_stat.mtime.sec > newest_mtime then
        newest_mtime = cc_stat.mtime.sec
        newest_path = cc
      end
    end
  end

  if newest_path then
    vim.uv.fs_symlink(newest_path, root_cc)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp" },
  callback = function(ev)
    local root = vim.fs.root(ev.buf, { "CMakeLists.txt", ".git" })
    if root then
      link_compile_commands(root)
    end
  end,
})

return {}
