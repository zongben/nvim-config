return {
	"zongben/capsoff.nvim",
  build = ":CapsLockOffBuild",
  config = function()
    require("capsoff").setup()
  end,
}
