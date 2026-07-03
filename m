Return-Path: <linux-leds+bounces-8925-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1oRYANOZR2rVbwAAu9opvQ
	(envelope-from <linux-leds+bounces-8925-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:15:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C5701B5C
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:15:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LM3BmMC7;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8925-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8925-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3ECAB30248B4
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 11:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D89A388885;
	Fri,  3 Jul 2026 11:09:17 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB30375F83;
	Fri,  3 Jul 2026 11:09:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076957; cv=none; b=W92MX6EP3hQpE8HqHuPkOVDYRDJdMrZ+83KaeJuPk74kOwDuBoSyv4j5Y+iL47fn5N2GuYjvyTH0dZ6FQxK3Er4KOoY0RXHHgD24hzSi4fKJyOY7PzSALL0MNXd2JUDyzDs0GGz4c5vPdOr/Jxqnw81gX986gnu+PgETg9tTfiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076957; c=relaxed/simple;
	bh=J4lbIewbp//OWqVawc0kwzLxFyB+WGnSs2Zv7Dy6SeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYrR2dC1jCUYmfziCLau4qDgRAqixlXz+JZWM/CR8QbaV8Ftu4VzXi2QoGxOxtUTXQZeCYj9rnwrY5ecPnfAQyTl8Ou8wwOpHrEmKVRL1flHZ2EOMfByi3u2QKEW9/pthLb9sDCIuG19T0kh9j+S9c710kmMg3Y1BoVZFR7dvqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM3BmMC7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96BA1F000E9;
	Fri,  3 Jul 2026 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076955;
	bh=tuWJc8imFqb5FUwYOIHT8S1/CiCKvV///7YUxzwmiDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LM3BmMC7MgYSpIzMfpzB+fFYNAhMe9wIo1o0OJLC1Kel2K2ZP/+VYxOAC9ivUroRz
	 e4JPeoPiFFfqZ1qhYtgHkZfsdaJh8zcFkZV/66zPWGhUzxzaFzlF4vJpkPovVJSOtI
	 lwj3dqu+64Kj8tRzc145Qxd72W41qMMdgRzcTAa273NCEWWlyJtiJvPgXzbS3Dgy7H
	 MoZ72HwHtFSy9sa/vMxx7hgMY28svlczu2j7TqHWvEhRlnhjNiIsYAZQu4yNqsXE4d
	 nuCScM8ZI10umNXmDNle0KarbBqoXiOd0UIayfbNh22N3Bes3fi6oQgXyA+zQkFa33
	 pLJ/aYI5MisIg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfblh-00000000jBK-1vKA;
	Fri, 03 Jul 2026 13:09:13 +0200
Date: Fri, 3 Jul 2026 13:09:13 +0200
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
Subject: Re: [PATCH v5 09/14] mfd: lm3533: Add support for VIN power supply
Message-ID: <akeYWRF-wIlrHTF5@hovoldconsulting.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-10-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617080031.99156-10-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8925-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,hovoldconsulting.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE2C5701B5C

On Wed, Jun 17, 2026 at 11:00:26AM +0300, Svyatoslav Ryhel wrote:
> Add support for 2.7V-5.5V VIN power supply.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
 
> -static void lm3533_enable(struct lm3533 *lm3533)
> +static int lm3533_enable(struct lm3533 *lm3533)
>  {
> +	int ret;
> +
> +	ret = regulator_enable(lm3533->vin_supply);
> +	if (ret) {
> +		dev_err(lm3533->dev, "failed to enable vin power supply\n");
> +		return ret;
> +	}
> +

No delay needed?

>  	gpiod_set_value(lm3533->hwen, 1);
> +
> +	return 0;
>  }

Johan

