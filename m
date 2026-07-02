Return-Path: <linux-leds+bounces-8853-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z/+vMSuRRmrPYgsAu9opvQ
	(envelope-from <linux-leds+bounces-8853-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:26:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 335166FA275
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:26:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Boem+Th2;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8853-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8853-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBABA3175870
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 16:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD20233A005;
	Thu,  2 Jul 2026 16:18:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA25A339844;
	Thu,  2 Jul 2026 16:18:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009115; cv=none; b=jHgxesjydP+TroYSxWTyjhyYNvO46JiDmzELgiBouQMj4KekOJzBfcCzDrfsXZCKs3sTh3y+0gU+60zah0d4g9OXY2dU+igqcGLT9x+OFhYMkDCwjdPzL6PuqKEVHISS7VZhRzRLB9CjTVtJb4A1Y7zznmtLkPF5RWIjEhLgMwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009115; c=relaxed/simple;
	bh=kbMVKXOX8SCr6JbCks28PC928ssdxo4qHNutrvGZHUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJDfaqLzjP92B8QvZZ8NYrOPXfLIRfPgkNYM/22n7JcfcljSLCbkRixiFQqgY51lFIyZv3BL79Vx1xWjxNjUMeyzsEluFAftgTziGlhYs3k11AFOKbihmgq1y6Fr4L17RdRGd8+rbvGo829y8KSszh8uyDVSSdRKwYQF3ZBVp3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Boem+Th2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8181F000E9;
	Thu,  2 Jul 2026 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009114;
	bh=IkM3i77YEX756C+1EiUCu7s5eiNq08LZMZb9R/S6UVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Boem+Th2L4HdoWEQTaxNWFMH7uToI7We2Tpm4ZgaNjG5LlRIJUY59A8IPMjF7fuhn
	 FNE0C0yd6ubUt3G98s90QSUZrdIuHvGW7kWfKgYyZgkZiTLdMByC56vhyoJaImJUDe
	 C1eRQUPxmaUs2CusAXna5pu46Bz0iVlySFCQlG1h5NN86hZRcBUZtBUOZG4Da/m2MY
	 qvSi4aUyUC2kuecKH3CO+8AlyeI5SbDa26w2X35rhmihRNIxRf+F1PW5kfZVBWewhC
	 Ej/Xgj74nB1y+sO3gHPQV0yR3w/aEsGvkzN/zsUWAht8t6Qh+ZX5ewdeaZYrWj2TRn
	 Kh1cP2ydiQvaQ==
Date: Thu, 2 Jul 2026 17:18:28 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 00/14] mfd: lm3533: convert to OF bindings, improve
 support
Message-ID: <20260702161828.GB2108533@google.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8853-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 335166FA275

On Wed, 17 Jun 2026, Svyatoslav Ryhel wrote:

> Convert LM3533 to OF bindings, add missing VIN supply, add support for
> setting mapping mode and LED sources based on device tree. 
> 
> ---
> Changes in v2:
> 
> schema
> - maximum led sources for leds set to 4
> - anyOf > oneOf in ALS
> - improved ALS descriptions
> - adjusted example
> drivers
> - dropped devm convertion of irq and mfd helpers
> - all als configuration moved into lm3533_als_setup
> - added regulator/consumer.h
> - lm3533_bl_setup set before sysfs_create_group in backlight
> - added check if LVLED is valid
> - LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLED5

This set looks good to me now.

Let me know when you have all of the Acks and I'll merge it via MFD.

-- 
Lee Jones

