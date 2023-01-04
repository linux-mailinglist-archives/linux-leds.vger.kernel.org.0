Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B72165DBFB
	for <lists+linux-leds@lfdr.de>; Wed,  4 Jan 2023 19:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239591AbjADSP4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Jan 2023 13:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239589AbjADSPy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Jan 2023 13:15:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F0C9FE4
        for <linux-leds@vger.kernel.org>; Wed,  4 Jan 2023 10:15:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5295D617D8
        for <linux-leds@vger.kernel.org>; Wed,  4 Jan 2023 18:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81185C433F0;
        Wed,  4 Jan 2023 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672856152;
        bh=zTn1tdZuWmuPKIq0K6MghJeHbyGBGWxMJ12FpwqZrC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hG7qEyYH0sNPwDThC8FKfTs6rn5WXL5NQG/ZyYwY4iIScU68YBOS4Fh1zc3osGVWn
         l8l3bm0rVw3KhpQ6YXGu4RFUuF10si14dwmXeb873xKJ5YIzcMaIb1fpZN+jZTK3an
         RuK0ibFMyisj9+sFQ7jGnoqC98PI8VEdmd8bqQVZFFHrorvb/F93xnwfiejQQbSCER
         stIFv+yA/r6/jDvy7RZQVFKEVS+guwi6U4Zx2By2QipqcYsXTaJFCgTp6Ey3GA0Q7B
         vn8dVFnYNd0TpZGuZ/1cm9bo/8vr5NAwYqfIxiOTaM4sJgrJRq49sHOC11wIWoFqX0
         KXyzgLxZ7zQjw==
Date:   Wed, 4 Jan 2023 18:15:48 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-leds@vger.kernel.org, pavel@ucw.cz
Subject: Re: [PATCH] leds: pwm: clear the led structure before parsing each
 child node
Message-ID: <Y7XCVDpHbvc5P/NY@google.com>
References: <20221220073335.393489-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220073335.393489-1-hui.wang@canonical.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 20 Dec 2022, Hui Wang wrote:

> I defined 2 leds in the device tree, in the 1st led node, the
> max-brightness is set to 248, while in the 2nd led node, I
> mis-spelled the max-brightness to max-brighttness, but the driver
> is still able to get the max-brightness 248 for the 2nd node,  that
> is because the led structure is not cleared before parsing each child
> node.
> 
> 	pwmleds {
> 		compatible = "pwm-leds";
> 
> 		pwm-green {
> 			...
> 			max-brightness = <248>;
> 		};
> 
> 		pwm-red {
> 		        ...
> 			max-brighttness = <128>;
> 		};
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  drivers/leds/leds-pwm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
