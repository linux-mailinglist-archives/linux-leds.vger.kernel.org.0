Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA066B8F34
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 13:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438238AbfITLp4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 07:45:56 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51394 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438234AbfITLp4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 07:45:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KBjniL065355;
        Fri, 20 Sep 2019 06:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568979949;
        bh=BEDtAfL/joofY0lgoqbNbOuUs3KMuDnLnj1scx1TbUs=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=AXsSUJZ8PmVDa/FaDDUY3zbO/D4Sugk4DhZFVPQltzana+q7DiFUQ3sYnaRC2hOD0
         JDOdXqCvcqbaMmGuE6BTFeHhEzmpdaTRD4XHfEYGGD3vPCtIpppFngBDDzEIda3CDu
         c9BoPjG/9fX13931HIf8ggf/l07XAF0Spg+9/3p0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KBjn4d089246
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 06:45:49 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 06:45:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 06:45:45 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KBjn9w055169;
        Fri, 20 Sep 2019 06:45:49 -0500
Subject: Re: [PATCH v2 2/5] leds: lm3692x: Don't overwrite return value in
 error path
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1568957104.git.agx@sigxcpu.org>
 <e3ee36845c1555bd722807f85329341d5ec9728e.1568957104.git.agx@sigxcpu.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2bde2870-08a3-38b9-9cd7-fee0e2107743@ti.com>
Date:   Fri, 20 Sep 2019 06:48:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e3ee36845c1555bd722807f85329341d5ec9728e.1568957104.git.agx@sigxcpu.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Guido

On 9/20/19 12:27 AM, Guido Günther wrote:
> The driver currently reports successful initialization on every failure
> as long as it's able to power off the regulator. Don't check the return
> value of regulator_disable to avoid that.
>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   drivers/leds/leds-lm3692x.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index 487228c2bed2..31115655f97b 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -198,7 +198,7 @@ static int lm3692x_brightness_set(struct led_classdev *led_cdev,
>   static int lm3692x_init(struct lm3692x_led *led)
>   {
>   	int enable_state;
> -	int ret;
> +	int ret, ret2;
>   
>   	if (led->regulator) {
>   		ret = regulator_enable(led->regulator);
> @@ -313,14 +313,15 @@ static int lm3692x_init(struct lm3692x_led *led)
>   		gpiod_direction_output(led->enable_gpio, 0);
>   
>   	if (led->regulator) {
> -		ret = regulator_disable(led->regulator);
> -		if (ret)
> +		ret2 = regulator_disable(led->regulator);
> +		if (ret2)
>   			dev_err(&led->client->dev,
>   				"Failed to disable regulator\n");

s/ret2/reg_ret

Like you did in patch 1 log the error code as well.

If regulator_disabled failed you might want to send that error code but 
either error returned is fine.

Dan


>   	}
>   
>   	return ret;
>   }
> +
>   static int lm3692x_probe_dt(struct lm3692x_led *led)
>   {
>   	struct fwnode_handle *child = NULL;
