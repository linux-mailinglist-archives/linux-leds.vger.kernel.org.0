Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E798BB64A
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 16:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405326AbfIWONU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 10:13:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50728 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404847AbfIWONU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 10:13:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NEDFYh074217;
        Mon, 23 Sep 2019 09:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569247996;
        bh=pylUPeCNtRYYZvjwR77bzHfG+zVG/7+gE+JoZOyPgmM=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Hgbv4v36BP4W3UhGYlKUnVLDXwiAqEaYuizHFb2RbcmN8fb5t0hew/PgBEN4dpVUf
         MmFqV3ki2K+x/aZjJhgJbxCkb6xKig6A28L9495kXCOl2tjNMr33HK15/FLr+0y8rv
         NapSH1ZHlwYb73LCStx0KzPlbAjatWoQK6Hc4jCc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NEDF6T082043
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 09:13:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 09:13:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 09:13:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NEDF8s092017;
        Mon, 23 Sep 2019 09:13:15 -0500
Subject: Re: [PATCH v3 3/5] leds: lm3692x: Handle failure to probe the
 regulator
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1569100154.git.agx@sigxcpu.org>
 <32fd08565f8dff39ce9a13f7b0a2546d22913b3a.1569100154.git.agx@sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c1073a35-adaa-1a9b-e1d6-1b36ee7ac1a5@ti.com>
Date:   Mon, 23 Sep 2019 09:17:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <32fd08565f8dff39ce9a13f7b0a2546d22913b3a.1569100154.git.agx@sigxcpu.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Guido

Thanks for the update

Reviewed-by: Dan Murphy <dmurphy@ti.com>

On 9/21/19 4:12 PM, Guido Günther wrote:
> Instead use devm_regulator_get_optional since the regulator
> is optional and check for errors.
>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>   drivers/leds/leds-lm3692x.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index ad76e34455ff..54e9bd2d288b 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -337,9 +337,18 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
>   		return ret;
>   	}
>   
> -	led->regulator = devm_regulator_get(&led->client->dev, "vled");
> -	if (IS_ERR(led->regulator))
> +	led->regulator = devm_regulator_get_optional(&led->client->dev, "vled");
> +	if (IS_ERR(led->regulator)) {
> +		ret = PTR_ERR(led->regulator);
> +		if (ret != -ENODEV) {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(&led->client->dev,
> +					"Failed to get vled regulator: %d\n",
> +					ret);
> +			return ret;
> +		}
>   		led->regulator = NULL;
> +	}
>   
>   	child = device_get_next_child_node(&led->client->dev, child);
>   	if (!child) {
