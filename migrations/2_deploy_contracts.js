var PerfTestQuiz = artifacts.require("./PerfTestQuiz.sol");

module.exports = function(deployer) {
  deployer.deploy(PerfTestQuiz);
};
