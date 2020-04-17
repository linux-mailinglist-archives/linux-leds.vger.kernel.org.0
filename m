Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27351ADDF6
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 15:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbgDQNBU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 09:01:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59670 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729845AbgDQNBT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Apr 2020 09:01:19 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HD1FFc052490;
        Fri, 17 Apr 2020 08:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587128475;
        bh=30YPLLaLQjy+yhV0lSNLa2a1Qi1ZVGGjBf+Af6BBjwA=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=NrltBYeWfPU0l/2WJlqcxzmyCDUENyrpr5TnUX98VR09nI6VC6oZJfcm4D/oLqdAA
         hpVbN9agjPL9VK6v2phHPIz7nkhgj75ElWtyyw2MNlwPMrUm3S+vwQO108H9luzJU8
         GYHDkhQ0JEQVDbjHHI2MDrpUIKGhRF4GdMxFjeug=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HD1Fh5055269;
        Fri, 17 Apr 2020 08:01:15 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 08:01:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 08:01:15 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HD1FBk032801;
        Fri, 17 Apr 2020 08:01:15 -0500
Subject: Re: [PATCH] leds: tlc591xxt: hide error on EPROBE_DEFER
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20200417113758.24924-1-tomi.valkeinen@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <4deb542b-211e-edb3-637b-c3939fb26fa3@ti.com>
Date:   Fri, 17 Apr 2020 07:55:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417113758.24924-1-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Tomi

On 4/17/20 6:37 AM, Tomi Valkeinen wrote:
> If devm_led_classdev_register_ext() fails with EPROBE_DEFER, we get:
>
> tlc591xx 0-0040: couldn't register LED (null)
>
> Only print the error if the error is something else than EPROBE_DEFER.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>   drivers/leds/leds-tlc591xx.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
> index a8911ebd30e5..0929f1275814 100644
> --- a/drivers/leds/leds-tlc591xx.c
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -214,8 +214,9 @@ tlc591xx_probe(struct i2c_client *client,
>   		err = devm_led_classdev_register_ext(dev, &led->ldev,
>   						     &init_data);
>   		if (err < 0) {
> -			dev_err(dev, "couldn't register LED %s\n",
> -				led->ldev.name);
> +			if (err != -EPROBE_DEFER)
> +				dev_err(dev, "couldn't register LED %s\n",
> +					led->ldev.name);
>   			return err;
>   		}
>   	}
Reviewed-by: Dan Murphy <dmurphy@ti.com>
