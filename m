Return-Path: <linux-leds+bounces-8566-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yrv6AoTvKWpbfwMAu9opvQ
	(envelope-from <linux-leds+bounces-8566-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 01:13:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C766D530
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 01:13:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ucw.cz header.s=gen1 header.b=rKHLPfdQ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8566-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8566-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ucw.cz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B8E230F694F
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 23:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081E5233954;
	Wed, 10 Jun 2026 23:13:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516831898FB
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 23:12:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133180; cv=none; b=DRZgBwaWz3Tc8ezzJY++DlT5i7/aokNYlyysBzBVQ24QsdskiBxuXk/SG4EbKw/IxVEsYonJjM3gj9gf/lD6lt5uMmV+TVVbCDEuwnBhYVFhON6XU+4NqbkbGMkH76WR+eUG1Hi16c+qUyBZsv3CDASIvTBMpz9FatPaURuLt5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133180; c=relaxed/simple;
	bh=x2w3u68elFhqkinyuYXJoYkQ+RsTTlc3U1Xf8eRKgQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnEiiyDGY4UgbxQaa7WcTZBRHaHWEEGAOVKklTA6/pckXvnajpVAS0IoymIwy3Q2o8i1sLTy7AnArm6KeM9IR3OVLHaS0IgbMBjiLSKM8aEPvk96RlA4+HEIIoD79pTqEWOeIRWfjFEV55/ofubfCZbNZoncDbkg6YQUBILDI7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=rKHLPfdQ; arc=none smtp.client-ip=46.255.230.98
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A92BE327EE9; Thu, 11 Jun 2026 01:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1781132659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=as5nK12NpA4CPp6QlxIOnqvyCmSkgtPLciGWopmTqwY=;
	b=rKHLPfdQ6nWxr2cLfsbI4JwwtTUoMIm+JhqibuMH3Hjzv8qmNZypECxhIy7eEmZMWZmL8q
	466I0wJDljslUR+JsSJePMQNLNLRBnmWVba3azfRlnlocyoH93jzLPscRavXElc7kDj7yM
	oAMrCOv4zA39daV/pMhF01yiq10N6mM=
Date: Thu, 11 Jun 2026 01:04:19 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lorenzo Egidio <lorenzoegidioms@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: tests: clarify name conflict test It is a good
 practice to use a fresh led_classdev instance when doing the testing.
 LED_REJECT_NAME_CONFLICT rather than re-registering the already registered
 LED class device. Besides that, do a zero initialization of led_lookup_data.
Message-ID: <aintc15RHlD5iU2m@ucw.cz>
References: <20260610172107.507-1-lorenzoegidioms@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610172107.507-1-lorenzoegidioms@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-8566-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lorenzoegidioms@gmail.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[pavel@ucw.cz,linux-leds@vger.kernel.org];
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
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E4C766D530

> Signed-off-by: Lorenzo Egidio <lorenzoegidioms@gmail.com>
> ---
>  drivers/leds/led-test.c | 102 ++++++++++++++++++++++++++--------------
>  1 file changed, 66 insertions(+), 36 deletions(-)

NAK.
							Pavel
							

