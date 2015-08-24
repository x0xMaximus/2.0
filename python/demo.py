import datetime

class Issue():

    def __init__(self, **kwargs):
        self.__dict__.update(kwargs)

    def publish(self):
        return ('This is the {0.pubdate:%B %d, %Y} issue of {0.title}. ' +
                'It is {0.pages:,} pages long, and ' +
                'costs ${0.price:.5}. ' +
                'It is about {0.subject}.').format(self)

if __name__ == '__main__':
    bbw = Issue(title='Bloomberg Businessweek',
                price=5.99,
                pages=112,
                pubdate=datetime.datetime(2015, 6, 15),
                subject="code")
    print(bbw.publish())
