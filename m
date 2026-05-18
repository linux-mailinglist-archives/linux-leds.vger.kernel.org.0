Return-Path: <linux-leds+bounces-8184-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBE5JVfiCmoF9AQAu9opvQ
	(envelope-from <linux-leds+bounces-8184-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 11:56:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE3556A26D
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 11:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8130304705F
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 09:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E0731B114;
	Mon, 18 May 2026 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhE3wCQ0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517603242B0
	for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097884; cv=pass; b=ONUAOpnzJAiPYWxUeqdmmfQO2bsftTGA8NpG7QkoldWw7wGLFLap/LESTYNatFMpm64gynAXMu/sNrb0zi+J+g/EPisAqfogsGvcMLdAN8iDE8EbmTMSPHgR83s433KMzzo3uZgn0S9pSdAICe34nNK4+aatQ7ohs2Iyl7XUScQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097884; c=relaxed/simple;
	bh=JOqNYOpYniKiLryaD7Q8FBNSmyt01Ujzp39DKCKBG8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLXZuVNbt0DU7NqjCYmzanv15HHJjkHOXItj2/lkjAX7O14YPWyqrKA+bStuAwLMLtM2XBkG77kaOvNfJFuHIPhTNARAo+AaMJoX6nofaVEf4LBTj/ho0VsEBz4ZdX3QycnsrYfNq5q/tlJIhc/JFsYd2NTGLmF6rjvi50LQAgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhE3wCQ0; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f33ae12f97so7672563eec.1
        for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 02:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779097882; cv=none;
        d=google.com; s=arc-20240605;
        b=OUQzgnFNAOTRycy/OYSBOB/QHnw6Nr/R9ZKp/AWsB5yJ7wZTd8dUs0EgIGnNvU7add
         S8LCO6heutfX9hYXuEsHRFnjZxe+hvw50EZLxwlUAb3ibEbwk9vHkNib7e9bju9s6kCb
         WSYTk2e9G/WzGIKlwDqtEiBOab/LZymi0yYyn99XG9Zx3ms7ttdmiYobKh5Qn2547dOG
         bq90N8q/KkYU8FglGcagtfymVYIRZCZnMDMqSm1kpZkQ+7VxepEGQ5m4SU6DzvAN5um+
         22Q1w5lMFfsoaOSd3TVdaSb0vrS/xH/KOIBl/IoWS6gHbJUSBgo+wx7dMaujotll7Hd9
         z6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FePX2WL11b5dRW+WYbo5NswoFP4g/thJvtgtY1wXay8=;
        fh=v6q3ZTExIZN71VqBCdkuarWejoelI4XpZWEpsbBEdxc=;
        b=T2kXQPVbGgX6bIsgCppcBAmtyFKYDaXKiOCVo/qnMbvWQG+5WTURAW9ZpXPiO/1P1G
         2qmC10F8Tl0/nFgnawEmjjA/Gsd/aCDENLUBr+rUenndWZeZcf/AoiRNFZ1tY3KY5/sl
         wnZqiF38CXmARXlAXS7H63eMrU1kveto/PMt05z3oppEJy3fQ9z7dP0kIKVFH6+z1DLR
         fzff6qT7XjUaiK2KcVcaF+x/o0sT19nzCYLqHETLG7w+Xrpfd3W+mm4cQxeBaxse8ylV
         E/ZRv+zb9r8Hc6DPPfTjjBowvaSkYxMlAPefgL2xjQxeuemXqZSwJ/tJMWXKvJIfE8Mb
         Kw1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097882; x=1779702682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FePX2WL11b5dRW+WYbo5NswoFP4g/thJvtgtY1wXay8=;
        b=RhE3wCQ0oOeMN7MfcDrswyUcIWD9pJ8hEEqNNEgJej/v03XZnbisRVNEy21JsCAuD0
         O8CxKVFumIUtF+3uQ42UOVYIEi9wcMc90cwHYSLxyl0xRa744xAIoEE5Y2woX468sbfQ
         joafHnsz88TeQiWFZphoG2hZe1jTfZ2M2c/EvAomXv5hGvDNOrTAm9a9cUQ5F0UyXc+4
         Y9e2nHtcfkeOc2QgqvUwDB0EjbUFovCSm0koR2rNlmWrWoAVCBDGmOf7mrt1TYTRNJ8f
         TKCMRz0QYzqBYw8vKS9d42QrF3+gYazrH5JsmMPeUdzsrOfVqCvrLwdAx9rwkkBXd3Uo
         Aqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097882; x=1779702682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FePX2WL11b5dRW+WYbo5NswoFP4g/thJvtgtY1wXay8=;
        b=jjNDcsiqiR05lMxlaJ53sTcN4T5TdjI98PfV8SYSXMnsR0CDgzMee/zrSJq/mdPAAo
         asPn47QNo4xapgzol55ByozjnG96cpsFgecvmrrL9JB5Go30C1OsuuvY1N8t3ot9Gbkt
         HmsCZabeNqRVkXEm6gtbNArMCvolAxsRkKF4wZDpys7DCwpEZtoxRB4TtikAdC2pd9IO
         tK9w0EmmS8D2+QIneRNPjpc17hOmRUW08aIR0q1JIJs7brvfZS/EVM5noenbIsWRsLiz
         K9UNeBlFYDSFx8iG8n7y9expYoKMP6Sb3opb9ktF/0LQkIBo2xcfIVVrlHTugwY8yisu
         mz0g==
X-Forwarded-Encrypted: i=1; AFNElJ/AdMLuVG80MwGV67hrzO1OIALCNQBF0KMkna12UtoCfEcDBlrBCZe0yWgWaWVSv1VZrPZNh8yI2MkH@vger.kernel.org
X-Gm-Message-State: AOJu0YyEA+1mq/nRMMWuNl1vyqByWR45+srE6Q11i3E281rnAhV+Whzw
	2DdA/ldvFtK0KSoUf0FGZIC+FTDHbyx2w3bB0eHuXhsPqkjf4Toqn425QXAlsN96INn3x9JhDDu
	Z+5Uq8HL9hE46W8NQQ0bEcEWsX6Acg/4=
X-Gm-Gg: Acq92OFhdvKNyzS9s0AfhZH+k2A8dKBwjW7/zRelsWaOBH9esd+8tAGWubk7v5EhdQf
	Ecdqk83FnXav/RxyTXZFoC4cO0a1KOvK8UfLnJfkh5rddlxzKM8eMjtY0W0pjBCNMyqozhZxol3
	fVzTkuxfr0tuLmgMSNN3iGl1w/uu4mV7rYEHHltAYaCrOx7Rb/aoZcQacTGCJ93nsaqDudXa7+e
	0xSSUWM8FQdzhXDhWSyvUr9SB+jCKFfN7npvwfe+nWiwTzlWYK1ie0ecvcO336FOMZMD4yewi2N
	g0PVbmjQYW6FqppXuhsuzwCXiabSfQ==
X-Received: by 2002:a05:7301:688:b0:2ed:e16:6b4a with SMTP id
 5a478bee46e88-3039869b963mr6436744eec.32.1779097882266; Mon, 18 May 2026
 02:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <20260517074306.30937-3-clamor95@gmail.com>
 <CAPVz0n3gLYXab4H+DihfTkdBkGPqTvmoFVY1Cwuafd70KPtYbA@mail.gmail.com> <20260518092833.GR305027@google.com>
In-Reply-To: <20260518092833.GR305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 18 May 2026 12:51:11 +0300
X-Gm-Features: AVHnY4IgFlUyRpln1URXZyQyooZBVQu7rOOaMkPI7Cfdheurgkdm_oeKquAVOyE
Message-ID: <CAPVz0n3QAGk_iebCQdEnv_fG2nnGdM1xm__=wG+4KqVJzs-T_g@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] mfd: lm3533: Convert to use OF bindings
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Rob Herring <robh@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EEE3556A26D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8184-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=BF=D0=BD, 18 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:2=
8 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 17 May 2026, Svyatoslav Ryhel wrote:
>
> > =D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
10:43 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Since there are no users of this driver via platform data, remove the
> > > platform data support and switch to using Device Tree bindings.
> > > Additionally, optimize functions used only by platform data.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/iio/light/lm3533-als.c      | 123 +++++--------
> > >  drivers/leds/leds-lm3533.c          |  60 ++++---
> > >  drivers/mfd/lm3533-core.c           | 257 +++++++++-----------------=
--
> > >  drivers/video/backlight/lm3533_bl.c |  52 ++++--
> > >  include/linux/mfd/lm3533.h          |  51 +-----
> > >  5 files changed, 202 insertions(+), 341 deletions(-)
>
> Please snip replies.
>
> [...]
>
> > > -static int lm3533_device_led_init(struct lm3533 *lm3533)
> > > -{
> > > -       struct lm3533_platform_data *pdata =3D dev_get_platdata(lm353=
3->dev);
> > > -       int i;
> > > -       int ret;
> > > -
> > > -       if (!pdata->leds || pdata->num_leds =3D=3D 0)
> > > -               return 0;
> > > -
> > > -       if (pdata->num_leds > ARRAY_SIZE(lm3533_led_devs))
> > > -               pdata->num_leds =3D ARRAY_SIZE(lm3533_led_devs);
> > > -
> > > -       for (i =3D 0; i < pdata->num_leds; ++i) {
> > > -               lm3533_led_devs[i].platform_data =3D &pdata->leds[i];
> > > -               lm3533_led_devs[i].pdata_size =3D sizeof(pdata->leds[=
i]);
> > > +               dev_err(dev, "failed to set boost ovp\n");
> > > +               goto err_disable;
> > >         }
> > >
> > > -       ret =3D mfd_add_devices(lm3533->dev, 0, lm3533_led_devs,
> > > -                             pdata->num_leds, NULL, 0, NULL);
> > > +       ret =3D devm_mfd_add_devices(dev, 0, lm3533_child_devices,
> > > +                                  ARRAY_SIZE(lm3533_child_devices),
> > > +                                  NULL, 0, NULL);
> >
> > Question to Lee Jones. Would you find acceptable if the driver will
> > build cell list dynamically based on the nodes in the device tree?
> > This is LED controller after all, not all leds can be populated and
> > same LED control bank can be linked to all LVLEDs for example.
> >
> > If you are ok, would this implementation satisfy you?
>
> Generally not.  Create the non-dynamical information statically
> (obviously not 'const'), then you can add dynamic data as you go.
>

Hm, code I have proposed below creates mfd_cell structure with 7 cells
(max amount of children), and fills each slot with devices described
in the device tree. This seems to fit your expectation. LM3533 is
basically a LED controller but it is set as mfd and IMHO would be
undesirable to create dummy devices.

> >         struct mfd_cell lm3533_cells[LM3533_CELLS_MAX];
> >         u32 count =3D 0, reg;
> >         int ret;
> >
> >         device_for_each_child_node_scoped(lm3533->dev, child) {
> >                 if (!fwnode_device_is_available(child))
> >                         continue;
> >
> >                 if (count >=3D LM3533_CELLS_MAX)
> >                         break;
> >
> >                 if (fwnode_device_is_compatible(child, "ti,lm3533-als")=
) {
> >                         lm3533_cells[count].name =3D "lm3533-als";
> >                         lm3533_cells[count].id =3D PLATFORM_DEVID_NONE;
> >                         lm3533_cells[count].of_compatible =3D "ti,lm353=
3-als";
> >
> >                         lm3533->have_als =3D true;
> >                 }
> >
> >                 if (fwnode_device_is_compatible(child, "ti,lm3533-backl=
ight")) {
> >                         ret =3D fwnode_property_read_u32(child, "reg", =
&reg);
> >                         if (ret || reg > LM3533_HVLED_ID_MAX) {
> >                                 dev_err(dev, "invalid backlight reg %d\=
n", reg);
> >                                 continue;
> >                         }
> >
> >                         lm3533_cells[count].name =3D "lm3533-backlight"=
;
> >                         lm3533_cells[count].id =3D reg;
> >                         lm3533_cells[count].of_compatible =3D
> > "ti,lm3533-backlight";
> >
> >                         lm3533->have_backlights =3D true;
> >                 }
> >
> >                 if (fwnode_device_is_compatible(child, "ti,lm3533-leds"=
)) {
> >                         ret =3D fwnode_property_read_u32(child, "reg", =
&reg);
> >                         if (ret || reg < LM3533_HVLED_ID_MAX ||
> >                             reg > LM3533_LVLED_ID_MAX) {
> >                                 dev_err(dev, "invalid LED reg %d\n", re=
g);
> >                                 continue;
> >                         }
> >
> >                         lm3533_cells[count].name =3D "lm3533-leds";
> >                         lm3533_cells[count].id =3D reg - LM3533_HVLED_I=
D_MAX;
> >                         lm3533_cells[count].of_compatible =3D "ti,lm353=
3-leds";
> >
> >                         lm3533->have_leds =3D true;
> >                 }
> >
> >                 count++;
> >         }
> >
> > >         if (ret) {
> > > -               dev_err(lm3533->dev, "failed to add LED devices\n");
> > > -               return ret;
> > > -       }
> > > -
> > > -       lm3533->have_leds =3D 1;
> > > -
> > > -       return 0;
> > > -}
>
> [...]
>
> --
> Lee Jones

