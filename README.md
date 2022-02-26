# Solidity CTF Solutions
A few random exploit scripts from solidity challenges I found interesting. They're all written with remix hence the lack of deploy scripts.

BankRobber.sol - Solution to [GreHack CTF 2017 Bank challenge](https://github.com/GreHack/CTF-challs/tree/master/2017/Blockchain/300%20-%20Bank) made by [Josselin Feist](https://twitter.com/Montyly) of Trail of Bits.
**NB**: You'd have to implement access control for a similar exploit if you were to ever deploy this in the wild to white hat some funds and ideally, this should be done to avoid getting front run by bots. See [here](https://www.paradigm.xyz/2020/08/ethereum-is-a-dark-forest) and [here](https://samczsun.com/escaping-the-dark-forest/) Additionally, you can loop the exploit sequence and gas optimize it if you wish but that's overkill for a quick CTF solution.
