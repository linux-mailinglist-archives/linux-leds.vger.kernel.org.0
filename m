Return-Path: <linux-leds+bounces-8913-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ufFOBryJR2oRagAAu9opvQ
	(envelope-from <linux-leds+bounces-8913-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 12:06:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2C700F98
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 12:06:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GWluniAe;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8913-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8913-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 168B1313729B
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 09:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7A33B5314;
	Fri,  3 Jul 2026 09:57:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B053B42FD;
	Fri,  3 Jul 2026 09:57:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072642; cv=none; b=Wu+lN/WSmzy1V8pCRk8F8/depVc2Az/taR+W/SvXMHR1Vn0jmSh9ICbuK3NAFAo9TjT+PJC7R/zGNHttTRX7CadXljsXMxUevZMomR6UrL4Qfj9i1mKcAdD/ghCrtZMoipESQ74DSFTcL69Sz+XfM3Y1KtQdrWQYNG3SGBbZetk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072642; c=relaxed/simple;
	bh=B/+ZhFAiwNqtyruFpGe8RK10LPI08f58/qvAauSKt6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocbcMqnoLCbOoEO8YP5bCSYu2CknEirXOFbf/tgu1iGVSg3D9rpmMSgmW86yuy8yrOdCN3J5klGYzxMnHoj+Cb4vBLs9KvN98S8VoEe1SNHrO3lyHQ9p7FYuaUJG7WgMHVxcQqRSU8qTw+/clj0dLR8opzsT5fTq0q3P88ozk+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWluniAe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFC41F000E9;
	Fri,  3 Jul 2026 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072639;
	bh=B/+ZhFAiwNqtyruFpGe8RK10LPI08f58/qvAauSKt6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GWluniAe58J2LgwEA+NCudTqAfLwinS1hgxERTFFOUxhynpg6iOHwko/W0wy+aWZ+
	 +ehMlptLnTJpqj9P/k9DYnniLjB1+5dJBuXlbxQ3sMWh2FXTC1hSfiGA9CrVgPp5vp
	 URGO/rHv9MF4oIaq7TvYxp0G7FipyDNvLpRhZBZhb0H5dUA2lQdTzZzznF4NLlHtFy
	 my+7bbwnvq75nh0YGbCXkM9nDNA6EvfJu0Vo6ZezjPMHM6OYeJk+7I4pPENY8dOTox
	 rlG++P62SLr4jNhIJlwHXOR9GL3cX+hMHq8IvNeAzBe/VyTWL4B/LQQplWpdV59DUt
	 Q0UVTfA5rXXxA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfae5-00000000i2b-0qxo;
	Fri, 03 Jul 2026 11:57:17 +0200
Date: Fri, 3 Jul 2026 11:57:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 06/14] mfd: lm3533-core: Remove redundant pdata helpers
Message-ID: <akeHfV45fs_wabFl@hovoldconsulting.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617080031.99156-7-clamor95@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8913-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[johan@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6C2C700F98

On Wed, Jun 17, 2026 at 11:00:23AM +0300, Svyatoslav Ryhel wrote:
> The lm3533_set_boost_freq() and lm3533_set_boost_ovp() functions are used
> only in lm3533_device_setup(), which in turn is only called by
> lm3533_device_init(). Incorporate their code directly into
> lm3533_device_init() to simplify driver readability.

Again, this isn't needed. Why are you removing abstraction that improve
readability?

Johan

