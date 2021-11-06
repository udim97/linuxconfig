#!/usr/bin/env python3

import networkx as nx
import matplotlib.pyplot as plt

['. ./listeners/dispatcher.h',
 '.. ./listeners/service.h',
 '... ./message/message.h',
 '... ./utils/buffer_builder.h',
 '.... ./utils/buffer_builder.tpp',
 '..... ./logger.h',
 '... ./utils/buffer_consumer.h',
 '.... ./utils/buffer_consumer.tpp',
 '.. ./listeners/controller.h',
 '.. ./pipe/PriorityPipe.h',
 '. ./pipe/PipesManager.h',


def main():
    graph = nx.Graph()

    nx.draw_networkx(graph)
    plt.show()

if __name__ == "__main__":
    main()
