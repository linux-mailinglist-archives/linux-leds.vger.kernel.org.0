Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6F2B6AC6
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 20:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbfIRSpl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 14:45:41 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56918 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfIRSpl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 14:45:41 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IIjbhR088798;
        Wed, 18 Sep 2019 13:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568832337;
        bh=EXt8+T246I96qjzHn0OTx9qPWlbzfdV0acnWhBtUscQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=yFSPDOfcm+jvM/UgrFAIv5irGShkWaFB74jqABIJA/y+zlACz8L2cn3DvCEqrhP5h
         u+BWsA4US9PXuIuAs4y6G223WlX6XMdcGXMaO0Fe1sB94sgLW8XozqWaJ3Nr+p52ST
         ejw/jIcP7kFpxHUMsqiy3vOJBDLIz/E3nXuKeINM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IIjbrl028043
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Sep 2019 13:45:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 13:45:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 13:45:37 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IIjap6107852;
        Wed, 18 Sep 2019 13:45:36 -0500
Subject: Re: [PATCH 5/5] leds: lm3692x: Use flags from LM3692X_BRT_CTRL
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1568772964.git.agx@sigxcpu.org>
 <d1347a31ab9f86c3d13ab8016606999d5c0497cd.1568772964.git.agx@sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <905f43fb-b75c-d0f2-8669-275e18241735@ti.com>
Date:   Wed, 18 Sep 2019 13:48:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d1347a31ab9f86c3d13ab8016606999d5c0497cd.1568772964.git.agx@sigxcpu.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Guido

On 9/17/19 9:19 PM, Guido Günther wrote:
> Use LM3692X_RAMP_EN instead of LM3692X_PWM_HYSTER_4LSB
> since the later is a flag for the PWM register. The
> actual register value remains unchanged.
>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/leds-lm3692x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index d673f706385e..ecac586ca89c 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -269,7 +269,7 @@ static int lm3692x_init(struct lm3692x_led *led)
>   		goto out;
>   
>   	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL,
> -			LM3692X_BL_ADJ_POL | LM3692X_PWM_HYSTER_4LSB);
> +			LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN);
>   	if (ret)
>   		goto out;
>   
