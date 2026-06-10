Return-Path: <linux-leds+bounces-8555-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8mOjArx4KWqUXQMAu9opvQ
	(envelope-from <linux-leds+bounces-8555-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:46:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838366A5E6
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:46:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="KQm7/gRU";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8555-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8555-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34805353101E
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 14:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF088426699;
	Wed, 10 Jun 2026 14:35:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA503419317
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 14:35:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102133; cv=pass; b=ueC6EWXrVigzVUaes3HsjSVaoGe33kAy9T4r+BQmjjA1xBtgjPoZCI0n1lbI/oPxhHGuf3IK0C3IGqyo1zlgKYxbU3XiSrfEZg9e4uuubGVBP61vXP4Z6w5ocgz9zAdgTcE5w0DcIBVR+7AKTMZVBiUWpSgTlNRZcQtPIoZUE40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102133; c=relaxed/simple;
	bh=QQx6HdrZCLg1/bCUL3imDIU0SHjoIZfIndkzDKlCI1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IejwnMWEh3fU/ZfAW9MM/vhr5Igl+FEKOhoWdUWM/NLzf2xwUGGLvOFKsR1yBgN6tztKNrU1bt97WBYZC6tHGB+8wfNhP79M4V04UgLaD7zOK/IiKlglEqov8gdQ8KARlP3pR57nqku2X2H+BIhdbjKKAJgtmS8K6OMmeFdHViw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQm7/gRU; arc=pass smtp.client-ip=74.125.82.171
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304f0039c02so12353227eec.1
        for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 07:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102132; cv=none;
        d=google.com; s=arc-20240605;
        b=YfOCZRz8lJhuJxbJYk3Z9pDe+6XeNThI/i2P+IKx9k9GSTnO87jqnBi9mJN6vT+wyg
         O8iNtNzSKfum7NirRm/aqWdot6CHGHk0xM2qfSc0aWGGFgq9LZDyeJWTSsqk+mNHbg5e
         8lDQDWu2B/yPdJY2Zunj4QMA68JFKKg1uOtNjsVstDhn8cOriWbtpb6g3TXIwf6MdZRH
         msl+KmhS/0eDa3tZ0h28Hvn6I7MXukoNwA60MNKkUd5gsjNO5zh3Oen/zHi+y4IM8Vjq
         DXFQ+2BNW0tzMt7SD2V54oP68IdJKABX8TKjt5F5GylLM/Vt0WacFsl/wCRVCeGghTmi
         g/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5u4rWfzB/dXcaizEq3FSq09DXlW+GebEr04lNWgXuHI=;
        fh=zXxhqMN15j7foMI9bNKKYXaRcCVBVhhM6/bcc0mi/Bo=;
        b=IW0Db79PHvoj6ibL5h86WEao5DH+Pncb7R03y51sBjz9Thw7I+rJ9qmtaUZLbrasku
         jb/9jJW3pPw+iatkgJ9kjCjCfXpTfQvivHPHYKBg4CYDB7xomPLvyQOFgFKEB8frjnii
         kZLZpnv5t8QDPJhrGuPpkrwGvroP0UOy0hDFE9pCP4U1ZbPfhiCeiqHlqYgLZoCWua4u
         lH5rdYd2jcARz8F26j32CC6+03Dk2gUcJpcW1O2anN7tBXhnq3LXjNy5tqOXEWSU5ByF
         jFrxsTdCsGHZ7KMaw/kYcBsqXij0v8DuLJuBJj08paK4KDulYuCpeOpeVj15y5TnA9UC
         uLZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102132; x=1781706932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u4rWfzB/dXcaizEq3FSq09DXlW+GebEr04lNWgXuHI=;
        b=KQm7/gRUZfsFKZqtrRX/8Gv0F6bhmSvFCeIsHmKzg4zXiy5wml4L2DCsSYXvR9y6VT
         dakAcxRGvyiyeLEmi/m/zwtHybvTK2vGxqItzgALr+8oc4OGZyYciXirvN9GSOw2RLkK
         49Vn92bndAK2aGF8/CBb1krYV8XgERip/wUWOu/2gqfs+ZtfENmUS6MNzPv1lIc8FRIX
         sC8lAPSWJ2RzX3/CQeIgHwZpONkaUhzMNPtYIc1hOpnirAwqodCd4glpOxDEpUKLRR35
         ws/Yz+J9Dp50xOxLOKTmZ38zDkB6qSGaeeevLFcfTPWN5pVFpAZuUXlPzW8qBX5pAkNk
         eTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102132; x=1781706932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5u4rWfzB/dXcaizEq3FSq09DXlW+GebEr04lNWgXuHI=;
        b=kR28FDhGkhyglyb5P/Zui2q8j4HIuv8Pv06RyndWebmOoV/U8EpAWZBoRBWTJBsg4F
         Tam87HnHL3K/rvk2ZMjYp3XRgoKoXFJQJhvRJQZ0L5sIBeuSSRdT7KLIOyuLbyFp23J2
         xOwK/rz/JE8cKCSwiwYNnpFJq3CicMOwQWhTUK5iMm6Ay4s4UsG2MO5dUrVf3pCKuOtz
         IvD9LtxKP2BNZwJVMAwxZbpZq7AqA0qXLAeXSSBOUBohEEauygei4e+64bOVqUj95l4i
         Tqws0cO5JEqvoBN6goOVdYI9AvRwVfavAVvMdWvFlit4GkhngBnEXZhjEe0kijKCCSRS
         8ttw==
X-Forwarded-Encrypted: i=1; AFNElJ/TX3SaX2PUY9xwJeQO0oRIiEEPiRtcjPGwdjXytOlY9E2vaxYJb+QV43QLAnhjcHsSdHDZ+/M/3XDd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+YJSzK/FBqqjcatefVz9PIYdzYppHqYVFeCE6WCpLWeSIgO8b
	G/Tv/jhIFiFMF+sPnGyr8YSSYpOSA/UlxTTjvMHyIoCHlwAmjzSPPyo7sq5nr99MZEePe4JOWIh
	qUfobywrkHLPLHyn8xSzJHOUALnisoVQ=
X-Gm-Gg: Acq92OFyllqFRxwewgNUVtJnUGAIUK1AypAekHXJku+fRIf94bM27MGaxBp9JIh6cLB
	SsjjQbudQAuqQtdDAGogpTgGqjBBw3MmFS/EUaqlxxVR3AC0TOTPXA9Uk6fp6Qgs/ZJL6yK1kki
	7iZ14i109XEYZD1K6CTeII1LKpbq+SX82lzIB8eatd4YIaFwnXRBlxlsizRhWQoIYYhoiQrpQl6
	MlCpy97FktU9+rAJQJ6peVvfSdjBIawu7mgik1L38QAdLvvwoV0BcESG4RIm+T+HcRaRo/cOyoi
	txrVa7mTOqnpwuvcAVw=
X-Received: by 2002:a05:7301:4186:b0:2ef:9961:27fa with SMTP id
 5a478bee46e88-307d62ddc77mr6085557eec.18.1781102131738; Wed, 10 Jun 2026
 07:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-6-clamor95@gmail.com>
 <aihlDGNZRuHI-vMR@ashevche-desk.local>
In-Reply-To: <aihlDGNZRuHI-vMR@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:35:20 +0300
X-Gm-Features: AVVi8CeF2WtE8NAfRo3Ry4_ONFpQ60FlY7Ry_ggOsna45f4Sc2pO4GqWSxBW8Fo
Message-ID: <CAPVz0n17uAvpyuF5_E1L49eoz8LvHULE0-SVjJpHvu4veWWjEQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8555-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5838366A5E6

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:10=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:29AM +0300, Svyatoslav Ryhel wrote:
> > The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
> > used only in lm3533_als_setup. Incorporate their code into
> > lm3533_als_setup directly to simplify driver readability.
>
> Use func() when referring to a function in the commit message.
>

I must have missed, thanks.

> ...
>
> >  static int lm3533_als_setup(struct lm3533_als *als,
> >                           const struct lm3533_als_platform_data *pdata)
> >  {
> > +     struct device *dev =3D &als->pdev->dev;
> >       int ret;
> >
> > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > +     ret =3D regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
> > +                              LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_m=
ode);
> >       if (ret)
> > -             return ret;
> > +             return dev_err_probe(dev, ret, "failed to set input mode =
%d\n",
> > +                                  pdata->pwm_mode);
> >
> >       /* ALS input is always high impedance in PWM-mode. */
> >       if (!pdata->pwm_mode) {
> > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select);
> > +             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > +                 pdata->r_select > LM3533_ALS_RESISTOR_MAX)
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "invalid resistor value\n");
> > +
> > +             ret =3D regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR=
_SELECT,
> > +                                pdata->r_select);
> >               if (ret)
> > -                     return ret;
> > +                     return dev_err_probe(dev, ret, "failed to set res=
istor\n");
> >       }
> >
> >       return 0;
>
> Wondering if it would be better to
>
>         /* Bail out when in PWM-mode */
>         if (pdata->pwm_mode)
>                 return 0;
>
>         /* ALS input is always high impedance in PWM-mode. */
>         ...
>
> as the above changes almost every line in that conditional.
>

This is a decent idea, thank you!

> --
> With Best Regards,
> Andy Shevchenko
>
>

