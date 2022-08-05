Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A871D58A9B0
	for <lists+linux-leds@lfdr.de>; Fri,  5 Aug 2022 12:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240003AbiHEKvj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Aug 2022 06:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237666AbiHEKvi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Aug 2022 06:51:38 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E6811C03;
        Fri,  5 Aug 2022 03:51:36 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id b21so1707818qte.12;
        Fri, 05 Aug 2022 03:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=t6fXAhWVUFAuj9fGZxy9SW8dxs2cVUbQslkXYvZLT+w=;
        b=O9VzxhCkEHHB8OFxr9GvZKHnDiomK3qEuWR7pUzw2hB+0X9CBFlifvyIaM9mDy4nCO
         la/vWCEN6rpYojHsH4rEKsMQZsIHjToOoqEHu0Af3R8eq2qZAqnOVaM1H+97rdouLwkx
         Ozt0YL23GvxiQP7RVfJJG58KFwIOsknow2DXLTfHBQGlz36jhezD5F24tUBd0OMioQge
         OSrUOHyghaXqQoTFy69qcTwKHUVY3EOIQL80GOl27jDh27LFQsXr/iukdVdUSUp7gfCJ
         oUwSwk3ntoO8FtXaOvWeiGPycaUw2QqTjfWuavbPDSR0pncTLyDrRlQYA46Vq1Ex+/oL
         He6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=t6fXAhWVUFAuj9fGZxy9SW8dxs2cVUbQslkXYvZLT+w=;
        b=G3syfdSy/NkriZd7wRYTS+KmPi8LiBGATTu5wFGvpVzQxzdVwnLE9IiJYTNeqhKjWR
         TOllPC6GjspT1nGqsM7C/BTXwiTw+/fxlmUVc77Gh0LWj/tEezWqynj/jOxxKSG7k27A
         gz1BOit7N1iA527PCx6MfkuHCeWdFlWYuUu7X4xQEMhNpjoxe33BPhr/n2zAIwtnmrz7
         bhyYX/i0mtLecwOeABbG++DpJJSA5TScaz7E40kbrcXSrqQOSqCmCkZ0jyiecpH3MUgI
         xU2l1HoXvov7+pAb0CkfiVQqhPQoCOyK9iwmt4RsnphFmB1hDwAt2GMJbiVvW9axAWdm
         b3Og==
X-Gm-Message-State: ACgBeo1IRhw8E1aUwYNiWwbZl9A/3hmcZC7HJIbAUMvWc7fi2KoMXe5c
        RpZp9VzqQmavMTOapZPS2ebrwAzvsYF0Hmy2bmk=
X-Google-Smtp-Source: AA6agR5K3dv/wqvSJHsdvtimgpDw6LDloHXKTbPrFyY/hLxfC65YOp0ehjqgYs6C7QzUOyT9KMDQsDyHqMEiIgtFDo0=
X-Received: by 2002:ac8:7d49:0:b0:340:81b1:e320 with SMTP id
 h9-20020ac87d49000000b0034081b1e320mr5211944qtb.61.1659696695901; Fri, 05 Aug
 2022 03:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com> <20220805070610.3516-9-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-9-peterwu.pub@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Aug 2022 12:50:59 +0200
Message-ID: <CAHp75Ve7OOaVU=Xm5D7nRsCAhDYi3Eq3x4YscPYdJrBqO+AM-g@mail.gmail.com>
Subject: Re: [PATCH v7 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
To:     ChiaEn Wu <peterwu.pub@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Helge Deller <deller@gmx.de>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        Alice Chen <alice_chen@richtek.com>,
        cy_huang <cy_huang@richtek.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
        szuni chen <szunichen@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Aug 5, 2022 at 9:07 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add a support for the Type-C & Power Delivery controller in
> MediaTek MT6370 IC.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>
> v7
> - Revise 'devm_add_action_or_reset(dev, ...)' to one line
> - Revise 'return regmap_update_bits(...)' with using positive
>   conditional
> ---
>  drivers/usb/typec/tcpm/Kconfig        |  11 ++
>  drivers/usb/typec/tcpm/Makefile       |   1 +
>  drivers/usb/typec/tcpm/tcpci_mt6370.c | 207 ++++++++++++++++++++++++++++++++++
>  3 files changed, 219 insertions(+)
>  create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
>
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 073fd2e..e6b88ca 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -35,6 +35,17 @@ config TYPEC_MT6360
>           USB Type-C. It works with Type-C Port Controller Manager
>           to provide USB PD and USB Type-C functionalities.
>
> +config TYPEC_TCPCI_MT6370
> +       tristate "MediaTek MT6370 Type-C driver"
> +       depends on MFD_MT6370
> +       help
> +         MediaTek MT6370 is a multi-functional IC that includes
> +         USB Type-C. It works with Type-C Port Controller Manager
> +         to provide USB PD and USB Type-C functionalities.
> +
> +         This driver can also be built as a module. The module
> +         will be called "tcpci_mt6370".
> +
>  config TYPEC_TCPCI_MAXIM
>         tristate "Maxim TCPCI based Type-C chip driver"
>         help
> diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
> index 7d499f3..906d9dc 100644
> --- a/drivers/usb/typec/tcpm/Makefile
> +++ b/drivers/usb/typec/tcpm/Makefile
> @@ -6,4 +6,5 @@ typec_wcove-y                           := wcove.o
>  obj-$(CONFIG_TYPEC_TCPCI)              += tcpci.o
>  obj-$(CONFIG_TYPEC_RT1711H)            += tcpci_rt1711h.o
>  obj-$(CONFIG_TYPEC_MT6360)             += tcpci_mt6360.o
> +obj-$(CONFIG_TYPEC_TCPCI_MT6370)       += tcpci_mt6370.o
>  obj-$(CONFIG_TYPEC_TCPCI_MAXIM)                += tcpci_maxim.o
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> new file mode 100644
> index 0000000..c5bb201
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Richtek Technology Corp.
> + *
> + * Author: ChiYuan Huang <cy_huang@richtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/tcpci.h>
> +#include <linux/usb/tcpm.h>
> +
> +#define MT6370_REG_SYSCTRL8    0x9B
> +
> +#define MT6370_AUTOIDLE_MASK   BIT(3)
> +
> +#define MT6370_VENDOR_ID       0x29CF
> +#define MT6370_TCPC_DID_A      0x2170
> +
> +struct mt6370_priv {
> +       struct device *dev;
> +       struct regulator *vbus;
> +       struct tcpci *tcpci;
> +       struct tcpci_data tcpci_data;
> +};
> +
> +static const struct reg_sequence mt6370_reg_init[] = {
> +       REG_SEQ(0xA0, 0x1, 1000),
> +       REG_SEQ(0x81, 0x38, 0),
> +       REG_SEQ(0x82, 0x82, 0),
> +       REG_SEQ(0xBA, 0xFC, 0),
> +       REG_SEQ(0xBB, 0x50, 0),
> +       REG_SEQ(0x9E, 0x8F, 0),
> +       REG_SEQ(0xA1, 0x5, 0),
> +       REG_SEQ(0xA2, 0x4, 0),
> +       REG_SEQ(0xA3, 0x4A, 0),
> +       REG_SEQ(0xA4, 0x01, 0),
> +       REG_SEQ(0x95, 0x01, 0),
> +       REG_SEQ(0x80, 0x71, 0),
> +       REG_SEQ(0x9B, 0x3A, 1000),
> +};
> +
> +static int mt6370_tcpc_init(struct tcpci *tcpci, struct tcpci_data *data)
> +{
> +       u16 did;
> +       int ret;
> +
> +       ret = regmap_register_patch(data->regmap, mt6370_reg_init,
> +                                   ARRAY_SIZE(mt6370_reg_init));
> +       if (ret)
> +               return ret;
> +
> +       ret = regmap_raw_read(data->regmap, TCPC_BCD_DEV, &did, sizeof(u16));
> +       if (ret)
> +               return ret;
> +
> +       if (did == MT6370_TCPC_DID_A)
> +               return regmap_write(data->regmap, TCPC_FAULT_CTRL, 0x80);
> +
> +       return 0;
> +}
> +
> +static int mt6370_tcpc_set_vconn(struct tcpci *tcpci, struct tcpci_data *data,
> +                                bool enable)
> +{
> +       return regmap_update_bits(data->regmap, MT6370_REG_SYSCTRL8,
> +                                 MT6370_AUTOIDLE_MASK,
> +                                 enable ? 0 : MT6370_AUTOIDLE_MASK);
> +}
> +
> +static int mt6370_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *data,
> +                               bool source, bool sink)
> +{
> +       struct mt6370_priv *priv = container_of(data, struct mt6370_priv,
> +                                               tcpci_data);
> +       int ret;
> +
> +       ret = regulator_is_enabled(priv->vbus);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (ret && !source)
> +               return regulator_disable(priv->vbus);
> +
> +       if (!ret && source)
> +               return regulator_enable(priv->vbus);
> +
> +       return 0;
> +}
> +
> +static irqreturn_t mt6370_irq_handler(int irq, void *dev_id)
> +{
> +       struct mt6370_priv *priv = dev_id;
> +
> +       return tcpci_irq(priv->tcpci);
> +}
> +
> +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
> +{
> +       struct regmap *regmap = priv->tcpci_data.regmap;
> +       u16 vid;
> +       int ret;
> +
> +       ret = regmap_raw_read(regmap, TCPC_VENDOR_ID, &vid, sizeof(u16));
> +       if (ret)
> +               return ret;
> +
> +       if (vid != MT6370_VENDOR_ID)
> +               return dev_err_probe(priv->dev, -ENODEV,
> +                                    "Vendor ID not correct 0x%02x\n", vid);
> +
> +       return 0;
> +}
> +
> +static void mt6370_unregister_tcpci_port(void *tcpci)
> +{
> +       tcpci_unregister_port(tcpci);
> +}
> +
> +static int mt6370_tcpc_probe(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv;
> +       struct device *dev = &pdev->dev;
> +       int irq, ret;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev = dev;
> +
> +       priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
> +       if (!priv->tcpci_data.regmap)
> +               return dev_err_probe(dev, -ENODEV, "Failed to init regmap\n");
> +
> +       ret = mt6370_check_vendor_info(priv);
> +       if (ret)
> +               return ret;
> +
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return dev_err_probe(dev, irq, "Failed to get irq\n");
> +
> +       /* Assign TCPCI feature and ops */
> +       priv->tcpci_data.auto_discharge_disconnect = 1;
> +       priv->tcpci_data.init = mt6370_tcpc_init;
> +       priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
> +
> +       priv->vbus = devm_regulator_get_optional(dev, "vbus");
> +       if (!IS_ERR(priv->vbus))
> +               priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
> +
> +       priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
> +       if (IS_ERR(priv->tcpci))
> +               return dev_err_probe(dev, PTR_ERR(priv->tcpci),
> +                                    "Failed to register tcpci port\n");
> +
> +       ret = devm_add_action_or_reset(dev, mt6370_unregister_tcpci_port, priv->tcpci);
> +       if (ret)
> +               return ret;
> +
> +       ret = devm_request_threaded_irq(dev, irq, NULL, mt6370_irq_handler,
> +                                       IRQF_ONESHOT, dev_name(dev), priv);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> +
> +       device_init_wakeup(dev, true);
> +       dev_pm_set_wake_irq(dev, irq);
> +
> +       return 0;
> +}
> +
> +static int mt6370_tcpc_remove(struct platform_device *pdev)
> +{
> +       dev_pm_clear_wake_irq(&pdev->dev);
> +       device_init_wakeup(&pdev->dev, false);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id mt6370_tcpc_devid_table[] = {
> +       { .compatible = "mediatek,mt6370-tcpc" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, mt6370_tcpc_devid_table);
> +
> +static struct platform_driver mt6370_tcpc_driver = {
> +       .driver = {
> +               .name = "mt6370-tcpc",
> +               .of_match_table = mt6370_tcpc_devid_table,
> +       },
> +       .probe = mt6370_tcpc_probe,
> +       .remove = mt6370_tcpc_remove,
> +};
> +module_platform_driver(mt6370_tcpc_driver);
> +
> +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> +MODULE_DESCRIPTION("MT6370 USB Type-C Port Controller Interface Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko
