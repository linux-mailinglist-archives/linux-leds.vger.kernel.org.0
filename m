Return-Path: <linux-leds+bounces-7975-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OyfL4NN+GmQsQIAu9opvQ
	(envelope-from <linux-leds+bounces-7975-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 09:40:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC14B974C
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 09:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9E213003ED9
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 07:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FD53019D9;
	Mon,  4 May 2026 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DL1Ss2ML"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482C2F7AD2
	for <linux-leds@vger.kernel.org>; Mon,  4 May 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880426; cv=pass; b=Axs5XJnm66izHMfDF09mnwIB9fYmD5aH+uRxUQ9PPV9vQ1kEdj6sxqxnJZKMWro/oT2x+ZKX4wHn7A9OeONgle9jfaOE96Uoy6Nw3YYyGz69DHUoA6HeFQoSfY/2TNdihEW1iudALQz6aC1Gw/pFZKy6ljMhXx12oLsdNjIlMd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880426; c=relaxed/simple;
	bh=iOIZC0Rb26Cur9uVnDQRUVm7x6p7aLLZEKmBIeaBAiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cj2K/mG4CIWwPKnoogiueK5MjQkocXZFFkUcPkcBAdb2kwWqwq7KE2jk4vlYXM3VjOWaqxoX7h7WesT7huDEoUNzoVibmUoqTnj2xiwyNFbVM3t+lqVNszeMQGLq+GbCLGBF4DE84V93NvjCB2itjasL9NLxdamAuSS7mMCdI68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DL1Ss2ML; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ee1054627bso2385218eec.1
        for <linux-leds@vger.kernel.org>; Mon, 04 May 2026 00:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880423; cv=none;
        d=google.com; s=arc-20240605;
        b=jJOin8L4yBkAMHurxM8d+xWhqdxgIeq+fepWaZMCzZRAqxWyw7LIkemlNF/j7mUCoh
         JWTpk1ttkEK5g0MCv9+PhPLiWZI6f/WF9ZnY9x7HI4QvbzV63CDYAnvE44Eo7T4u6gct
         Cd2ocMDq09eP2vLF4gOjRgP7YV2VI/AfsPP4BH8j97yQYosk03C1rZSzHoUmSdPE+oCl
         eK0JCziKNMj2jcYIp06g49q4At1A5cYJ3LYpDX8xVd1/UILFvWfJz5T/rfAPBDCMLAFl
         WOmRIDpqPwRGTSsz6XMhQkJ/UNr5rhZYFE4ymtvdXKA/ZM0FtTKbo7J8LbWAI/w8aWul
         hKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVoTA2LpzvgPxPTDBkf5ngvZMRRYbPntshQWcVxxYnA=;
        fh=CxXN8DjJ33eqta/fsE0XRNB9lE+dTUSf5augDrDb7GI=;
        b=l0Vpx3HqSBLJD7m9OFA7Q7NnnxT3/cka1VyvN7X11f+J8E/PYteFjL/YfaOWHME0+q
         LK+rgRSgyUyo7F1qhPU5c7qbkRHhQ0PxN4iVl1bzpWIFyWnzE2VMFFY5sEsE7V4Z1eqM
         iWswgqnoh8w5/oTR/xgHwcP4nE3WNdeLxuaFqlYNNYKmPbBe/WddzGAl0OzvHS0qNBM/
         1MPso97vCWLJXR0yUMDL7QM4KlsKUVGh//ubbDq4quulH9lDHzc6YoRkmZtzETjDErwk
         jQ9vzSdAFVEU3pS7ES4tL/U6tW+TLc+VYbKgnQIE5lI1/PlCZqG4oApDnR1jRap7b6gc
         t0eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777880423; x=1778485223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVoTA2LpzvgPxPTDBkf5ngvZMRRYbPntshQWcVxxYnA=;
        b=DL1Ss2MLsPXqq/5jROTSDO0VB9Lne9JuKjksQvTmwRWzySHODEB1+q1krpfN5ILlaJ
         1NLesqIx/fK7PJdpgXRALMyjSH8BDo1XERQyNSmQ2oH+7nsygPBg6uuFHA8Ga8MX2OmE
         22pl34vx1utDWeGHPpzve4vLGbxPyPkxnyk6p8+/Qv7FBuN1jGUIst10Wef39ez0/IQw
         yAaopf42s312z9BP47/ydTWd5uSuIZvaFEwv7uO5TLdZGoHaKli23wMAo+S4i+pAMryq
         5Idg1M9lVHzKWNaUiy+Gc0DTwW6YXxyKkVDUUz0xy4+QvN0AAbsrkA4vSFoC0qXn+Jsx
         2ybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880423; x=1778485223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVoTA2LpzvgPxPTDBkf5ngvZMRRYbPntshQWcVxxYnA=;
        b=nsXUO51RfAu7Gp+JRxxEeAF1K+hcLX+pMYjw+Yrccgcz1lpomqOgGtQz+oipU07oTg
         cakGgHZdtYjxKmB4Z8kx8ycUv45QJQEzuLXze5MVSVNZqW6N+CMn2MtV3sovWdKNqcim
         YlNsHO3KX7c+NBq2vxz9i1UeDyjiOFokGCDk+y9vzQN2lisZmYDyxGWk46sn69YLaJWp
         T54GUQ6yYjZJaMng0jBBk8Ck6/guXUrzz02pWQL4Oyf+2AKUFvUx0jnMMqkL0LgbaYRE
         doQsXn4DkSG2huJhww7ZSuJ4cnHNFDA6OshKISr9C363/dBENzggBo39LUAFqu6kz9F1
         dwSA==
X-Forwarded-Encrypted: i=1; AFNElJ++LSwxs8EELDtriTMJAljAjkxL1XHm36SABrLBqOZkmIcl9KwRIsz5b9rXx96PynrWCG2bXCNfk7EQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYM1Z5GBF9p5QIIT97LnYKdwixodGujeo2cf5+a02H1uP4sFSl
	c9Bw0Z3V4zHCHosMa6RYLr3zhHHMUkyfS0PRA2McCtImeJKnkMUUv5sKyiix9fRf6hG3qShXpIa
	k7zZSOYuQDk59UJ8GWz0XEHlj6tfqhLI=
X-Gm-Gg: AeBDiesGo+L05Xa8pl28esbH92+y5AOu9dvklLlSFnT7FBEn/727fO/kSZ0lmnWFlSx
	H/fNBFGlMCmmF+YBa63G7LROCj+YPFCvlFmDCLEKYSMTuXAdP8ZuInyL5tWjMhrfdLqAO138duz
	X2I8yPt2XP44crm45hkJSwkNcjqmuXta/4u5UaN1WxjgoW4ex7uFhxWReJ6TosPayw0UKHzfjOK
	PLnqRJLxX+dv7wM5qvzzUxX5g/93x7xoVXyECdjN5bQGzBcHeJuhSDRv0sYUUEt8tLPLtROZJuC
	fj99QYIVaSDEulEwybA=
X-Received: by 2002:a05:693c:6218:b0:2f3:55d3:6221 with SMTP id
 5a478bee46e88-2f355d3776fmr41544eec.20.1777880423311; Mon, 04 May 2026
 00:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164445.215540-1-clamor95@gmail.com> <20260503164445.215540-5-clamor95@gmail.com>
 <afg-Xl7A7E0qowHR@kekkonen.localdomain>
In-Reply-To: <afg-Xl7A7E0qowHR@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 4 May 2026 10:40:11 +0300
X-Gm-Features: AVHnY4JwU_TWRY-jAPgFfMW54lLGK2G6j1a95_xAI25pXjMmwNS4U4p7GAg5Lvo
Message-ID: <CAPVz0n0YwUZ0TPSQV-Yb_4e7Di12ZWPVaKdde1v+7gHtWT1nuQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] media: i2c: lm3560: Convert to use OF bindings
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 23BC14B974C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7975-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmail.com]

=D0=BF=D0=BD, 4 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 09:36=
 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Sun, May 03, 2026 at 07:44:43PM +0300, Svyatoslav Ryhel wrote:
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
> >
> > Converting to Device Tree assumes dynamic and independent registration =
of
> > LEDs. To monitor the configured LEDs, a bitmap has been added. This mak=
es
> > LED cleanup more robust and less context dependent.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/lm3560.c | 143 ++++++++++++++++++++++++++-----------
> >  include/media/i2c/lm3560.h |  15 ----
> >  2 files changed, 102 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > index 5b568ed9536b..ce4b09d1f208 100644
> > --- a/drivers/media/i2c/lm3560.c
> > +++ b/drivers/media/i2c/lm3560.c
> > @@ -9,11 +9,15 @@
> >   *                   Ldd-Mlp <ldd-mlp@list.ti.com>
> >   */
> >
> > +#include <linux/bitmap.h>
> >  #include <linux/delay.h>
> >  #include <linux/module.h>
> >  #include <linux/i2c.h>
> >  #include <linux/slab.h>
> > +#include <linux/mod_devicetable.h>
> >  #include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/videodev2.h>
> >  #include <media/i2c/lm3560.h>
> > @@ -43,22 +47,33 @@ enum led_enable {
> >   * struct lm3560_flash
> >   *
> >   * @dev: pointer to &struct device
> > - * @pdata: platform data
> >   * @regmap: reg. map for i2c
> >   * @lock: muxtex for serial access.
> >   * @led_mode: V4L2 LED mode
> >   * @ctrls_led: V4L2 controls
> >   * @subdev_led: V4L2 subdev
> > + * @led_id: LED status holder
> > + * @peak: peak current
> > + * @max_flash_timeout: flash timeout
> > + * @max_flash_brt: flash mode led brightness
> > + * @max_torch_brt: torch mode led brightness
> >   */
> >  struct lm3560_flash {
> >       struct device *dev;
> > -     struct lm3560_platform_data *pdata;
> >       struct regmap *regmap;
> >       struct mutex lock;
> >
> >       enum v4l2_flash_led_mode led_mode;
> >       struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
> >       struct v4l2_subdev subdev_led[LM3560_LED_MAX];
> > +
> > +     DECLARE_BITMAP(led_id, LM3560_LED_MAX);
> > +
> > +     enum lm3560_peak_current peak;
> > +     u32 max_flash_timeout;
> > +
> > +     u32 max_flash_brt[LM3560_LED_MAX];
> > +     u32 max_torch_brt[LM3560_LED_MAX];
> >  };
> >
> >  #define to_lm3560_flash(_ctrl, _no)  \
> > @@ -269,8 +284,8 @@ static int lm3560_init_controls(struct lm3560_flash=
 *flash,
> >                               enum lm3560_led_id led_no)
> >  {
> >       struct v4l2_ctrl *fault;
> > -     u32 max_flash_brt =3D flash->pdata->max_flash_brt[led_no];
> > -     u32 max_torch_brt =3D flash->pdata->max_torch_brt[led_no];
> > +     u32 max_flash_brt =3D flash->max_flash_brt[led_no];
> > +     u32 max_torch_brt =3D flash->max_torch_brt[led_no];
> >       struct v4l2_ctrl_handler *hdl =3D &flash->ctrls_led[led_no];
> >       const struct v4l2_ctrl_ops *ops =3D &lm3560_led_ctrl_ops[led_no];
> >
> > @@ -295,9 +310,9 @@ static int lm3560_init_controls(struct lm3560_flash=
 *flash,
> >       /* flash strobe timeout */
> >       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_TIMEOUT,
> >                         LM3560_FLASH_TOUT_MIN,
> > -                       flash->pdata->max_flash_timeout,
> > +                       flash->max_flash_timeout,
> >                         LM3560_FLASH_TOUT_STEP,
> > -                       flash->pdata->max_flash_timeout);
> > +                       flash->max_flash_timeout);
> >
> >       /* flash brt */
> >       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_INTENSITY,
> > @@ -339,15 +354,18 @@ static const struct regmap_config lm3560_regmap =
=3D {
> >  };
> >
> >  static int lm3560_subdev_init(struct lm3560_flash *flash,
> > -                           enum lm3560_led_id led_no, char *led_name)
> > +                           enum lm3560_led_id led_no,
> > +                           struct device_node *np)
> >  {
> >       struct i2c_client *client =3D to_i2c_client(flash->dev);
> >       int rval;
> >
> >       v4l2_i2c_subdev_init(&flash->subdev_led[led_no], client, &lm3560_=
ops);
> >       flash->subdev_led[led_no].flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > -     strscpy(flash->subdev_led[led_no].name, led_name,
> > -             sizeof(flash->subdev_led[led_no].name));
> > +     snprintf(flash->subdev_led[led_no].name,
> > +              sizeof(flash->subdev_led[led_no].name),
> > +              "lm3560-led%d", led_no);
> > +     flash->subdev_led[led_no].fwnode =3D of_fwnode_handle(np);
> >       rval =3D lm3560_init_controls(flash, led_no);
> >       if (rval)
> >               goto err_out;
> > @@ -378,7 +396,7 @@ static int lm3560_init_device(struct lm3560_flash *=
flash)
> >
> >       /* set peak current */
> >       rval =3D regmap_update_bits(flash->regmap,
> > -                               REG_FLASH_TOUT, 0x60, flash->pdata->pea=
k);
> > +                               REG_FLASH_TOUT, 0x60, flash->peak);
> >       if (rval < 0)
> >               return rval;
> >       /* output disable */
> > @@ -391,18 +409,22 @@ static int lm3560_init_device(struct lm3560_flash=
 *flash)
> >       return rval;
> >  }
> >
> > -static void lm3560_subdev_cleanup(struct lm3560_flash *flash,
> > -                               enum lm3560_led_id led_no)
> > +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> >  {
> > -     v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
> > -     v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
> > -     media_entity_cleanup(&flash->subdev_led[led_no].entity);
> > +     int led_no;
> > +
> > +     for_each_set_bit(led_no, flash->led_id, LM3560_LED_MAX) {
> > +             v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
> > +             v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
> > +             media_entity_cleanup(&flash->subdev_led[led_no].entity);
> > +     }
> >  }
> >
> >  static int lm3560_probe(struct i2c_client *client)
> >  {
> >       struct lm3560_flash *flash;
> > -     struct lm3560_platform_data *pdata =3D dev_get_platdata(&client->=
dev);
> > +     struct device_node *node;
> > +     u32 peak_ua;
> >       int rval;
> >
> >       flash =3D devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
> > @@ -415,36 +437,69 @@ static int lm3560_probe(struct i2c_client *client=
)
> >               return rval;
> >       }
> >
> > -     /* if there is no platform data, use chip default value */
> > -     if (pdata =3D=3D NULL) {
> > -             pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_=
KERNEL);
> > -             if (pdata =3D=3D NULL)
> > -                     return -ENODEV;
> > -             pdata->peak =3D LM3560_PEAK_3600mA;
> > -             pdata->max_flash_timeout =3D LM3560_FLASH_TOUT_MAX;
> > -             /* led 1 */
> > -             pdata->max_flash_brt[LM3560_LED0] =3D LM3560_FLASH_BRT_MA=
X;
> > -             pdata->max_torch_brt[LM3560_LED0] =3D LM3560_TORCH_BRT_MA=
X;
> > -             /* led 2 */
> > -             pdata->max_flash_brt[LM3560_LED1] =3D LM3560_FLASH_BRT_MA=
X;
> > -             pdata->max_torch_brt[LM3560_LED1] =3D LM3560_TORCH_BRT_MA=
X;
> > -     }
> > -     flash->pdata =3D pdata;
> >       flash->dev =3D &client->dev;
> >       mutex_init(&flash->lock);
> >
> > +     bitmap_zero(flash->led_id, LM3560_LED_MAX);
> > +
> > +     flash->peak =3D LM3560_PEAK_1600mA;
> > +     rval =3D device_property_read_u32(flash->dev,
> > +                                     "ti,peak-current-microamp", &peak=
_ua);
> > +     if (!rval) {
> > +             switch (peak_ua) {
> > +             case 1600000:
> > +                     flash->peak =3D LM3560_PEAK_1600mA;
> > +                     break;
> > +             case 2300000:
> > +                     flash->peak =3D LM3560_PEAK_2300mA;
> > +                     break;
> > +             case 3000000:
> > +                     flash->peak =3D LM3560_PEAK_3000mA;
> > +                     break;
> > +             case 3600000:
> > +                     flash->peak =3D LM3560_PEAK_3600mA;
> > +                     break;
> > +             default:
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     flash->max_flash_timeout =3D LM3560_FLASH_TOUT_MIN * 1000;
> > +     device_property_read_u32(flash->dev, "flash-max-timeout-us",
> > +                              &flash->max_flash_timeout);
> > +     flash->max_flash_timeout /=3D 1000;
> > +
> >       rval =3D lm3560_init_device(flash);
> >       if (rval < 0)
> >               return rval;
> >
> > -     rval =3D lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
> > -     if (rval < 0)
> > -             return rval;
> > +     for_each_available_child_of_node(dev_of_node(flash->dev), node) {
>
> device_for_each_child_node(), please.
>
> > +             u32 reg;
> >
> > -     rval =3D lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
> > -     if (rval < 0) {
> > -             lm3560_subdev_cleanup(flash, LM3560_LED0);
> > -             return rval;
> > +             rval =3D of_property_read_u32(node, "reg", &reg);
>
> device_property_read_u32() here and elsewhere.
>

I have switched to OF equivalent deliberately because if I use
device_for_each_child_node I found no sane way to pass fwnode to
subdev_led since device_for_each_child_node releases fwnode handle it
uses and I cannot assign it to subdev_led.fwnode since it will result
in NULL pointer on loop exit

> > +             if (rval < 0)
> > +                     /* We care only about nodes with reg property */
> > +                     continue;
> > +
> > +             if (reg =3D=3D LM3560_LED0 || reg =3D=3D LM3560_LED1) {
> > +                     flash->max_flash_brt[reg] =3D LM3560_FLASH_BRT_MI=
N;
> > +                     of_property_read_u32(node, "flash-max-microamp",
> > +                                          &flash->max_flash_brt[reg]);
> > +
> > +                     flash->max_torch_brt[reg] =3D LM3560_TORCH_BRT_MI=
N;
> > +                     of_property_read_u32(node, "led-max-microamp",
> > +                                          &flash->max_torch_brt[reg]);
> > +
> > +                     rval =3D lm3560_subdev_init(flash, reg, node);
> > +                     if (rval < 0) {
> > +                             lm3560_subdev_cleanup(flash);
> > +                             return dev_err_probe(flash->dev, rval,
> > +                                                 "failed to register l=
ed%d\n",
> > +                                                 reg);
> > +                     }
> > +
> > +                     set_bit(reg, flash->led_id);
> > +             }
> >       }
> >
> >       i2c_set_clientdata(client, flash);
> > @@ -455,12 +510,17 @@ static int lm3560_probe(struct i2c_client *client=
)
> >  static void lm3560_remove(struct i2c_client *client)
> >  {
> >       struct lm3560_flash *flash =3D i2c_get_clientdata(client);
> > -     unsigned int i;
> >
> > -     for (i =3D LM3560_LED0; i < LM3560_LED_MAX; i++)
> > -             lm3560_subdev_cleanup(flash, i);
> > +     lm3560_subdev_cleanup(flash);
> >  }
> >
> > +static const struct of_device_id lm3560_of_match[] =3D {
> > +     { .compatible =3D "ti,lm3559" },
> > +     { .compatible =3D "ti,lm3560" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, lm3560_of_match);
> > +
> >  static const struct i2c_device_id lm3560_id_table[] =3D {
> >       { LM3559_NAME },
> >       { LM3560_NAME },
> > @@ -473,6 +533,7 @@ static struct i2c_driver lm3560_i2c_driver =3D {
> >       .driver =3D {
> >                  .name =3D LM3560_NAME,
> >                  .pm =3D NULL,
> > +                .of_match_table =3D lm3560_of_match,
> >                  },
> >       .probe =3D lm3560_probe,
> >       .remove =3D lm3560_remove,
> > diff --git a/include/media/i2c/lm3560.h b/include/media/i2c/lm3560.h
> > index 770d8c72c94a..b56c1ff8fd49 100644
> > --- a/include/media/i2c/lm3560.h
> > +++ b/include/media/i2c/lm3560.h
> > @@ -66,19 +66,4 @@ enum lm3560_peak_current {
> >       LM3560_PEAK_3600mA =3D 0x60
> >  };
> >
> > -/* struct lm3560_platform_data
> > - *
> > - * @peak :  peak current
> > - * @max_flash_timeout: flash timeout
> > - * @max_flash_brt: flash mode led brightness
> > - * @max_torch_brt: torch mode led brightness
> > - */
> > -struct lm3560_platform_data {
> > -     enum lm3560_peak_current peak;
> > -
> > -     u32 max_flash_timeout;
> > -     u32 max_flash_brt[LM3560_LED_MAX];
> > -     u32 max_torch_brt[LM3560_LED_MAX];
> > -};
> > -
> >  #endif /* __LM3560_H__ */
>
> --
> Kind regards,
>
> Sakari Ailus

