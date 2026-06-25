Return-Path: <linux-leds+bounces-8747-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3+88IPHmPGp7uAgAu9opvQ
	(envelope-from <linux-leds+bounces-8747-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:29:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 000796C3CE2
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C6H4x9r9;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8747-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8747-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CE3A300468B
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C0137AA97;
	Thu, 25 Jun 2026 08:29:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACDF1A681C;
	Thu, 25 Jun 2026 08:29:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376169; cv=none; b=QqJgVcYVC8n5XTMk/RDzDJq9Ybmjj2vD44ie+kMk72VoM1l82jkn00DCA6tT0uGmt87EtMAP20yZmnt3gzcSHCTwlrm+TCIrc/Qelayi2Z7vxRcylIGRQZCcsWIzVufRSSzATF2K/feiTP9VdRVtKhW8ZRgIKJTLV+Ldg2fmI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376169; c=relaxed/simple;
	bh=FWV3sOWPsBarvCrvM5DbuqTaLSzitvwRiEf9ZuCvugo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I9eXYzgHq0d4/zmEuhw4YaofqNLPjdogJGTUM0j4mzrqMolXmf/4AVIouz1rXDoLmWsRV8Ga9VNjl9AynsnLhpBkxge4iOvallphdVHiMr1dr7TQIaxMCjH9URuHiywfLXhS4IfETpJddbcJGrMfQu+4+J+Dz0g/vJnuULdOJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6H4x9r9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19261F000E9;
	Thu, 25 Jun 2026 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782376168;
	bh=z1OUgnKgiktxtj7qM25yaDJIoSYWRc3fkgfDZ0VAdXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C6H4x9r9C5HwcbN54174z4YIjdeRGhvA5rKfU2eaHUuDOFTLamX/yOaW5N7HTv7NS
	 mHn1OJYwBenw5FPq4yuMO9UimasGvYXnL5NCQmpagaHlgPsvIED91JclmkNC+vEV+Z
	 4dcIXlcEnu/1uJuT+o7uys78+Vm4uzlW8/anxCAbO341NrlIbPVyksWzxW4tqVwRMb
	 /5snP/sHpJLV9xksVPZXe8hMkIBPOhRPMRk2liTsYzYIS6q1e4MDwoEiM6wdWki9rQ
	 lH9+TO/UOzGXggJzkQrhJeTFGvutGsa4rtkxmO+q4Neemki1AooJ+0ZF3fjbYHIqwD
	 Hwb+EF+YaNU1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6 RESEND] mfd: motorola-cpcap: diverge
 configuration per-board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-input@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, lee@kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20260625081812.33474-6-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
 <20260625081812.33474-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 08:29:27 +0000
Message-Id: <20260625082927.A19261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8747-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-input@vger.kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:robh@kernel.org,m:lee@kernel.org,m:dmitry.torokhov@gmail.com,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 000796C3CE2

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Repurposing the `motorola,cpcap` compatible string and removin=
g `st,6556002` breaks backwards compatibility with existing Device Trees.
- [Low] Direct cast from `const void *` to `enum cpcap_variant` will cause =
a `-Wpointer-to-int-cast` compiler warning on 64-bit architectures.
--

commit bcc834e6accda9ec696d0ed365c9e5ada87bff4f
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: motorola-cpcap: diverge configuration per-board

MFD have rigid subdevice structure which does not allow flexible dynamic
subdevice linking. Address this by diverging CPCAP subdevice composition
to take into account board specific configuration.

> diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
> index d8243b956f875..5b6ca6b81c232 100644
> --- a/drivers/mfd/motorola-cpcap.c
> +++ b/drivers/mfd/motorola-cpcap.c

[ ... ]

> @@ -241,62 +229,58 @@ static int cpcap_resume(struct device *dev)
[ ... ]
> +static const struct mfd_cell cpcap_default_devices[] =3D {
> +	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
> +	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap-regula=
tor"),
> +	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-usb-phy"=
),
> +};

[Severity: Critical]
Does repurposing the default configuration break backwards compatibility wi=
th
existing Device Trees?

Existing hardware using the "motorola,cpcap" compatible string will now
use this generic array. It completely omits the charger and uses non-Mappho=
ne
of_compatible strings, which will prevent existing child nodes (like
"motorola,mapphone-cpcap-adc") from successfully binding.

[ ... ]

>  static int cpcap_probe(struct spi_device *spi)
>  {
>  	struct cpcap_ddata *cpcap;
> +	const struct mfd_cell *cells;
> +	unsigned int num_cells;
>  	int ret;
> =20
>  	cpcap =3D devm_kzalloc(&spi->dev, sizeof(*cpcap), GFP_KERNEL);
>  	if (!cpcap)
>  		return -ENOMEM;
> =20
> +	cpcap->variant =3D (enum cpcap_variant)spi_get_device_match_data(spi);

[Severity: Low]
Will this direct cast from const void * to enum cpcap_variant cause a
-Wpointer-to-int-cast compiler warning when building on 64-bit architecture=
s?

[ ... ]

> @@ -331,10 +315,29 @@ static int cpcap_probe(struct spi_device *spi)
[ ... ]
> +static const struct of_device_id cpcap_of_match[] =3D {
> +	{ .compatible =3D "motorola,cpcap", .data =3D (void *)CPCAP_DEFAULT },
> +	{ .compatible =3D "motorola,mapphone-cpcap", .data =3D (void *)CPCAP_MA=
PPHONE },
> +	{ /* sentinel */ }
> +};

[Severity: Critical]
Does removing the "st,6556002" compatible string and re-mapping
"motorola,cpcap" to CPCAP_DEFAULT break existing devices?

Devices in the wild using "motorola,cpcap" or "st,6556002" in their
device tree may fail to probe critical PMIC functionality because they
are no longer correctly matched with their required Mapphone components.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081812.3347=
4-1-clamor95@gmail.com?part=3D5

