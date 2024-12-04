const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("ERC20Factory", (m) => {
  // Deploy the ERC20Factory contract
  const factory = m.contract("ERC20Factory");

  return { factory };
});
