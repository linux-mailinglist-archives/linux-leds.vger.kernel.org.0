Return-Path: <linux-leds+bounces-8233-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC52BFLgDWrb4QUAu9opvQ
	(envelope-from <linux-leds+bounces-8233-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:24:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1E591D99
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5E8230585DA
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638F5369D46;
	Wed, 20 May 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYEKVCYM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E7229C328
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291003; cv=pass; b=aeLtAC47bG8kOua80YioycCe5YsqwJBsm+bbr6rmkJKeMC3aPVpxiknypikZJFgyxZq+iCNWKWgLt8TPAA59e432FLmndxgCvVJckKFoEy3atk7oTzxITUDkUAfYAM025FxTZkhIh2Xv4AbW5l81bAKSMNuqImcSlo0F/ZofVDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291003; c=relaxed/simple;
	bh=PTr/pjHamO1Ihg2Vlky7Uv+UhQr1pnHfT9hc7eeJzYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyNjbk2J3BhKkJ16xwT0vCkGmzY5hiJ9ZOy6fHlLQMliZ340dGiimUVmmRkrH0f5Ma2/JqT8wnJ1hu5WMeZx7KzqqXMnVEh1vJRuosI50NI2MmZ56G7sfSYpwiQ4Vkwf4m0Ydegzc+p61pg+Iwi/FqWcR3vW49aZD51SP1fGhoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYEKVCYM; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1329fc4bf77so443284c88.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 08:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779290999; cv=none;
        d=google.com; s=arc-20240605;
        b=ejq91atRmRxo8vNkLFu9VF6UIpklNDUxbN2fDbM8DqIf/E8rv5ANuXkZEnmbzgjX7p
         Fx8Jne3f7iEjcRym3DnolOv4IEmRWF1XzPyrQgrxYhPDEOMJjVC2lKnAslpXi8zj4fSS
         5FPQ09vM92GuberSJOrqPrnqkiS7IlCoAx8InvGQnLUCR2Ux/Z+xatfuTmvlPoMualAz
         QhvAhqdtkooynGss1XweMnepYMl4Y9I0pDzqVO2n8Hwuj5KdsFaEGSlnA4ozhaPgxnfI
         D4dfPqm5PVJcCZ/iovnI8n3TUkcJDm667lVRbXWAn1uEzIGdY2To9jCuKTdkKMTqctBL
         ZUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtw3lFRwGwzg4VGtWzpJUm2nCeCDIPbLOk/3aHo9wFo=;
        fh=TyI5kQu+ICposEWXUR1x7vZgkF6YXuFh0Lemgr+ySAI=;
        b=BVErHnWvvHe8d3Kq2YnDtHSxRSBC3I07B/u29mHneMQurypChHGTfCSuHzL3zTuKt2
         aJNzaDS8fnf3pYsIDRQhX7ltIuXb4mtus2hVNawr54mDGDVWAV19a6s+HbJ+lRvFZh9X
         9CwkQHKXjslYLJCiqkCIoM+pgzdkl2PJede+9Y4lYgwzGxRZOOhYr9RfwFdWDRHV5rz1
         4zlRI+SZ6jlfBOziRLWBO3WfRTfazSRche2MAtBd/24vYJScj7iV4bSckq6iw7B27BVq
         IF3A0K1IFO5W/bIkPY1nXyCDxF29m+ozO6bptuGnB9rJm6nGcERjIxgYFTCbqZzDM4qK
         MNlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779290999; x=1779895799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtw3lFRwGwzg4VGtWzpJUm2nCeCDIPbLOk/3aHo9wFo=;
        b=ZYEKVCYM05IaMxw52h+I6/upd3Q9DI3VILdTT5ZI8YKXD4cHK2tvp18u2c5K3JJaj4
         5LRvMt6GRpHUynY6r2YFZdmsbfgBN8XFFxMrkE8IiwfZoyiJyAfTocBTHscWH2E+EhKN
         whqRRNqI2HNT3yjC/k4rS/u5ZG5QKpsuU6tVcqEt4ik5tFxHp+8EGi8OogH9D1bnPhEl
         g8LInrPvcU5thrtDZBZvlX6S5KxqXtppOECU7vRkcmdoqAYP3vYFzp62nSMc+t4kOH+N
         FkuQ3+RLfcN4YbKYds5Ia2xP07bAcNFONvDdbGModQLRhLaC5EgOIhXgEbS2bmkKSDsZ
         VQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290999; x=1779895799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtw3lFRwGwzg4VGtWzpJUm2nCeCDIPbLOk/3aHo9wFo=;
        b=BxDd07ggddLeDN65o/1Pmy2q8lTHdo0IZm9HPwkPxlqW6GWf58jjrfK2kH/Ld7MlCm
         +d9P+M9ocdtpUFYldBwAx1lbMJSSuwOt4wqr8XKxOhTe+gzolErhpaDS7DQ13l/bschU
         h/9e4Qc9O6ryvi+z4kuvTkWSgUVc9XMF855U0HbRoJEpw/7mDze8DnfHbFEePpbU9wmG
         ffAWavjU7OXIi4kN4MrDMftxN0WZTMORK0MLbglATkg5xuZSPe8eKEvg9zaTplOSc2A+
         C5nlDvTO+pQq6IxGw+h8PwL9KGiXDhP6kPyt3Wscj8fe25ZFEfrXWvyuekmDAtLF4MTH
         ZApQ==
X-Forwarded-Encrypted: i=1; AFNElJ89fmrVLY8tXwH6jLtkfHgFUN+4FEPZFRwNgVcNxpjUaCy0U9wdAQBIRnA1jQrPY7O7RFzmnN4yjTC3@vger.kernel.org
X-Gm-Message-State: AOJu0YySuhHRQQfCWuz73eGEa6L0cEgKcMwMI1C/0Bkl54v/5uJY8wUK
	umAR8GgJeQ5Rw+L8SJecNfYg+Cm/CYryeygrE1Y69CW7m5xkVKHcDr+1Mr7o/29ed4Jq3p+3Cqw
	0NilVcq1+OeRc09lSY7jzPrFWKYuoM4I=
X-Gm-Gg: Acq92OG9plgspIPKVKFMU+F1E4T1clG1n5fwooV5RNEONnY8Qi/KO7vxFe3R17pXmeu
	Rm75faW4Dv75htI5wgW/5xPvyH6kdAMPSXg7hYJAwv7zLKCggUqL3xk6qVga3dbobwnwn+ADQ/C
	VKs8+W63d1Wt3thKN9g4/quhF9MDH+iM/S2PAoHWpkwoOhQ8ESaZkKd5vFVhDOwLSuuJVdPkQP5
	Tlh4ScpBvAr4nvQQx05jDYxLoGkzJhoGLt1mvapqNlT9YGoBUdP+pQctVFzaxgvcPhuspy/EN9c
	bjwead2X
X-Received: by 2002:a05:7022:ff42:b0:132:7ab5:6cb6 with SMTP id
 a92af1059eb24-1350451da55mr10925797c88.2.1779290999431; Wed, 20 May 2026
 08:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510110804.33045-1-clamor95@gmail.com> <20260510110804.33045-6-clamor95@gmail.com>
 <20260520150758.GG2767592@google.com>
In-Reply-To: <20260520150758.GG2767592@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 May 2026 18:29:47 +0300
X-Gm-Features: AVHnY4Lt9k-AaWpyoqKkenUEfytkiPeEYyaiI3OoBCYQ7SFe8jSWa06DLoiLIec
Message-ID: <CAPVz0n0t4PXfmgWYQ1vSTFwfg=+g4oGU+-dwgnBVKxUoUwHGqw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8233-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 11F1E591D99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=81=D1=80, 20 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 18:0=
8 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 10 May 2026, Svyatoslav Ryhel wrote:
>
> > MFD have rigid subdevice structure which does not allow flexible dynami=
c
> > subdevice linking. Address this by diverging CPCAP subdevice compositio=
n
> > to take into account board specific configuration.
> >
> > Create a common default subdevice composition, rename existing subdevic=
e
> > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > Mapphone board.
> >
> > Removed st,6556002 as it is no longer applicable to all cases and
> > duplicates motorola,cpcap, which is used as the default composition.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/motorola-cpcap.c       | 142 ++++++++++++++++-------------
> >  include/linux/mfd/motorola-cpcap.h |   6 ++
> >  2 files changed, 87 insertions(+), 61 deletions(-)
>
> Looking much better, thanks.
>
> Nit: A patch-level changelog really is much more helpful to reviewers.
>

Noted, but I will not guarantee that I will do patch-level changelogs, sorr=
y.

> > diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.=
c
> > index d8243b956f87..f5a7fdd89dd5 100644
> > --- a/drivers/mfd/motorola-cpcap.c
> > +++ b/drivers/mfd/motorola-cpcap.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/sysfs.h>
> >
> > @@ -30,6 +31,7 @@ struct cpcap_ddata {
> >       struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
> >       const struct regmap_config *regmap_conf;
> >       struct regmap *regmap;
> > +     enum cpcap_variant variant;
> >  };
> >
> >  static int cpcap_sense_irq(struct regmap *regmap, int irq)
> > @@ -195,20 +197,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpca=
p)
> >       return 0;
> >  }
> >
> > -static const struct of_device_id cpcap_of_match[] =3D {
> > -     { .compatible =3D "motorola,cpcap", },
> > -     { .compatible =3D "st,6556002", },
> > -     {},
> > -};
> > -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > -
> > -static const struct spi_device_id cpcap_spi_ids[] =3D {
> > -     { .name =3D "cpcap", },
> > -     { .name =3D "6556002", },
> > -     {},
> > -};
> > -MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > -
> >  static const struct regmap_config cpcap_regmap_config =3D {
> >       .reg_bits =3D 16,
> >       .reg_stride =3D 4,
> > @@ -241,62 +229,76 @@ static int cpcap_resume(struct device *dev)
> >
> >  static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume)=
;
> >
> > -static const struct mfd_cell cpcap_mfd_devices[] =3D {
> > -     {
> > -             .name          =3D "cpcap_adc",
> > -             .of_compatible =3D "motorola,mapphone-cpcap-adc",
> > -     }, {
> > -             .name          =3D "cpcap_battery",
> > -             .of_compatible =3D "motorola,cpcap-battery",
> > -     }, {
> > -             .name          =3D "cpcap-charger",
> > -             .of_compatible =3D "motorola,mapphone-cpcap-charger",
> > -     }, {
> > -             .name          =3D "cpcap-regulator",
> > -             .of_compatible =3D "motorola,mapphone-cpcap-regulator",
> > -     }, {
> > -             .name          =3D "cpcap-rtc",
> > -             .of_compatible =3D "motorola,cpcap-rtc",
> > -     }, {
> > -             .name          =3D "cpcap-pwrbutton",
> > -             .of_compatible =3D "motorola,cpcap-pwrbutton",
> > -     }, {
> > -             .name          =3D "cpcap-usb-phy",
> > -             .of_compatible =3D "motorola,mapphone-cpcap-usb-phy",
> > -     }, {
> > -             .name          =3D "cpcap-led",
> > -             .id            =3D 0,
> > -             .of_compatible =3D "motorola,cpcap-led-red",
> > -     }, {
> > -             .name          =3D "cpcap-led",
> > -             .id            =3D 1,
> > -             .of_compatible =3D "motorola,cpcap-led-green",
> > -     }, {
> > -             .name          =3D "cpcap-led",
> > -             .id            =3D 2,
> > -             .of_compatible =3D "motorola,cpcap-led-blue",
> > -     }, {
> > -             .name          =3D "cpcap-led",
> > -             .id            =3D 3,
> > -             .of_compatible =3D "motorola,cpcap-led-adl",
> > -     }, {
> > -             .name          =3D "cpcap-led",
> > -             .id            =3D 4,
> > -             .of_compatible =3D "motorola,cpcap-led-cp",
> > -     }, {
> > -             .name          =3D "cpcap-codec",
> > -     }
> > +static const struct mfd_cell cpcap_default_mfd_devices[] =3D {
> > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
> > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > +                 "motorola,cpcap-battery"),
> > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > +                 "motorola,cpcap-regulator"),
> > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
> > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > +                 "motorola,cpcap-pwrbutton"),
> > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > +                 "motorola,cpcap-usb-phy"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-re=
d"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-gr=
een"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-bl=
ue"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-ad=
l"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp=
"),
> > +     MFD_CELL_NAME("cpcap-codec"),
> > +};
>
> Nit: I wouldn't complain if you wanted to have all of these on a single
> line for neatness.
>

Noted

> > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] =3D {
> > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0,
> > +                 "motorola,mapphone-cpcap-adc"),
> > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > +                 "motorola,cpcap-battery"),
> > +     MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0,
> > +                 "motorola,mapphone-cpcap-charger"),
> > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > +                 "motorola,mapphone-cpcap-regulator"),
> > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
> > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > +                 "motorola,cpcap-pwrbutton"),
> > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > +                 "motorola,mapphone-cpcap-usb-phy"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-re=
d"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-gr=
een"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-bl=
ue"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-ad=
l"),
> > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp=
"),
> > +     MFD_CELL_NAME("cpcap-codec"),
> >  };
>
> A lot of these are duplicated, right?
>
> I would have a comment set, then the differences in separate containers.

It may be impossible to predict a generic setup since some devices may
require unique compatibles, other may not have LEDs, third may be
partially incompatible with existing cells. In other mfd cases
creating a generic bundle might be good, but in this case I would
suggest better to keep these separate entirely per-device. They will
not take much space, nor add confusion with these macros.

>
> >  static int cpcap_probe(struct spi_device *spi)
> >  {
> >       struct cpcap_ddata *cpcap;
> > +     const struct mfd_cell *cells;
> > +     unsigned int num_cells;
> >       int ret;
> >
> >       cpcap =3D devm_kzalloc(&spi->dev, sizeof(*cpcap), GFP_KERNEL);
> >       if (!cpcap)
> >               return -ENOMEM;
> >
> > +     cpcap->variant =3D (enum cpcap_variant)spi_get_device_match_data(=
spi);
> > +     if (!cpcap->variant)
> > +             return -ENODEV;
>
> Isn't this covered in the 'default' below?
>

This is for case cpcap->variant =3D 0, it should never happen, but check
will not cause harm

>
> > +     switch (cpcap->variant) {
> > +     case CPCAP_DEFAULT:
> > +             cells =3D cpcap_default_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(cpcap_default_mfd_devices);
> > +             break;
> > +     case CPCAP_MAPPHONE:
> > +             cells =3D cpcap_mapphone_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(cpcap_mapphone_mfd_devices);
> > +             break;
> > +     default:
> > +             return dev_err_probe(&spi->dev, -EINVAL,
> > +                                  "Unknown device %d\n", cpcap->varian=
t);
>
> This should be -ENODEV.
>

hm, match is ENODEV cause it looks for device, here driver checks
id/variant, so shouldn't it be EINVAL? I assume error message should
be "Unknown device version" or "Unknown device ID"

> > +     }
> > +
> >       cpcap->spi =3D spi;
> >       spi_set_drvdata(spi, cpcap);
> >
> > @@ -331,10 +333,28 @@ static int cpcap_probe(struct spi_device *spi)
> >       spi->dev.coherent_dma_mask =3D 0;
> >       spi->dev.dma_mask =3D &spi->dev.coherent_dma_mask;
> >
> > -     return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
> > -                                 ARRAY_SIZE(cpcap_mfd_devices), NULL, =
0, NULL);
> > +     return devm_mfd_add_devices(&spi->dev, 0, cells, num_cells, NULL,=
 0, NULL);
> >  }
> >
> > +static const struct of_device_id cpcap_of_match[] =3D {
> > +     {
> > +             .compatible =3D "motorola,cpcap",
> > +             .data =3D (void *)CPCAP_DEFAULT
>
> Single line should be fine.
>

Noted

> > +     }, {
> > +             .compatible =3D "motorola,mapphone-cpcap",
> > +             .data =3D (void *)CPCAP_MAPPHONE
> > +     },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > +
> > +static const struct spi_device_id cpcap_spi_ids[] =3D {
> > +     { "cpcap", CPCAP_DEFAULT },
> > +     { "mapphone-cpcap", CPCAP_MAPPHONE },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > +
> >  static struct spi_driver cpcap_driver =3D {
> >       .driver =3D {
> >               .name =3D "cpcap-core",
> > diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/mot=
orola-cpcap.h
> > index 981e5777deb7..1a85b06272c8 100644
> > --- a/include/linux/mfd/motorola-cpcap.h
> > +++ b/include/linux/mfd/motorola-cpcap.h
> > @@ -25,6 +25,12 @@
> >  #define CPCAP_REVISION_2_0   0x10
> >  #define CPCAP_REVISION_2_1   0x11
> >
> > +enum cpcap_variant {
> > +     CPCAP_DEFAULT =3D 1,
> > +     CPCAP_MAPPHONE,
> > +     CPCAP_MAX
> > +};
> > +
> >  /* CPCAP registers */
> >  #define CPCAP_REG_INT1               0x0000  /* Interrupt 1 */
> >  #define CPCAP_REG_INT2               0x0004  /* Interrupt 2 */
> > --
> > 2.51.0
> >
>
> --
> Lee Jones

