import locale

import matplotlib as mpl
import numpy as np
from matplotlib import rc
import matplotlib.pyplot as plt


# Use LaTeX throughout the figure for consistency
rc('font', **{'family': 'serif', 'serif': ['Computer Modern'], 'size': 16})
rc('text', usetex=True)


if __name__ == '__main__':
    plt.style.use('grayscale')
    fig, axs = plt.subplots(figsize=(8, 4), nrows=2, ncols=2, sharex="col", sharey="row", constrained_layout=True)

    X = np.linspace(0, 1, 1000)
    Y = np.copy(X)

    for row in range(2):
        for col in range(2):
            Y = 2 * np.minimum(Y, 1 - Y)
            label = "$T_{2}^{" + str(2 * row + col + 1) + "}$"
            ax = axs[row][col]
            ax.plot(X, Y, label=label)
            ax.set_xticks(ticks=[0.0, 0.25, 0.5, 0.75, 1.0], labels=["0", "", "0,5", "", "1"])
            ax.set_yticks(ticks=[0.0, 0.5, 1.0], labels=["0", "", "1"])
            ax.legend()

    plt.savefig("tent_2.png", dpi=300)
