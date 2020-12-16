Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F2C2DBAEF
	for <lists+linux-leds@lfdr.de>; Wed, 16 Dec 2020 07:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgLPGBh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Dec 2020 01:01:37 -0500
Received: from mail.thorsis.com ([92.198.35.195]:33564 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgLPGBh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Dec 2020 01:01:37 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 6597110A6;
        Wed, 16 Dec 2020 07:00:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AJkWkZtv3C8R; Wed, 16 Dec 2020 07:00:56 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 7A3EC13C; Wed, 16 Dec 2020 07:00:54 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
Date:   Wed, 16 Dec 2020 07:00:48 +0100 (CET)
From:   Alexander Dahl <ada@thorsis.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>, pavel@ucw.cz,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <998881507.2525.1608098449122@seven.thorsis.com>
In-Reply-To: <20201214134545.4884-1-zhengyongjun3@huawei.com>
References: <20201214134545.4884-1-zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] leds: leds-ariel: convert comma to semicolon
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

> Zheng Yongjun <zhengyongjun3@huawei.com> hat am 14.12.2020 14:45 geschrieben:
> 
>  
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/leds/leds-ariel.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
> index bb68ba23a7d4..49e1bddaa15e 100644
> --- a/drivers/leds/leds-ariel.c
> +++ b/drivers/leds/leds-ariel.c
> @@ -96,14 +96,14 @@ static int ariel_led_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	leds[0].ec_index = EC_BLUE_LED;
> -	leds[0].led_cdev.name = "blue:power",
> +	leds[0].led_cdev.name = "blue:power";
>  	leds[0].led_cdev.default_trigger = "default-on";
>  
>  	leds[1].ec_index = EC_AMBER_LED;
> -	leds[1].led_cdev.name = "amber:status",
> +	leds[1].led_cdev.name = "amber:status";
>  
>  	leds[2].ec_index = EC_GREEN_LED;
> -	leds[2].led_cdev.name = "green:status",
> +	leds[2].led_cdev.name = "green:status";
>  	leds[2].led_cdev.default_trigger = "default-on";
>  
>  	for (i = 0; i < NLEDS; i++) {

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex
