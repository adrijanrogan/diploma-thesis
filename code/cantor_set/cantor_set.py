import numpy as np
from matplotlib import rc
import matplotlib.pyplot as plt

# Use LaTeX throughout the figure for consistency
rc('font', **{'family': 'serif', 'serif': ['Computer Modern'], 'size': 16})
rc('text', usetex=True)

depth = 5


def plot_recursive(line, level=0):
    plt.plot(line, [level, level], color="k", lw=10, solid_capstyle="butt")
    if level < depth:
        s = np.linspace(line[0], line[1], 4)
        plot_recursive(s[:2], level + 1)
        plot_recursive(s[2:], level + 1)


if __name__ == '__main__':
    plt.style.use('grayscale')
    fig, ax = plt.subplots(figsize=(8, 3), constrained_layout=True)
    ax.invert_yaxis()

    plot_recursive(line=[0, 1])

    x = [0, 1 / 3, 2 / 3, 1]
    x_labels = ["0", "$\\frac{1}{3}$", "$\\frac{2}{3}$", "1"]
    plt.xticks(x, x_labels)

    y = [0, 1, 2, 3, 4, 5]
    y_labels = ["$\\mathcal{C}_0$", "$\\mathcal{C}_1$", "$\\mathcal{C}_2$", "$\\mathcal{C}_3$", "$\\mathcal{C}_4$",
                "$\\mathcal{C}_5$"]
    plt.yticks(y, y_labels)
    plt.box(False)
    plt.grid(axis="x", linestyle='--', color="#EAEAEA")
    plt.tick_params(left=False, bottom=False)
    plt.margins(y=0.1)

    plt.savefig("cantor_set.png", dpi=300)
