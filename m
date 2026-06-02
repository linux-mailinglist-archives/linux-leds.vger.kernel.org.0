Return-Path: <linux-leds+bounces-8433-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +2odH47hHmodYQAAu9opvQ
	(envelope-from <linux-leds+bounces-8433-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 15:58:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB362F13F
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 15:58:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e929EOfx;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8433-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8433-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 136EA3044940
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 13:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F4A3E5EF4;
	Tue,  2 Jun 2026 13:45:14 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35993E172E
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 13:45:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407914; cv=pass; b=HSFSPoPmKEfRKPO6vj9Q9HC14Vkyf/VTqZiMT94uVlUr6I67U8KneYNdUehti72RPiQ8L853uWLj54n7na1Mtb7iGEqfbFxihAn07ufnUMt83mLEDz+xz1ld9mcTrv11/O2OExbu/i+21pjk7wOmgkh+cKgSZ0/F8IiA5OZO9Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407914; c=relaxed/simple;
	bh=mfRQt6zofjyY6ZTAQWLKGrBLLlNAa1/TidY6jbdB1k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EN7kn/r7AqPFTE0ziqAXnR8aO5/cOEaLgu14lTw4JesSggCg1lZRYfFVwRRREMJ9xStMrk/4CZVQhEp1GUH+gcaiIvcAth5m/52SSCKce4dwQiOzN0AmWDSIywu+uYcrZidj3GduKXriHtj3DqJ+UlKrvRn3aK3B90x2m6oBXHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e929EOfx; arc=pass smtp.client-ip=74.125.82.48
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137dd51129bso83202c88.1
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 06:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780407912; cv=none;
        d=google.com; s=arc-20240605;
        b=dfk9EV+dPmgNsYjuDhY7mtH5nEQiQcrrbCu4J1z/V9QwHzTutwWSQss+Ofk6iLeGZs
         kG39ASXIxJ3pEFdjV0DlhouhH6cxqvTWkxgNpRWD9PPTykRQwwq/EaplsJEW3KWUstxN
         O6QjxDO1lnFMAtMlvTOoHEWQi5GcNdPw5OEWWHpqWJZZEY5FD56vtjXnpo3dkwQSSN8B
         YowKy83XANr+MbPP4HZvqE9wAoCahZyE4Cfui4Wm4buVQOaSVRj1y1J/VBWdpQRWtJvh
         +PWhMZFnbK8UwztFsM/auXNLd+7fvp5Csd9mOLjxoU5dpeXddqsWzUiWHENXiSkYH+ly
         p3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zT4hcJaJAxpNku3U6+68TAPB6S0TflnId/dwWCFEDQY=;
        fh=JxR6RONmnYzXobMonyPgHxAgr6oWP56g/l/WEMMG5NY=;
        b=Kk5j0OFiVDWcRFW+Toum+riKz/j4ckdnxqGMDJH0Y+ksQ5Fvet4qgQMx0LaGv0sVXj
         1pAtXMGn0TQXlWpn1gncnZZhLvQhvl4uUYv/epohbzWxJSxGlvo+0bO9nE9RLPWUh9b8
         4+Qr3T5Tev3gUntI6V83wUxeeYnDFiB8mUzVSP+V1BABlXQwPzOUXM7WmayNjWTs1YPb
         /TPe7pEZSdqhqiWFkeuHRfMd+wMS4n1WHc8lZ73hXfOZr1LZtcmpy8uRV10dL9k2bf5T
         Hu1P9yf7XoF3J9NXCQWyCfBRx7MGU+gyv4J+miloOZeYzzU5XoLt/NWVvWSAUtRf4sAi
         Mfow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780407912; x=1781012712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zT4hcJaJAxpNku3U6+68TAPB6S0TflnId/dwWCFEDQY=;
        b=e929EOfxmFLsq4hUlkHzE+NE/58yILxGFpn3fOd1gvdeurK8o0AzwY8aRvFicbE+ke
         fZp7+dZqrWslwv6YzhIu7Wytt1eLhXz02mTz9XvnCYGLW7Df5QjXvgBbqfDsvDE+X4OY
         5gUD7yR4J6ikvTwaJxWeQ1oqTAIWWEzw4IvmokTpxi3XjVWsnUGYek583gN5FJieF0oH
         6zkQleJmtJAP091wg/euGBxNKHNGl3FvczfyNLOux+xJwCER0y6aaRzorubzp7iHuIjK
         wlnHb3d2gtsYVsc1pienT4XNF1eCN3rRiLFSQhH3Q3WvBk3oRFhgjjuWwKK5Z278Bu0M
         m37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407912; x=1781012712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zT4hcJaJAxpNku3U6+68TAPB6S0TflnId/dwWCFEDQY=;
        b=jPOPTDRmlBL3tpcAw1zu4aZ7AAquUmF2g5l8mMEy0lhbWhjbqrgKihy1kELgJb4UYh
         MlVSY3w3Ki6s99hFFbXrUgbzHSQZnF7bSLZcPB054tOsnSubdtRAd0JwlDAvSgKlRwaW
         Gl4SnOnkx9bxmWudbaNgsbtGUjxyicPold5NGXpxNZXXSUroQqzWbYRMSPNc6kQ0KEfU
         3gPLuNu5gSu0uYZexqawmgwrDWtKFNC0Dqy056UqMHmmkF0Po6YT1kTvJupHzA5kp2L1
         Wdz9CQx7NS1BAJSVvZ1wgML5W3FclIq/EYUO4WlI9gcLBry8r128KT6iRl9XzPOAoX+F
         RUhA==
X-Forwarded-Encrypted: i=1; AFNElJ9l77MZnKP03SAr7NzXUTOa3k9jCWzdhB089aQtpWwIbD/ZK2fMTl+91HLR8CCWrb414ymvpifRBeVh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51IF8Tl4eRwJv22ra0TFPdw2v5Hby0/nYBXJfX73ywwBGWh1O
	W8Rq+aZ8zCDzke9n8zBzRtWATWH/Rf0DE+X1yNKS1iKbJyAztD2H1dpJNam1A76TI0R1MA0ZLS0
	pS609Nnt4cPPhMoco6C/tXu7LxpdsgfU=
X-Gm-Gg: Acq92OFWZQH8WbJbqqNK5Q8A7P188F5XQ6zgUZIJ1eJ5gh/JwwSNt5UZiLkWuE2qMfu
	goIxX2ek8qvfgi9myl33VlgWdn+20upxzV3szYt4SwCubR14Y0xMHMA61g3W4NhNETCeXUv9oPk
	TZboM8zsGVAwD/hi4/Lf2E5yX+bdDeqz369QWmli7q/qXxStpoOxg+2vzfd/+lUmRLXyMbT/J4Q
	DNzOGNtvnPjR1kQuMYXgDrnb9yMaNr7bIYWnnu4dfWkImiB2D9vPfAQKI66fo4MeUJSccrZTJAo
	qqTvF+DDf5BU+iCqFu8=
X-Received: by 2002:a05:7300:724d:b0:304:8366:7456 with SMTP id
 5a478bee46e88-304fa4a97f7mr7197710eec.3.1780407912080; Tue, 02 Jun 2026
 06:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-4-clamor95@gmail.com>
 <20260602144222.7a50a041@jic23-huawei>
In-Reply-To: <20260602144222.7a50a041@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 16:45:00 +0300
X-Gm-Features: AVHnY4LTNpiSYmDW8xnqHecCTvTzpdUFD5jDfC_0pqaKrNHhEcy0XqCOTlsLpZ4
Message-ID: <CAPVz0n3x7KaaoZQAmpX-NCz2QNrhWNQaYFvX3pwS8DLb56bFuA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] iio: light: lm3533-als: Remove redundant pdata helpers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8433-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFFB362F13F

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:42=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon,  1 Jun 2026 18:18:23 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
> > used only in lm3533_als_setup. Incorporate their code into
> > lm3533_als_setup directly to simplify driver readability.
> Minor stuff inline.
>
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/lm3533-als.c | 61 +++++++++-------------------------
> >  1 file changed, 16 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-=
als.c
> > index fb61904f110f..52136ca1abc9 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
>
> >  static int lm3533_als_setup(struct lm3533_als *als,
> >                           const struct lm3533_als_platform_data *pdata)
> >  {
> > +     struct device *dev =3D &als->pdev->dev;
> >       int ret;
> >
> > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > +     ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
>
> Maybe a local struct regmap pointer given dereferenced in a couple of pla=
ces.
>

sure, why not

> > +                              LM3533_ALS_INPUT_MODE_MASK,
> > +                              pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_=
MASK : 0);
>
> Andy raised this in previous patch but in the interests of being specific
> regmap_assign_bits() is going to be cleaner here.
>

I am currently adjusting accordingly.

> >       if (ret)
> > -             return ret;
> > +             return dev_err_probe(dev, ret, "failed to set input mode =
%d\n",
> > +                                  pdata->pwm_mode);
> > +
> >
> >       /* ALS input is always high impedance in PWM-mode. */
> >       if (!pdata->pwm_mode) {
> > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select);
> > +             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > +                 pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> > +                     dev_err(&als->pdev->dev, "invalid resistor value\=
n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret =3D regmap_write(als->lm3533->regmap, LM3533_REG_ALS_=
RESISTOR_SELECT,
> > +                                pdata->r_select);
> >               if (ret)
> > -                     return ret;
> > +                     return dev_err_probe(dev, ret, "failed to set res=
istor\n");
> >       }
> >
> >       return 0;
>

