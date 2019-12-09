Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3332117018
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 16:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfLIPPO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 10:15:14 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35302 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfLIPPO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2019 10:15:14 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so7278741pgk.2;
        Mon, 09 Dec 2019 07:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5p1spyZSykr9TaP0CnkdC2CY7tPzDiSLkHXnb86Xovs=;
        b=ebiupU584wSQfYKFi2wG9qmHHdMexkl4PdgFmox3KZidWxR9Nn5P8J+DLReJ5+IC7i
         U1igfbyRMx5zpb5z5iehxHpAFenvBswLpAVG0yXBCKvh1RgZXM42Nm72gUWIHhGfriyy
         7R/2f1jJ2xtBAqnOGOPG4tZsWr4TRbpjjP3JsAObtRf+9WuO6LTPMbbKsCc1iln4h2bj
         lu9ljnsOSGiOegJujRwYoIDd9Bte2dqYhm2pc+BTQXEKWipqlTvTkEKjTzDR/ox4p2lC
         k3jyKDLMtlhzgHzsSmLCT00JKWa8txDVmo2iuhLuAt/IkOwmHwwIQzYdcxj3RW/Jb2w3
         YFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5p1spyZSykr9TaP0CnkdC2CY7tPzDiSLkHXnb86Xovs=;
        b=QsfhIPExsrbehGrL4XwKzAAn0Y/jxfKWvhAzPtb5M2fKYwTaq+n+xLwunwPFGOg9xe
         FZrxSiBW10PVeLchYkc0lE5PlicxAlAAI6xXlLNmlrq09uBoJM672vOqa4F4wPrS6Zwd
         x0ZTJIbFrZmg19yWgN1Gdt4TBvtY9MaZCVG+n8Cyx1Kb2DHCz/i4E4KdJSZXVv7PXs7j
         uVG6NxoGAAlKbAK37Bfp1rc4UaQ6A7SeKpRFF/7mHz2zx8lxVs7k4EVYAGFG5epI2gOH
         kC7LxlAp0VOxbWPR+87teJaz1QJXaKypEAMksuPmqsucDqruDV/qMXkdqBi2rOEvG++w
         vclQ==
X-Gm-Message-State: APjAAAXHxoqe0gHF9SUJwPa6iB68u6/rhQsrngTcC9EnlyewfKwis1Yf
        ub00YCmjoqF+V8TPDbbFQY71ZKLBtXpKCJGlzzs=
X-Google-Smtp-Source: APXvYqy73+fW5VBN9n2K5kkmfSpXWFsoHC63VdxOXZsOUofjku7qNi1PvaEx8jie715xSpQ7TeJ5LxL3F0XfVxej14s=
X-Received: by 2002:aa7:9697:: with SMTP id f23mr28831776pfk.232.1575904513324;
 Mon, 09 Dec 2019 07:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20191209140234.6558-1-TheSven73@gmail.com> <20191209140234.6558-2-TheSven73@gmail.com>
 <81e05dad-8582-7673-7ff3-658d7f08ed6a@ti.com>
In-Reply-To: <81e05dad-8582-7673-7ff3-658d7f08ed6a@ti.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 9 Dec 2019 10:15:02 -0500
Message-ID: <CAGngYiVmOm2985Xu5pXdAx7Gx=hXJ-uUjMSgTv4L9_WeiyCXug@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] leds: tps6105x: add driver for mfd chip led mode
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thank you for the review, Dan. Some remarks below.

On Mon, Dec 9, 2019 at 9:12 AM Dan Murphy <dmurphy@ti.com> wrote:
>
> > +     priv->fwnode = device_get_next_child_node(pdev->dev.parent, NULL);
>
> Probably need to check for NULL on the return
>

The driver will work without crashes or oopses even when this returns NULL:
- struct led_init_data . fwnode is optional (can be NULL)
- fwnode_handle_put() ignores NULL arguments

By not checking for NULL here, non-devicetree users can still select
led mode through platform data on the parent mfd driver, and things
will "just work".

Could I persuade you to keep this behaviour?
Perhaps I should put a comment in to clarify?

> > +     ret = regmap_update_bits(tps6105x->regmap, TPS6105X_REG_0,
> > +             TPS6105X_REG0_MODE_MASK | TPS6105X_REG0_TORCHC_MASK,
> > +             TPS6105X_REG0_MODE_TORCH << TPS6105X_REG0_MODE_SHIFT);
> Checkpatch should have warned about alignment here

I used 5.4's checkpatch.pl, but somehow it doesn't warn :(
Will fix that up.
