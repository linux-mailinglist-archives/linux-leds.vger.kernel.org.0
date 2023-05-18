Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7277D707D03
	for <lists+linux-leds@lfdr.de>; Thu, 18 May 2023 11:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjERJfy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 May 2023 05:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbjERJfx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 May 2023 05:35:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5941FDD
        for <linux-leds@vger.kernel.org>; Thu, 18 May 2023 02:35:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8247764DA9
        for <linux-leds@vger.kernel.org>; Thu, 18 May 2023 09:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA65C433D2;
        Thu, 18 May 2023 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684402551;
        bh=lPfqrHxmeLvaaM1zW9f4JWU5qX98j6/4muE+rSDhcps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R0otYgrWro2H7CspeaiMrbf+WDd9QIvnFG8j3QcAKLB6YcJDq8pAmHbhY+XXGx73I
         Y0T7MfNQu64BEbP06MPMYC2ZSTRXs02sXm5tVffsByKv3fV8fGKjqUSXCa0qIN2MsE
         E3hUCC/LZsmCFf9V1dpfafnJSxR+8LDPmtY9WLMISQzRo4+LFZSjDY1aNomo2iXlDy
         GzNsgDwvdsVwhUEIONqQ3AtPHwvtTrzbhoo6Ysy0z1VS3D5A6higJTQiJ8UcTjWktK
         TiKH2vBir53B7fhLrYUuFh2wGxCzySu6o9tHHvUW9tgHfZxKlZeS7y9oXPZn5zRhxV
         ACCMbiSJcA6TA==
Date:   Thu, 18 May 2023 10:35:47 +0100
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] leds: Switch i2c drivers back to use .probe()
Message-ID: <20230518093547.GB404509@google.com>
References: <20230517180559.166329-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517180559.166329-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 17 May 2023, Uwe Kleine-König wrote:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this patch was generated using coccinelle, but I aligned the result to
> the per-file indention. Other than that it's just s/probe_new/probe/.
> 
> I used v6.4-rc1 as base for this patch, but it also fits on top of
> today's next master. If there are some conflicts when you apply it, feel
> free to just drop all conflicting hunks, I'll care about the fallout
> later.
> 
> I chose to do this in a single patch for all drivers below
> drivers/leds. If you want me to split it, just tell me.
> 
> Also note I didn't Cc: all the individual maintainers to not exceed the
> allowed length of To: and Cc:. If this patch will be split I can extend
> the audience accordingly.
> 
> Best regards
> Uwe
> 
>  drivers/leds/flash/leds-as3645a.c | 2 +-
>  drivers/leds/flash/leds-lm3601x.c | 2 +-
>  drivers/leds/flash/leds-rt4505.c  | 2 +-
>  drivers/leds/leds-an30259a.c      | 2 +-
>  drivers/leds/leds-aw2013.c        | 2 +-
>  drivers/leds/leds-bd2606mvv.c     | 2 +-
>  drivers/leds/leds-bd2802.c        | 2 +-
>  drivers/leds/leds-blinkm.c        | 2 +-
>  drivers/leds/leds-is31fl319x.c    | 2 +-
>  drivers/leds/leds-is31fl32xx.c    | 2 +-
>  drivers/leds/leds-lm3530.c        | 2 +-
>  drivers/leds/leds-lm3532.c        | 2 +-
>  drivers/leds/leds-lm355x.c        | 2 +-
>  drivers/leds/leds-lm3642.c        | 2 +-
>  drivers/leds/leds-lm3692x.c       | 2 +-
>  drivers/leds/leds-lm3697.c        | 2 +-
>  drivers/leds/leds-lp3944.c        | 2 +-
>  drivers/leds/leds-lp3952.c        | 2 +-
>  drivers/leds/leds-lp50xx.c        | 2 +-
>  drivers/leds/leds-lp5521.c        | 2 +-
>  drivers/leds/leds-lp5523.c        | 2 +-
>  drivers/leds/leds-lp5562.c        | 2 +-
>  drivers/leds/leds-lp8501.c        | 2 +-
>  drivers/leds/leds-lp8860.c        | 2 +-
>  drivers/leds/leds-pca9532.c       | 2 +-
>  drivers/leds/leds-pca955x.c       | 2 +-
>  drivers/leds/leds-pca963x.c       | 2 +-
>  drivers/leds/leds-tca6507.c       | 2 +-
>  drivers/leds/leds-tlc591xx.c      | 2 +-
>  drivers/leds/leds-turris-omnia.c  | 2 +-
>  30 files changed, 30 insertions(+), 30 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
