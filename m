Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1DC15AA0C
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2020 14:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgBLNbs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Feb 2020 08:31:48 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43144 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgBLNbs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Feb 2020 08:31:48 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01CDVfxg052623;
        Wed, 12 Feb 2020 07:31:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581514301;
        bh=T994I6+GF8haALJGR/LjnbSPhpWFXFIVbbQeQCeVcuI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hNq9i9gLsTBfnOMhrxXphl6hfNL9D+oWYSOq0lfpaqHteEEEj0uKFJ68kZgmBRxeq
         odQ+vdSOO9HB3P8PWlcj+t6kmA2uqu0mEtDiQYHdpxAEP1TiY9K/IXdP+b43ddnBU2
         fDQ4M4DY+OZhufbOY6vTGyhSo/l6oqRiOLYmGxYY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01CDVf1u124371;
        Wed, 12 Feb 2020 07:31:41 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 07:31:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 07:31:41 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01CDVegh002399;
        Wed, 12 Feb 2020 07:31:40 -0600
Subject: Re: [PATCH 1/2 v2] leds: ns2: Absorb platform data
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
References: <20200210101354.287045-1-linus.walleij@linaro.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <a7e4fefe-103c-7161-ef35-f7a0f8cb1453@ti.com>
Date:   Wed, 12 Feb 2020 07:27:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210101354.287045-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Linus

On 2/10/20 4:13 AM, Linus Walleij wrote:
> Nothing in the kernel includes the external header
> <linux/platform_data/leds-kirkwood-ns2.h> so just push the
> contents into the ns2 leds driver. If someone wants to use
> platform data or board files to describe this device they
> should be able to do so using GPIO machine descriptors but
> in any case device tree should be the way forward for these
> systems in all cases I can think of, and the driver already
> supports that.
>
> Cc: Vincent Donnefort <vdonnefort@gmail.com>
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Collect Simon's Tested-by tag
> ---
>   drivers/leds/leds-ns2.c                       | 30 +++++++++++++--
>   .../linux/platform_data/leds-kirkwood-ns2.h   | 38 -------------------
>   2 files changed, 27 insertions(+), 41 deletions(-)
>   delete mode 100644 include/linux/platform_data/leds-kirkwood-ns2.h
>
> diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
> index 7c500dfdcfa3..6d37dda12c39 100644
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@ -12,14 +12,38 @@
>   #include <linux/kernel.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/leds.h>
>   #include <linux/module.h>
> -#include <linux/platform_data/leds-kirkwood-ns2.h>
>   #include <linux/of.h>
> -#include <linux/of_gpio.h>
>   #include "leds.h"

These header file change for gpio seem to belong in patch 2/2.

I don't see any gpio related changes in this patch

Dan


