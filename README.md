# AdGuardHome DNS Filter List<a name="adguardhome-dns-filter-list"></a>

______________________________________________________________________

<!-- mdformat-toc start --slug=github --maxlevel=6 --minlevel=1 -->

- [AdGuardHome DNS Filter List](#adguardhome-dns-filter-list)
  - [What Is This?](#what-is-this)
  - [How Can I Use It?](#how-can-i-use-it)
  - [Which Lists Are Combined Here?](#which-lists-are-combined-here)
  - [Do You Curate the Lists?](#do-you-curate-the-lists)
  - [How Often Is This List Updated?](#how-often-is-this-list-updated)
  - [Whitelist Exceptions You Might Want to Make](#whitelist-exceptions-you-might-want-to-make)
    - [Google Fonts](#google-fonts)
    - [Eve Online](#eve-online)
  - [Last Words](#last-words)

<!-- mdformat-toc end -->

______________________________________________________________________

## What Is This?<a name="what-is-this"></a>

This is a DNS blocklist that can be used for AdGuardHome. (Does not work with Pi-hole)

This list combines more than 80 other lists, including the default lists from
AdGuardHome, into one single list, so you don't have to add countless lists to your
AdGuardHome, but just this one.

## How Can I Use It?<a name="how-can-i-use-it"></a>

Pretty simple, copy this link
(https://github.com/ppfeufer/adguard-filter-list/blob/master/blocklist?raw=true) and
add it to your AdGuardHome DNS blocklists.

## Which Lists Are Combined Here?<a name="which-lists-are-combined-here"></a>

Which lists I'm using here, you can see in hostlist compiler configuration
» [click here](hostlist-compiler-config.json) « or have a look at the table below.

| Name                             | URL                                                                                      |
| -------------------------------- | ---------------------------------------------------------------------------------------- |
| Dandelion Sprout's Anti-Malware List        | https://adguardteam.github.io/HostlistsRegistry/assets/filter_12.txt          |
| HaGeZi's Pro Blocklist   | https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.txt        |
| HaGeZi's Threat Intelligence Feeds DNS Blocklist | https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/tif.txt |
| uBlock filters – Privacy         | https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt        |
| uBlock filters – Resource abuse  | https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt |
| uBlock filters – Unbreak         | https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt        |
| NextDNS Privacy - Alexa          | https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/alexa     |
| NextDNS Privacy - Apple          | https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/apple     |
| NextDNS Privacy - Huawei         | https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/huawei    |
| NextDNS Privacy - Roku           | https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/roku      |
| NextDNS Privacy - Samsung        | https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/samsung   |
| NextDNS Privacy - Sonos          | https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/sonos     |
| NextDNS Privacy - Windows        | https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/windows   |
| NextDNS Privacy - Xiaomi         | https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/xiaomi    |

## Do You Curate the Lists?<a name="do-you-curate-the-lists"></a>

Absolutely not.

All these lists are considered 3rd party from my point of view. I have no influence
over them at all. All I do is combine the lists I was using into one single list, so
my list of blocklists isn't massive. (That was a lot of lists in one sentence ...)

## How Often Is This List Updated?<a name="how-often-is-this-list-updated"></a>

Once a day

## Whitelist Exceptions You Might Want to Make<a name="whitelist-exceptions-you-might-want-to-make"></a>

### Google Fonts<a name="google-fonts"></a>

As stated [here](https://github.com/lightswitch05/hosts#google-fonts) from one of
the lists I am using, you might have to whitelist `fonts.gstatic.com`. To do so, add
the following to your whitelist:

```plainext
@@||fonts.gstatic.com^$important
```

### Eve Online<a name="eve-online"></a>

If you are playing Eve Online by any chance, you also might want to add the
following line to your custom filter rules:

```plaintext
@@||extccp.com^$important
```

## Last Words<a name="last-words"></a>

You are free to use this list, but I can give you no guarantee for it since none of
the lists combined here is managed by me.

If you want to create your own combined list, feel free to fork this repository and
change the hostlist compiler configuration I included to start your own voyage. To
compile the hostlist, use
[AdGuard's HostlistCompiler](https://github.com/AdguardTeam/HostlistCompiler).
