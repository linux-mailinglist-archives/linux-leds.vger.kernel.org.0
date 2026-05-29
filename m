Return-Path: <linux-leds+bounces-8372-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEF+DUxzGWogwwgAu9opvQ
	(envelope-from <linux-leds+bounces-8372-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:06:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1568601544
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9841D300AEFB
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8275D3BD638;
	Fri, 29 May 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+zedHJx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358EF32B10C
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052809; cv=pass; b=C+yXIBBgM8y83eH74ftUmb232a5mSdF0GDpsvvVjTDe5VvsE3z+l0IiK/4uCy4s5SgeaQp64m7Gz7ufGsKnXsZWDT2QBHAHDn9xgQBfNf0CWDPA6ie1530PedoSpAOgfkgzAVLCRxfiz68QEl0KrBmmW5NeTO90735NY/hY4w8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052809; c=relaxed/simple;
	bh=RBtquzZL5rzrFMLe6YTrQtMK6vs2r+FZyGLbgsVlHPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/eGDbME/pF6HBuK1nYFSnDPawiI0LetVw7lDQsj/DkbQKkPyGuOhpKjfJNzPco8OEObWov2VRNWU3OSD6D/+GJduAsB0Ra9YSo+8fYfalJDNGMjlvCx3lbyfD9DFqoYznV2WYkuJHksaosGNl60LcdUEP2XEZPuRAIi2r9bfGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+zedHJx; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ee990e8597so31797324eec.1
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 04:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780052807; cv=none;
        d=google.com; s=arc-20240605;
        b=QbaVIdyDE4YN6o/Mp+UNGvy+g3F7Qin+PwANqx0fy5mThsyITD/hl4fVIWfwKLngB+
         OjZs1RJVhHg39mZykTYBksd33pXp5ANomiF4kEcZtgT+ZY829v2pNEf1EIPWLjf/Cyrw
         ctfMFn74CvxPSvJbPMxJWVH0R3Pm7oNH5x0rsw0cBhFRZmx1INd5e/VzSsl411uRXdpy
         h1n1bxnBKEXT493tDGIjaJ+s1VHkw4cg82uNwBg7u3lUnkvfJ3k1MfnhZfmjABMNknbd
         BlZ0jOcbw2L1QyCpmQyqo/n4yf75KSZWY3grT7LOKn0E+SVSH+qOFCUdNEgTE03ZDPWh
         z5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LmadBKdB4Tf6OOuj36z3zIm/LqobfnTJZ4j9RKZPk70=;
        fh=2/pKqerNkwXl4YwI9bUKmrLAygLkfSoIU3RIq7HQNE8=;
        b=MaQuHXkNenuS2UY31wvPXXAr7SFET3z+bQNakrlBMBvE6jzHwzUA4Z9064GnF53pZU
         msPJB82sivUrPJ2s4CpzInvb1aorTm41gZ+QVUxMVPRfXsQHborIphC07TZkzZNFp0zy
         zGm3KS4+3N4AGImWSU6UnirwiMuaG3gjrY5xJ8MgkqR9gd7UXtHdZz7D369IPQee7hUW
         Pxb5w7W3Lq40G/j4EdLXQ9UkzZ0wwOYEQ0wBiCrOcW1tn2ZNYoW1W9lGB9XRLRbRqCFG
         4U0hWlVNLCiKRAD9gSaTxueFbnaT/ZF3NfKrmnrqdAEBj4ErEHKF/JKVuMUQroJPvSlz
         6QIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052807; x=1780657607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmadBKdB4Tf6OOuj36z3zIm/LqobfnTJZ4j9RKZPk70=;
        b=k+zedHJxq/NiiL9G3gRXk9NZnIXIGulYd+YjajIahy5H2J5CWj1FRPPFe0f67pg5BJ
         NccfuGJpYlEOAQiCJ1UoX1hibZNAouQd1z5+nlDCSJRkrppSqDPE2LxIlSTpLIk1ti87
         LlJBeaJ0ebnO2QoewUhHTyE2MKO+fXPDhI++rjpRUHmZyQLtnFKzUUCJm+oBvu1Y636K
         80M1RdaIyr4nlwlZHkigcl6FfSmxUW64YAIxnub0ijDSEvVw6h86Dwv29Sfv1Bgz6y0c
         GClnfCJ96Iw4EIU7JaLIh88naUbRXEzLLcWPNdhbgQ8Rb8JR76T60xSFcdNfbJLkz1Ks
         rVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052807; x=1780657607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LmadBKdB4Tf6OOuj36z3zIm/LqobfnTJZ4j9RKZPk70=;
        b=mkqgVfc7VTVhyWEU9/e66Kt6aqklNf8kcCIQCyfMRf8q51VSIEew4Uk4BNggMJtkon
         lUW840iv2N2iLGVuZTTFalH8u6TVDx4iuO6QX6uWIoCbDg+YLzH1A6cmmdS/fhMhqYtt
         4Gi8Y0UnROcqZLv6puJre4xiePDb88TWXMfIUvPKEDBAIzV1D6n6/PzdsyvXsP4pD4V9
         8Nt7tKaQwuWkOQDGfH5tYDWl3azK2xQ/vw6nWYf7MbO8ytN7AYKcb8iL657fbgWL1G+V
         7Zsv/NogAjrFe2qQy5M8SujfphhTbhgtcCY4XJKTJAY3DOS/n8HBZRP04glB7EDGjOQL
         6ifA==
X-Forwarded-Encrypted: i=1; AFNElJ936LVcQ62SUnn8rnf/Z3Emfo+sBCML9a8eyg/Rr6BQZRleQ7C7/BIP2a7O5YMO79D+iYd1RUkmOjlf@vger.kernel.org
X-Gm-Message-State: AOJu0YytKjk+k2xeqyIMuZbEztqdunEgS3fYIn2uU5xgcq1PnkILqwBr
	cGIO8+S7kRf/jj1wMUPk6Jukp1lakxCA4OrI67JfLVXu7nS2kUfGTQYmTiX5HXd+64musSVbS47
	U13uwbeqCAH2VS7JpnLLflujRK91OIrE=
X-Gm-Gg: Acq92OFttotJuf4FNcli6l2OELA2D6IjZOQrbFAvAXiN9LdYIYvYoxX3qvtrVDioQ58
	fBXNcaD8+5c8tPE8rC/6QouYT3p36I2oXjeTD1h+PbUkLSt1SAWXDKyqGEjvq9ymRA4dJK0xFrD
	uj2PWin9CZ2hYFBalEJmPA9+UL29vlgnxZqbhi2bYi2NYSxRhz0tHMqVIq3TBFlZFqo2KxU44En
	mg2NBtMfW98VLfgHbW5nE5DsV3fvxc1c1c/z+WQlf7xhCWkT71W0Lsw6hVMETGunIEnRESOa1Nh
	GIOgi9tLNuSktlIDfK0=
X-Received: by 2002:a05:7300:230a:b0:304:c651:bdfe with SMTP id
 5a478bee46e88-304eb0e0873mr1128093eec.17.1780052807341; Fri, 29 May 2026
 04:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-3-clamor95@gmail.com>
 <ahlxvGRVFDFrTUN3@aspen.lan>
In-Reply-To: <ahlxvGRVFDFrTUN3@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 14:06:36 +0300
X-Gm-Features: AVHnY4KaFyk9CM74sBMVnXwM-QNoUHCxCc551JZM8S6RjnbIpb-ePbED6pxRxh8
Message-ID: <CAPVz0n0jXsd2CDhEPkr4bo+n59q3S=bEs5i4Hh4tur60aa2OZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8372-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,riscstar.com:email]
X-Rspamd-Queue-Id: A1568601544
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:0=
0 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, May 28, 2026 at 04:51:19PM +0300, Svyatoslav Ryhel wrote:
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
> > Additionally, optimize functions used only by platform data.
>
> The last sentence is a little vague and makes us have to hunt for the
> changes in a relatively large patch. If it is referring to the change to
> common up the init and update code then it's would better to say that
> explicitly!
>

If I understood Jonathan properly, the last sentence will get its own patch=
.

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/lm3533-als.c      |  95 ++++------
> >  drivers/leds/leds-lm3533.c          |  51 ++++--
> >  drivers/mfd/lm3533-core.c           | 268 ++++++++++------------------
> >  drivers/video/backlight/lm3533_bl.c |  52 ++++--
> >  include/linux/mfd/lm3533.h          |  51 +-----
>
> Just one comment for backlight, below:
>
> > diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backli=
ght/lm3533_bl.c
> > index babfd3ceec86..42da652df58d 100644
> > --- a/drivers/video/backlight/lm3533_bl.c
> > +++ b/drivers/video/backlight/lm3533_bl.c
> > @@ -295,13 +293,20 @@ static int lm3533_bl_probe(struct platform_device=
 *pdev)
> >       bl->cb.id =3D lm3533_bl_get_ctrlbank_id(bl);
> >       bl->cb.dev =3D NULL;                      /* until registered */
> >
> > +     name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
> > +                           pdev->name, pdev->id);
> > +     if (!name)
> > +             return -ENOMEM;
> > +
> >       memset(&props, 0, sizeof(props));
> >       props.type =3D BACKLIGHT_RAW;
> >       props.max_brightness =3D LM3533_BL_MAX_BRIGHTNESS;
> > -     props.brightness =3D pdata->default_brightness;
>
> Given the big changes to the driver is there any chance of putting a
> good value in props.scale (BACKLIGHT_SCALE_LINEAR or
> BACKLIGHT_SCALE_NON_LINEAR)?
>
> If the difference between 50% and 100% *looks* like 50% then the scale is
> non-linear (since humn perception of brightness is not linear).
>

Yes! But not in  this patch. This patchset has a dedicated patch
implementing linear and non-linear configuration from tree which may
include this configuration as well. No guarantees though, but I will
keep in mind this request. Thanks!

>
> Daniel.

