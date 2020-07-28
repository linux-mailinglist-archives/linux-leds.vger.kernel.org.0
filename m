Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951BC230B90
	for <lists+linux-leds@lfdr.de>; Tue, 28 Jul 2020 15:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbgG1NjD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Jul 2020 09:39:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52478 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbgG1NjD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jul 2020 09:39:03 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06SDceok086218;
        Tue, 28 Jul 2020 08:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595943520;
        bh=LF1KW3b5hNQ93VNK2QHQ2c1Hqq2jNqESiln7vaNb5mw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=v2pj/FVZBSdeoK7UrRluB53SZAjqMFqWQi/FBqkcSIMOrHjO/6OrC6fMf/fnV8v2g
         N6qcOvCuXROYGhZAgCHi3c5yDICDzViFIKKyjMXRSmDyEO9889wJ53RbKalU4AwG/P
         XWA1W7a6R/HWGH+FHYCDlnrPhtKkYda1GWcFhgRQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06SDcebH042073
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Jul 2020 08:38:40 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Jul 2020 08:38:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Jul 2020 08:38:40 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06SDcdWq054358;
        Tue, 28 Jul 2020 08:38:39 -0500
Subject: Re: [PATCH v32 3/6] ARM: defconfig: u8500: Add LP55XX_COMMON config
 flag
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-4-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <372891d8-816e-f640-7356-90513f998702@ti.com>
Date:   Tue, 28 Jul 2020 08:38:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722153146.8767-4-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Russel and Linus

On 7/22/20 10:31 AM, Dan Murphy wrote:
> The dependencies for the LP55XX LED drivers have been updated so that
> the child devices (i.e. LP5521) now depends on the LP55XX_COMMON config
> flag as opposed to the device selecting the LP55XX_COMMON flag.  The
> LP55XX_COMMON needs to be set in the defconfig.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   arch/arm/configs/u8500_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
> index 28dd7cf56048..dea599e1c17e 100644
> --- a/arch/arm/configs/u8500_defconfig
> +++ b/arch/arm/configs/u8500_defconfig
> @@ -113,6 +113,7 @@ CONFIG_NEW_LEDS=y
>   CONFIG_LEDS_CLASS=y
>   CONFIG_LEDS_LM3530=y
>   CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_LP55XX_COMMON=y
>   CONFIG_LEDS_LP5521=y
>   CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>   CONFIG_RTC_CLASS=y


I missed adding you to the patch.

Can you kindly review this change?

Dan

