Return-Path: <linux-leds+bounces-8579-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8rWhEJvgK2qMGwQAu9opvQ
	(envelope-from <linux-leds+bounces-8579-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 12:34:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84526678B6A
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 12:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ucw.cz header.s=gen1 header.b=Rf66uNSQ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8579-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8579-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ucw.cz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 970FB31C4454
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 10:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458FF35A933;
	Fri, 12 Jun 2026 10:33:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E138B14F
	for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 10:33:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260388; cv=none; b=tVZy0NyP4jbdi9K8O7PxYxB2kxBWrMEAGrwWLWq5ERaf9NHW2EY9bOtQhgoPhurMf6tOuTGoRQ1aCPkfVo2PO+7OP4ghCQShKSm3ssrsd0k1/dJTxGRNebBS/SMdvSdB+RKT7p63p8w8y4RMe5u7N24bNAVsiqhC9WuPhKf/2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260388; c=relaxed/simple;
	bh=GMIx4i7KrlMIuxS0edaZd61Qyw/um7dSwrmGRPbBKyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sf8rJxcXys7Wts3VpU3wqbovCD3rZgE2QJ623lQFu3/X18w6hLiiZYrGdxgVl5VGfnLLdoVU3fSTPQLlc4XlIeSAoCkKJHNBWvKq6kAMhQ6qViVg/VaTrq4uqgLPTIYirWmfPpmAHoeEU97SsmsxFPOM4NJl2MFu93tVF83ss5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Rf66uNSQ; arc=none smtp.client-ip=46.255.230.98
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id EAD7C327EF1; Fri, 12 Jun 2026 12:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1781260375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lOHlgq2p1fjD0Xmiw+9SJH+AenF7lRtlL4MOJ5bfXo=;
	b=Rf66uNSQRKKQfB1F7gzr9HpS8hZxpBJSPUdBc4tlBUc/lRPTmYot1GbSUtmLjvtXit2mUy
	EuJGFiEZvbJySd9ChS64yQMa/T3hLVTbPGA3NqRYAOwPN1YOdZ4FLsVzCsfPLtw3mjROke
	MH+bNsHpiD6YBjAhwpXIcUtto2Rl43w=
Date: Fri, 12 Jun 2026 12:32:55 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Egidio <lorenzoegidioms@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: tests: clarify name conflict test It is a good
 practice to use a fresh led_classdev instance when doing the testing.
 LED_REJECT_NAME_CONFLICT rather than re-registering the already registered
 LED class device. Besides that, do a zero initialization of led_lookup_data.
Message-ID: <aivgV_T8QCVXs29-@ucw.cz>
References: <20260610172107.507-1-lorenzoegidioms@gmail.com>
 <aintc15RHlD5iU2m@ucw.cz>
 <20260612084519.GE1212816@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612084519.GE1212816@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.05 / 15.00];
	LONG_SUBJ(2.11)[282];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ucw.cz,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ucw.cz:s=gen1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8579-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:lorenzoegidioms@gmail.com,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pavel@ucw.cz,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavel@ucw.cz,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[ucw.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84526678B6A

> /* Sashiko Automation: Reviewed (0 Findings) */

If Sashinko can't see problem with this, Sashiko needs to be fixed.

> > > Signed-off-by: Lorenzo Egidio <lorenzoegidioms@gmail.com>
> > > ---
> > >  drivers/leds/led-test.c | 102 ++++++++++++++++++++++++++--------------
> > >  1 file changed, 66 insertions(+), 36 deletions(-)
> > 
> > NAK.
> 
> Definitely, but can you give the contributor something to work on?

Do we put entire changelog in a message subject? No.

BR,
								Pavel

