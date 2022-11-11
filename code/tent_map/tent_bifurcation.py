import numpy as np
from matplotlib import rc
import matplotlib.pyplot as plt

# Use LaTeX throughout the figure for consistency
rc('font', **{'family': 'serif', 'serif': ['Computer Modern'], 'size': 16})
rc('text', usetex=True)

# Configuration
N = 1000

if __name__ == '__main__':
    plt.style.use('grayscale')
    plt.rcParams['figure.constrained_layout.use'] = True

    # Horizontal axis values
    mus = np.linspace(1, 2, N)

    img = np.zeros([N, N])

    # Start with x0 = 0.4
    X = 0.4 * np.ones(N)

    # Iterate 1000 times
    for i in range(1000):
        X = mus * np.minimum(X, 1 - X)

    # Plot next 100k iterations
    for i in range(100000):
        X = mus * np.minimum(X, 1 - X)
        for k in range(0, N):
            mu = mus[k]
            y = N - int(N * X[k]) - 1
            img[y][k] = img[y][k] + 1

    img = 1 - (img / img.max(axis=0))
    plt.xlabel("$\\mu$")
    plt.ylabel("$x$")
    plt.imshow(img)

    plt.savefig("tent_bifurcation.png", dpi=300)
