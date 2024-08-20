---
layout: post
title: "RL | Multi-armed Bandits | A k-armed Bandit Problem"
date: 2024-08-20
author: Mohammad Javad Zallaghi
tags: [rl]
---
# The goal of these kind of posts
While reading the book "Reinforcement Learning: An Introduction", written by Sutton, the idea of having important summaries of the chapters came into my mind. This way, I and probabaly my future students could quickly review the main core and methods of RL from an introduction point of view.

# RL vs other types of learning methods
RL uses training information that evaluates the ```action``` taken, rather than ```instructs``` by giving correct actions. Evaluative feedback depends entirely on the action taken, whereas instructive feedback is independent of the action taken. And in RL, this behavior create the need for active exploration, for a good bahavior.

# A ```k-armed``` Bandit Problem
The agent is faced repeatedly with a choice among ```k``` different actions. The agent would receive a numerical reward chosen from a stationary probability distribution that depends on the action taken by the agent. The ultimate objective is maximizing the expected total reward over some time period.

The problem is the original form of the ```k-armed bandit problem```. There are other names like slot machine, or "one-armed bandit problem", where there is only one action (or lever) for decision making (Why?!).

## Value of action
Each of the k actions, has an expected reward give that that action is selected, and this is called ```value``` of that action.

$$
q_{*}(a)=\mathbb{E}[R(t)|A_{t}=a]
$$

## Greedy actions
If we maintain estimates of the action values, then at any time step there is at least one action whose estimaed value is greatest, which is called ```greedy``` actions.

## Exploiting vs Exploring
When the selected action is greedy, the currect knowledge of velues of the actions are ```exploiting```, while if a nongreedy action be selected, then the system is ```exploring```, as the selections made, make the system able to improve the estimate of nongreedy action's value. There should be a balance between exploitign and exploring, and it could lead to a conflict. There are many balancing methods, but the issue is not completely solved yet.

## Comprehensive description in the reference
- Section 2.1, Reinforcement Learning – An Introduction, by Richard Sutton and Andrew Barto
