Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13BE33FCE9
	for <lists+linux-leds@lfdr.de>; Thu, 18 Mar 2021 02:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhCRB4B (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Mar 2021 21:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhCRBz3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Mar 2021 21:55:29 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF26DC06174A;
        Wed, 17 Mar 2021 18:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=oMzWJkVczBjzFzxKEp2q/6qdsYB3/dcAkAMFScMmPws=; b=T4uHDSxbTJwEngklC0rXr16s7D
        mcgrxFUr7QdYI5sOiBjMlgy+CCw1qjKF8ziworeae7TXPHnukO6YRdia6tA93S9jLnxYCoQf/PFx9
        sJFe2HGfCaM8XaHtaeZP1FSWGi/5TigixQiyeMdz4KelmcXnHyswalaDfCdicpneshJbIUwAnB02+
        mtBIb8+sEdlvFvTZMapz7Joqd8AzYHmqsxeQBh3c48M1Yw80MqFSG0YDpuQVBbJVptFnuL8dFpAfo
        wSUx6/3ISGHAj9dVHUzLSurZSBP0p3f7csXNw4XuPowSXRNtNTu1Pt+CMMADQBLFQDGjCJnKuODWd
        ZwwvlaEA==;
Received: from [2601:1c0:6280:3f0::9757]
        by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMhrp-001hqj-4a; Thu, 18 Mar 2021 01:54:35 +0000
Subject: Re: [PATCH 1/1] leds: lgm: Improve Kconfig help
To:     Rahul Tanwar <rtanwar@maxlinear.com>, Pavel Machek <pavel@ucw.cz>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
References: <8ae0456a08ef1a2491fd382b273ff7259e6fcbd0.1615969806.git.rtanwar@maxlinear.com>
 <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <42a0c810-4b6f-1853-60c9-e36a9dc6100a@infradead.org>
Date:   Wed, 17 Mar 2021 18:54:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

For the leds/blink/Kconfig file at least, something has
changed all of the tabs to spaces.

Keywords in Kconfig files should be indented with one tab,
while help text should be indented with one tab + 2 spaces.


On 3/17/21 3:04 AM, Rahul Tanwar wrote:
> Remove unnecessary Kconfig symbol LEDS_BLINK
> Improve Kconfig help text to make it more useful.
> 
> Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>
> ---
> 
> diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
> index 6dedc58c47b3..2de2973fbc6b 100644
> --- a/drivers/leds/blink/Kconfig
> +++ b/drivers/leds/blink/Kconfig
> @@ -1,21 +1,19 @@
> -menuconfig LEDS_BLINK
> -       bool "LED Blink support"
> -       depends on LEDS_CLASS
> -       help
> -         This option enables blink support for the leds class.
> -         If unsure, say Y.
> -
> -if LEDS_BLINK
> -
> -config LEDS_BLINK_LGM
> -       tristate "LED support for Intel LGM SoC series"
> +config LEDS_LGM
> +       tristate "LED support for LGM SoC series"
>          depends on GPIOLIB
>          depends on LEDS_CLASS
>          depends on MFD_SYSCON
>          depends on OF
>          help
> -         Parallel to serial conversion, which is also called SSO 
> controller,
> -         can drive external shift register for LED outputs.
> -         This enables LED support for Serial Shift Output controller(SSO).
> +         This option enables support for LEDs connected to GPIO lines on
> +         Lightning Mountain(LGM) SoC. These LEDs are driven by a Serial

                      Mountain (LGM)

> +         Shift Output(SSO) controller. The driver supports hardware

                  Output (SSO)

> +         blinking with a configurable LED update/blink frequency in two
> +         modes, 2/4/8/10 Hz in low speed mode and 50/100/200/250 KHz in
> +         high speed mode. The LEDs can be configured to be triggered by
> +         SW/CPU or by hardware. Say 'Y' here if you are working on LGM

Please spell out "software".

> +         SoC based platform.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called leds-lgm-sso.
> 
> -endif # LEDS_BLINK

thanks.
-- 
~Randy

