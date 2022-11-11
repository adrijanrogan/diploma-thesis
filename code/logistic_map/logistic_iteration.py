import locale

import matplotlib as mpl
import numpy as np
from matplotlib import rc
import matplotlib.pyplot as plt

# Use LaTeX throughout the figure for consistency
rc('font', **{'family': 'serif', 'serif': ['Computer Modern'], 'size': 16})
rc('text', usetex=True)
plt.rcParams.update({'text.latex.preamble': [r'\usepackage{icomma}']})
plt.rcParams['axes.formatter.use_locale'] = True

# Configuration
iters = 100
x0 = 0.35
rs = [0.99, 2.95, 3.2, 3.5, 3.7, 4.0]

if __name__ == '__main__':
    plt.style.use('grayscale')
    fig, axs = plt.subplots(figsize=(8, 12), nrows=len(rs), sharex="all", constrained_layout=True)

    x = np.linspace(1, iters, iters)
    y = np.zeros(iters)

    for k in range(len(rs)):
        r = rs[k]
        ax = axs[k]
        ax.set_ylim([0, 1])
        ax.set_yticks(ticks=[0.0, 0.5, 1.0], labels=["0", "0,5", "1"])

        # Iterate logistic map
        y[0] = x0
        for i in range(1, iters):
            y[i] = r * y[i - 1] * (1 - y[i - 1])

        ax.plot(x, y, label="$r = {r}$".format(r="{,}".join(str(r).split("."))))
        ax.legend()

    plt.savefig("logistic_iteration.png", dpi=300)
