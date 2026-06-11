Return-Path: <linux-leds+bounces-8576-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4/EaNivSKmoexgMAu9opvQ
	(envelope-from <linux-leds+bounces-8576-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 17:20:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2437367303A
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 17:20:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=1DxwRBuT;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8576-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8576-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lunn.ch;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00949338BB99
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 15:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF803F23B5;
	Thu, 11 Jun 2026 15:19:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1883BB117;
	Thu, 11 Jun 2026 15:19:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781191187; cv=none; b=dEev6eRZXNVDBegN1iyFXJCaabSALKqPnaLurjhfE+5rv/fF/kD5MtQRg3dakGsHD+pSmsssTQ2gLA+XVnia4Bqf4MZbmPW5XCIm5Yhqe5Bve5psC6c5m+s/eQ7FEnMbSJNgrqiMJyBTQPHCtBghfjKz9glLPQ0SZF2rgWaIk3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781191187; c=relaxed/simple;
	bh=g0j5kM2+dWRBDaBxQMPzIpkd8P9s0+184WoorrF5rm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQn+sYGq/v3TbTD/ZFLmi6OeR7SCoSMU6jtfKjBKhmtW5z+VZymxvbu7Iigd7hRHVmOdzp02E1tCpBzlbvoUODxKOOObLwbUCvDKdnYq9kuMfdZWyH8um5f/1eb1OrOjKzkkWmkObxvZHhP6ZQYFkUeIFtc8uFpJavnxzQKGKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1DxwRBuT; arc=none smtp.client-ip=156.67.10.101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=A8565lvtNHBzjTCVx5zEc6Kacc1WY5y9OqG0mhhu3FM=; b=1DxwRBuTj1XXGDxcfwXvdccpkN
	XG88qvNl9KZ9zGOaDZN/AytLazr44xrMd02D7R1tO5UrYlH43Kj1sJtDqASdTdv0tXGo+ZjsoQUSy
	KkrnBSJRbbRjrxGma7OSnFvgb7HzG+o9S9JJnmscMiNfrlwmyUyOdS8ptHVGvi8nu1N4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wXhBe-007B3U-Rb; Thu, 11 Jun 2026 17:19:18 +0200
Date: Thu, 11 Jun 2026 17:19:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: mike.marciniszyn@gmail.com, Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>, Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>, Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] leds: trigger: netdev: Extend speeds up to
 100G
Message-ID: <6a935882-31e2-4953-af9a-0e9791fe5d30@lunn.ch>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <20260520200337.204431-2-mike.marciniszyn@gmail.com>
 <d2faba3d-68ed-492f-a914-d513e9f8b34f@lunn.ch>
 <20260611142032.GA1127823@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611142032.GA1127823@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8576-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:mike.marciniszyn@gmail.com,m:pavel@kernel.org,m:alexanderduyck@fb.com,m:kuba@kernel.org,m:kernel-team@meta.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:linux@armlinux.org.uk,m:daniel@makrotopia.org,m:kees@kernel.org,m:horms@kernel.org,m:dimitri.daskalakis1@gmail.com,m:jacob.e.keller@intel.com,m:lee@trager.us,m:mohsin.bashr@gmail.com,m:alok.a.tiwari@oracle.com,m:dg573847474@gmail.com,m:andriy.shevchenko@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:mikemarciniszyn@gmail.com,m:andrew@lunn.ch,m:dimitridaskalakis1@gmail.com,m:mohsinbashr@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,intel.com,trager.us,oracle.com,linux.intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2437367303A

On Thu, Jun 11, 2026 at 03:20:32PM +0100, Lee Jones wrote:
> On Wed, 20 May 2026, Andrew Lunn wrote:
> 
> > On Wed, May 20, 2026 at 04:03:35PM -0400, mike.marciniszyn@gmail.com wrote:
> > > From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>
> > > 
> > > Add 25G, 40G, 50G, and 100G as available speeds to the netdev LED trigger.
> > > 
> > > Signed-off-by: Mike Marciniszyn (Meta) <mike.marciniszyn@gmail.com>
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> Should I wait until the net reviews are satisfied or take this right away?

This one can be merged any time. The speeds are generic, so even if
they are not used now, they can be in future.

     Andrew

