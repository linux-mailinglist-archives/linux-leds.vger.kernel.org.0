Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC2816C6BAC
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 15:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbjCWO5q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 10:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjCWO5p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 10:57:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DB11ACF8;
        Thu, 23 Mar 2023 07:57:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1E8F362778;
        Thu, 23 Mar 2023 14:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C9DC433D2;
        Thu, 23 Mar 2023 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679583463;
        bh=4SKK1B8jja9o0uUKsq5/ptb8ZMrXwzoUx0IkPkwl20A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QaGPIa/Q0SSYcyxHzncR8RmHnUrE/jbSffqkWKpXZfysFwkdpeScjfoYAZOoX4LqY
         Mtqjz9Ah0PpE1yw+fLPNsKTewRYSeRR0bRVRaXo7QKMXa0Aj8kLUEwLy+T6HqbbhF4
         slFQFLGvcQ+xLqE7kYDyqPKtgor6Kkgd03qZLLNSUA14w0ihUQPtTfVUrQmbZs8P0D
         MblUZaWRN2LrOQ1Y73no40U5ToacSy2pi2Na6n2NSfpuYVShDUzKuDK83cwj7JRRWE
         ASsm6S1FuHF0CP3up1N4mlL8HK7pT6X6vxzd0PbTETfoHriKk7UvpRHPWUWPcSvfbg
         XC2upE11qwCRA==
Date:   Thu, 23 Mar 2023 14:57:38 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 1/3] platform: x86: int3472: Add MFD cell for tps68470
 LED
Message-ID: <20230323145738.GN2673958@google.com>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-2-hpa@redhat.com>
 <20230323122327.GJ2673958@google.com>
 <d2c6af4b-218c-96a7-a2d8-87f90e856c7c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2c6af4b-218c-96a7-a2d8-87f90e856c7c@redhat.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Mar 2023, Hans de Goede wrote:

> Hi,
>
> On 3/23/23 13:23, Lee Jones wrote:
> > On Tue, 21 Mar 2023, Kate Hsuan wrote:
> >
> >> Add MFD cell for tps68470-led.
> >>
> >> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> >> ---
> >>  drivers/platform/x86/intel/int3472/tps68470.c | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> >> index 5b8d1a9620a5..82ef022f8916 100644
> >> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> >> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> >> @@ -17,7 +17,7 @@
> >>  #define DESIGNED_FOR_CHROMEOS		1
> >>  #define DESIGNED_FOR_WINDOWS		2
> >>
> >> -#define TPS68470_WIN_MFD_CELL_COUNT	3
> >> +#define TPS68470_WIN_MFD_CELL_COUNT	4
> >>
> >>  static const struct mfd_cell tps68470_cros[] = {
> >>  	{ .name = "tps68470-gpio" },
> >> @@ -193,7 +193,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
> >>  		cells[1].name = "tps68470-regulator";
> >>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> >>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> >> -		cells[2].name = "tps68470-gpio";
> >> +		cells[2].name = "tps68470-led";
> >> +		cells[3].name = "tps68470-gpio";
> >
> > The question is, why is the MFD API being used out side of drivers/mfd?
>
> Because Intel made a big mess about how they describe camera sensors + the matching clks / regulators / GPIOs and the optional PMIC in ACPI.
>
> The drivers/platform/x86/intel/int3472/ code untangles this mess and in some cases it instantiates MFD cells (with a whole bunch of derived platform_data per cell) for a TPS68470 PMIC.
>
> And sometimes while binding to an INT3472 ACPI device-node it does not instantiate any MFD cells at all since the INT3472 ACPI device-node does not always describe such a PMIC.
>
> Oh and also depending on of the ACPI tables are targetting ChromeOS or Windows a different set of MFD cells needs to be instantiated. On ChromeOS most of the PMIC poking is done through ACPI through a ChomeOS specific custom ACPI OpRegion, so there there are only cells for GPIO and a driver providing the OpRegion are created.
>
> So lots of ugly x86 platform specific handling, ACPI parsing, etc. which is why this landed under drivers/platform/x86/ . IIRC you were even involved in the original merge since there once was a much simpler MFD driver under driver/mfd which only supported the ChromeOS setup.
>
> (but my memory may be deceiving me here).

Right, I guess we've both slept since then!

My normal request is that MFD handling should be in drivers/mfd.
Anything else can be farmed out to the various functional subsystems and
drivers/platform.

--
Lee Jones [李琼斯]
