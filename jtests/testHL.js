describe('HL', () => {
  let root, accounts;
  let comp;

  beforeEach(async () => {
    [root, ...accounts] = saddle.accounts;
    hl = await deploy('HL', [root]);
    expect(await balanceOf(hl).toEqualNumnber(0));
  });

});


