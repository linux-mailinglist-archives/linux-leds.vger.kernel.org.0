Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DA26BCEE
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 15:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfGQNX0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 09:23:26 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33626 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbfGQNX0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 09:23:26 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HDNJfc053821;
        Wed, 17 Jul 2019 08:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563369799;
        bh=7w70GvKKtgyFoxwG+WzJCvNRew7k10rVv3rd6Z95nLk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rCTktTTyWodhfYtJr/j12+hmDxYg2bovIequtwO63+ayqS47UzhSEHpEh0nT4tZGr
         e4GwNvJ8SSrBRQynqnsUV64I7LyMi2kdZJOnwoUmpey134e7Pt+eX+nQauZemFlBQ0
         /qkj9b2I8S19A8pT9ASekkSQ3C0umAA7BQH8n/3g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HDNJDH060743
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Jul 2019 08:23:19 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 08:23:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 08:23:19 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HDNHfr093396;
        Wed, 17 Jul 2019 08:23:18 -0500
Subject: Re: [PATCH v2 2/2] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-3-jjhiblot@ti.com>
 <4ae4d83b-8dee-72e4-3860-dd420a29115e@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <08873dfd-d7b2-9fd2-1aca-c63a7e983e2d@ti.com>
Date:   Wed, 17 Jul 2019 15:23:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4ae4d83b-8dee-72e4-3860-dd420a29115e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On 15/07/2019 22:42, Jacek Anaszewski wrote:
> @@ -80,6 +107,7 @@ static void led_timer_function(struct timer_list *t)
>   	}
>   
>   	led_set_brightness_nosleep(led_cdev, brightness);
> +	__led_handle_regulator(led_cdev, brightness);
> This cannot be called from atomic context since regulator_enable/disable
> use mutex beneath, that can sleep on contention. Therefore this call
> has to be made in two places instead:
>
> __led_set_brightness()
> __led_set_brightness_blocking()

Thanks. I'll fix this in v3.

JJ
