Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE7B6B3D6F
	for <lists+linux-leds@lfdr.de>; Fri, 10 Mar 2023 12:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjCJLOZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Mar 2023 06:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjCJLOH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Mar 2023 06:14:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DD6108688;
        Fri, 10 Mar 2023 03:13:57 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5D29EF;
        Fri, 10 Mar 2023 12:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678446836;
        bh=xm27T+boTJTlMQ8dVNLqxcQNGlITz4z0uASKPxUJjwc=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=bWJqisHVCJmR81ajV7NF2XfSoUnzQST5n2PgklPg9Xz+/0GomVY2UK5w8PP5kZqPe
         NnT+NJTGqmRTfWDvGVJphpVpaWPSd0727p8oJlOvIQqUd0UNUGW44sBvVJLK2S3kNy
         y0TEeTN0hlNn/QeXByA/TyrDWrQsoGiVKJgB/zOQ=
Message-ID: <22d798c0-4f80-5b06-b1e7-6366b1a1a19f@ideasonboard.com>
Date:   Fri, 10 Mar 2023 11:13:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] platform: x86: int3472: Add MFD cell for tps68470
 LED
Content-Language: en-US
To:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230310095635.813262-1-hpa@redhat.com>
 <20230310095635.813262-2-hpa@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230310095635.813262-2-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/03/2023 09:56, Kate Hsuan wrote:
> Add MFD cell for tps68470-led.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---

Looks fine to me: Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/platform/x86/intel/int3472/tps68470.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 5b8d1a9620a5..82ef022f8916 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -17,7 +17,7 @@
>   #define DESIGNED_FOR_CHROMEOS		1
>   #define DESIGNED_FOR_WINDOWS		2
>   
> -#define TPS68470_WIN_MFD_CELL_COUNT	3
> +#define TPS68470_WIN_MFD_CELL_COUNT	4
>   
>   static const struct mfd_cell tps68470_cros[] = {
>   	{ .name = "tps68470-gpio" },
> @@ -193,7 +193,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>   		cells[1].name = "tps68470-regulator";
>   		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>   		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> -		cells[2].name = "tps68470-gpio";
> +		cells[2].name = "tps68470-led";
> +		cells[3].name = "tps68470-gpio";
>   
>   		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>   			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);

