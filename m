Return-Path: <linux-leds+bounces-7974-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLQqItZM+GmQsQIAu9opvQ
	(envelope-from <linux-leds+bounces-7974-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 09:37:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C48C4B96F7
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 09:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 955353001030
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 07:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4428C3009EE;
	Mon,  4 May 2026 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEJTCUyM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D523033FD
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880275; cv=pass; b=CC4hkV1hvzukGqDZGN/sKf7TgW+7Q3tquzeQgHk5GaHqLbh+I54KUghUX4WVLqjf78OS3wD9kC8pe+s/lQlkNHqfbMtCzQOCAV5WLxesDoBotm4iKyahle+Y5rL4q2h+ouB6r7hmMgH3sEJgKtBhQh6sQCG9QAhjQBLB2k61/vU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880275; c=relaxed/simple;
	bh=SkAyZheX4waCWuHGvfquozr5NNPe6Gsd7f1v3OGagJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSoRjiDMmVwQvgPtmVLbxQcDKFWRWdm7Tf92ZqmFfUYVvWYp5i9SdUwJkPavFwevYFeCHut/lZCZkQNhKMLOYiZanNodpAkiiW2IAeL6Rp8nou3I6SCIGsQK21fQwMOnkp2UfgyNeEPIUyTh0ao94USBsSXg5Wl16NDeIom3s/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEJTCUyM; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ef84d016d9so5072442eec.0
        for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 00:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880271; cv=none;
        d=google.com; s=arc-20240605;
        b=kqVok5hGzwSzQUUKmz3OIbY7xl39n0zS1QgseA2N2KTQJ56vTa4mdj6LlJEm94TeWv
         qqBLaXBHSB45LxRGu3dXpzf5r1LghpsgPPjm88SomroNIco/3ZDRHbUzimH/pvQmLRCB
         Ui4fOW4z6j/3DPRXJWZjAQpBCoDt5ZdSS7cJDoDrbQgDh79bjQOWIJHqZuNlRXMyIGzJ
         f2TApXOvTTfwf8mkZFnDOIYmPosRyxEI5oVIIEmaJYcPE1gAtgbI5sOZVu2l8VaJ3Bmq
         7gOBrGX380mYlUXZ/nrfyheBTgabnaGMILhA1ntc8/miz4QuLAGgE3i1tTuZ8owJXIVY
         5Sgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E63KbLdB4yYfhixBlPz2gKSrMtI+SLvYx7zD9jCFADA=;
        fh=g+g3fyJBlMTSVuiSENlGJX565D1PYxi6CGfunG1EeDo=;
        b=KQtbk9/ZMbx1onjw55tXkni32SjCBLvvixL/RV5CA9mfGynG/eUa6AKQJTbkiPwZ6c
         QoibL1G9rfJAnIwVO25MiXJG0HMekKGx7b0ieZVFnYJCg5/fYt0P0tCGV/uAn2ZpZLEg
         PXtvfd94lHy4sYwvesX4o2BJzpFHCR3C49q/V+wGWJmRsJKdhV+L75XCYT8MKNJF/s62
         jOddOBptrW394YDvt2IjQtg9uBnCegcSKmhtGGJaWGoxEQv8lNHYXfpg1hC85j4p1RKY
         hzsDcyEXX6goNXUrGDlMX47tCgDDkCW3b1yDaPSXDHp9FZOP8g4ZJM5RRnjq00QAXNN8
         fJtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777880271; x=1778485071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E63KbLdB4yYfhixBlPz2gKSrMtI+SLvYx7zD9jCFADA=;
        b=oEJTCUyMLKgSL7aTv/ScnP9BjzmVl/wtu/kjoVgHMeTDkf0XkH/eGYpjFk8N/uv75x
         yvc+VnSPD9yV66ljo+3zGsGajXbaeKE8a72C7JReZ59uQ//DGWKBX3lL6FctvTZS0oEo
         YCEdgN4W3dd/1cxMxbYj4l28gXTQ/HWjgVxhOgDiOljygvjXDw4aT7FVv0bXrCe1N7oy
         iyxtpik71f+Hav+hKiE6KJJrP/FJIN4LoGmge6ivXc4SXujVZRjogcHG9HPPrul6C2t/
         CcIoDvFElsyIRyL/S7Pkc6J9FZL2YxUvyaQjzqd0BI8/BHTLKLIsKPZN9FSfb+kB/SBD
         a8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880271; x=1778485071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E63KbLdB4yYfhixBlPz2gKSrMtI+SLvYx7zD9jCFADA=;
        b=csjn7Nv7jHxEJl8OSzAJDLFBQdhZQ80tIfEbtbSPnAS/SsMj5i7nHgmfKZfnm9Cfxj
         6A17Vb7TSC7Kz3oKejn7Acy6FI4KfkQQr0HOl31CLpxfV5Iuqh8yTlzUmXDM1NxjZcLI
         zlk6oBB0kb77UNfuEiSHXqFWTZZ1olbgiOqEMqM8IEuaXmnzp1QLK8fh7RsX1dreE6e9
         6EGLDvkWr3OXKM6ge83QMT67lNWuI6mkI7dOUM4aKlcEbFeBphe5c2e6RgNKqXwjMZqj
         m6lEXvxV9D5EFYvfjUwxuxJVdvBMcp9nrvBDMyKxOLEDodvm+7npfhbnELMnhecamH/R
         w8fA==
X-Forwarded-Encrypted: i=1; AFNElJ9pb1y8Quag4RePhqDyIoGMFlImteMpHQvvzrsSbTDuigsT6ihj43pDklaJw65XF+qrB0iFkouoLk4/@vger.kernel.org
X-Gm-Message-State: AOJu0YyVaVphPaZtzLnkKH5tlxuy1qS8r+94C1nfgdhs3uzA2sE+cGLU
	RjH9qyUgauD+OsqY32lkTf0Yt8xsvEHPDTUJoJvEUoX2Ro1nBRqbULdr+xpGW2mS+JQoSffAeXr
	WIXFVPwL3ENOM1Q75b+yoV5rQnZIJMic=
X-Gm-Gg: AeBDieuBFOrHhssZtwKqmBtOYs0K3vHaHDM+4YjHlUq3wCQ0hnSOj1Lv69GuzmXSJpT
	xBA3ds0LqKEbTAzuiPyP1Jb3yLyzySR49O4X5KoLlS1VzmrsIAjEc1cZH5leDjK9uF7fNATnQfn
	m/33+4OKVj6ZIu1ZEz4g4QUuycFdG8oxAJcpJnBhbQ0VS0sVuT5oRpAd8rZ1tvJjAor8lSA2RBB
	S4AdHVIMATD5MwnEJVrHCYlnhtESpEVYYU42gbxqz1kFJyv6wu922SyOo7tfp3FXncJVyfIkBiq
	9cgxRTxE4lLTMBJkSP0=
X-Received: by 2002:a05:693c:2b0d:b0:2be:6f30:f2f9 with SMTP id
 5a478bee46e88-2efb9f7e8c7mr3711282eec.26.1777880271400; Mon, 04 May 2026
 00:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com> <20260503164445.215540-4-clamor95@gmail.com>
 <afg8JPS3KGMO4xj9@kekkonen.localdomain>
In-Reply-To: <afg8JPS3KGMO4xj9@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 10:37:40 +0300
X-Gm-Features: AVHnY4JmogR967dYeT77ddhiewmS1p-4HAi9vf-al-5f9Rko60NJTYpT2cyWY1s
Message-ID: <CAPVz0n1JjHY2R3fEhkt4Ejwq81K=uHVrZQjkJ5dUDYJOFN_mmQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] media: i2c: lm3560: Optimize mutex lock usage
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2C48C4B96F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7974-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmail.com]

=D0=BF=D0=BD, 4 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 09:26=
 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Sun, May 03, 2026 at 07:44:42PM +0300, Svyatoslav Ryhel wrote:
> > Pass the device's own mutex lock to the control handler so that the med=
ia
> > framework can handle control access instead of managing it manually. Th=
e
> > lock must be common to both sub-devices since they share same hardware,
> > so the individual sub-device locks will not work here.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/lm3560.c | 19 ++++++-------------
> >  1 file changed, 6 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > index edfb07587cab..5b568ed9536b 100644
> > --- a/drivers/media/i2c/lm3560.c
> > +++ b/drivers/media/i2c/lm3560.c
> > @@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl=
, enum lm3560_led_id led_no)
> >       struct lm3560_flash *flash =3D to_lm3560_flash(ctrl, led_no);
> >       int rval =3D -EINVAL;
> >
> > -     mutex_lock(&flash->lock);
> > -
> >       if (ctrl->id =3D=3D V4L2_CID_FLASH_FAULT) {
> >               s32 fault =3D 0;
> >               unsigned int reg_val;
> >               rval =3D regmap_read(flash->regmap, REG_FLAG, &reg_val);
> >               if (rval < 0)
> > -                     goto out;
> > +                     return rval;
> >               if (reg_val & FAULT_SHORT_CIRCUIT)
> >                       fault |=3D V4L2_FLASH_FAULT_SHORT_CIRCUIT;
> >               if (reg_val & FAULT_OVERTEMP)
> > @@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >               ctrl->cur.val =3D fault;
> >       }
> >
> > -out:
> > -     mutex_unlock(&flash->lock);
> >       return rval;
> >  }
> >
> > @@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >       u8 tout_bits;
> >       int rval =3D -EINVAL;
> >
> > -     mutex_lock(&flash->lock);
> > -
> >       switch (ctrl->id) {
> >       case V4L2_CID_FLASH_LED_MODE:
> >               flash->led_mode =3D ctrl->val;
> > @@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl=
, enum lm3560_led_id led_no)
> >       case V4L2_CID_FLASH_STROBE_SOURCE:
> >               rval =3D regmap_update_bits(flash->regmap,
> >                                         REG_CONFIG1, 0x04, (ctrl->val) =
<< 2);
> > -             if (rval < 0)
> > -                     goto err_out;
> >               break;
> >
> >       case V4L2_CID_FLASH_STROBE:
> >               if (flash->led_mode !=3D V4L2_FLASH_LED_MODE_FLASH) {
> >                       rval =3D -EBUSY;
> > -                     goto err_out;
> > +                     break;
> >               }
> >               flash->led_mode =3D V4L2_FLASH_LED_MODE_FLASH;
> >               rval =3D lm3560_mode_ctrl(flash);
> > @@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >       case V4L2_CID_FLASH_STROBE_STOP:
> >               if (flash->led_mode !=3D V4L2_FLASH_LED_MODE_FLASH) {
> >                       rval =3D -EBUSY;
> > -                     goto err_out;
> > +                     break;
> >               }
> >               flash->led_mode =3D V4L2_FLASH_LED_MODE_NONE;
> >               rval =3D lm3560_mode_ctrl(flash);
> > @@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, =
enum lm3560_led_id led_no)
> >               break;
> >       }
> >
> > -err_out:
> > -     mutex_unlock(&flash->lock);
> >       return rval;
> >  }
> >
> > @@ -328,6 +318,8 @@ static int lm3560_init_controls(struct lm3560_flash=
 *flash,
> >       if (fault !=3D NULL)
> >               fault->flags |=3D V4L2_CTRL_FLAG_VOLATILE;
> >
> > +     hdl->lock =3D &flash->lock;
> > +
> >       if (hdl->error)
> >               return hdl->error;
> >
> > @@ -363,6 +355,7 @@ static int lm3560_subdev_init(struct lm3560_flash *=
flash,
> >       if (rval < 0)
> >               goto err_out;
> >       flash->subdev_led[led_no].entity.function =3D MEDIA_ENT_F_FLASH;
> > +     flash->subdev_led[led_no].state_lock =3D &flash->lock;
>
> I must have missed it earlier but you can use the control handler's mutex
> here. As a result, I believe you can drop the driver's own mutex
> altogether.
>

Control handler mutexes are per device, but both devices share the
same hardware so those mutexes will not prevent simultaneous access
from both devices. For this reason driver's own mutex is used.

> >
> >       rval =3D v4l2_async_register_subdev(&flash->subdev_led[led_no]);
> >       if (rval < 0) {
>
> --
> Kind regards,
>
> Sakari Ailus

