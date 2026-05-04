Return-Path: <linux-leds+bounces-7980-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKzsIgFp+GkSuQIAu9opvQ
	(envelope-from <linux-leds+bounces-7980-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 11:38:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 198244BB12A
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 11:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61E973013B7E
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 09:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C887C37D123;
	Mon,  4 May 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ7gQrT+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309D37D13A
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887474; cv=pass; b=uPvmQgOiE04QzRR56JghE9pgqF1nkSpeusGadlyZcIt4I+4E/2pN/qqMj2bPoTY7yEgP495oHGsJRa7tWtz/NTyBiTwrh1lQObN2JOy79kRbzeG20DaVEz0KsmPos+zIFp6W9YvrSBnI9KHDthVq4jvyW8/KGmveHCmnP4va16s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887474; c=relaxed/simple;
	bh=71PO99w70GlfqT+VogiZjkbZiYM7VZxIKnVBLiCBfJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hlu46QCTm96WL2egBfCIZI0c9Dat7A8ZTqpfOiB6uDIChTimdF949ALM3hwlKARR0k2HJrYq0GcK8Fx8srLrl2iJPTdk74bcQ1qTek9uSMkT1dnoC3gfkQTtHoeqyuzHsH4+L4YNLxNo9nCh404C3zWawtCqshr2g15QmhEWzWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ7gQrT+; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so157102eec.0
        for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 02:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777887472; cv=none;
        d=google.com; s=arc-20240605;
        b=MHXsKz67Cinwmas2sg+MsnYZDAsdUnznJTp8WmGjWRM1VlcDaW6nUXF9igKsXIIaxB
         HOrz782inra3Ql+UIL2E88vxalxQnuBzRSO+0JXR4TmSgCXo58r5S74gNwaOo2DIs6M8
         z2kcS6yNAvA2/EOfLh06tHX1tZJ/bt7AO/TW9mDeOFiHCTuYSw0BtUcazz7+nVl51lda
         IKy0FIgZz4+MMhRjak6RQtz3pdxr5MIqNWBgNXgrHqzXxzSglhHGBbjdTrw6YWNoeq8V
         v5U8AcDOUrTcR4qXyyHUxKkldvrkoKttl8QjB/OosQX6kdEOu6sz5y30Ja66P9VBCp8n
         zTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uQgaIU3/lUFPecRotTETL58okHimyQ3sCU6EdEBtpPc=;
        fh=0Ije0PyFYKRQWie9k9ZzkWXVatER8nyg+k4Av0TjlLE=;
        b=PHaRWvw5sszZCWKfiBD1JSciyK0Ckxt3wj47yRSiXCuba2kHCxNSOMCoj5zPDwTfHW
         44M2fKTDa9P4g7GX9nySWX32kU+ior6tRC7NBXsoG5ZdJ0dw5JZiEiKzfZbkWASnB8pb
         i3QQorZO2AO5JJ260n+rUmBgkvikJ8NhjrztI/N49hM8NfTov0Oy9K1sPvwtpMCjeEm+
         u+BTXEceef08xM6qH9zadOQIOfSx1eLHrYZDbfb5VecoeiKA3lmdmWB4S85g2kuSMGlY
         6rMvHux5AyhByIDsxvAEOiRnJUKLpY60GMFZDqkJaq2hiSh8DgQjUYVjmnr9woMA/d7l
         8knQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777887472; x=1778492272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQgaIU3/lUFPecRotTETL58okHimyQ3sCU6EdEBtpPc=;
        b=RQ7gQrT+nPgQcBXmnHv2r+dsbaI+bxccU2MqIxm7HwnTuA8eL80ZGmnjlLWsWBvpKL
         jgJPrM1oTKH5dn1G4TIktOq8xc4rHqEVQR6eyb3B7fMsVWr9JmDxrWmO3e5tUbuM5X01
         KYsOp/9x2noSwvo2ecCxghLwn2B6L1ZxIAZa+tGJTl+XWkdIoL5a5WDqUBXRr/geP85P
         NsmtBsyk80EY++wCmeqHYSt+Of4vywMvUfh3aePt3vtuvXDyapaHHBVzqT3n5Vc4kyVc
         YSeSwqGZmnfq0kxAaviZL2hxRU0iW7j/SWOsfOelS/3bqIKiW9TixCCR7dHkwGaPzHFa
         3GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887472; x=1778492272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQgaIU3/lUFPecRotTETL58okHimyQ3sCU6EdEBtpPc=;
        b=MJNsyc0dGknbI2Fn71Ed0X4Rd8BCvGHrgGViW6Oiems9SA0IiK9+t+7oEtwo8JdYq5
         OlluiLdeA1O5Lulv1l0udsi/Y9cey7rzuyYsXqkl1n+2CkGVq80rMAKdrHhcvR8WAH9D
         faXLoRfF90i/cA14IFHBtV2vS0s6FN1pUYbQIquDcT+nRiEWNmYxCPQeVJD6VKbRcjuz
         3sjBN1NNo9N34xha74rkIz6LfhE4+Lwip3luic6/os4tHdi3S3TN/16FwFXcgmT22SDJ
         xMoet2F6iwmBfTdX06cYWGdKQpMCWhNZvS+iM9Wg2mu1JGVHCnR15fjbXb5jNPez+Xip
         4HBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+83T3CILCr8O+214DT/P5HTXchda858DuEiP9YQCUSOEXvbhXdRYlIoKIaG5TmK7XAPkPtWZCbp/sO@vger.kernel.org
X-Gm-Message-State: AOJu0YwwBN70cZWbcthyQKIualicsemnS7ZG73BIQfMWjRtUyQIvMTPj
	fhaZSkI6Xw1zWUDiUwibhiJw+IYV5i0yFfXFUjkRn46tQQahauiC4z0x3+nrhwQcJ5G4IYMZU7X
	tKoSOv3Her3aV4JTp8VDYYqTLonC5XoA=
X-Gm-Gg: AeBDiesY76dNg+ZUztDJUwaFBGSFw96rQUnJpBVbQb/Odyt0vYzRBfS25PbGiZnRR2Q
	iBSsZljjq2efkyW41xK70/bnWLvQ5I+8LqSEgRvJ581eYaNITCngh5z6LHPsslzRLG596cBhTKp
	yviyVCZJDAt/Yf/ngaNRTrZ2t4RrthpgM6IaosrE1TP+h7N7QW7/hBWPX67kh1MhG9ZAUjtP/7G
	zpw1G7881p9B7SVmX6FH+KLb9/2H9m6KLGqQrkaVKtSX89LiStJ18fr+VkuVokG1Taz/DTRpPeF
	AsEfSBjRWJdrQwL8nX9d+4XfvaJshA==
X-Received: by 2002:a05:7301:1e8c:b0:2d2:ff9e:c07d with SMTP id
 5a478bee46e88-2efbb193dd5mr3868462eec.24.1777887472107; Mon, 04 May 2026
 02:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com> <20260503164445.215540-6-clamor95@gmail.com>
 <afg-ldFd7hockYn-@kekkonen.localdomain> <CAPVz0n0w90AuczbhdPrWewpKpJC_iJ5u3LsPug5mVPJ+KDnZRQ@mail.gmail.com>
In-Reply-To: <CAPVz0n0w90AuczbhdPrWewpKpJC_iJ5u3LsPug5mVPJ+KDnZRQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 12:37:40 +0300
X-Gm-Features: AVHnY4JXa9_A9FgPD7H53X5gj2MQlEeVpKV7NY_VEYrG3Y12RWIXEP2zJiTYx74
Message-ID: <CAPVz0n0f5Q5+CbBRU3VNT_juir3vPi4EywwTgM2oCK7KsdgLUQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 198244BB12A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7980-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

=D0=BF=D0=BD, 4 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:40=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D0=BD, 4 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 09:=
37 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi Svyatoslav,
> >
> > On Sun, May 03, 2026 at 07:44:44PM +0300, Svyatoslav Ryhel wrote:
> > > Add support for power management features to better control the LM356=
0
> > > within the media framework. To achieve the desired PM support, the HW=
EN
> > > GPIO and VIN power supply were added and configured into power on/off
> > > sequences. Added PM operations along with the PM configuration setup.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++-=
--
> > >  1 file changed, 110 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > > index ce4b09d1f208..15741ea5684f 100644
> > > --- a/drivers/media/i2c/lm3560.c
> > > +++ b/drivers/media/i2c/lm3560.c
> > > @@ -12,13 +12,16 @@
> > >  #include <linux/bitmap.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/module.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/mod_devicetable.h>
> > >  #include <linux/mutex.h>
> > >  #include <linux/of.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/property.h>
> > >  #include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > >  #include <linux/videodev2.h>
> > >  #include <media/i2c/lm3560.h>
> > >  #include <media/v4l2-ctrls.h>
> > > @@ -49,6 +52,8 @@ enum led_enable {
> > >   * @dev: pointer to &struct device
> > >   * @regmap: reg. map for i2c
> > >   * @lock: muxtex for serial access.
> > > + * @hwen_gpio: line connected to HWEN pin
> > > + * @vin_supply: line connected to IN supply (2.5V - 5.5V)
> > >   * @led_mode: V4L2 LED mode
> > >   * @ctrls_led: V4L2 controls
> > >   * @subdev_led: V4L2 subdev
> > > @@ -63,6 +68,9 @@ struct lm3560_flash {
> > >       struct regmap *regmap;
> > >       struct mutex lock;
> > >
> > > +     struct gpio_desc *hwen_gpio;
> > > +     struct regulator *vin_supply;
> > > +
> > >       enum v4l2_flash_led_mode led_mode;
> > >       struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
> > >       struct v4l2_subdev subdev_led[LM3560_LED_MAX];
> > > @@ -177,12 +185,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ct=
rl, enum lm3560_led_id led_no)
> > >       struct lm3560_flash *flash =3D to_lm3560_flash(ctrl, led_no);
> > >       int rval =3D -EINVAL;
> > >
> > > +     if (!pm_runtime_get_if_in_use(flash->dev))
> > > +             return 0;
> > > +
> > >       if (ctrl->id =3D=3D V4L2_CID_FLASH_FAULT) {
> > >               s32 fault =3D 0;
> > >               unsigned int reg_val;
> > >               rval =3D regmap_read(flash->regmap, REG_FLAG, &reg_val)=
;
> > > -             if (rval < 0)
> > > +             if (rval < 0) {
> > > +                     pm_runtime_put(flash->dev);
> > >                       return rval;
> > > +             }
> > >               if (reg_val & FAULT_SHORT_CIRCUIT)
> > >                       fault |=3D V4L2_FLASH_FAULT_SHORT_CIRCUIT;
> > >               if (reg_val & FAULT_OVERTEMP)
> > > @@ -192,6 +205,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl=
, enum lm3560_led_id led_no)
> > >               ctrl->cur.val =3D fault;
> > >       }
> > >
> > > +     pm_runtime_put(flash->dev);
> > > +
> > >       return rval;
> > >  }
> > >
> > > @@ -201,6 +216,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl=
, enum lm3560_led_id led_no)
> > >       u8 tout_bits;
> > >       int rval =3D -EINVAL;
> > >
> > > +     if (!pm_runtime_get_if_in_use(flash->dev))
> >
> > This should be pm_runtime_get_if_active().
> >
>

For both lm3560_set_ctrl and lm3560_get_ctrl or only for lm3560_set_ctrl?

> Noted
>
> > > +             return 0;
> > > +
> > >       switch (ctrl->id) {
> > >       case V4L2_CID_FLASH_LED_MODE:
> > >               flash->led_mode =3D ctrl->val;
> > > @@ -246,6 +264,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl=
, enum lm3560_led_id led_no)
> > >               break;
> > >       }
> > >
> > > +     pm_runtime_put(flash->dev);
> > > +
> > >       return rval;
> > >  }
> > >
> > > @@ -409,6 +429,38 @@ static int lm3560_init_device(struct lm3560_flas=
h *flash)
> > >       return rval;
> > >  }
> > >
> > > +static int __maybe_unused lm3560_power_off(struct device *dev)
> > > +{
> > > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > > +
> > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > > +     regulator_disable(flash->vin_supply);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int __maybe_unused lm3560_power_on(struct device *dev)
> > > +{
> > > +     struct lm3560_flash *flash =3D dev_get_drvdata(dev);
> > > +     int rval;
> > > +
> > > +     rval =3D regulator_enable(flash->vin_supply);
> > > +     if (rval < 0) {
> > > +             dev_err(flash->dev, "failed to enable vin power supply\=
n");
> > > +             return rval;
> > > +     }
> > > +
> > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > > +
> > > +     rval =3D lm3560_init_device(flash);
> > > +     if (rval < 0) {
> > > +             lm3560_power_off(dev);
> > > +             return rval;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > >  {
> > >       int led_no;
> > > @@ -442,6 +494,17 @@ static int lm3560_probe(struct i2c_client *clien=
t)
> > >
> > >       bitmap_zero(flash->led_id, LM3560_LED_MAX);
> > >
> > > +     flash->hwen_gpio =3D devm_gpiod_get_optional(flash->dev, "enabl=
e",
> > > +                                                GPIOD_OUT_LOW);
> > > +     if (IS_ERR(flash->hwen_gpio))
> > > +             return dev_err_probe(flash->dev, PTR_ERR(flash->hwen_gp=
io),
> > > +                                  "failed to get hwen gpio\n");
> > > +
> > > +     flash->vin_supply =3D devm_regulator_get(flash->dev, "vin");
> > > +     if (IS_ERR(flash->vin_supply))
> > > +             return dev_err_probe(flash->dev, PTR_ERR(flash->vin_sup=
ply),
> > > +                                  "failed to get vin-supply\n");
> > > +
> > >       flash->peak =3D LM3560_PEAK_1600mA;
> > >       rval =3D device_property_read_u32(flash->dev,
> > >                                       "ti,peak-current-microamp", &pe=
ak_ua);
> > > @@ -469,9 +532,19 @@ static int lm3560_probe(struct i2c_client *clien=
t)
> > >                                &flash->max_flash_timeout);
> > >       flash->max_flash_timeout /=3D 1000;
> > >
> > > +     rval =3D regulator_enable(flash->vin_supply);
> > > +     if (rval < 0)
> > > +             return dev_err_probe(flash->dev, rval,
> > > +                                  "failed to enable vin power supply=
\n");
> > > +
> > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > > +
> > >       rval =3D lm3560_init_device(flash);
> > >       if (rval < 0)
> > > -             return rval;
> > > +             goto error_disable;
> > > +
> > > +     pm_runtime_set_active(flash->dev);
> > > +     pm_runtime_enable(flash->dev);
> > >
> > >       for_each_available_child_of_node(dev_of_node(flash->dev), node)=
 {
> > >               u32 reg;
> > > @@ -492,10 +565,10 @@ static int lm3560_probe(struct i2c_client *clie=
nt)
> > >
> > >                       rval =3D lm3560_subdev_init(flash, reg, node);
> > >                       if (rval < 0) {
> > > -                             lm3560_subdev_cleanup(flash);
> > > -                             return dev_err_probe(flash->dev, rval,
> > > -                                                 "failed to register=
 led%d\n",
> > > -                                                 reg);
> > > +                             dev_err(flash->dev,
> > > +                                     "failed to register led%d: %d\n=
",
> > > +                                     reg, rval);
> > > +                             goto error_clean;
> > >                       }
> > >
> > >                       set_bit(reg, flash->led_id);
> > > @@ -504,7 +577,23 @@ static int lm3560_probe(struct i2c_client *clien=
t)
> > >
> > >       i2c_set_clientdata(client, flash);
> > >
> > > +     pm_runtime_set_autosuspend_delay(flash->dev, 1000);
> > > +     pm_runtime_use_autosuspend(flash->dev);
> > > +     pm_runtime_idle(flash->dev);
> > > +
> > >       return 0;
> > > +
> > > +error_clean:
> > > +     pm_runtime_disable(flash->dev);
> > > +     pm_runtime_set_suspended(flash->dev);
> > > +
> > > +     lm3560_subdev_cleanup(flash);
> > > +
> > > +error_disable:
> > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > > +     regulator_disable(flash->vin_supply);
> > > +
> > > +     return rval;
> > >  }
> > >
> > >  static void lm3560_remove(struct i2c_client *client)
> > > @@ -512,8 +601,22 @@ static void lm3560_remove(struct i2c_client *cli=
ent)
> > >       struct lm3560_flash *flash =3D i2c_get_clientdata(client);
> > >
> > >       lm3560_subdev_cleanup(flash);
> > > +
> > > +     /*
> > > +      * Disable runtime PM. In case runtime PM is disabled in the ke=
rnel,
> > > +      * make sure to turn power off manually.
> > > +      */
> > > +     pm_runtime_disable(&client->dev);
> > > +     if (!pm_runtime_status_suspended(&client->dev)) {
> > > +             lm3560_power_off(&client->dev);
> > > +             pm_runtime_set_suspended(&client->dev);
> > > +     }
> > >  }
> > >
> > > +static const struct dev_pm_ops lm3560_pm_ops =3D {
> > > +     SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
> > > +};
> > > +
> > >  static const struct of_device_id lm3560_of_match[] =3D {
> > >       { .compatible =3D "ti,lm3559" },
> > >       { .compatible =3D "ti,lm3560" },
> > > @@ -532,7 +635,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
> > >  static struct i2c_driver lm3560_i2c_driver =3D {
> > >       .driver =3D {
> > >                  .name =3D LM3560_NAME,
> > > -                .pm =3D NULL,
> > > +                .pm =3D pm_ptr(&lm3560_pm_ops),
> > >                  .of_match_table =3D lm3560_of_match,
> > >                  },
> > >       .probe =3D lm3560_probe,
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus

