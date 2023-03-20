Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C2F6C149D
	for <lists+linux-leds@lfdr.de>; Mon, 20 Mar 2023 15:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjCTOYF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Mar 2023 10:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjCTOYC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Mar 2023 10:24:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F782D50;
        Mon, 20 Mar 2023 07:24:01 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 956D0A25;
        Mon, 20 Mar 2023 15:23:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679322240;
        bh=QnYj4nXIa2auGM+0iklsTvAxOfZoaL3WB8pnbJxAt6U=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=Lna3YYE29gDIhLeK8LApbhDfeSxBMkPrUJ1PHlPOHCN/zUzdsiKmy6leYOtIjCQRF
         4R18/zjRjICROxU25Zdl2JYajBGU7JuPxv+riW1Pn6dkWxow47jF7eD78CsP5LGlmW
         o+hkcRBAOsKjZXpRxxyBe5Sdl+FOcOcLlQqjqhUg=
Message-ID: <82eaa100-c334-fb02-f956-5515e9b3d79d@ideasonboard.com>
Date:   Mon, 20 Mar 2023 14:23:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] leds: tps68470: Add LED control for tps68470
Content-Language: en-US
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230310095635.813262-1-hpa@redhat.com>
 <20230310095635.813262-4-hpa@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230310095635.813262-4-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kate - sorry just noticed one more thing...

On 10/03/2023 09:56, Kate Hsuan wrote:
> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
> tps68470 provides four levels of power status for LEDB. If the
> properties called "ti,ledb-current" can be found, the current will be
> set according to the property values. These two LEDs can be controlled
> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
>
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>   drivers/leds/Kconfig         |  12 +++
>   drivers/leds/Makefile        |   1 +
>   drivers/leds/leds-tps68470.c | 182 +++++++++++++++++++++++++++++++++++
>   3 files changed, 195 insertions(+)
>   create mode 100644 drivers/leds/leds-tps68470.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 9dbce09eabac..fd26036b3c61 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -827,6 +827,18 @@ config LEDS_TPS6105X
>   	  It is a single boost converter primarily for white LEDs and
>   	  audio amplifiers.
>   
> +config LEDS_TPS68470
> +	tristate "LED support for TI TPS68470"
> +	depends on LEDS_CLASS
> +	depends on INTEL_SKL_INT3472
> +	help
> +	  This driver supports TPS68470 PMIC with LED chip.
> +	  It provide two LED controllers, including an indicator LED
> +	  and a flash LED.
> +
> +	  To compile this driver as a module, choose M and it will be
> +	  called leds-tps68470
> +
>   config LEDS_IP30
>   	tristate "LED support for SGI Octane machines"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d30395d11fd8..b284bc0daa98 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -84,6 +84,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>   obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>   obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
>   obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
> +obj-$(CONFIG_LEDS_TPS68470)		+= leds-tps68470.o


Alphabetical order here too please :)
