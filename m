Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDA13A018
	for <lists+linux-leds@lfdr.de>; Sat,  8 Jun 2019 15:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbfFHN5F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 8 Jun 2019 09:57:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46460 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFHN5E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 8 Jun 2019 09:57:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x58Dv1LC103911;
        Sat, 8 Jun 2019 08:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560002221;
        bh=kvbm5W0o+PaDuyP3NcYM25ZffKpjV32oldQSEdTLpNc=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=o6nd9F/GafrZ0DotFSw32RFaiLQRkUzYCFcVcZ75DNdmXpkfDaqPgURkxM2aMm9iS
         uvAddiwnTq9rHZwnL+zwZ3Dc1QPbMoBDcew91/dDBECa5LfAOR7mvuhhqThAaahMPW
         awL2bUki+gtm9Ouz9KKDg7HsZ9PYmDhIgzrhqfPg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x58Dv14Y017713
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 8 Jun 2019 08:57:01 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 8 Jun
 2019 08:57:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 8 Jun 2019 08:57:01 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x58Dv0Iq040739;
        Sat, 8 Jun 2019 08:57:00 -0500
Subject: Re: [PATCH 1/2] Use usleep_range() for better precision timings
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <linux-leds@vger.kernel.org>
References: <20190608121312.11056-1-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <dee01f3f-3963-7755-a6fa-a4ab38bafeed@ti.com>
Date:   Sat, 8 Jun 2019 08:57:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608121312.11056-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/8/19 7:13 AM, Oleh Kravchenko wrote:

Commit log

Dan
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   drivers/leds/leds-cr0014114.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
> index 0e4262462cb9..91deb40db307 100644
> --- a/drivers/leds/leds-cr0014114.c
> +++ b/drivers/leds/leds-cr0014114.c
> @@ -37,7 +37,7 @@
>   
>   /* CR0014114 default settings */
>   #define CR_MAX_BRIGHTNESS	GENMASK(6, 0)
> -#define CR_FW_DELAY_MSEC	10
> +#define CR_FW_DELAY_USEC	10000
>   #define CR_RECOUNT_DELAY	(HZ * 3600)
>   
>   struct cr0014114_led {
> @@ -92,7 +92,7 @@ static int cr0014114_recount(struct cr0014114 *priv)
>   
>   	cmd = CR_NEXT_REENUMERATE;
>   	for (i = 0; i < priv->count; i++) {
> -		msleep(CR_FW_DELAY_MSEC);
> +		usleep_range(CR_FW_DELAY_USEC, CR_FW_DELAY_USEC + 1);
>   
>   		ret = spi_write(priv->spi, &cmd, sizeof(cmd));
>   		if (ret)
> @@ -126,7 +126,7 @@ static int cr0014114_sync(struct cr0014114 *priv)
>   			goto err;
>   
>   		priv->do_recount = false;
> -		msleep(CR_FW_DELAY_MSEC);
> +		usleep_range(CR_FW_DELAY_USEC, CR_FW_DELAY_USEC + 1);
>   	}
>   
>   	priv->buf[0] = CR_SET_BRIGHTNESS;
> @@ -136,7 +136,7 @@ static int cr0014114_sync(struct cr0014114 *priv)
>   	ret = spi_write(priv->spi, priv->buf, priv->count + 2);
>   
>   err:
> -	priv->delay = jiffies + msecs_to_jiffies(CR_FW_DELAY_MSEC);
> +	priv->delay = jiffies + usecs_to_jiffies(CR_FW_DELAY_USEC);
>   
>   	return ret;
>   }
> @@ -252,7 +252,7 @@ static int cr0014114_probe(struct spi_device *spi)
>   	priv->dev	= &spi->dev;
>   	priv->spi	= spi;
>   	priv->delay	= jiffies -
> -			  msecs_to_jiffies(CR_FW_DELAY_MSEC);
> +			  usecs_to_jiffies(CR_FW_DELAY_USEC);
>   
>   	priv->do_recount = true;
>   	ret = cr0014114_sync(priv);
