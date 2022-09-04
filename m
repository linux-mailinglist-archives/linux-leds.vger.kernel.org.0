Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0C3E5AC64C
	for <lists+linux-leds@lfdr.de>; Sun,  4 Sep 2022 22:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbiIDUPP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 4 Sep 2022 16:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbiIDUPM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 4 Sep 2022 16:15:12 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60998175BF
        for <linux-leds@vger.kernel.org>; Sun,  4 Sep 2022 13:15:11 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id q21so1337794edc.9
        for <linux-leds@vger.kernel.org>; Sun, 04 Sep 2022 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=B0UcNE6NxxIEK/T2D5tC9KfKA9gJ+JcocCKLSydu1+k=;
        b=QsMqX+zGDd8becR5YbPdz3CvjWgJ/Ff19vFQlLyPQ1h1Kuu8+IMWsZh1cB7Cait8+n
         iE31bT2THSSmgkd9BAPM62u9HgLpoB1OIkfmnjLwBx3HL1mtltQxljzmt0ZCgScik2bH
         LIY2BMNdc/M7NzorgLISf5/k8DTT+V+ovxQWLFizYjrrdbKfCUi7JfH7Qx/t+cZormJ4
         rJ6FYsmDBXA9t/2xAEiMnkLTz7mUfab3Z+yr8u+YSRaO/+SSncW3jCFIGLB8vSJQ64Bg
         P184azlGAFE8liXKeaqsa0Dqpukvura38GhIqJb1/LaPKOMNEU8cml2AjGBiQcBcrQpi
         vWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=B0UcNE6NxxIEK/T2D5tC9KfKA9gJ+JcocCKLSydu1+k=;
        b=To/G4yAYXYHOeAqjxkLXJIncFJMUAQmcVYgcDuTeY6qUiUviI/dKM3OSfZHlotKGgV
         235DdGnH0bQzVEeyw0S2TWG3pQA1vjH5/MfBU5qeo45ZrvBMQqk6l3FdOSQ1zjmNmhQD
         eZ2ZSdEc9J4SnVLT2NRZhVWdbH4BC3qENHvCIDfp/ac0k8S/5eOE//mbjt0vAxfA0gNT
         QuYLKgu4o9BAxgr0h1FNbULR54a1W/VPO+VJlLE634L+FTeZwfa02NsqY2c5tYxZCZR9
         t+/68I6QNQ5eXplyKJCrrPZ+lJVawl4RnomE0ilfbqyrh6lfEP6D2C7ioEYtNIaZEwaq
         PxPA==
X-Gm-Message-State: ACgBeo1bW4BnuRv5B2mSTuH0QRisIkAx2Cq40REz+x2LTDPvSAyP+Mnm
        +x65qW6mkW1IKhTuEwcvzqDSA0SsLQGMOdiJ69MswQ==
X-Google-Smtp-Source: AA6agR4HhRTeC470jwaUuyblo5zi9/wv7ouI3w+gC3QMbRTKnsiWG+DY/w8S3Xw5JC5qq+/xDHtQjaSrzSEIDNoXhjY=
X-Received: by 2002:a05:6402:4007:b0:448:6c4c:b40 with SMTP id
 d7-20020a056402400700b004486c4c0b40mr29495975eda.422.1662322509795; Sun, 04
 Sep 2022 13:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220902-get_gpiod_from_child-remove-v1-0-1e47125df20f@gmail.com> <20220902-get_gpiod_from_child-remove-v1-3-1e47125df20f@gmail.com>
In-Reply-To: <20220902-get_gpiod_from_child-remove-v1-3-1e47125df20f@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 4 Sep 2022 22:14:59 +0200
Message-ID: <CAMRc=Md=uOtULefxLRD_t2+o1_qcr5aSZe6Tzy+i+hOeNMejWQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpiolib: remove devm_fwnode_get_[index_]gpiod_from_child()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 3, 2022 at 2:56 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Now that there are no more users of these APIs in the kernel we can
> remove them.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index fe0f460d9a3b..2ccda8567533 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -594,27 +594,6 @@ struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
>                                            flags, label);
>  }
>
> -static inline
> -struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
> -                                               const char *con_id, int index,
> -                                               struct fwnode_handle *child,
> -                                               enum gpiod_flags flags,
> -                                               const char *label)
> -{
> -       return devm_fwnode_gpiod_get_index(dev, child, con_id, index,
> -                                          flags, label);
> -}
> -
> -static inline
> -struct gpio_desc *devm_fwnode_get_gpiod_from_child(struct device *dev,
> -                                                  const char *con_id,
> -                                                  struct fwnode_handle *child,
> -                                                  enum gpiod_flags flags,
> -                                                  const char *label)
> -{
> -       return devm_fwnode_gpiod_get_index(dev, child, con_id, 0, flags, label);
> -}
> -
>  #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_OF_GPIO)
>  struct device_node;
>
>
> --
> b4 0.10.0-dev-fc921

Either:

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

Or I can take pull an immutable branch from the leds tree.

Bart
