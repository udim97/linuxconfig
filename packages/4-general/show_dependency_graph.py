#!/usr/bin/env python3

import networkx as nx
import matplotlib.pyplot as plt
import sys
from networkx.drawing.nx_pydot import graphviz_layout


def main():
    graph = nx.DiGraph()

    exec(sys.argv[1])

    pos = graphviz_layout(graph, prog="dot")
    nx.draw(graph.to_directed(), pos, with_labels=True, font_size=8)
    plt.show()

if __name__ == "__main__":
    main()
