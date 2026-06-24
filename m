Return-Path: <linux-leds+bounces-8719-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XkiLH6yrO2pwbAgAu9opvQ
	(envelope-from <linux-leds+bounces-8719-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 12:04:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA986BD2EC
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 12:04:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WsA3GFLl;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8719-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8719-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBAC53018747
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 10:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD483B14D2;
	Wed, 24 Jun 2026 10:04:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961503ACF0C;
	Wed, 24 Jun 2026 10:04:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295453; cv=none; b=hZtX/E0BfyxanooFp+H2pSEiuchh+BTL2eBj1x/bSdYHK5uvdeZqAwPrpYkPbKBHITWerbOuHdg7AB8W11VcUhtzRyVKuAUDnrIqdpT/Tmz+aalqku3I7vs6OLJRRx0S/dlFp8xRWlnZBIRjoJYye8c6G4nT4wlBwZW7X1375xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295453; c=relaxed/simple;
	bh=V2xL5spx0Bw3nq5DCJ41peJmadVLewOTsGrgOweshTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWaKp0a6zrRlU3U2qj8oDx3o9v/BtDCltoxRH5S/ucFHhM+GSJUHA+8gvn+1EBGapOksYwFNQXkYsxxxA/Lz6ZH1KQKCUw++BBhbZtF78cQhGWB35MBru6512bhhWv/tIcEWyz1EHxy795Ih591uJN9uizXFZnFascGTLIcrVEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsA3GFLl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A861F000E9;
	Wed, 24 Jun 2026 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782295451;
	bh=V2xL5spx0Bw3nq5DCJ41peJmadVLewOTsGrgOweshTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WsA3GFLl8oEmpAYbgnyy1sjrM/OUy2YwTdbA/HqXIeqPekL7nXV49/ZuidyAKBwPH
	 b2o6jJmsLjpQ5C9zJtcxp8RZYzMMzJnfUlXTjpi5uGVBGKvKZXSYrDnoDtPzO1dIF3
	 3tIgGnYSoMsYA0EB/t39Xs+pi9D5mnU4h6HZsmduygKi8RJUfYVZLKnaa2Lj/7AJSr
	 oCAbG+le+GIESH1CSeluTfX1vYETQ3ItuVytwI73SRDxptQf1MJ7Cn/DZmJhvb9Y7T
	 obs0HgGFzpf7ZO0ARQ7Bwyu/PVVFbP7bHWGMJ27W12lwEuWKeM4POnqHCYPlvyTqD+
	 p8PrGXZThNp2A==
Date: Wed, 24 Jun 2026 11:04:03 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
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
Subject: Re: [PATCH v5 14/14] video: leds: backlight: lm3533: Support getting
 LED sources from DT
Message-ID: <ajurk9wOxHh6rOH-@aspen.lan>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-15-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617080031.99156-15-clamor95@gmail.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8719-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[danielt@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielt@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,aspen.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDA986BD2EC

On Wed, Jun 17, 2026 at 11:00:31AM +0300, Svyatoslav Ryhel wrote:
> Add Control Bank to HVLED/LVLED muxing support based on the led-sources
> defined in the device tree.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

