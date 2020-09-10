Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AB5263F69
	for <lists+linux-leds@lfdr.de>; Thu, 10 Sep 2020 10:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgIJILX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Sep 2020 04:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbgIJILT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Sep 2020 04:11:19 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF27CC061573;
        Thu, 10 Sep 2020 01:11:18 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id p13so4879018ils.3;
        Thu, 10 Sep 2020 01:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h2IZltBAMOS/o9iIrQdsLGqY/IFmzbDkqlzeIWyPEyE=;
        b=AaIzZvaqthpqmY0nldV4aFsCIUhn6+C5yi/EJmXnqVwgmkk4rzm3OoJgvrNeO9mQ2O
         YLmG7ZzVAFwXMQeHxWnO/+awYblIIUa6XHGMsJwqbuQQRIkTn4dLRgZi1y68fc9WupkX
         VPu/qdWD6V5mDIulLRmlf5xi5wlNQ/7I3tnMixgrEeLPfbdsQSS6vRwYx9vTaQxkcmV8
         13DxwoYIVwBw8ZZPRAw4XyqcAzaNxLIykpvG20uitwd8pd7z6YIk3noLRe2uL0mTB5R+
         DIYvtHXZzVanJxCj8wMRZnGd8APuOBAXi/ildev/001fMHoBs7XP40UW/YvyGhzWuXR3
         8Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h2IZltBAMOS/o9iIrQdsLGqY/IFmzbDkqlzeIWyPEyE=;
        b=JqYD8gpuTZWgp4omy2IYCcqbVPYua0pOrbkbicQ18CZuhGfd32414iHM5s8tfXIzAG
         VUAz6Cmn63XrN5mzSP9QT1O26uZfBonJmu0sIqpP6UB7M524Xo/KCruAbmEpbSDPwI+8
         IkCRL8ywR+9DNnAQfE1tUj8APB+lEQ8Z6YOvkBx4lc4I92HcZkbp7N/F5VNeHdfossay
         zvvoMcrheKoqXmtTUEV4b1Au45mj2e6CMR39In4Y+MidS2lyHvxrrH+MOzpV7shEfqKI
         hozZdr0RDFFmpu80clVcHfJpVbWbCNDVS1m6PS8vNNY4MYrdU+SbH1BK/abfNwu4snBi
         16Kw==
X-Gm-Message-State: AOAM532n96cLBDLN91kaGWlPq+oJg698S1E7FGMvWY0q9cw0QHE16sec
        OuydQ6w2/afkSEnZwCJ1RYrQlRvXdTalC6h6r7U=
X-Google-Smtp-Source: ABdhPJxK4TDHSOyxHtmtUBONEAfWXowozHed9JQnZ2LJ4ec+JtNREuI0uflxK0VEzj+Thfg96iuJThe14spKX5gwJas=
X-Received: by 2002:a92:7f0f:: with SMTP id a15mr6964207ild.186.1599725478055;
 Thu, 10 Sep 2020 01:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com> <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
In-Reply-To: <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Thu, 10 Sep 2020 08:11:06 +0800
Message-ID: <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2020=E5=B9=B49=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:48=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Sep 7, 2020 at 1:31 PM Gene Chen <gene.chen.richtek@gmail.com> wr=
ote:
> >
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mod=
e,
> > and 4-channel RGB LED support Register/Flash/Breath Mode
>
> I'm wondering why you don't use struct led_classdev_flash.
>
> ...
>

Both Flash and RGB LED use led_classdev_flash by
"devm_led_classdev_flash_register_ext".

> > +//
> > +// Copyright (C) 2020 MediaTek Inc.
> > +//
>
> Do you really need these two // lines?
>

ACK, I will remove it

> ...
>
> > +enum {
> > +       MT6360_LED_ISNK1 =3D 0,
> > +       MT6360_LED_ISNK2,
> > +       MT6360_LED_ISNK3,
> > +       MT6360_LED_ISNK4,
> > +       MT6360_LED_FLASH1,
> > +       MT6360_LED_FLASH2,
>
> > +       MT6360_MAX_LEDS,
>
> No comma for terminator entry.
>

ACK

> > +};
>
> ...
>
> > +#define MT6360_ISNK_MASK               0x1F
>
> GENMASK()
>
> ...
>
> > +#define MT6360_ITORCH_MIN              25000
> > +#define MT6360_ITORCH_STEP             12500
> > +#define MT6360_ITORCH_MAX              400000
> > +#define MT6360_ISTRB_MIN               50000
> > +#define MT6360_ISTRB_STEP              12500
> > +#define MT6360_ISTRB_MAX               1500000
> > +#define MT6360_STRBTO_MIN              64000
> > +#define MT6360_STRBTO_STEP             32000
> > +#define MT6360_STRBTO_MAX              2432000
>
> Add unit suffixes, please.
>

ACK

> ...
>
> > +#define FLED_TORCH_FLAG_MASK           0x0c
>
> > +#define FLED_STROBE_FLAG_MASK          0x03
>
> GENMASK()
>

ACK

> ...
>
> > +       dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level)=
;
>
> Not production noise.
>

ACK

> ...
>
> > +       ret =3D regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enab=
le_mask, val);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return 0;
>
> return regmap...
>
> > +       u32 val =3D (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
>
> Why parens?
>

ACK

> ...
>
> > +       dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level)=
;
>
> Noise.
>

ACK

> ...
>
> > +       if (priv->fled_strobe_used) {
> > +               dev_warn(lcdev->dev, "Please disable strobe first [%d]\=
n", priv->fled_strobe_used);
> > +               return -EINVAL;
>
> Hmm... Shouldn't be guaranteed by some framework?
>

Because both Flash LED use single logically control.
It doesn't exist one LED is torch mode, and the other is strobe mode.

> ...
>
> > +               curr =3D prev & (~BIT(led->led_no));
>
> Too many parens.
>

ACK

> ...
>
> > +static int mt6360_strobe_brightness_set(struct led_classdev_flash *fl_=
cdev, u32 brightness)
> > +{
> > +       struct mt6360_led *led =3D container_of(fl_cdev, struct mt6360_=
led, flash);
> > +       struct led_classdev *lcdev =3D &fl_cdev->led_cdev;
> > +
>
> > +       dev_dbg(lcdev->dev, "[%d] strobe brightness %d\n", led->led_no,=
 brightness);
>
> Noise. Point of this entire function?
>

ACK, I will remove it, reserve function entry only for register
ledcass_dev check ops exist

> > +       return 0;
> > +}
>
> ...
>
> > +       dev_dbg(lcdev->dev, "[%d] strobe state %d\n", led->led_no, stat=
e);
>
> Noise.
>
> If you wish to do it right, add trace events to the framework.
>

ACK, I will remove it.

> ...
>
> > +       if (priv->fled_torch_used) {
>
> > +               dev_warn(lcdev->dev, "Please disable torch first [0x%x]=
\n", priv->fled_torch_used);
>
> Again, why the warning? Can this be a part of the framework?
>

Same as above.

> > +               return -EINVAL;
> > +       }
>
> ...
>
> > +               curr =3D prev & (~BIT(led->led_no));
>
> Too many parens.
>

ACK

> ...
>
> > +       if (!prev && curr)
> > +               usleep_range(5000, 6000);
> > +       else if (prev && !curr)
> > +               udelay(500);
>
> These delays must be explained.
>

ACK

> ...
>
> > +       if (led->led_no =3D=3D MT6360_LED_FLASH1) {
> > +               strobe_timeout_mask =3D MT6360_FLED1STRBTO_MASK;
> > +               fled_short_mask =3D MT6360_FLED1SHORT_MASK;
>
> > +
>
> Redundant blank line.
>

ACK

> > +       } else {
> > +               strobe_timeout_mask =3D MT6360_FLED2STRBTO_MASK;
> > +               fled_short_mask =3D MT6360_FLED2SHORT_MASK;
> > +       }
>
> ...
>
> > +static int mt6360_flash_external_strobe_set(struct v4l2_flash *v4l2_fl=
ash, bool enable)
> > +{
> > +       struct led_classdev_flash *flash =3D v4l2_flash->fled_cdev;
> > +       struct mt6360_led *led =3D container_of(flash, struct mt6360_le=
d, flash);
> > +       struct mt6360_priv *priv =3D led->priv;
>
> > +       u32 enable_mask =3D MT6360_FLCSEN_MASK(led->led_no);
>
> enable_mask -> mask
>   u32 value =3D enable ? mask : 0;
>
> > +       int ret;
> > +
> > +       ret =3D regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, ena=
ble_mask,
>
> > +                                enable ? enable_mask : 0);
>
>   ret =3D  ... mask, value);
>

ACK

> > +       if (ret)
> > +               return ret;
> > +
> > +       if (enable)
> > +               priv->fled_strobe_used |=3D BIT(led->led_no);
> > +       else
> > +               priv->fled_strobe_used &=3D (~BIT(led->led_no));
>
> Too many parens.
>

ACK

> > +
> > +       return 0;
> > +}
>
> ...
>
> > +       s->val =3D s->max =3D (s->min) + (lcdev->max_brightness - 1) * =
s->step;
>
> Ditto.
>

ACK

> ...
>
> > +static void clamp_align(u32 *v, u32 min, u32 max, u32 step)
>
> Can we keep a similar API, i.e. return a new value rather than update old=
?
>
> > +{
>
> > +       *v =3D clamp_val(*v, min, max);
>
> I would rather use a temporary variable (and it actually will be
> required with above).
>
> > +       if (step > 1)
> > +               *v =3D (*v - min) / step * step + min;
>
> Sounds like open coded rounddown().
>

ACK

> > +}
>
> ...
>
> > +       lcdev->max_brightness =3D (val - MT6360_ITORCH_MIN) / MT6360_IT=
ORCH_STEP + 1;
>
> DIV_ROUND_UP(val - MT6360_ITORCH_MIN, MT6360_ITORCH_STEP) ?
>

This is mapping 0~val to 1~max_brightness as level.
I convert val below MT6360_ITORCH_STEP to 1 for ignore max_brightness
=3D 0, because 0 means disable.
There is a little difference from DIV_ROUND_UP.

> ...
>
> > +static int mt6360_init_common_properties(struct mt6360_led *led, struc=
t led_init_data *init_data)
> > +{
> > +       const char *str;
> > +
> > +       if (!fwnode_property_read_string(init_data->fwnode, "default-st=
ate", &str)) {
> > +               if (!strcmp(str, "on"))
> > +                       led->default_state =3D STATE_ON;
> > +               else if (!strcmp(str, "keep"))
> > +                       led->default_state =3D STATE_KEEP;
>
> > +               else
>
> I wouldn't allow some garbage to be off.
>

ACK

> > +                       led->default_state =3D STATE_OFF;
> > +       }
>
> What about
>
> static const char * const states =3D { "on", "keep", "off" };
>
> int ret;
>
> ret =3D match_string(states, ARRAY_SIZE(states), str);
> if (ret)
>  ...
>
> default_state =3D ret;
>
> ?
>
> > +       return 0;
> > +}
>

ACK

> ...
>
> > +static int mt6360_led_probe(struct platform_device *pdev)
> > +{
> > +       struct mt6360_priv *priv;
> > +       struct fwnode_handle *child;
> > +       int i, ret;
> > +
>
> > +       priv->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> > +       if (!priv->regmap) {
> > +               dev_err(&pdev->dev, "Failed to get parent regmap\n");
> > +               return -ENODEV;
> > +       }
>
> ...
>
> > +out:
>
> out_flash_leds_release: ?
>

ACK

> > +       for (i =3D MT6360_LED_FLASH1; i <=3D MT6360_LED_FLASH2; i++) {
> > +               struct mt6360_led *led =3D priv->leds[i];
> > +
> > +               if (led && led->v4l2_flash)
> > +                       v4l2_flash_release(led->v4l2_flash);
> > +
> > +       }
>
> ...
>
> > +static int mt6360_led_remove(struct platform_device *pdev)
> > +{
> > +       struct mt6360_priv *priv =3D platform_get_drvdata(pdev);
> > +       int i;
> > +
> > +       for (i =3D MT6360_LED_FLASH1; i <=3D MT6360_LED_FLASH2; i++) {
> > +               struct mt6360_led *led =3D priv->leds[i];
> > +
> > +               if (led && led->v4l2_flash)
> > +                       v4l2_flash_release(led->v4l2_flash);
> > +
> > +       }
>
> Looks like a code duplication.
>

ACK

> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id __maybe_unused mt6360_led_of_id[] =3D=
 {
> > +       { .compatible =3D "mediatek,mt6360-led", },
>
> > +       {},
>
> No need comma.
>

ACK

> > +};
>
>
> --
> With Best Regards,
> Andy Shevchenko
