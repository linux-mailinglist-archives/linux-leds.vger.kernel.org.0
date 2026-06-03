Return-Path: <linux-leds+bounces-8463-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id COIaHOLlH2oOsAAAu9opvQ
	(envelope-from <linux-leds+bounces-8463-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 10:29:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002C635B43
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 10:29:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=blackwall.org header.s=google header.b=DbqgEAUJ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8463-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8463-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C03230207D6
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 07:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8145E36F91E;
	Wed,  3 Jun 2026 07:55:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBF6402453
	for <linux-leds@vger.kernel.org>; Wed,  3 Jun 2026 07:55:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473304; cv=none; b=KNa04hMYpkiXpsmHQCcAiF4J89bvfHUNR+VSh9Ybo8OpjaAOQ99UL/fzERdfdd15iuZDJTtRhp93fhbFPeu4n4F44m8AgWnyHqwWtzXJgqZD+KWHli9bLyV7FR4dHMPidtVLhRmCg53U5rlW4lUxBYhJOIsBq/BlRrge8aNDGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473304; c=relaxed/simple;
	bh=bf2/JwpQWD28xonEaanPrW5K427APXwU9FOB9VhG6XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgWRQb7rAJcFuq1QZqqK9DIpUWzpUtrwNTLVL3YDZ0O6OYhl2MqXrJmqZtyIQpbOyGwxBw4W9XTIvmVqGd5PkphaAy/Z7MVmCCkSWLL5MZaZncXsyGdSWdShUa9jLivw0DX104k23u7OXLFTfXtK/xQLQMEki/FrgoWkAavLpkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=DbqgEAUJ; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b3e03939so3096445e9.1
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2026 00:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1780473299; x=1781078099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wT5gJlr8gJU4Zg/k/veBZUjxGWuT2RFVJgAw37fV/Es=;
        b=DbqgEAUJOPWkmk2ACD4xC8i/MTc3gRHHC3exd3KuGJQqFVXtesk71sOzlGFAmeHC1G
         IXrLGIwM+ZG69rVZh94hUMh1h2Oc1m1NfHWKXHiKZCSA4rGRGEo1+UFAT2lt47+2gcel
         Y20advU9dV+kDdWSlRdvIGXSdsmqJqpA19GJtyuDl43pIe2JVZqzAzQxMbpsv5OTxJ6V
         tdsmNhmg7RncL0GsDufTWk+W2CCmRSVbYWjF/ho9Hh8yhMv+EfNqjuKeCJEQ2LEOfOrn
         F3HI+yr34cIvwHU7gCJuEKvXPcv0djsNCqj7zEQA2tyUtU85Sb6IMcOQdUjCkXXsqj0V
         Zbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473299; x=1781078099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT5gJlr8gJU4Zg/k/veBZUjxGWuT2RFVJgAw37fV/Es=;
        b=HQR7XQIwebYQ/B/Q5Q2zUmb3uyZdwoRJBTyNZBrPL7Vo0b4qoIDvWNXt5boQHWbPSV
         zbK3oSTY/SszPa837I6hA9288iLdxW7k9l66gUcnzzck+R5WpRTmNoH6V795Cp7zZlje
         OKaaTFYi9vsNDcS32+019ry5cW2rFcLl3JOrt9dPUpBgY3N5VBlv/kYpCUl1OmqwUSIo
         a2unNJEkddBXhckMOCoUJqOryQvnMUaZgBcq+XJsAbpHGXR5BJP1K3Si8mp4at8vLP8d
         nuSqxEJScaZrbZ0e4xlTDuPJr3C/KKUBHgLGAMH/+mUmHU27dfYdVpKIMk/gSneEtRn1
         i9fQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xc/qI0Klr8lzq3voJqZyFNomG7H4aZktFE7Qg/Sxyw8oObUwUaaIOQAu0XK59MCcEqpgoGpMO04Ss@vger.kernel.org
X-Gm-Message-State: AOJu0YwkyPpeNEycQY/khA19Dx1Ue8nJ5qmyYSINzeMi3Vu14KsuDIPc
	K49C6/N4PEpeleUpBIpb8/yrjwywJvAAvtwcvIrszPHZih43c5PvH7nqVbZLnwo4drc=
X-Gm-Gg: Acq92OGBlP+VrQ80c+224h8in+q4Wah3QBRjE5NTWiS13g3lSFfHDFxyi5JK8UQnrYE
	+0ldZhGz2LcdfaALIOXOHihtpXQeR/4Myt/rrH1XQaaYPNVTWvzA7kOWtgaFv3V3+HcamAgqOGH
	hqAvcRY+rY21GHjMVsQsZ4fkfOEm47t5ALLR1203fYyoytqOY+S7b7uiAdhFstgzImgbQf3xuFa
	Pw8Wfy7WIDNlq/BVCCelg5Re5lIsn3Il6ciZ6SL6Fuw4xfS6EZPHHi99KOylgC79L+f+OZrrui/
	g79hvY7s+qZrufNao7I0ajraiRQs3MUceWhnQ9MHRgYDRz2i7Ejtl2+hQzAj2XJd5//qIvr7O0x
	eh1pqK38xfp986EeducfmtFy1IgtWOEN+LEFYmzVbm9MS9PXQQ4nJNGU3AvyA3+2Hd69+jFv9W5
	4Cn1Bk+to6RkIGWkV7bwNncGBuVkwAcNt7GclBUs7a40655qP4AkguJtDiBqRIgi4W
X-Received: by 2002:a05:600c:458b:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490b6128dc3mr30990335e9.7.1780473299633;
        Wed, 03 Jun 2026 00:54:59 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm115325225e9.6.2026.06.03.00.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 00:54:58 -0700 (PDT)
Message-ID: <efcb9ef1-3996-4e49-9c71-7dc2a3edc5ab@blackwall.org>
Date: Wed, 3 Jun 2026 10:54:56 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/11] net: bridge: don't recurse on the
 port's netdev ops lock
Content-Language: en-US, bg
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, jakub@cloudflare.com,
 maxime.chevallier@bootlin.com, nb@tipi-net.de, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, vinicius.gomes@intel.com,
 idosch@nvidia.com, hare@suse.de, jhasan@marvell.com, danieller@nvidia.com
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-8-kuba@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260603012840.2254293-8-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[blackwall.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8463-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:nb@tipi-net.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:idosch@nvidia.com,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[razor@blackwall.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[blackwall.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[blackwall.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[razor@blackwall.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,blackwall.org:mid,blackwall.org:dkim,blackwall.org:from_mime,blackwall.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7002C635B43

On 03/06/2026 04:28, Jakub Kicinski wrote:
> port_cost() calls __ethtool_get_link_ksettings() on the port device,
> which will soon take the port's ops lock. br_port_carrier_check()
> is reached via the NETDEV_CHANGE notifier from linkwatch, which
> already holds the port's ops lock, so the call would deadlock.
> 
> Make port_cost() expect the port's ops lock held and switch to
> netif_get_link_ksettings(). The only other caller is new_nbp(),
> make sure it takes the lock explicitly.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>   net/bridge/br_if.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/net/bridge/br_if.c b/net/bridge/br_if.c
> index d39571e13744..049d1d25bc26 100644
> --- a/net/bridge/br_if.c
> +++ b/net/bridge/br_if.c
> @@ -19,6 +19,7 @@
>   #include <linux/if_ether.h>
>   #include <linux/slab.h>
>   #include <net/dsa.h>
> +#include <net/netdev_lock.h>
>   #include <net/sock.h>
>   #include <linux/if_vlan.h>
>   #include <net/switchdev.h>
> @@ -30,13 +31,13 @@
>    * Determine initial path cost based on speed.
>    * using recommendations from 802.1d standard
>    *
> - * Since driver might sleep need to not be holding any locks.
> + * Since driver might sleep, we need to not be holding any bridge spinlocks.
>    */
>   static int port_cost(struct net_device *dev)
>   {
>   	struct ethtool_link_ksettings ecmd;
>   
> -	if (!__ethtool_get_link_ksettings(dev, &ecmd)) {
> +	if (!netif_get_link_ksettings(dev, &ecmd)) {
>   		switch (ecmd.base.speed) {
>   		case SPEED_10000:
>   			return 2;
> @@ -436,7 +437,9 @@ static struct net_bridge_port *new_nbp(struct net_bridge *br,
>   	p->br = br;
>   	netdev_hold(dev, &p->dev_tracker, GFP_KERNEL);
>   	p->dev = dev;
> +	netdev_lock_ops(dev);
>   	p->path_cost = port_cost(dev);
> +	netdev_unlock_ops(dev);
>   	p->priority = 0x8000 >> BR_PORT_BITS;
>   	p->port_no = index;
>   	p->flags = BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD | BR_BCAST_FLOOD;

LGTM,
Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


