Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A79263180
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 18:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbgIIQQc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 12:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730996AbgIIQMt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 12:12:49 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F61C061344;
        Wed,  9 Sep 2020 06:48:51 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u13so2127771pgh.1;
        Wed, 09 Sep 2020 06:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4HvDFPexsr3s8vYjArlu6gd3N2WqfJ+OIg8egu/XCac=;
        b=J72MnFFZPk8u2206qNOtZ8zlPYgrR+X7pVkPWdPhSDSmCOfDa0MEJnRcCwc5XFw0mm
         Sb1lV3OennBIkiQRhc1R9Cqh98lBtOaDVB+fAUD+z3jcJIBgQ+Oh/oqMMqSJJm1WVdD9
         14VbNIjhy1+L+Uj5j7VEF9gFJyNVZKbjv4K7dQom9wlg+yNZhsFThmEKa+XBh0dg9f5W
         19K0E481CVGu3OHopl8TAG3T7AASPx7+BNMyuozy8TwCOs9JHgphikRfA3TPcsQBkMnh
         ggETmYwWv//F/4g6KmFxUq5LFmeDeHnVgtvaWehFZqCyo+/+kL+okh/+UiDa3eBd+AaW
         wCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4HvDFPexsr3s8vYjArlu6gd3N2WqfJ+OIg8egu/XCac=;
        b=gOd+9JyN/jSl8wdefoSxgaSHu9OElxQCcbCz7/fG98EHUFjyXXBCiNgfqIrIlxfS0O
         qYdEiOka+sDjCtVbt7U3GBBw7zFMe0BMZSiMugSgxtVsr3UepmL3q2OTVCB2eokIhv4g
         Ce9TPcO4jrytFGjMfQFlG3ZXkhbVeuEHJyOPtdnFkOyF9ajeH4xXHhcpHgss8XKz488r
         96MB8E9tE8OQy8kcOmTfCWurp32j3c6MFQ4pJHI62QAy8vBdjCzVksflpUtdWO+rOc7X
         kfzw1tWBnRbrdMU2SMawLYoezg3oj7hyHeaKVb8euqusAFCV7LRp7NxXSdeKcBFGkefU
         mcaQ==
X-Gm-Message-State: AOAM531dN9pvz0GJgprt+osMLPmeClXDAqqwlJokF8i0ngtUxBlVwf90
        dlC4qWsyLmpwOIrYmptbHBXMeBIybN/b2yrVUOU=
X-Google-Smtp-Source: ABdhPJwjGN/noYtRq/MK1sDgwwqkVhBVfELDCJ83d3DmuK7PnZsQ3TAXDjKUtQ6RdtWZMOqD40lzOcLYlIZiBWGiE+k=
X-Received: by 2002:aa7:800c:: with SMTP id j12mr889318pfi.130.1599659331306;
 Wed, 09 Sep 2020 06:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com> <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
In-Reply-To: <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Sep 2020 16:48:33 +0300
Message-ID: <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>
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
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 7, 2020 at 1:31 PM Gene Chen <gene.chen.richtek@gmail.com> wrote:
>
> From: Gene Chen <gene_chen@richtek.com>
>
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> and 4-channel RGB LED support Register/Flash/Breath Mode

I'm wondering why you don't use struct led_classdev_flash.

...

> +//
> +// Copyright (C) 2020 MediaTek Inc.
> +//

Do you really need these two // lines?

...

> +enum {
> +       MT6360_LED_ISNK1 = 0,
> +       MT6360_LED_ISNK2,
> +       MT6360_LED_ISNK3,
> +       MT6360_LED_ISNK4,
> +       MT6360_LED_FLASH1,
> +       MT6360_LED_FLASH2,

> +       MT6360_MAX_LEDS,

No comma for terminator entry.

> +};

...

> +#define MT6360_ISNK_MASK               0x1F

GENMASK()

...

> +#define MT6360_ITORCH_MIN              25000
> +#define MT6360_ITORCH_STEP             12500
> +#define MT6360_ITORCH_MAX              400000
> +#define MT6360_ISTRB_MIN               50000
> +#define MT6360_ISTRB_STEP              12500
> +#define MT6360_ISTRB_MAX               1500000
> +#define MT6360_STRBTO_MIN              64000
> +#define MT6360_STRBTO_STEP             32000
> +#define MT6360_STRBTO_MAX              2432000

Add unit suffixes, please.

...

> +#define FLED_TORCH_FLAG_MASK           0x0c

> +#define FLED_STROBE_FLAG_MASK          0x03

GENMASK()

...

> +       dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);

Not production noise.

...

> +       ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable_mask, val);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

return regmap...

> +       u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;

Why parens?

...

> +       dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);

Noise.

...

> +       if (priv->fled_strobe_used) {
> +               dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
> +               return -EINVAL;

Hmm... Shouldn't be guaranteed by some framework?

...

> +               curr = prev & (~BIT(led->led_no));

Too many parens.

...

> +static int mt6360_strobe_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
> +{
> +       struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +       struct led_classdev *lcdev = &fl_cdev->led_cdev;
> +

> +       dev_dbg(lcdev->dev, "[%d] strobe brightness %d\n", led->led_no, brightness);

Noise. Point of this entire function?

> +       return 0;
> +}

...

> +       dev_dbg(lcdev->dev, "[%d] strobe state %d\n", led->led_no, state);

Noise.

If you wish to do it right, add trace events to the framework.

...

> +       if (priv->fled_torch_used) {

> +               dev_warn(lcdev->dev, "Please disable torch first [0x%x]\n", priv->fled_torch_used);

Again, why the warning? Can this be a part of the framework?

> +               return -EINVAL;
> +       }

...

> +               curr = prev & (~BIT(led->led_no));

Too many parens.

...

> +       if (!prev && curr)
> +               usleep_range(5000, 6000);
> +       else if (prev && !curr)
> +               udelay(500);

These delays must be explained.

...

> +       if (led->led_no == MT6360_LED_FLASH1) {
> +               strobe_timeout_mask = MT6360_FLED1STRBTO_MASK;
> +               fled_short_mask = MT6360_FLED1SHORT_MASK;

> +

Redundant blank line.

> +       } else {
> +               strobe_timeout_mask = MT6360_FLED2STRBTO_MASK;
> +               fled_short_mask = MT6360_FLED2SHORT_MASK;
> +       }

...

> +static int mt6360_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
> +{
> +       struct led_classdev_flash *flash = v4l2_flash->fled_cdev;
> +       struct mt6360_led *led = container_of(flash, struct mt6360_led, flash);
> +       struct mt6360_priv *priv = led->priv;

> +       u32 enable_mask = MT6360_FLCSEN_MASK(led->led_no);

enable_mask -> mask
  u32 value = enable ? mask : 0;

> +       int ret;
> +
> +       ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask,

> +                                enable ? enable_mask : 0);

  ret =  ... mask, value);

> +       if (ret)
> +               return ret;
> +
> +       if (enable)
> +               priv->fled_strobe_used |= BIT(led->led_no);
> +       else
> +               priv->fled_strobe_used &= (~BIT(led->led_no));

Too many parens.

> +
> +       return 0;
> +}

...

> +       s->val = s->max = (s->min) + (lcdev->max_brightness - 1) * s->step;

Ditto.

...

> +static void clamp_align(u32 *v, u32 min, u32 max, u32 step)

Can we keep a similar API, i.e. return a new value rather than update old?

> +{

> +       *v = clamp_val(*v, min, max);

I would rather use a temporary variable (and it actually will be
required with above).

> +       if (step > 1)
> +               *v = (*v - min) / step * step + min;

Sounds like open coded rounddown().

> +}

...

> +       lcdev->max_brightness = (val - MT6360_ITORCH_MIN) / MT6360_ITORCH_STEP + 1;

DIV_ROUND_UP(val - MT6360_ITORCH_MIN, MT6360_ITORCH_STEP) ?

...

> +static int mt6360_init_common_properties(struct mt6360_led *led, struct led_init_data *init_data)
> +{
> +       const char *str;
> +
> +       if (!fwnode_property_read_string(init_data->fwnode, "default-state", &str)) {
> +               if (!strcmp(str, "on"))
> +                       led->default_state = STATE_ON;
> +               else if (!strcmp(str, "keep"))
> +                       led->default_state = STATE_KEEP;

> +               else

I wouldn't allow some garbage to be off.

> +                       led->default_state = STATE_OFF;
> +       }

What about

static const char * const states = { "on", "keep", "off" };

int ret;

ret = match_string(states, ARRAY_SIZE(states), str);
if (ret)
 ...

default_state = ret;

?

> +       return 0;
> +}

...

> +static int mt6360_led_probe(struct platform_device *pdev)
> +{
> +       struct mt6360_priv *priv;
> +       struct fwnode_handle *child;
> +       int i, ret;
> +

> +       priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!priv->regmap) {
> +               dev_err(&pdev->dev, "Failed to get parent regmap\n");
> +               return -ENODEV;
> +       }

...

> +out:

out_flash_leds_release: ?

> +       for (i = MT6360_LED_FLASH1; i <= MT6360_LED_FLASH2; i++) {
> +               struct mt6360_led *led = priv->leds[i];
> +
> +               if (led && led->v4l2_flash)
> +                       v4l2_flash_release(led->v4l2_flash);
> +
> +       }

...

> +static int mt6360_led_remove(struct platform_device *pdev)
> +{
> +       struct mt6360_priv *priv = platform_get_drvdata(pdev);
> +       int i;
> +
> +       for (i = MT6360_LED_FLASH1; i <= MT6360_LED_FLASH2; i++) {
> +               struct mt6360_led *led = priv->leds[i];
> +
> +               if (led && led->v4l2_flash)
> +                       v4l2_flash_release(led->v4l2_flash);
> +
> +       }

Looks like a code duplication.

> +
> +       return 0;
> +}
> +
> +static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
> +       { .compatible = "mediatek,mt6360-led", },

> +       {},

No need comma.

> +};


-- 
With Best Regards,
Andy Shevchenko
