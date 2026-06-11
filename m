Return-Path: <linux-leds+bounces-8575-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vQRpEGDEKmoewgMAu9opvQ
	(envelope-from <linux-leds+bounces-8575-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 16:21:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A12672A90
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 16:21:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HvoK8CcD;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8575-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8575-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FE453078FD0
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 14:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F1840801D;
	Thu, 11 Jun 2026 14:20:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96F818FC97;
	Thu, 11 Jun 2026 14:20:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187640; cv=none; b=hB4bE8phstSevKraMwcg2gg1/FBF2MoGcmopP47g4iRFRiIY4LnKf1p8I97WKu6GJFOevd8NJwsqxqibiS+GfRnnpY3ZKxJdoqsqLE9eZ6W/3hB0kMKck70oF6guCfkS4TAkqbJ62zPAyE8FFCtHnoMfwNgLpp+39yNg9HnLPrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187640; c=relaxed/simple;
	bh=ADQz79wsdx0K9pSTvhRv4OP57hiPtzgG1Gdz9YO0Smk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSCjOq9hLO7S14XDApyTWpG8PDq0axnj9qoKUfezkZyh577bLOXy9xNxXsvITr7am+PLXQJ2c41XyNkxvHtBqxX6lKc+cms9E6RIX8P155vmfXBTaHVEjTZLv8SY++vWgjPKrbcr9mA0K9W+M841iuOzCXcxEGPmRYatlNGPl+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvoK8CcD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428251F00893;
	Thu, 11 Jun 2026 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781187639;
	bh=v2gjtL3A5CRGLr5EDM+cgnB3UKQPGTOj7Fa8nWv3OBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HvoK8CcD/1QEh/SAWVVdiKVHVlLEUy0sEBvE0xhESVAAiWhUMY7rUDoOD6EFWOTZ4
	 sBQt8RtWPJhw3PrpxD7jq13kw+wQ+b62TUcbKqTwQbKGK9rUkPwQq1ePj0cLq5TzIQ
	 fIZG3NNkFvs/0S7+pNFxm22FnFAl7u2YNy+VMhlRGHIOCEt7yt0RkZTC8SCYMV81c6
	 25oWhFQG4H9RXQjXk69vNbF6uH2aaBG/gtLvPQuAPGx/0KIIU00mHEA5yXS24NfHFg
	 6ipWUo4W3o06kYqXWr0gmhVFuw8hMnAqABuwiGEQ46aURJiOxGuc9TEbq7PwOfQ18S
	 S9f8wukwH7A4g==
Date: Thu, 11 Jun 2026 15:20:32 +0100
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <20260611142032.GA1127823@google.com>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <20260520200337.204431-2-mike.marciniszyn@gmail.com>
 <d2faba3d-68ed-492f-a914-d513e9f8b34f@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2faba3d-68ed-492f-a914-d513e9f8b34f@lunn.ch>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8575-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:mike.marciniszyn@gmail.com,m:pavel@kernel.org,m:alexanderduyck@fb.com,m:kuba@kernel.org,m:kernel-team@meta.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:linux@armlinux.org.uk,m:daniel@makrotopia.org,m:kees@kernel.org,m:horms@kernel.org,m:dimitri.daskalakis1@gmail.com,m:jacob.e.keller@intel.com,m:lee@trager.us,m:mohsin.bashr@gmail.com,m:alok.a.tiwari@oracle.com,m:dg573847474@gmail.com,m:andriy.shevchenko@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:mikemarciniszyn@gmail.com,m:dimitridaskalakis1@gmail.com,m:mohsinbashr@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,intel.com,trager.us,oracle.com,linux.intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lunn.ch:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95A12672A90

On Wed, 20 May 2026, Andrew Lunn wrote:

> On Wed, May 20, 2026 at 04:03:35PM -0400, mike.marciniszyn@gmail.com wrote:
> > From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>
> > 
> > Add 25G, 40G, 50G, and 100G as available speeds to the netdev LED trigger.
> > 
> > Signed-off-by: Mike Marciniszyn (Meta) <mike.marciniszyn@gmail.com>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Should I wait until the net reviews are satisfied or take this right away?

-- 
Lee Jones

