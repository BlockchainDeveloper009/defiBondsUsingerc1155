const {
    time,
    loadFixture,
  } = require("@nomicfoundation/hardhat-network-helpers");
  const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
  const { expect } = require("chai");
  
  describe("Lock", function () {

    async function deployOneYearLockFixture() {
        const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
        const ONE_GWEI = 1_000_000_000;
    
        const lockedAmount = ONE_GWEI;
        const unlockTime = (await time.latest()) + ONE_YEAR_IN_SECS;
    
        // Contracts are deployed using the first signer/account by default
        const [owner, otherAccount] = await ethers.getSigners();
    
        const Lock = await ethers.getContractFactory("myBond");
        const lock = await Lock.deploy();
    
        return { lock, unlockTime, lockedAmount, owner, otherAccount };
      }

      describe("Deployment", function () {

        it("gold value is returned", async function () {
            const { lock, owner } = await loadFixture(deployOneYearLockFixture);
            const expected = await lock.getGold();
            console.log('expcted:');
            console.log(expected);
            console.log('---------');
            console.log('-valie');
            console.log(expected.value);
            console.log('---------');
            console.log('--v');
            console.log(expected.v);
            expect(expected.value).to.equal(0);
        });

        it("age is returned", async function () {
            const { lock, owner } = await loadFixture(deployOneYearLockFixture);
            const {id, age} = await lock.getPerson(0);
            console.log('expcted:');
            console.log(id);
            console.log('---------');
            console.log(age);
            expect(age).to.equal(35);
        });

//portfolio management, dao
//fund managers, stocks
// create new funds 
//fund raiser

    });



});