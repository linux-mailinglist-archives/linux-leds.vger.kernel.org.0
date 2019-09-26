Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96729BF267
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2019 14:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbfIZMDb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Sep 2019 08:03:31 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53406 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfIZMDb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2019 08:03:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QC3H3v033447;
        Thu, 26 Sep 2019 07:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569499397;
        bh=2CPazhH8rWKmhbyLUwHo9If8lNYXMNPeJh6UIDfWy94=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aT9/PTX8kU0VWFi3jjgddPnnyvXN6d/flO8aJplJZDATQvfp8R2DP6RX9ZtANXsk6
         9bIvU91cT9MIScq+bJA5Qev1lbzpIYP3PyAIUVvPyBf6BIYs/ZFM7Ah6SbIE1ESb0U
         MLzEqgCUbJRi6ZrUNKF3uYryHUu50NuajHYZ4t1s=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QC3Hkh049921;
        Thu, 26 Sep 2019 07:03:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 07:03:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 07:03:08 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QC3Fl2074434;
        Thu, 26 Sep 2019 07:03:15 -0500
Subject: Re: [PATCH v9 01/15] leds: multicolor: Add sysfs interface definition
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linus.walleij@linaro.org>,
        <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-2-dmurphy@ti.com> <20190926111043.GA9310@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <92ae6985-d4fb-7570-3ac6-ebabcf3ab5ed@ti.com>
Date:   Thu, 26 Sep 2019 07:08:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926111043.GA9310@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 9/26/19 6:10 AM, Pavel Machek wrote:
> Hi!
>
>> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
>> new file mode 100644
>> index 000000000000..87a1588d7619
>> --- /dev/null
>> +++ b/Documentation/leds/leds-class-multicolor.rst
>> @@ -0,0 +1,96 @@
>> +====================================
>> +Multi Color LED handling under Linux
>> +====================================
>> +
>> +Description
>> +===========
>> +The multi color class groups monochrome LEDs and allows controlling two
>> +aspects of the final combined color: hue and lightness. The former is
>> +controlled via <color>_intensity files and the latter is controlled
>> +via brightness file.
>> +
>> +For more details on hue and lightness notions please refer to
>> +https://en.wikipedia.org/wiki/CIECAM02.
>> +
>> +Note that intensity files only cache the written value and the actual
>> +change of hardware state occurs upon writing brightness file. This
>> +allows for changing many factors of the perceived color in a virtually
>> +unnoticeable way for the human observer.
> So unlike previous versions, userspace will need to write 4 files
> instead of one in the common case.

Request was made here in v5 of the patchset

https://lore.kernel.org/patchwork/patch/1126685/


>
>> +Directory Layout Example
>> +========================
>> +root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
>> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 red_max_intensity
>> +--w--wx-w- 1 root root 4096 Jul 7 03:10 red_intensity
>> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 green_max_intensity
>> +--w--wx-w- 1 root root 4096 Jul 7 03:10 green_intensity
>> +-rw-rwxr-- 1 root root 4096 Jul 7 03:10 blue_max_intensity
>> +--w--wx-w- 1 root root 4096 Jul 7 03:10 blue_intensity
> Permissions are way off here.
Yes Jacek made a comment in the code about octals.
>
>> +A user first writes the color LED brightness file with the brightness level that
>> +is necessary to achieve a blueish violet output from the RGB LED group.
>> +
>> +echo 138 > /sys/class/leds/rgb:grouped_leds/red_intensity
>> +echo 43 > /sys/class/leds/rgb:grouped_leds/green_intensity
>> +echo 226 > /sys/class/leds/rgb:grouped_leds/blue_intensity
> No, you can't tell what kind of color this will result in.

I tested this combination on two devices (LP5523 and LP50xx) and it was 
a blueish violet.

> Will you be on ELCE/OSS in Lyon?

Unfortunately no.

Dan

>
> Best regards,
> 									Pavel
>
