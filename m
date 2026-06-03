Return-Path: <linux-leds+bounces-8461-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 84VcAQ/bH2rZrAAAu9opvQ
	(envelope-from <linux-leds+bounces-8461-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 09:43:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E355463554E
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 09:43:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tipi-net.de header.s=dkim header.b=QCym67S5;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8461-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8461-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8C4630AFD75
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 07:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBD13A168C;
	Wed,  3 Jun 2026 07:21:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32DC39B95D;
	Wed,  3 Jun 2026 07:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471260; cv=none; b=cK/Yy0PQZ0B2zFUaLeiJJmlvGv2mF6qlM+lmrgrnP9spPnNiRGMkwSzk+TW7uGp2+CYabJ9E90D7dupWxfIQlJlz2mmlFF0hK/5bCGfvNV3IJc/NgfOiirG3HkbUShb1vob84gBJ3jjmMTywcpglgmRhVKHDriS2pGiprhaR0I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471260; c=relaxed/simple;
	bh=Y9vLGOj4ICVsi17I/8jLeBr4sz39f6x5VIQKq1H427s=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lvQANtfPp9tVsxJ9Ktbm/EaqCP3tNr09J2xBWhdIbtefXHYqlT/4Qh+cT8jKO/29LE6yu2h8UeCUs1nycfWUOv5imT3Cv1UmzM6qtag27M1Wzv2n1poTVXBshaXGYrug0KaO040lgJSChSmkwg8dKIcQXrL3OJia6OrJL9pX78Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=QCym67S5; arc=none smtp.client-ip=194.13.80.246
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D48CFA03C2;
	Wed,  3 Jun 2026 09:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1780471256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d78Y0rgghtQryF8HguMHQnLEcRVBz4Hrp5YENnoJQhg=;
	b=QCym67S58FjOuEiGfvlJ1bmXrz/iX6ycC5Pyux2crsXKFpfDSv8WW9hXZiicGmnjUM9CWi
	W4zJORwBjTxD8ZoohvaXLdRsfw+sF6PwKsY1gElTIHJ0G/JdQVvL1N5O1Qj6hA6FQMSKph
	aA41En1Rl77YjsxjG69Yn11z8Y+a5IFblULSqm3xdIEKdJWRhRHaD5QMlho8sKaP1mAD+M
	TRIxU0bCjX5en/YqijlAvU1fQ6HU9qS3wqFwHep7RLryih6GQm5qFO/AKwJIR4Yd0ON84c
	02BxjsJ1H4/3Lqx8b5hMDSjYLuGEXyWKCsl1ZI2A5kJa7Ipazv64DF19dgJDdw==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 09:20:53 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jakub@cloudflare.com, maxime.chevallier@bootlin.com, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, vinicius.gomes@intel.com,
 idosch@nvidia.com, razor@blackwall.org, hare@suse.de, jhasan@marvell.com,
 danieller@nvidia.com
Subject: Re: [PATCH net-next v2 05/11] net: bonding: don't recurse on the
 slave's netdev ops lock
In-Reply-To: <20260603012840.2254293-6-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-6-kuba@kernel.org>
Message-ID: <ab1671e499127b38a7ee3cdfe5038143@tipi-net.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tipi-net.de];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:idosch@nvidia.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nb@tipi-net.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-8461-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tipi-net.de:mid,tipi-net.de:dkim,tipi-net.de:from_mime,tipi-net.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E355463554E

Hi Jakub

On 3.6.2026 03:28, Jakub Kicinski wrote:
> bond_update_speed_duplex() calls __ethtool_get_link_ksettings() on
> the slave, which will soon take the slave's ops lock. One of its
> callers already holds it and the other three don't, so the function
> would either deadlock or run unprotected depending on the path.
> 
> Make the helper expect the slave's ops lock held and switch to
> netif_get_link_ksettings(). Wrap the three call sites that don't
> already hold it:
> 
>   * bond_enslave() (rtnl held; core drops the lower's ops lock
>     around ->ndo_add_slave).
>   * bond_miimon_commit() (rtnl_trylock'd from the mii workqueue).
>   * bond_ethtool_get_link_ksettings() (rtnl held via ethtool layer,
>     bond device itself is not ops locked).
> 
> The call site which does already hold the ops lock is
> bond_slave_netdev_event() via NETDEV_UP / NETDEV_CHANGE notifiers,
> so it stays as-is.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks
Nicolai

