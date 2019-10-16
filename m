Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C780DD93F8
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 16:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392214AbfJPOea (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 10:34:30 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58688 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731987AbfJPOea (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 10:34:30 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GEYOuC002057;
        Wed, 16 Oct 2019 09:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571236464;
        bh=sL1OOfBP4VKCoJ3rIFCH/P3XqaR9GzNKjyDtWXF3MBU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NnGUwC3NzS3mrMrBSxIGGpbjHNlwiEZWnY5lgWZUj6A9VgA7Sg0q7OmFkPEz25Zwi
         VKLwtoJQ2y+ySJgAFd+itQkKTpJK8aU7z+/MCUYYFfMsXMlGBvBgQi3BtLvldS9mb8
         zCdBMHRTDIsYfyTrvr97VwO3BDic79QEy6LijNnM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GEYOv4096679
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 09:34:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 09:34:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 09:34:17 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GEYOln020144;
        Wed, 16 Oct 2019 09:34:24 -0500
Subject: Re: [PATCH v2] leds: an30259a: add a check for devm_regmap_init_i2c
To:     Chuhong Yuan <hslester96@gmail.com>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191016125403.23359-1-hslester96@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1f4282aa-edb2-2683-bfff-8805a972710b@ti.com>
Date:   Wed, 16 Oct 2019 09:33:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016125403.23359-1-hslester96@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Chuhong

On 10/16/19 7:54 AM, Chuhong Yuan wrote:
> an30259a_probe misses a check for devm_regmap_init_i2c and may cause
> problems.
> Add a check and print errors like other leds drivers.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
> Changes in v2:
>    - Use goto exit instead of return to destroy the mutex when failed.
>
>   drivers/leds/leds-an30259a.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
> index 250dc9d6f635..82350a28a564 100644
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
> +		goto exit;
> +	}
> +

Reviewed-by: Dan Murphy <dmurphy@ti.com>


>   	for (i = 0; i < chip->num_leds; i++) {
>   		struct led_init_data init_data = {};
>   
