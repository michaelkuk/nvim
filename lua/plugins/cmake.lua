return {
  {
    "Civitasv/cmake-tools.nvim",
    opts = {
      cmake_executor = { name = "overseer" },
      cmake_runner = { name = "overseer" },
    },
    keys = {
      { "<leader>Cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
      { "<leader>Cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
      { "<leader>Cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
      { "<leader>Cd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
      { "<leader>Cp", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "CMake Select Preset" },
      { "<leader>Ct", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake Select Target" },
      { "<leader>Cl", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "CMake Select Launch Target" },
    },
  },
}
