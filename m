Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4B052B266
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 08:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbiERG0e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 02:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbiERG0d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 02:26:33 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3065E33E23
        for <linux-leds@vger.kernel.org>; Tue, 17 May 2022 23:26:32 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <83905ef3-104f-a8ac-d45c-ee3749c56331@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1652855188;
        bh=tCuDo9lD5zjftKV+x43EslWYju5Rih7ATwkcgZ2qhJ4=;
        h=Subject:To:References:From:In-Reply-To;
        b=CRtecPcoDX0LeOnbDRv5N0Lzlh5IYCnn+ngKJR3BZAzbm6JijGlb9gyccJ2eUVmdq
         enJ9XXOIrVh3i/YRKqMcE7x0m+Np7REkCXQ6zSpfO0Z0A5p6NQA2MXzcjlg9g6fZ8w
         45MdsYuyecXPt0RBv4A9bkHREHd+kVaiFbF1rWkC6e96M6l52cIuWxFxBKzag7bXgV
         YBJCrh7HG++sLRM7vwf7WhdqOEOdYbi9dlmCE8UYTDz6LALfkBmZUM7b6EZVGAxe+w
         UxPRCNAqU9Vluw9OYzOtCSx4LKi4naCxK/gK7iun+YW/VlXVdTHTOnXr+i8pFdIwOS
         CSrlqz1C8Yjyg==
Date:   Wed, 18 May 2022 08:26:26 +0200
Mime-Version: 1.0
Subject: Re: AW: Setting multi-color intensities stops software blink
Content-Language: en-US
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sven Schuchmann <schuchmann@schleissheimer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <4e88850e-9e45-2b47-c857-7070ec87440f@svenschwermer.de>
 <GVXP190MB19172D8DD26648FC9F2EB4D6D9CE9@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
 <4f672091-07da-8815-a00f-659f5a478b0e@gmail.com>
From:   Sven Schwermer <sven@svenschwermer.de>
In-Reply-To: <4f672091-07da-8815-a00f-659f5a478b0e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On 5/17/22 23:43, Jacek Anaszewski wrote:
> To fix the issue it could suffice to let led_set_brightness()
> be called in multi_intensity_store() only if SW blinking is disabled.
> When enabled the new color will be applied upon the next blink anyway,
> and the behavior will match that of monochrome LEDs.
> 

That sounds like a good and very simple fix. I'll try it out and if it 
works, I'll post a patch to this list shortly. Thank you!

Best regards,
Sven
