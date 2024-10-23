## Crowdfunding Smart Contract: Transparent and Community-Driven Fundraising

### Key Features

1. **Proposal Submission**:
   - Organizers can create proposals for charitable causes that require funding. 
   - Each proposal includes details such as the project's goal and required funding amount.

2. **Donation System**:
   - Contributors can browse available proposals and donate funds to the contract.
   - Donations are sent to the contract’s address, where they are securely stored until a decision is made regarding their allocation.
   - The contract maintains a record of all contributors and their corresponding donations.

3. **Community Voting**:
   - Contributors are given the ability to vote on whether the funds should be allocated to a particular proposal.
   - A donation is released to a specific proposal only if more than **50% of the contributors** vote in favor of the initiative.
   - This voting mechanism ensures that funds are distributed democratically, preventing misuse or fraudulent claims for funding.

4. **Security and Transparency**:
   - All transactions and votes are recorded on the blockchain, making them immutable and publicly accessible, providing full transparency.
   - The smart contract’s decentralized nature ensures that no single entity controls the funds, reducing the risk of fraud.

5. **Fund Release**:
   - Once a project receives enough votes in favor, the organizer has the permission to release the funds to the intended recipient .
   - If the voting threshold is not met, the funds remain locked in the contract, ensuring that the contributors’ money is only spent as per their collective decision.

### Integration of PriceConverter Library

To enhance usability, the project integrates a **PriceConverter** library, which leverages **Chainlink Oracles** to convert the value of Ethereum (ETH) donations into USD in real time. This functionality serves multiple purposes:

1. **Real-Time Conversion**:
   - Contributors and organizers can track the equivalent value of donations in USD, providing clarity on the actual value of the funds being transferred, given the volatility of cryptocurrencies.

2. **Chainlink Oracle Integration**:
   - The **Chainlink Oracle** fetches the latest ETH/USD exchange rate from a reliable off-chain data source, ensuring up-to-date and accurate price conversions within the smart contract.
