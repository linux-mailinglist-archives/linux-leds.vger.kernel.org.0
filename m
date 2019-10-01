Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73707C38BD
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 17:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389499AbfJAPRy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 11:17:54 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52544 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfJAPRy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 11:17:54 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91FHd6G012908;
        Tue, 1 Oct 2019 10:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569943059;
        bh=mYUdVtpTVwCAKDqOu/gzrxlPJtwVfw4kTjUjOPGBBwI=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=vgVjgSmM4Fm9w2oqiQFOOZO20eOMLlmf2fpPWhTk4SB6lLT6cXWfq0Z6zuuYfKhb9
         WJcvCpx5oSZRqK2kWQ7PTEZWd82IgRDhabn5MBGNjzDlHvmLVVdbTmmHjMnBeKbxqw
         yXchTeVsv4hWw2aRN9OXYzqf2lbVnB42ync3zMWA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91FHdhi031997
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 10:17:39 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 10:17:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 10:17:29 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91FHceg051485;
        Tue, 1 Oct 2019 10:17:38 -0500
Subject: Re: [PATCH V6 5/8] backlight: qcom-wled: Restructure the driver for
 WLED3
To:     Kiran Gunda <kgunda@codeaurora.org>, <bjorn.andersson@linaro.org>,
        <jingoohan1@gmail.com>, <lee.jones@linaro.org>,
        <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
        <daniel.thompson@linaro.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-fbdev@vger.kernel.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-6-git-send-email-kgunda@codeaurora.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6f50ea19-f320-b4e6-f269-4d1e2189fa77@ti.com>
Date:   Tue, 1 Oct 2019 10:17:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569825553-26039-6-git-send-email-kgunda@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Kiran

On 9/30/19 1:39 AM, Kiran Gunda wrote:
> Restructure the driver to add the support for new WLED
> peripherals.
>
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>   drivers/video/backlight/qcom-wled.c | 395 ++++++++++++++++++++++--------------
>   1 file changed, 245 insertions(+), 150 deletions(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index f191242..740f1b6 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -7,59 +7,71 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_device.h>
> +#include <linux/of_address.h>
>   #include <linux/regmap.h>
>   
>   /* From DT binding */
> +#define WLED_MAX_STRINGS				4
> +
>   #define WLED_DEFAULT_BRIGHTNESS				2048
>   
> -#define WLED3_SINK_REG_BRIGHT_MAX			0xFFF
> -#define WLED3_CTRL_REG_VAL_BASE				0x40
> +#define WLED_SINK_REG_BRIGHT_MAX			0xFFF

Why did you change some of these again?

Can you just change it to the final #define in patch 4/8?

Dan

<snip>

