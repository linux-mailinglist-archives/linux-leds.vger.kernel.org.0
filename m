Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D690927BD76
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 08:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgI2G4e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 02:56:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36730 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI2G4e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 02:56:34 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08T6uLSJ009267;
        Tue, 29 Sep 2020 01:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601362582;
        bh=BFkXgP5gDCcaMl/MOafuuTLn+rBSoUlL3gONewgmCDA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kJuRL2mOnT10QTX5G5imNN5wFMJXCzG+MJDOy+2CXX+Q/gBmj0BsswOR2Dmtnh0j1
         H1H4KYHyXjhHPvZtz3YK3RlOyvMXiUtBS1LD8/OIu234dTDVLdqVx3GtHiBA1PC9r8
         zrleoLmrPoEXCsGCQ6k75+ssEEVtuxL7Py8YfHEU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08T6uLwP009403
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Sep 2020 01:56:21 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 01:56:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 01:56:21 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08T6uJ12102914;
        Tue, 29 Sep 2020 01:56:19 -0500
Subject: Re: [PATCH v3] leds: tlc591xx: fix leak of device node iterator
To:     Tobias Jordan <kernel@cdqe.de>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>
References: <20200926162755.GA26532@agrajag.zerfleddert.de>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ec14762f-29fd-39ba-8314-cfd4ec7a0001@ti.com>
Date:   Tue, 29 Sep 2020 09:56:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926162755.GA26532@agrajag.zerfleddert.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 26/09/2020 19:27, Tobias Jordan wrote:
> In one of the error paths of the for_each_child_of_node loop in
> tlc591xx_probe, add missing call to of_node_put.
> 
> Fixes: 1ab4531ad132 ("leds: tlc591xx: simplify driver by using the managed led API")
> Signed-off-by: Tobias Jordan <kernel@cdqe.de>
> Reviewed-by: Marek Behún <kabel@kernel.org>
> 
> ---
> v3: removed linebreak from Fixes: tag in commit message
> v2: rebased to Pavel's for-next branch
> 
>  drivers/leds/leds-tlc591xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
> index 0929f1275814..a8cc49752cd5 100644
> --- a/drivers/leds/leds-tlc591xx.c
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -214,6 +214,7 @@ tlc591xx_probe(struct i2c_client *client,
>  		err = devm_led_classdev_register_ext(dev, &led->ldev,
>  						     &init_data);
>  		if (err < 0) {
> +			of_node_put(child);
>  			if (err != -EPROBE_DEFER)
>  				dev_err(dev, "couldn't register LED %s\n",
>  					led->ldev.name);
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
