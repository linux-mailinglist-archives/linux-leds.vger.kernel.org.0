Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF0AD90E7
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 14:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfJPMaM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 08:30:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42956 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfJPMaM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 08:30:12 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GCU8Te063884;
        Wed, 16 Oct 2019 07:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571229008;
        bh=1yO6MQItQdQePmVKkocVm+uu1v/nZ2c3sXLBJEhh1Tc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=m/1f/KuWPJB174uUX5awUVxS+l9harq2hrJisKcUnn4m287naYNWiS5e/ABHbUrvM
         E/0caQ7RL+//PzbwVwwNIR+lRRSzhx4IZX9grb+b18TxRCf0faFdDMkq8iYLPaC2fy
         YLu8Twy8OgZcV5GcGadixwY/TZBE5r7euqSOdoBU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GCU8Dt061831
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 07:30:08 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 07:30:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 07:30:08 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GCU7Bl052311;
        Wed, 16 Oct 2019 07:30:07 -0500
Subject: Re: [PATCH] leds: an30259a: add a check for devm_regmap_init_i2c
To:     Chuhong Yuan <hslester96@gmail.com>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191016120607.32718-1-hslester96@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <89fb4769-d941-38d3-5536-fe4e750845b7@ti.com>
Date:   Wed, 16 Oct 2019 07:29:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016120607.32718-1-hslester96@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Chuhong

On 10/16/19 7:06 AM, Chuhong Yuan wrote:
> an30259a_probe misses a check for devm_regmap_init_i2c and may cause
> problems.
> Add a check and print errors like other leds drivers.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>   drivers/leds/leds-an30259a.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
> index 250dc9d6f635..03ad068f29f7 100644
> --- a/drivers/leds/leds-an30259a.c
> +++ b/drivers/leds/leds-an30259a.c
> @@ -305,6 +305,13 @@ static int an30259a_probe(struct i2c_client *client)
>   
>   	chip->regmap = devm_regmap_init_i2c(client, &an30259a_regmap_config);
>   
> +	if (IS_ERR(chip->regmap)) {
> +		err = PTR_ERR(chip->regmap);
> +		dev_err(&client->dev, "Failed to allocate register map: %d\n",
> +			err);
> +		return err;

This should goto exit as the mutex is created before this allocation on 
ln 302

Dan

