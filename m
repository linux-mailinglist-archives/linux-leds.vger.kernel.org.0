Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BF56C681D
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 13:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjCWMXe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 08:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjCWMXe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 08:23:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283E4222D0;
        Thu, 23 Mar 2023 05:23:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B7D1A6267B;
        Thu, 23 Mar 2023 12:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770C5C433D2;
        Thu, 23 Mar 2023 12:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679574212;
        bh=hatv8Y9Doyccu8RjvWrYrrTBemUUAQIktajKkNvSZbw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eCpZX+SqUQd8eP0p0T4rqb1V1iT2V82naCNAZ2bjq8S1bLytOXn3jYpWRFk+EysY+
         q6AcTwAEtMM+kGLNA81suhT4JsO85bE+NwvH/rRSYfGNccEkPy7j26cXYtn3GtNu6/
         n20Nb8kw8Clnn2POwqKA/HDjft78GcjzgZ4V3ZfT/2DxrbfIA+NTZ/LZWQCQOeF52E
         /oZkWMFIiCQ1FBMM6tUxvSwR4mPPMrxQLKbSMOOrCxHi6Ram8dd5pZQKOXuKUSlajw
         kwkDtOityHGZ412e4+ptuJFHcIMVqyp7hQ5vEWSX+7ZGOH6REZkyaIHTzhZQyFITdn
         NYmk9lpd38DzQ==
Date:   Thu, 23 Mar 2023 12:23:27 +0000
From:   Lee Jones <lee@kernel.org>
To:     Kate Hsuan <hpa@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 1/3] platform: x86: int3472: Add MFD cell for tps68470
 LED
Message-ID: <20230323122327.GJ2673958@google.com>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-2-hpa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321153718.1355511-2-hpa@redhat.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 21 Mar 2023, Kate Hsuan wrote:

> Add MFD cell for tps68470-led.
>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index 5b8d1a9620a5..82ef022f8916 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -17,7 +17,7 @@
>  #define DESIGNED_FOR_CHROMEOS		1
>  #define DESIGNED_FOR_WINDOWS		2
>
> -#define TPS68470_WIN_MFD_CELL_COUNT	3
> +#define TPS68470_WIN_MFD_CELL_COUNT	4
>
>  static const struct mfd_cell tps68470_cros[] = {
>  	{ .name = "tps68470-gpio" },
> @@ -193,7 +193,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].name = "tps68470-regulator";
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> -		cells[2].name = "tps68470-gpio";
> +		cells[2].name = "tps68470-led";
> +		cells[3].name = "tps68470-gpio";

The question is, why is the MFD API being used out side of drivers/mfd?

>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> --
> 2.39.2
>

--
Lee Jones [李琼斯]
