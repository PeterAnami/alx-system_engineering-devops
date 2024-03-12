#!/usr/bin/python3
"""Parses the title of all hot articles, and prints a sorted count of given
keywords (case-insensitive, delimited by spaces. Javascript should count as
javascript, but java should not).
"""
import requests


def count_words(subreddit, word_list, after="", word_count={}):
    """Parses the title of all hot articles, and prints a sorted count of given
    keywords (case-insensitive, delimited by spaces. Javascript should count as
    javascript, but java should not).
    """
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)\
               AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77\
               Safari/537.36"}
    params = {"limit": 100, "after": after}
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    if response.status_code == 200:
        for post in response.json().get("data").get("children"):
            title = post.get("data").get("title").lower().split()
            for word in word_list:
                if word.lower() in title:
                    if word in word_count:
                        word_count[word] += 1
                    else:
                        word_count[word] = 1
        after = response.json().get("data").get("after")
        if after is None:
            if len(word_count) == 0:
                return
            for key, value in sorted(word_count.items(),
                                     key=lambda x: (-x[1], x[0])):
                print("{}: {}".format(key, value))
            return
        return count_words(subreddit, word_list, after, word_count)
    else:
        return
