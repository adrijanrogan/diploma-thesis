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
    fig, axs = plt.subplots(figsize=(8, 5), nrows=2, ncols=2, sharex="col", sharey="row", constrained_layout=True)

    X = np.linspace(0, 1, 1000)
    Y = np.copy(X)

    for row in range(2):
        for col in range(2):
            Y = 3 * np.minimum(Y, 1 - Y)
            label = "$T_{3}^{" + str(2 * row + col + 1) + "}$"
            ax = axs[row][col]
            ax.plot(X, Y, label=label)
            ax.axhline(1, 0, 1, linestyle='--', color="#888888", linewidth=1)
            ax.set_xticks(ticks=[0.0, 1/3, 2/3, 1.0], labels=["0", "$\\frac{1}{3}$", "$\\frac{2}{3}$", "1"])
            ax.set_yticks(ticks=[0.0, 0.5, 1.0, 1.5], labels=["0", "0,5", "1", "1,5"])
            ax.set_ylim([0, 1.5])
            ax.legend()

    plt.savefig("tent_3.png", dpi=300)
