Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4080362ADC0
	for <lists+linux-leds@lfdr.de>; Tue, 15 Nov 2022 23:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbiKOWHe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Nov 2022 17:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbiKOWHc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Nov 2022 17:07:32 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7B42FC37
        for <linux-leds@vger.kernel.org>; Tue, 15 Nov 2022 14:07:31 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 12B5A35F;
        Tue, 15 Nov 2022 22:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 12B5A35F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668550051; bh=c9yZ/IhIiE8wXJVKu8n2dBs9bRW3+Ov5BGvBe7ch6Zg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=U6n6JQLMkLqVUOCZ2/X8QhCDQ3cJQ3I63uK0OBaqDYhhaSUWvtPnhI4oNyPG+4VNE
         d9KdQJ0tHgetL5nLYvYx8AxFgrtH2z8++zdLI60sJ6x1ILXpqAAXpwyRLxC6oJ48a1
         dxIzNQ9GQxHRtQLxR0wTasI7Wl8j+Y4XSLVsNCIUGfkWzjj7zaTzcuKZUDolYtzErD
         WERptDeGhWuzIhKJuv+KfL9Srpahv4HptsZb92xIF1zsCfb3sPtGrw3TDSZHGYbPc8
         8TNI3BAiMy3sjcIhMvuuAzRuCE5SgY8am5DcDt5pUE6DVAK62DY5Fsl3C58ScVc5h3
         9vmenOApIqthg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-leds@vger.kernel.org
Cc:     pavel@ucw.cz, yangyingliang@huawei.com
Subject: Re: [PATCH] Documentation: devres: add missing LED helpers
In-Reply-To: <20221103021331.1007699-1-yangyingliang@huawei.com>
References: <20221103021331.1007699-1-yangyingliang@huawei.com>
Date:   Tue, 15 Nov 2022 15:07:30 -0700
Message-ID: <87zgcr98il.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Yang Yingliang <yangyingliang@huawei.com> writes:

> Add some missing device-managed helpers of led to devres.rst.
>
> devm_led_classdev_register_ext() is introduced by commit b2b998c0f944 ("leds:
> class: Improve LED and LED flash class registration API").
>
> devm_led_trigger_register() is introduced by commit 9534cc31dda2 ("leds: core:
> add managed version of led_trigger_register").
>
> devm_of_led_get() is introduced by commit e389240ad992 ("leds: Add managed
> API to get a LED from a device driver").
>
> Fixes: b2b998c0f944 ("leds: class: Improve LED and LED flash class registration API")
> Fixes: 9534cc31dda2 ("leds: core: add managed version of led_trigger_register")
> Fixes: e389240ad992 ("leds: Add managed API to get a LED from a device driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  Documentation/driver-api/driver-model/devres.rst | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
> index 08e5ba810eb0..e0cb7df0f782 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -339,7 +339,10 @@ IRQ
>  
>  LED
>    devm_led_classdev_register()
> +  devm_led_classdev_register_ext()
>    devm_led_classdev_unregister()
> +  devm_led_trigger_register()
> +  devm_of_led_get()

Applied, thanks.

jon
