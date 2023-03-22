Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2204C6C526E
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 18:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCVR0i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 13:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCVR0h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 13:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8575149B4
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2BCzf9yNfqPS/o+6dJP9wT9ur6OFw/P5ZqtE3Tm0xY8=;
        b=TIcEDwJdBEPuphC4e6pZU+bobv1vYGUK6/Jci9SdeOxDSERwonS9f41l33RN/WwrNdV+dg
        TV0ew0xmWRleEoDfjVH+qytnHmj1D1t2urln5Ydk1nnC8lB6P9EWwVLAtswuh9Ztoznue/
        DbKzmgoz99KNH0ux34hZHBUNqdzDAgU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-NEfktcpbPu-NZgRVb7KW1w-1; Wed, 22 Mar 2023 13:25:48 -0400
X-MC-Unique: NEfktcpbPu-NZgRVb7KW1w-1
Received: by mail-ed1-f72.google.com with SMTP id t26-20020a50d71a000000b005003c5087caso26566469edi.1
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2BCzf9yNfqPS/o+6dJP9wT9ur6OFw/P5ZqtE3Tm0xY8=;
        b=r2j83hCD0weHg/A6udsjDId3IxIZdmrOg41K9iWU5uOhG8rSfvsU6LKSjUqZwr6L6g
         s+0jeJvR/BdSqwWadk9kETQKuv456AT1LBdA9oDlP9DtS7kaJTh/8kJ16tp7qYyMn0Rm
         DpTosEw5bsIKc5GxXNDGlqokAYXjhcEVUbFBrRKIsVtuF6tiMkiCjXhPnxcvSAlLzok0
         9+xtxqmTYTS1LtWo6BZOD9gd+GvHHSGfxOQqcv3B4od8EYKJ3fFKzUI3sCybCniMVadF
         qIJ95ZjvpU0R8MSOD8hUSxRnux7EPhtR9o1kFMdgKFV9iv9q33Vw3tzlqeyR4DiuEnFO
         sxNg==
X-Gm-Message-State: AO0yUKUtjQtjLwmZKZXXPPZDQZNkyBFfHG5uvSTQp6UaSbqTtdLe3Ni1
        bCiz3V/h7iLgmTY2DZLHrtOpdcgIxBciqvwl0G5Gca1zxW9JMjL50HbXiq9ObzNRHMTpRR2nucR
        ifLEV1gXDt7H4ATv8Hax/pQ==
X-Received: by 2002:aa7:de99:0:b0:501:d6c2:7440 with SMTP id j25-20020aa7de99000000b00501d6c27440mr7523065edv.6.1679505947056;
        Wed, 22 Mar 2023 10:25:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set96lO/N4LsdI6KHDwwBVZl/xD+ohv8xtOec+wU93QSM6fKUYN4yZLx7lHLg0O6BUqRef37Xwg==
X-Received: by 2002:aa7:de99:0:b0:501:d6c2:7440 with SMTP id j25-20020aa7de99000000b00501d6c27440mr7523050edv.6.1679505946819;
        Wed, 22 Mar 2023 10:25:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709062bcc00b0093034e71b94sm7432397ejg.65.2023.03.22.10.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:25:46 -0700 (PDT)
Message-ID: <cdd5a764-5c6d-8385-fbcc-c0459ae4cfb0@redhat.com>
Date:   Wed, 22 Mar 2023 18:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/8] platform/x86: int3472: Support LED lookups in board
 data
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-8-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-8-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/22/23 17:09, Daniel Scally wrote:
> On platforms with the TPS68470 PMIC, we need to be able to define
> which of the LEDs powered by the PMIC should be used by each of
> the sensors that consume its resources. Add the ability to define
> tables of LED lookup data to the board data file.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 8 ++++++++
>  drivers/platform/x86/intel/int3472/tps68470.h | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 818f2fc5bf2a..07ac7b5b9082 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -206,6 +206,10 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
>  
> +		if (board_data->led_lookups)
> +			for (i = 0; i < board_data->led_lookups->n_lookups; i++)
> +				led_add_lookup(&board_data->led_lookups->lookup_table[i]);
> +
>  		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
>  					   cells, TPS68470_WIN_MFD_CELL_COUNT,
>  					   NULL, 0, NULL);
> @@ -214,6 +218,10 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		if (ret) {
>  			for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> +
> +			if (board_data->led_lookups)
> +				for (i = 0; i < board_data->led_lookups->n_lookups; i++)
> +					led_remove_lookup(&board_data->led_lookups->lookup_table[i]);
>  		}
>  
>  		break;
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index ce50687db6fb..c03884654898 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -11,14 +11,22 @@
>  #ifndef _INTEL_SKL_INT3472_TPS68470_H
>  #define _INTEL_SKL_INT3472_TPS68470_H
>  
> +#include <linux/leds.h>
> +
>  struct gpiod_lookup_table;
>  struct tps68470_regulator_platform_data;
>  struct tps68470_led_platform_data;
>  
> +struct tps68470_led_lookups {
> +	unsigned int n_lookups;
> +	struct led_lookup_data lookup_table[];
> +};
> +
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
>  	const struct tps68470_led_platform_data *tps68470_led_pdata;
> +	struct tps68470_led_lookups *led_lookups;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };

