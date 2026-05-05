Return-Path: <linux-leds+bounces-8006-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMomBDoI+mkEIgMAu9opvQ
	(envelope-from <linux-leds+bounces-8006-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 17:09:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA14CFFB6
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 17:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BCB430CCF6A
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 15:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6C248097A;
	Tue,  5 May 2026 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lazprdTv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7A480971;
	Tue,  5 May 2026 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993342; cv=none; b=SEAC7ErBfVUpZTPD+P2dzgpbApLCNDugU8wPjuqQGgkf7hB/ReTO5hBDyLGrNGX29xndD0hbBGT7GSJqj2Ij3O0f0RwWgSBV7fhFytnJSOWoaGH6CFyWkYkWgyhsQbpW1MmX6etXYsqZSzzuXIBnUWupKpZ9nE7p0v/tw62L470=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993342; c=relaxed/simple;
	bh=eS08/QgzE3JbtlTNsuaiLEoeEhYoU1U2MF4qhRHE0Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qvdb0PZef+Ph1z0xpyHPqVZl/i2mKkLLCVhqd9+dAH20knSHEpNzd1jA3fqFJbLfYS89KyRsHQTtInq8vKpRuPtaZRI1uSR4N7Ea2an3xBqBExmUMZciaOHRqvxCK/dPt9Ba0hyfE8bmEGq7m6CUQwf17huQTBFc+Wb3w48q1VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lazprdTv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE28C2BCF4;
	Tue,  5 May 2026 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777993341;
	bh=eS08/QgzE3JbtlTNsuaiLEoeEhYoU1U2MF4qhRHE0Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lazprdTvVHFYN0YWddYG3A+WsXHlfN59MJt9MRCbgKQYUkIatoZ9/dlrrcCYeTxun
	 c8ReBGxtigw1Ldey+xKqTN1WlUsBtNiqZSsHf5P3SFTR6WAD9uMppjX9teFaHlXMOS
	 bGlJ7v3a1QHFwxjgBHy7mSYQc+zg7+PlSGv9mc+usD01t/7QVa7TY4/IRo2CbUuUkb
	 QHgwEWd5lu2VPC1wdeUWSkBaat4l54UpLWI3qz4BAjtYzZ+kYehCJfoiUGzs7Y9Rr1
	 0KJZUaGKLYxDH65FCvlKSqKxR7KUO598QIuBGJQdXOxvEnQiYVOY+3I59I1UFij8Hm
	 OQINZn9hcZY+w==
Date: Tue, 5 May 2026 16:02:17 +0100
From: Lee Jones <lee@kernel.org>
To: "Escala, Edelweise" <Edelweise.Escala@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Message-ID: <20260505150217.GD2661693@google.com>
References: <20260417-ltc3220-driver-v6-0-18157871eddd@analog.com>
 <20260417-ltc3220-driver-v6-2-18157871eddd@analog.com>
 <20260430171145.GA2661693@google.com>
 <DS0PR03MB7228ACA655995A9CAC025B35ED312@DS0PR03MB7228.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR03MB7228ACA655995A9CAC025B35ED312@DS0PR03MB7228.namprd03.prod.outlook.com>
X-Rspamd-Queue-Id: 96DA14CFFB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8006-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, 04 May 2026, Escala, Edelweise wrote:

> Hello Lee,
> 
> Thank you for the review.
> 
> > > +static const struct regmap_config ltc3220_regmap_config = {
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +	.max_register = LTC3220_GRAD_BLINK_REG, };
> > 
> > .cache_type?
> > 
> 
> I will add 
> .cache_type = REGCACHE_FLAT,

No need to reply to review comments that you agree with.

-- 
Lee Jones

