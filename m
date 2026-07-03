Return-Path: <linux-leds+bounces-8909-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PCnpLsSFR2o9aAAAu9opvQ
	(envelope-from <linux-leds+bounces-8909-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 11:49:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB31C700D08
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 11:49:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AbNex+b9;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8909-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8909-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC21D30428C2
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 09:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE54B3B47D5;
	Fri,  3 Jul 2026 09:44:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E9B3B38BC;
	Fri,  3 Jul 2026 09:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071867; cv=none; b=O0X0Ef6h5xUyr8+6WwjYRfFO3tEDV96tTZF2A1n3+qcUFb/2VPwrNdbKrOY4Xc16R5EbXkDSW/c8MIPyrqpI1oGqPzVC81p/iSH5fUDMbtfQjS5IzkuS6VG8sH76U6f9r5Bq/Aka9eE8riOZP2gQZHeAtD3d43R+yD3GzXm8eZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071867; c=relaxed/simple;
	bh=g84Zki9ut8BoJRtesayIjwjtg5cf3L/XXhsEbFb1vBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHFb+M9f7NyX9VXiHoEwCRc+i5rjdE7VtMN3TBsX9HlQFoMWqnB+ncfS4p3Kiw25fUkdycWra+BChFJhoYmtkperckJ/VkLXxsz715hOj47CP+UUql9Deb2pjw9YcHaTiJrqwvGrJTNO4bUwO3y79e8Y2WFQRqO/Jf8bPNnYmhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbNex+b9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9881F00A3A;
	Fri,  3 Jul 2026 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783071866;
	bh=g84Zki9ut8BoJRtesayIjwjtg5cf3L/XXhsEbFb1vBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AbNex+b9+HGTx0UYbFnxDe+8LXC1LOM7a5Dp6ADn7Rj61dFAbJto4sQyu03tVXVxY
	 Hk2F5KAEg6raT3YLL4SsX2KyN41Wr8JHcrQQ6N759Sm3+jY2tqlPewxj8LfWGXsRd9
	 n14yC0imK2lizCcrEgGEyS8X/L4BPS02RNzTqsrDWJJgl+DSzFpmtVz2o+ZEinyAdF
	 YOH0aorEA+JlbDhbmXxiGRmd2G3R6SZCAL9kXf4yj51g5UZO4dQjlfXXadmgr0MKcE
	 NHB5XHQ+DqoS+NtHIcuUEuZnW233+y/5Ddi4qKgmpgkJgSvz17IYR+UfURGCk8yFJ3
	 d2KASztUXSM8Q==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfaRb-00000000Z8E-2ewT;
	Fri, 03 Jul 2026 11:44:23 +0200
Date: Fri, 3 Jul 2026 11:44:23 +0200
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
Subject: Re: [PATCH v5 02/14] mfd: lm3533: Remove driver specific regmap
 wrappers
Message-ID: <akeEd0GcHSqScGIl@hovoldconsulting.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617080031.99156-3-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8909-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB31C700D08

On Wed, Jun 17, 2026 at 11:00:19AM +0300, Svyatoslav Ryhel wrote:
> Remove driver-specific regmap wrappers in favor of using regmap helpers
> directly.

The commit message should explain why you think this is a good idea.

Based on a quick look you lose the errnos that were logged on errors and
also the register debugging provided by those helpers.

Johan

