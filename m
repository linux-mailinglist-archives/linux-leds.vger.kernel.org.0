Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0259E6C5244
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 18:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjCVRUS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 13:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjCVRUB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 13:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B421C5B8
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SMw6l8Y9d7rVMNxAIN1dm8nnft0HynDsRdE/l7NPZnA=;
        b=NGb0wVbxObCCdDojt/XjaL3Fc4WrwmzSQJoKLtPYwDKhbmtSGpihA8idiVchHr0bRM+iVw
        CcMb8l6CU/22vFwRc0kc+GeWxorGhdexIzpFz5kJdIJuPSy9kpjQ9JbmyBU2VNyxl7cIVH
        0RhPGf45a6SYIwVXzOj6LS+pV+uYksU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-F0YFbNSZNXyYRLLYzMrwFw-1; Wed, 22 Mar 2023 13:17:49 -0400
X-MC-Unique: F0YFbNSZNXyYRLLYzMrwFw-1
Received: by mail-ed1-f72.google.com with SMTP id e18-20020a056402191200b004fa702d64b3so28716653edz.23
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMw6l8Y9d7rVMNxAIN1dm8nnft0HynDsRdE/l7NPZnA=;
        b=taIMCosp7pukIbToPLvEqSAnXyDRB8VrGP52H4L6J0YW1xdx2Wnmh2ekEUM3ZN3WGh
         wuWX8XHZmay0I3z9ztf3bcFW4BkCLd8oSvvDFg4pnRPfLEhtbHcbJ65cDy8hyKblJntZ
         e/FMIdktwQMJo4Umn38QqbkMH2iHWkP65QLtcw/dKsuZIJ+kmYeoof9NUIud39WMQsd1
         48gYIoeOBJJ9A/Bvra59kEsIYELwodp/Gh+uHg7BvN4FivyFonCobHbHyfLjtS3qy2AQ
         kFEFYb2M73hSOR3VGrr5xauNSIY+hEpLM4UZCOp1fuhiDM9Wl/pkC1lcMCgF0tNqjDXr
         FhKQ==
X-Gm-Message-State: AO0yUKXn4KEsZlwlP0w0G8VezSAoMl8AABF8HG/qF5vXUhTnxj184g1R
        sD4ydRj6p3J7kxcpEc6gozmtxB8oDMouILkw4GdMak4QN7ob6XwxM36UbjWAt2Qj2seUEABhL3m
        rUue7ZWxRPZyfeaB5HGyxpQ==
X-Received: by 2002:a17:907:b0f:b0:930:e634:3d52 with SMTP id h15-20020a1709070b0f00b00930e6343d52mr7409593ejl.24.1679505468063;
        Wed, 22 Mar 2023 10:17:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set9UJ6fHpinSGLpYrikCXWXvZDMjiRa9RPd1G6Qo46KRj7UYH+C2D6wg7oTRZoSmf9+lH5lfwQ==
X-Received: by 2002:a17:907:b0f:b0:930:e634:3d52 with SMTP id h15-20020a1709070b0f00b00930e6343d52mr7409568ejl.24.1679505467765;
        Wed, 22 Mar 2023 10:17:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o7-20020a1709062e8700b00933356c681esm5967710eji.150.2023.03.22.10.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:17:47 -0700 (PDT)
Message-ID: <ac33109b-4dd2-02ed-8315-6d80c9e93dc1@redhat.com>
Date:   Wed, 22 Mar 2023 18:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/8] platform/x86: int3472: Add TPS68470 LED Board Data
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-4-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-4-dan.scally@ideasonboard.com>
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
> Add the board data for the Surface Go platforms to configure the LEDs
> provided by the TPS68470 PMIC.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

As mentioned in the review of 1/8 please squash the 
drivers/platorm/x86/intel/int3472/ of 1/8 into this, with
that fixed this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  ...ctps68470_board_data.c         | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 322237e056f3..0d46a238b630 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -146,9 +146,21 @@ static struct gpiod_lookup_table surface_go_int347e_gpios = {
>  	}
>  };
>  
> +static const struct tps68470_led_platform_data surface_go_tps68470_led_pdata = {
> +	.iledctl_ctrlb = 0x30,
> +	.wledmaxf = 0x1f,
> +	.wledto = 0x07,
> +	.wledc1 = 0x1f,
> +	.wledc2 = 0x1f,
> +	.wledctl_mode = 0x00,
> +	.wledctl_disled1 = true,
> +	.wledctl_disled2 = false,
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> +	.tps68470_led_pdata = &surface_go_tps68470_led_pdata,
>  	.n_gpiod_lookups = 2,
>  	.tps68470_gpio_lookup_tables = {
>  		&surface_go_int347a_gpios,
> @@ -159,6 +171,7 @@ static const struct int3472_tps68470_board_data surface_go_tps68470_board_data =
>  static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:01",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> +	.tps68470_led_pdata = &surface_go_tps68470_led_pdata,
>  	.n_gpiod_lookups = 2,
>  	.tps68470_gpio_lookup_tables = {
>  		&surface_go_int347a_gpios,

