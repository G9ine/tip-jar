# Tip Jar Smart Contract

A simple Stacks blockchain smart contract that allows users to send STX tips to a contract owner.

## Features

- Send STX tips to contract owner
- Track total tips received
- Owner-only withdrawal function
- Read-only function to check total tips

## Contract Functions

### Public Functions

```clarity
(tip (amount uint))
```
Send STX tips to the contract owner. Returns `(ok true)` on success or `(err u102)` on failure.

```clarity
(withdraw (amount uint))
```
Owner-only function to withdraw STX. Returns `(ok true)` or `(err u100)` if not owner.

### Read-Only Functions

```clarity
(get-total-tips)
```
Returns the total amount of tips received as `(ok uint)`.

## Development

### Prerequisites
- Stacks blockchain development environment
- Clarinet for testing
- Node.js and NPM

### Installation
```bash
npm install
```

### Testing
```bash
clarinet test
```
