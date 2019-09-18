Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21904B6AC3
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 20:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbfIRSoZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 14:44:25 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56710 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbfIRSoZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 14:44:25 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IIiLZp088425;
        Wed, 18 Sep 2019 13:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568832261;
        bh=g0cbAN+irGvhyFEY3hf2bq0VwD9auyJlckSTD+JK5lQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=iHc1susS5H0ZUXTLny1FCIzEmygfhAGPfzOOUu4+MbiLRzrHQOrKFOpIU5kA966Kk
         zbqbvjNkkT7k1E/gCDM4eXCHp8oPT/6+LLu0xiUJPDAptZ817LoOvh1G/5AZjzMnSX
         WbPRCBy0Y99MbtRl2pLSzt7DJsVGfkU5lB7HO/mw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IIiLWc017588
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Sep 2019 13:44:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 13:44:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 13:44:20 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IIiKG0046755;
        Wed, 18 Sep 2019 13:44:20 -0500
Subject: Re: [PATCH 4/5] leds: lm3692x: Use flags from LM3692X_BOOST_CTRL
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1568772964.git.agx@sigxcpu.org>
 <64a2f91377a7537d734de00473f1fc9653785d69.1568772964.git.agx@sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7efa3fd1-254f-d21f-eca7-007c0d07dd62@ti.com>
Date:   Wed, 18 Sep 2019 13:46:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <64a2f91377a7537d734de00473f1fc9653785d69.1568772964.git.agx@sigxcpu.org>
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
> The current setup of LM3692X_BOOST_CTRL uses flags from LM3692X_BRT_CTRL.
> Use flags from LM3692X_BOOST_CTRL but leave the resulting register value
> unchanged.
>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/leds-lm3692x.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index 9972c932d51e..d673f706385e 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -250,9 +250,9 @@ static int lm3692x_init(struct lm3692x_led *led)
>   		goto out;
>   
>   	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL,
> -			LM3692X_BRHT_MODE_RAMP_MULTI |
> -			LM3692X_BL_ADJ_POL |
> -			LM3692X_RAMP_RATE_250us);
> +			LM3692X_BOOST_SW_1MHZ |
> +			LM3692X_BOOST_SW_NO_SHIFT |
> +			LM3692X_OCP_PROT_1_5A);
>   	if (ret)
>   		goto out;
>   
