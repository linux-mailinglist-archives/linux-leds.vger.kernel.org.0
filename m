Return-Path: <linux-leds+bounces-8460-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uCGpC3rXH2p7qwAAu9opvQ
	(envelope-from <linux-leds+bounces-8460-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 09:27:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B361B635341
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 09:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tipi-net.de header.s=dkim header.b=Zoa7geZH;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8460-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8460-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DB7630FEE4F
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 07:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDB239E9C3;
	Wed,  3 Jun 2026 07:18:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAA39DBFC;
	Wed,  3 Jun 2026 07:18:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471108; cv=none; b=dAONig5s+vUGCgoWp+wfT+hXrD5M4x9TXjzQlK8ehgrm6Y88LkKt1G6Jlvv66u8O4683BhQwNtOtdJCOIfGOuvkfEksO6kOcLXUBY4R2ExQ4CKW6GjOZ5Q2FlBUaDZKtSoett1CiloqE8eoFXd1oE3Hi7Hh0dtU5i+O2jgg8Q+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471108; c=relaxed/simple;
	bh=eopH5zYjoqqXWPlP9/1em1VNH5BgMfP/OFiOmHs9DCU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=iu2icVZe8Oo96LLJ/0oVt8gcZ6A8+Nkr6chX8lqwfEEIbYDMG6f0wexGwb2BJCYEd6Y9YvFlNQ3UDZ/JmPuB3AzFJ5Yl/3eXgDBslZyd8Lve8dDRX5EU5wiwVsDO7ILJADgPT6GcO1BiJIz0F+hyJUnPlkVr85JlrX3x/RWgT3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=Zoa7geZH; arc=none smtp.client-ip=194.13.80.246
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24507A03C2;
	Wed,  3 Jun 2026 09:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1780471104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=unD7fVDej0gDVMjXgolcmQ3vJZ292FaMOu0mhGLUp/w=;
	b=Zoa7geZHCSxG7jx+fMSeAIApF6d+/cbc2PcgzMxaBKdgd9n0XmKdTtrCXFIXFnge/HyA7e
	Jpwc/WzlLbwFLBQhHNru1Fw7lQ0CzrDL+QYrWUXzz7CAsfhvPEtkN+naOVv8aaZ9bvhiY8
	ctoCuSydyXnFZxAtkaB4uEcXnEgfnrNeaaf/GEGSjuqMHhO3HAzmqyhm5DnpMPpQ09ktej
	ZyGVur03EYSZUs4TJ/2wsm7mGVTkmw2HL0Uf2S1xUbfQz8Vbn6RJqWoJDGlqWmHpRp2FVN
	2L1OgmXxjSd5cv/eUDuIPiwE/OrY78XlsOy6vy1sdKP7r02Bfs5QF6y5Cauczw==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 09:18:23 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jakub@cloudflare.com, maxime.chevallier@bootlin.com, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, vinicius.gomes@intel.com,
 idosch@nvidia.com, razor@blackwall.org, hare@suse.de, jhasan@marvell.com,
 danieller@nvidia.com
Subject: Re: [PATCH net-next v2 11/11] net: ethtool: make sure
 __ethtool_get_link_ksettings() is ops-locked
In-Reply-To: <20260603012840.2254293-12-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-12-kuba@kernel.org>
Message-ID: <6cedf5898b770e430cb60fa7ae011802@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tipi-net.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:idosch@nvidia.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[tipi-net.de];
	FORGED_SENDER(0.00)[nb@tipi-net.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-8460-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nb@tipi-net.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[tipi-net.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tipi-net.de:mid,tipi-net.de:dkim,tipi-net.de:from_mime,tipi-net.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B361B635341

Hi Jakub

On 3.6.2026 03:28, Jakub Kicinski wrote:
> All drivers which may call *_get_link_ksettings() on ops-locked
> devices from paths already holding the ops lock are ready now.
> Make __ethtool_get_link_ksettings() take the ops lock, and assert
> that it's held in netif_get_link_ksettings().
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  net/ethtool/ioctl.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
> index 49da873b673d..a4b0cbae4063 100644
> --- a/net/ethtool/ioctl.c
> +++ b/net/ethtool/ioctl.c
> @@ -439,7 +439,7 @@ struct ethtool_link_usettings {
>  int netif_get_link_ksettings(struct net_device *dev,
>  			     struct ethtool_link_ksettings *link_ksettings)
>  {
> -	/* once callers fixed - assert ops locked */
> +	netdev_assert_locked_ops_compat(dev);
> 
>  	if (!dev->ethtool_ops->get_link_ksettings)
>  		return -EOPNOTSUPP;
> @@ -456,10 +456,14 @@ EXPORT_SYMBOL(netif_get_link_ksettings);
>  int __ethtool_get_link_ksettings(struct net_device *dev,
>  				 struct ethtool_link_ksettings *link_ksettings)
>  {
> +	int ret;
> +
>  	ASSERT_RTNL();
> 
> -	/* once callers fixed - take the ops lock around this call */
> -	return netif_get_link_ksettings(dev, link_ksettings);
> +	netdev_lock_ops(dev);
> +	ret = netif_get_link_ksettings(dev, link_ksettings);
> +	netdev_unlock_ops(dev);
> +	return ret;
>  }
>  EXPORT_SYMBOL(__ethtool_get_link_ksettings);

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks
Nicolai

