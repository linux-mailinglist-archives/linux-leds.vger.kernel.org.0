Return-Path: <linux-leds+bounces-8559-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2iGmFAp+KWpjXwMAu9opvQ
	(envelope-from <linux-leds+bounces-8559-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 17:08:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C94F66A904
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 17:08:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lht.dlh.de (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8559-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8559-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5162E301426E
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 15:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D6E423148;
	Wed, 10 Jun 2026 15:06:06 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E726421EF4;
	Wed, 10 Jun 2026 15:06:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103966; cv=none; b=ItlTgA5SzcgnvuJLa0D3+7fQG3PBmWQcPzjAuG34o6YhcDj55LepokkhO1RmmG6/ftI/xWWWZuwXpvKt4QKQnYFdH91lDYpU+eawLLDap7TgixjMT25rVMnWwgqQIdXfUV2sy2tL6AwIqHBsBYCvkttcPNPg2s86EKeV8xuqFA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103966; c=relaxed/simple;
	bh=UWRW32+0hl/mCIAcvobwjdGt/K4xR7gQPKvVr+2Ti+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XE+QZ6Xj7KSCF/Fqzlv8a0qzBqBzf43T0WbY+2jSOj6xrJUvz39siExYb5B/9cVzXnH5wu2uNE1b4+wJCThhfQyn6w8XG9yXmNOHAiuEsu+SxjQlXax/N4mFBsJ79fFssm3Q6GlMujxUI6rzJ2/7e8CAbZrsL1BYODO0oYHP17c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.10
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 93DD94CDDA;
	Wed, 10 Jun 2026 17:05:59 +0200 (CEST)
Received: from OMT-CWNXR4TFW5-LHT (unknown [213.61.141.186])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 96E922003C6;
	Wed, 10 Jun 2026 17:05:46 +0200 (CEST)
Date: Wed, 10 Jun 2026 17:05:41 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, Pavel Machek
 <pavel@kernel.org>, linux-kernel@vger.kernel.org, Alban Bedel
 <alban.bedel@lht.dlh.de>
Subject: Re: [PATCH v2] leds: class: Use firmware nodes for device lookup
Message-ID: <20260610170541.5d3b20d3@OMT-CWNXR4TFW5-LHT>
In-Reply-To: <ailv8Yry41NYu54e@tom-desktop>
References: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
	<20260520152225.GH2767592@google.com>
	<aignTNlK5kCLmQ2A@tom-desktop>
	<20260609185132.1fcdab00@omt-cwnxr4tfw5-lht.ads.dlh.de>
	<ailv8Yry41NYu54e@tom-desktop>
Organization: Lufthansa Technik AG
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-apple-darwin25.4.0)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[lht.dlh.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8559-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:linux-kernel@vger.kernel.org,m:alban.bedel@lht.dlh.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alban.bedel@lht.dlh.de,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C94F66A904

On Wed, 10 Jun 2026 16:08:49 +0200
Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:

> Hi Alban,
> Thanks for your comments.
> 
> On Tue, Jun 09, 2026 at 06:54:29PM +0200, Alban Bedel wrote:
> > On Tue, 9 Jun 2026 16:46:36 +0200
> > Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> >   
> > > Hi Lee,
> > > Thanks for your patch.
> > > 
> > > On Wed, May 20, 2026 at 04:22:25PM +0100, Lee Jones wrote:
> > > [...]  
> > > > What happens if fwnode_property_match_string() returns an
> > > > error?    
> > > 
> > > Agree.
> > > 
> > > I think we need to check index:
> > > 		if (index < 0)
> > > 			return ERR_PTR(-ENOENT);  
> > 
> > I don't think that's the right solution. The documentation of
> > fwnode_property_get_reference_args() says that it return -ENOENT
> > when the index is out range. So it looks like the OF implementation
> > has a bug.
> > 
> > Looking at of_fwnode_get_reference_args() it directly pass the
> > return value of __of_parse_phandle_with_args(), which return
> > -EINVAL when the index is out of range. We should rather fix the OF
> > implementation of fwnode_property_get_reference_args() to respect
> > the documented interface.  
> 
> Maybe into of_fwnode_get_reference_args() first thing to do is to
> check index with:
> 
> 	if (index > INT_MAX)
> 		return -ENOENT;

Either that or fix it in __of_parse_phandle_with_args() which currently
return -EINVAL for negative indexes. It is used for all variations of
of_parse_phandle_with[_fixed|_optional|]_args() but none of these
documented their error values.

A quick search showed that the vast majority of users either pass a
constant index or a value from a loop under their control, so those
would not be affected by such a change. From the one left all the one I
checked overwrote the returned value with either -ENODEV or -ENOENT,
but I haven't checked them all.

I would tend to do the fix in __of_parse_phandle_with_args() as I don't
really see the value in differentiating negative index from too large
ones in this API.

Alban

