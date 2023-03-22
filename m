Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC026C528B
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 18:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjCVRfk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 13:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCVRfj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 13:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67593CE28
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679506492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sEppU8jPGeXwLeP3psOHcjcXbGFbF8/6px5b31EyYAE=;
        b=hM1WWwx3a98KCnZZH1Tw7nZYIWGjvDUEdzMvstPSHy09L1w8yW80VAMfFkqfHT8xlc+YoN
        Jl7mRD+qgeZc7jhYljRlLLT72JCu0d/ThnXrKcB5tR9DAhQglhNL4qX6l+P8MIPiy4ZgBy
        K8+LqYi4sNvLO2ZDjnSJBirS035eskc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-LyWzbIdUM9i2ynbhEtYoGA-1; Wed, 22 Mar 2023 13:34:50 -0400
X-MC-Unique: LyWzbIdUM9i2ynbhEtYoGA-1
Received: by mail-ed1-f70.google.com with SMTP id c11-20020a509f8b000000b00501e2facf47so7455459edf.16
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 10:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEppU8jPGeXwLeP3psOHcjcXbGFbF8/6px5b31EyYAE=;
        b=EMxNuNCQVWfv8/TM2EdEREKVN26UiqC/emIcVt8nxu1VY1WM0Tker1FODi2NnBtLsJ
         RuLfKg9bC5E7kyNiB+wAWdQFsfGVTAHHzOU67Ts4iYf1yvzmaKL+eJKizZocdEd0MKi0
         I6dzzKdrvX1GYWg17+raEZpkLsOJJJV0isIyx0ayp5T5i93tM4/Zf829QUOLjbUFAsB5
         JXKQshCQQ/xxPYjf2xcfaKc+ZZPwOHmn7MSLrDpvqfqym3yBbBwly4C9cSee4iEROD5S
         GXmKEDkbTOdHZwA7NCKQnZ51sSHDlNHbNmJPIsYYyyV2sCy+3u1pQpY1zjaPSfK7UMf3
         AhAg==
X-Gm-Message-State: AO0yUKUr1VNSjLR4YysuvCjCjbBYnZ3K55nfXK5aF3ws8jBXpvUeqpgm
        k8kXPdlnL+Zvxea5oO9hssSqo5BgYc6tKsQwiJtMvLVY+w+G1S+tL8hYDEAEMmenfHBe7cuSkd1
        6S5eujuQx7tGlGe4+Vn/T8Q==
X-Received: by 2002:aa7:d990:0:b0:501:caae:e0de with SMTP id u16-20020aa7d990000000b00501caaee0demr8185468eds.4.1679506489673;
        Wed, 22 Mar 2023 10:34:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set9PgS3kaidYhV9lemzJXhmJzARDYcOeWat02j02f8hyubTMFbtmqu3D884euBElh899ajJvBA==
X-Received: by 2002:aa7:d990:0:b0:501:caae:e0de with SMTP id u16-20020aa7d990000000b00501caaee0demr8185456eds.4.1679506489386;
        Wed, 22 Mar 2023 10:34:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gz4-20020a170907a04400b0090e0a4e1bacsm7453497ejc.159.2023.03.22.10.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:34:48 -0700 (PDT)
Message-ID: <ed161532-1f4b-74b2-1391-95d06e4c8200@redhat.com>
Date:   Wed, 22 Mar 2023 18:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/8] platform/x86: int3472: Define LED lookup data for MS
 Surface Go
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-9-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-9-dan.scally@ideasonboard.com>
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
> Add LED lookup data to tps68470_board_data.c for the Microsoft
> Surface Go line of devices.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 0d46a238b630..e2c53319e112 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -157,10 +157,27 @@ static const struct tps68470_led_platform_data surface_go_tps68470_led_pdata = {
>  	.wledctl_disled2 = false,
>  };
>  
> +static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
> +	.n_lookups = 2,
> +	.lookup_table = {
> +		{
> +			.provider = "tps68470-iled_a::indicator",
> +			.dev_id = "i2c-INT347A:00",
> +			.con_id = "privacy-led",
> +		},
> +		{
> +			.provider = "tps68470-wled::indicator",
> +			.dev_id = "i2c-INT347E:00",
> +			.con_id = "privacy-led",
> +		},

So this feels wrong to me in 2 ways:

1. It is abusing .con_id = "privacy-led" to enable the WLED

2. You are not activating the front privacy LED for the IR projector. I have noticed on IPU6 devices that the _DSM listing GPIOs for the discrete INT3472 device lists a privacy-LED GPIO for the IR sensor too, which I so far have been guessing activates the actual privacy-LED. As I'm typing this I'm wondering if instead this is doing the same hack as you are doing here ?  

Regardless I think it would be best to turn on the front privacy LED when the IR camera is used too, right ?

IMHO this should look like this (with either the media-core or the driver consuming "ir-led"):

static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
	.n_lookups = 3,
	.lookup_table = {
		{
			.provider = "tps68470-iled_a::indicator",
			.dev_id = "i2c-INT347A:00",
			.con_id = "privacy-led",
		},
		{
			/* Use regular front-sensor privacy LED for ir-sensor too */
			.provider = "INT33BE_00::privacy_led",
			.dev_id = "i2c-INT347E:00",
			.con_id = "privacy-led",
		},
		{
			.provider = "tps68470-wled::indicator",
			.dev_id = "i2c-INT347E:00",
			.con_id = "ir-led",
		},
	}

Regards,

Hans


