Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A45BB643
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 16:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393936AbfIWOMb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 10:12:31 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50650 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389738AbfIWOMb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 10:12:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NECO3O074073;
        Mon, 23 Sep 2019 09:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569247944;
        bh=xjCqVaqsfxQUrYb+QYCqmUUgiW6IKZy5ystoyrOScP0=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=djVMXW2xEx7V3DIFjCoijRRDlcfvADAx5fqZdXy+u/aWGj3+z1HJ3cufDqKSpYr0w
         tlK+Qrxedm0ElKG597iPF29GTsbxqbO4QQIEm85k9njWBbkrsNgd+Wko8acxf+2xTQ
         lSLGnKSDzBD2V8xpCnwizeQ9vtazvyNNCxaJhKOw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NECOe5007615;
        Mon, 23 Sep 2019 09:12:24 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 09:12:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 09:12:18 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NECNH5090850;
        Mon, 23 Sep 2019 09:12:23 -0500
Subject: Re: [PATCH v3 2/5] leds: lm3692x: Don't overwrite return value in
 error path
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1569100154.git.agx@sigxcpu.org>
 <be4c3e89e6285d8d1529967e6198abb51d28fe8b.1569100154.git.agx@sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b7f48872-b839-6c83-3708-659e84bc02b8@ti.com>
Date:   Mon, 23 Sep 2019 09:16:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <be4c3e89e6285d8d1529967e6198abb51d28fe8b.1569100154.git.agx@sigxcpu.org>
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
> The driver currently reports successful initialization on every failure
> as long as it's able to power off the regulator. Don't check the return
> value of regulator_disable to avoid that.
>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>   drivers/leds/leds-lm3692x.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index 487228c2bed2..ad76e34455ff 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -198,7 +198,7 @@ static int lm3692x_brightness_set(struct led_classdev *led_cdev,
>   static int lm3692x_init(struct lm3692x_led *led)
>   {
>   	int enable_state;
> -	int ret;
> +	int ret, reg_ret;
>   
>   	if (led->regulator) {
>   		ret = regulator_enable(led->regulator);
> @@ -313,14 +313,15 @@ static int lm3692x_init(struct lm3692x_led *led)
>   		gpiod_direction_output(led->enable_gpio, 0);
>   
>   	if (led->regulator) {
> -		ret = regulator_disable(led->regulator);
> -		if (ret)
> +		reg_ret = regulator_disable(led->regulator);
> +		if (reg_ret)
>   			dev_err(&led->client->dev,
> -				"Failed to disable regulator\n");
> +				"Failed to disable regulator: %d\n", reg_ret);
>   	}
>   
>   	return ret;
>   }
> +
>   static int lm3692x_probe_dt(struct lm3692x_led *led)
>   {
>   	struct fwnode_handle *child = NULL;
