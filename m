Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9D626320
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 13:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfEVLmb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 07:42:31 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39476 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfEVLma (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 07:42:30 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4MBgN6c001466;
        Wed, 22 May 2019 06:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558525343;
        bh=NTmfaLoNBH7n2rGU4kwdBrnd2VyxykrQMpqDjEGnUe0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Vw5nbhd9JHw9F6HA71TDoAh3QzTD8rr2yrWrk5Rivt1AdoqJ/yd1FTbqT4PUil9bT
         sY1zdiJbQ15eIY3nutEN25gOgrCsjDc4oEoWcrG5dWuCFnWr4hiid1jN89bVWnb+K0
         TOMJOTpHdafawUxCiaLtn6zWGt0SNExnNxefJzXU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4MBgNpZ033773
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 May 2019 06:42:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 22
 May 2019 06:42:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 22 May 2019 06:42:23 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4MBgNdJ016927;
        Wed, 22 May 2019 06:42:23 -0500
Subject: Re: [PATCH][V2] leds: TI LMU: fix u8 variable comparisons with less
 than zero
To:     Colin King <colin.king@canonical.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
CC:     <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190522101745.21828-1-colin.king@canonical.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <aa5698f5-9604-ec9c-3f6f-7fc7a6cdbca7@ti.com>
Date:   Wed, 22 May 2019 06:42:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522101745.21828-1-colin.king@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 5/22/19 5:17 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The u8 variables ramp_ups and ramp_downs are being compared to less
> than zero, this will always be false.  Fix this by making the ramp
> variables ints.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 9a8e66ebeaa2 ("leds: TI LMU: Add common code for TI LMU devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: make u8 vars ints rather than removing the comparison. Thanks once
> more to Dan Carpenter for spotting my clearly stupid V1 version and
> correcting my mistake.
> 
> ---
>  drivers/leds/leds-ti-lmu-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
> index adc7293004f1..c9ab40d5a6ba 100644
> --- a/drivers/leds/leds-ti-lmu-common.c
> +++ b/drivers/leds/leds-ti-lmu-common.c
> @@ -84,7 +84,7 @@ static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
>  int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
>  {
>  	struct regmap *regmap = lmu_bank->regmap;
> -	u8 ramp, ramp_up, ramp_down;
> +	int ramp, ramp_up, ramp_down;
>  
>  	if (lmu_bank->ramp_up_usec == 0 && lmu_bank->ramp_down_usec == 0) {
>  		ramp_up = 0;
> 

Reviewed-by: Dan Murphy <dmurphy@ti.com>
