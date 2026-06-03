Return-Path: <linux-leds+bounces-8462-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /p/rEmvdH2qPrQAAu9opvQ
	(envelope-from <linux-leds+bounces-8462-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 09:53:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B2635671
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 09:53:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tipi-net.de header.s=dkim header.b=SA6dAGcD;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8462-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8462-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEBAC31A6996
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 07:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FD13FB7C7;
	Wed,  3 Jun 2026 07:29:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512DD3FE668;
	Wed,  3 Jun 2026 07:29:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471771; cv=none; b=IBQj0iImAMf1QEGmP804Eec4gfIi3LkpSwhM6aktXAW4W8BuNKASCUnL37mjhMTaGG2IElHpX7gk6CEzyAY0sDI6GGq0/iBzeBqOSGkXSjqqFGNi2TvUk4XNbG7emQs28woWY3pERcWFnBTJcVzTZgePSbjKKtFfEChRfmYMI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471771; c=relaxed/simple;
	bh=rrJ8nSbCdRvjZeaPceVn4jHgqxAIX0v5RgeoIjy1oAE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YAYpLEXnS2LW/sm4hxD1IL+F6UfsDzq+EILnhkee915kxk8iGyi9pUG7ingbO4YFTLmN8vM8IBq0RZv8FmieImWUNB2fQSPcNRkLjtVp6Bc/ABr9GVbEtW98gODMHaFnnpSMvihRFunaspDnbk4rgoOXM6lAlSvjlpbHK35ONXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=SA6dAGcD; arc=none smtp.client-ip=194.13.80.246
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BE8DA0377;
	Wed,  3 Jun 2026 09:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1780471767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RF0JmXbcqbDHLWl8tXUuj4qadCrHg9eChZuwHplwDKU=;
	b=SA6dAGcD6Ug6wa33Q3wlq7juydyK+Wbs8IjLACBw+iWDS3HSxMPdzemvAn0xD696Mdh9Xd
	UIw6OeadfxG9AWDb1NZoowR/5h10yxZx3nk/tEyQnFzqbjVeeVA1OgfhM9TiZyrk179Him
	9AC20UTxc7f1ue1IvmVc+YOkHoROaj3EpwGf6P9BrQIRO/iPn7ATFEXpo1SwR7SlCbp3T5
	XR0uVO5pkLPGX4L2eThBt9wHhqcZhP6fshcSm2UKnQs0acW4BFfNJa/C33lL0aPsEL5WOL
	qobN46g5/XAn/0IFl5nNenFaJbwOpA7C8DPeGZx3QoA9pe1NwT8vVhNPNaXFmw==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 09:29:24 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jakub@cloudflare.com, maxime.chevallier@bootlin.com, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, vinicius.gomes@intel.com,
 idosch@nvidia.com, razor@blackwall.org, hare@suse.de, jhasan@marvell.com,
 danieller@nvidia.com
Subject: Re: [PATCH net-next v2 01/11] net: rename netdev_ops_assert_locked()
In-Reply-To: <20260603012840.2254293-2-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-2-kuba@kernel.org>
Message-ID: <fffc7ce413fe8a14eaac512b0ba0459e@tipi-net.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-8462-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,tipi-net.de:mid,tipi-net.de:dkim,tipi-net.de:from_mime,tipi-net.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E8B2635671

Hi Jakub

On 3.6.2026 03:28, Jakub Kicinski wrote:
> Jakub suggests renaming the existing assert to match
> the netdev_lock_ops_compat() semantics.
> 
> We want netdev_assert_locked_ops() to mean - if the driver
> is ops locked - check that it's holding the device lock.
> 
> The existing helper check for either ops lock or rtnl_lock,
> which is the locking behavior of netdev_lock_ops_compat().
> 
> The reason for naming divergence is likely that
> netdev_ops_assert_locked() predated the _compat() helpers.
> 
> Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks
Nicolai

