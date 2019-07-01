Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655E65C063
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfGAPhF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:37:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39014 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728170AbfGAPhF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:37:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61Fb2tR130506;
        Mon, 1 Jul 2019 10:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561995422;
        bh=qiiHsLzsZ4QEZAB3usis+CPLGFeEmBSVwIuh3luO7b8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LfUNUA34e/+R8i6WXxZjmp07oDZEyjs0ZMIV68wE3GAaNLfP5UNJ5i8KjKZxj7vFU
         xJerW/HeieVmVQGGWWKBwJXeleIG2J6rZMQmTeEUWCWurTMNzQf2VR7d5nGjR26JLr
         5xdIahBZhPMtCh7hUunWY696y9X2KNCSoEGPBamU=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61Fb2Tc083526
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:37:02 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:37:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:37:01 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61Fb1SN040518;
        Mon, 1 Jul 2019 10:37:01 -0500
Subject: Re: [PATCH 2/2] leds: tlc591xx: Use the OF version of the LED
 registration function
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ti.com>
References: <20190701152602.31716-1-jjhiblot@ti.com>
 <20190701152602.31716-3-jjhiblot@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <102194fe-e4d1-fa36-16f7-2a933e646bb5@ti.com>
Date:   Mon, 1 Jul 2019 10:36:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701152602.31716-3-jjhiblot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

JJ

On 7/1/19 10:26 AM, Jean-Jacques Hiblot wrote:
> The driver parses the device-tree to identify which LED should be handled.
> Since the information about the device node is known at this time, we can
> provide the LED core with it. It may be useful later.
>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   drivers/leds/leds-tlc591xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
> index 14e47ff44df5..6a2936c94b73 100644
> --- a/drivers/leds/leds-tlc591xx.c
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -207,7 +207,7 @@ tlc591xx_probe(struct i2c_client *client,
>   		led->led_no = idx++;
>   		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
>   		led->ldev.max_brightness = LED_FULL;
> -		err = devm_led_classdev_register(dev, &led->ldev);
> +		err = devm_of_led_classdev_register(dev, child, &led->ldev);
>   		if (err < 0) {
>   			dev_err(dev, "couldn't register LED %s\n",
>   				led->ldev.name);


Reviewed-by: Dan Murphy <dmurphy@ti.com>

