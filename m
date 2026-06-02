Return-Path: <linux-leds+bounces-8437-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MEtBKgTiHmp2YQAAu9opvQ
	(envelope-from <linux-leds+bounces-8437-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:00:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812662F18F
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:00:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WpZfRNzI;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8437-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8437-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29C7730C2793
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 13:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646983E5EF7;
	Tue,  2 Jun 2026 13:50:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F3F3E63B6
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 13:50:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408230; cv=pass; b=VbS5OSFq+dOBUzaJe5Z3WI7pzpy/lEB8pQ+dRfEtWYN3lis348U1axX1ypsZs8ea2quZLGpuMB2M2zDah84kwXMAmks+eWJEGWiZjp+kj2hxnZOzOPe5S1ox7la5AauLBsH2JlrVxW/0dUbmWTZXoWJX/1QsABlef03iJDoRGpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408230; c=relaxed/simple;
	bh=NVI4xF0q0eE4RXQugggAMrzJxldQ0dmIPoc43HTpsWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9LtVU4BfCqWSjPXbjogBt6DY1sqa6YWz1H1HRj59uLDf6VRb+qWoaDOJCj/klDEsQcb5U1l3L3B+dBXk0HvRfcE5krP1eMa0dNlDQ10LWLljaWpC1nIqowus2U/z/GQCsvodhbAAW5N6F28UgJ0o6eAXBOEQT5b/xZ/euJtOf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpZfRNzI; arc=pass smtp.client-ip=74.125.82.171
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304545f5206so15600577eec.0
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 06:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780408228; cv=none;
        d=google.com; s=arc-20240605;
        b=lhfxYn+gF8UqsnNZhAiBbqZ6S0Zoaiy2KUECTOQPGf0ubwlKihYn/Yo4QT0sPHgdy9
         wNJ56OYoW5XR2R7PN382rsJP3WQCdsXRG0QK2wahuuVc5VNobAfQgzag67Tv6sFY8Ope
         GBJ4yS0zsKJmB/RSb1YRp70JXgNsme6waandJFi0ezYVCH4+QNSxhmRmpbUKqsHTTkWC
         CW25wpsjLTnI5VUy7UIgI1bHYtIZ/Djov/pnbVxPOld/8S9YNFV26mN+AjgnxCHfXypX
         AwyXw1n6CCNRJ1vUL2wjcr/pRQ+kHn3yuBwA3G5Jbtqjw5PLRi5vpEseB4Idu8j4Qcqs
         GMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JXMEIdkpX0PMnnSFu3HxJtEnPHLXb+fgf1w6HULmKpc=;
        fh=4auAoYKAfKf24XzFynCdQF6eqwYVLnOKxuGuJ80XooA=;
        b=hYrwTKA23HxaXv2rw8VLO1qwzxKhZwEaEJWm/Zs9pHRRlnFdEod4SgPYx/0Qo30Oyj
         pKpobwvtY+v0CNA2Buw6PYyefjo4qzDxeRAQyFdx6nBSTeHr7hQ9LIXmF+Xou5E917XT
         zcAku6JZJh7BRuH/dZYXFUaoNrqOfYqogqUe56VVu1wKS5Mq1A2/b5SulNqJ1NNvBDsW
         oSd7qDtQKRZavUDQB1/f/XFLtunzHAwVYSwNh4V9f0AyCBQnO5FUfgaMrLtEru9HJ54U
         6z9u7eR0b1i7z4wGbEIa72ATmb9pcdp+gtKbVHBLRaKWr4dsKCZ6Vw7JNoN+KcgDhIXF
         Iesw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780408228; x=1781013028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXMEIdkpX0PMnnSFu3HxJtEnPHLXb+fgf1w6HULmKpc=;
        b=WpZfRNzII18pq3ZL6sObbH7QWDzG/lwUsSm8R/EAPn49vOM6x1YnRY6lU1kTrje/+r
         eH1unkYQWCB+UfaNlov/e1KTvzTuYaFPA/pPk64cte29X9zLnBYnEWHGNcXZ7rm1fUBj
         5IUcMifVOylKCBkbih3OuxCp3VDepMzqAIzuShWO23K0Sl/eNKptkHdhvBYNtrBbh5fc
         q2MDTkpjchmjAFZSofQzH/erjQ3z/41mVDrlemVKUXyyopDZCB2gMWNpwOWUGIQkbGe+
         Z/sbV+NH1e9evdm/MEbXdTxdYzmfDPlZVjnWqpv3JHvuBqaqk5ZKEKMqK4gFCmuQmsex
         Ijgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780408228; x=1781013028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXMEIdkpX0PMnnSFu3HxJtEnPHLXb+fgf1w6HULmKpc=;
        b=r/p7OajgF/3s4thNkTZq2RmZQmzfC64UmZPtMahvxJCLsWVF8qKzpb4H15yQlSmsWD
         p+8i1RRi/2a6LvFuOpx3I1mgqla8xQZwlqGMJ9lhCqJfOfTs7xSFE81GRRXXFlGpDxH4
         es+uNNbZy9YHhHG1OK8lVxsrMiqO14dru2bRKo9k1zpZO5CRsnoOMQ7YFmCt6fgI4fO6
         rLBcGCIEbFGRf4XKW9kgJmWV7gHyWUqffyghwobFQiI+H0ae1hZWLFdGSVtSOjt25Q05
         hRQ0EGJHlejsM7VApENm7Qqoz7y5e07VMjo1mHIXQguhjTn6k9yxA7IV+4BzhE4FhU/T
         q+sQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rkSiBWKh721h3rIJD+UQpbSeoOy8qV/L1/uW7//94zh071BQdUoeNk2FibeI5aA5CXoBBDJPAt6k1@vger.kernel.org
X-Gm-Message-State: AOJu0YyX0EDjxZI0UEZ4NcSdXTpETjVAHqUZ9IawjcWftjkCC2HwpDo9
	V5NyZDLohdpmujebogXN6m0EH7H8RF1GJW4TchTnKBADpCWxwrCA2UFZmOA6IA0rfqknIIWPNv1
	COYoRWseIVkwpXIZxLFqukRnIWdwxNV4=
X-Gm-Gg: Acq92OEV9FjnaDlmRUbH87XcjMGVRFArCdaZtIDYst/aVXtdJYK3gD7p+A/MRgMZ/0D
	EGwAsKfXOhHz3nfmbvuM3ehEi69faxZ7Hx8vdYnRNpLzH2jcfs7dlRvgMZ5n9LJ1NCyteGQNlLf
	LX7txn1TeFfla+tPOj9cyMSx8fRkaQIrODThw8qm7sdHUZqIkRO6xYOIXz5DEmDNaZV7T/KLbu3
	Cu8IELBNI9OrpmApjv1HuhXvad5a8BFVXk2T+/0A238RtSKQvlWmkOEjM3n2B5vAsbQ0VAxv3WC
	2zBS4oThXgDpJvoBaNc=
X-Received: by 2002:a05:7301:1f0d:b0:2ed:e14:42e9 with SMTP id
 5a478bee46e88-304fa693628mr8033250eec.34.1780408227938; Tue, 02 Jun 2026
 06:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-6-clamor95@gmail.com>
 <20260602144640.433b4d35@jic23-huawei>
In-Reply-To: <20260602144640.433b4d35@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 16:50:16 +0300
X-Gm-Features: AVHnY4KYcv6nkoqF49he0KoddQyJUPiBV8YuVyKK6U5KG-s9hQUTG1_wCFFBKFE
Message-ID: <CAPVz0n1r97d8-uzhPGBx0LFSp75A3_2mMXDQQ30utT-6NtpHNA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8437-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1812662F18F

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:46=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon,  1 Jun 2026 18:18:25 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
>
> > index 52136ca1abc9..55b35467a722 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
> > @@ -16,16 +16,19 @@
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/units.h>
> >
> >  #include <linux/mfd/lm3533.h>
> >
> >
> > -#define LM3533_ALS_RESISTOR_MIN                      1
> > -#define LM3533_ALS_RESISTOR_MAX                      127
> > +#define LM3533_ALS_RESISTOR_MIN                      1575
> > +#define LM3533_ALS_RESISTOR_MAX                      200000
> >  #define LM3533_ALS_CHANNEL_CURRENT_MAX               2
> >  #define LM3533_ALS_THRESH_MAX                        3
> >  #define LM3533_ALS_ZONE_MAX                  4
> > @@ -57,6 +60,9 @@ struct lm3533_als {
> >
> >       atomic_t zone;
> >       struct mutex thresh_mutex;
> > +
> > +     bool pwm_mode;
> > +     u32 r_select;
> >  };
> >
> >
> > @@ -411,7 +417,7 @@ static ssize_t show_thresh_either_en(struct device =
*dev,
> >       int enable;
> >       int ret;
> >
> > -     if (als->irq) {
> > +     if (als->irq > 0) {
> >               ret =3D lm3533_als_get_int_mode(indio_dev, &enable);
> >               if (ret)
> >                       return ret;
> > @@ -716,30 +722,34 @@ static const struct attribute_group lm3533_als_at=
tribute_group =3D {
> >       .attrs =3D lm3533_als_attributes
> >  };
> >
> > -static int lm3533_als_setup(struct lm3533_als *als,
> > -                         const struct lm3533_als_platform_data *pdata)
> > +static int lm3533_als_setup(struct lm3533_als *als)
> >  {
> >       struct device *dev =3D &als->pdev->dev;
> >       int ret;
> >
> > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode");
> > +
> >       ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CO=
NF,
> >                                LM3533_ALS_INPUT_MODE_MASK,
> > -                              pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_=
MASK : 0);
> > +                              als->pwm_mode ? LM3533_ALS_INPUT_MODE_MA=
SK : 0);
> >       if (ret)
> >               return dev_err_probe(dev, ret, "failed to set input mode =
%d\n",
> > -                                  pdata->pwm_mode);
> > -
> > +                                  als->pwm_mode);
> >
> >       /* ALS input is always high impedance in PWM-mode. */
> > -     if (!pdata->pwm_mode) {
> > -             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > -                 pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> > -                     dev_err(&als->pdev->dev, "invalid resistor value\=
n");
> > -                     return -EINVAL;
> > -             }
> > +     if (!als->pwm_mode) {
> > +             ret =3D device_property_read_u32(dev, "ti,resistor-value-=
ohms",
> > +                                            &als->r_select);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "failed to ger resistor valu=
e\n");
> > +
> > +             als->r_select =3D clamp(als->r_select, LM3533_ALS_RESISTO=
R_MIN,
> > +                                   LM3533_ALS_RESISTOR_MAX);
>
> If we are getting garbage from DT I think I'd rather error out that paper=
 over
> that problem.  So similar to before, check valid value and if not fail pr=
obe
> so that hopefully someone goes and fixes it!
>

sure

> > +             als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r_sel=
ect);
> Why do we need this when we didn't before?  The range checks are the same
> so it smells like it shouldn't need transforming. I'd also rather we didn=
't do
> rewriting of the meaning of r_select like this.  Just use a local variabl=
e for
> the intermediate result.
>

before pdata passed resistor value as actual register value, not we
are getting the actual resistance in ohms from the tree and must
convert it into register value.

> >
> >               ret =3D regmap_write(als->lm3533->regmap, LM3533_REG_ALS_=
RESISTOR_SELECT,
> > -                                pdata->r_select);
> > +                                als->r_select);
> >               if (ret)
> >                       return dev_err_probe(dev, ret, "failed to set res=
istor\n");

