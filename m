Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC3557C35F
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 15:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729356AbfGaNXU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 09:23:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51436 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729255AbfGaNXU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 09:23:20 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VDNAlG080355;
        Wed, 31 Jul 2019 08:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564579390;
        bh=0fUgRNTdr1H1z9bwTUX3/k1AsGS3eKBtv0BltL7AUXU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZfCkNYHwDcVMQFgdZ6MOFeaj3KK7HpxBfPeP4ixWJ8+pnkRx8TtUIZvKtYM+Ijs+8
         avV1JIDdTM52t8tytAKP8XzvbFGRA50+0RJQboZnPnCYcKUTHVejPZZ/698H0Arf77
         8aYY/E8fs9IEUBn0lXpcuFkennebLTmbC3cDfBNU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VDNAhi048603
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 08:23:10 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 08:23:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 08:23:10 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VDN720083249;
        Wed, 31 Jul 2019 08:23:08 -0500
Subject: Re: [PATCH v4 2/4] leds: Add managed API to get a LED from a device
 driver
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <20190717141514.21171-3-jjhiblot@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <94bdabf4-0922-5016-ed96-9916ed6bda9d@ti.com>
Date:   Wed, 31 Jul 2019 16:23:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717141514.21171-3-jjhiblot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 17/07/2019 17:15, Jean-Jacques Hiblot wrote:

> +struct led_classdev *__must_check devm_led_get(struct device *dev,
> +					       int index)
> +{
> +	struct led_classdev *led;
> +	struct led_classdev **dr;
> +

Should you check here if dev->of_node == NULL? Or should of_led_get() 
check it.

> +	led = of_led_get(dev->of_node, index);
> +	if (IS_ERR(led))
> +		return led;
> +
> +	dr = devres_alloc(devm_led_release, sizeof(struct led_classdev *),
> +			  GFP_KERNEL);
> +	if (!dr) {
> +		led_put(led);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	*dr = led;
> +	devres_add(dev, dr);
> +
> +	return led;
> +}

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
