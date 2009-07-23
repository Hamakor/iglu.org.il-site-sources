package MyNavData;

use strict;
use warnings;

use MyManageNews;

my $hosts =
{
    "iglu" =>
    {
        'base_url' => "http://iglu.org.il/",
    },
};

my $news_manager = get_news_manager();

sub get_news_category
{
    my $items = $news_manager->get_navmenu_items('num_items' => 5);
    if (@$items)
    {
        return
        {
            'text' => "News",
            'url' => "news/",
            'subs' =>
            [
                @$items,
            ],
        },
    }
    else
    {
        return ();
    }
}

my $tree_contents =
{
    'host' => "iglu",
    'text' => "My Site",
    'title' => "My Site",
    'subs' =>
    [
        {
            'text' => "Home",
            'url' => "",
        },
        {
            'text' => "About",
            'url' => "about/",
        },
        get_news_category(),
        {
            'text' => "Israeli Resources",
            'url' => "israeli-foss-resources/",
        },
        {
            'text' => "Links",
            'url' => "links/",
        },
    ],
};

sub get_params
{
    return
        (
            'hosts' => $hosts,
            'tree_contents' => $tree_contents,
        );
}

1;
