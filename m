Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC7631D7E5
	for <lists+linux-leds@lfdr.de>; Wed, 17 Feb 2021 12:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhBQLGK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Feb 2021 06:06:10 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50359 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhBQLFh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Feb 2021 06:05:37 -0500
Received: from [192.168.1.155] ([95.118.154.137]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N4A1h-1luMS91vX7-01091g; Wed, 17 Feb 2021 12:02:48 +0100
Subject: Re: [PATCH v2] leds: apu: extend support for PC Engines APU1 with
 newer firmware
To:     Andreas Eberlein <foodeas@aeberlein.de>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210216133028.4025-1-foodeas@aeberlein.de>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
Date:   Wed, 17 Feb 2021 12:02:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216133028.4025-1-foodeas@aeberlein.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yAxNEpEFxBE7Ix0QnFkCYKxglhgHdHtGs6CuP/iEros+rhaun5S
 YVAWXGspnSbqMA3YQLsbBgNhbB3qtdq3GDCzWxa4fc1bvhVMglZ3Z24Xo428eaBZ4lBh2L/
 FvfZKfoNOvefI/M/HB+tbPLRES+mRevWcKy6WowjrX/N3cSK7b3YhAWUbtRxqJ91nfWSvZ8
 LSd+xcbVA2Y96f184TQ4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AexSnRepnHw=:FoN8i7EG1uKLf49OyAj+R2
 mmreqh/jyPo77rm0WNt2kGQDulhlehZHfMs7m6UIZp33TVbW4BWwH/30IuprN8tctQPwofju4
 JbCmuXy9WFAkzmkf4VQmZ/QOz6QdVM9vTj7zSXvDmd1mJVY2SzY/we/imbHrY1oVjufh2t4ep
 b5FAtDpwScaftKpL8Fn+YSJP9Sp0VlcSrAG2NsO0PH49uQ5odjUmaaMzcq0nmiMD9C1SLxw2z
 uhrZO7nI7kqJ2IAsHmiJ5Xz5/sk+C1MSHSlj6K0nZLXrAwBpmAxtVi3tgWclTLKIA81MDoIKe
 HWaeMrBNL5BvZk5/X5/okXUeIJmtGpe6MYlVVOgWkwgLeoPYAqbBNfR3Q8Ksj7uL+NkR6/qCB
 W0wuuz1cEyfWjFsLI8wA9f5uZOqYNZooY1bBHKSrwRUcYxYUXsqar6fxUtIU3kjzdzqhIQS0k
 X6KSGYGMK6gyiFpiJTGydeURny5Y2LycL/vsuF3B0ImJk6v67ER4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 16.02.21 14:30, Andreas Eberlein wrote:

Hi,

> The DMI_PRODUCT_NAME entry on current firmware of PC Engines APU1 changed
> from "APU" to "apu1"
> 
> This modification adds the missing DMI data and thereby the LED support for
> the PC Engines APU1 with firmware versions >= 4.6.8.

Do you have a device for more intensive testing ?

In that case I'd like to suggest splitting the driver into gpio and
gpio-based LED (using leds-gpio) - just like already I did for apu2/3/4.
Maybe this even could also be moveed into the apu2 driver. This probably
just makes sense if there're more gpio-connected devices than just LED)

Personally, I don't have access to the old apu1 board (IIRC not even
produced anymore for several years), so I didn't dare to touch anything
here.

Note that apu1 vs. apu2/3/4 have completely different SOC with different
gpio logic - that was one of the reasons for writing a completely new
driver for apu2+ from scrath, rather than extending the old one.

> --- a/drivers/leds/leds-apu.c
> +++ b/drivers/leds/leds-apu.c
> @@ -83,6 +83,7 @@ static const struct apu_led_profile apu1_led_profile[] = {
>   };
>   
>   static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
> +	/* PC Engines APU with factory bios "SageBios_PCEngines_APU-45" */
>   	{
>   		.ident = "apu",
>   		.matches = {
> @@ -90,6 +91,14 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "APU")
>   		}
>   	},
> +	/* PC Engines APU with "Mainline" bios >= 4.6.8 */
> +	{
> +		.ident = "apu",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "apu1")
> +		}
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
> @@ -173,7 +182,7 @@ static int __init apu_led_init(void)
>   	int err;
>   
>   	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
> -	      dmi_match(DMI_PRODUCT_NAME, "APU"))) {
> +	      (dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "apu1")))) {
>   		pr_err("No PC Engines APUv1 board detected. For APUv2,3 support, enable CONFIG_PCENGINES_APU2\n");
>   		return -ENODEV;
>   	}
> 

Looks good to me. But don't dare giving official ack, since I don't
have an apu1 board for testing.

Is Alan Mizrahi (original author) still here ?


--mtx


-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
