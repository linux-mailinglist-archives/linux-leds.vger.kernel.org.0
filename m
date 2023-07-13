Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7657525B6
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jul 2023 16:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjGMOzg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Jul 2023 10:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjGMOz3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Jul 2023 10:55:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728DA2706;
        Thu, 13 Jul 2023 07:55:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1004261849;
        Thu, 13 Jul 2023 14:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D23C433C7;
        Thu, 13 Jul 2023 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689260127;
        bh=/PNa8c5uB3xZJs1ZCxwrUtLQVeBxBkNDCyB4lZC6vmc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AgAjCNirzo8hjm7DTmauBTe1zhbhCqJJv5W5tmdHzv8w33g9KzEGY4v3RaiUj15E6
         mX1KCgCCYf5kLkiMNd1tNZrgmcmXavs9koy2BY6c3xL3vnFkmX3Ikq4ecIaPYXUT0X
         cuW3W4MJx924IwSudXmTNxqU18JSOoT1Qj8Ck5LDwQ5qJfei+LmMYhPNGwidYZAnCg
         lhtrESBjg3tjF+Yvkh5kt8DYJccQkTglyoUw8QrXJ+j4WZV9f+2YPtpSYBDKVtT703
         8DqdNHGyslI9fL8MJp/LFAug2c9kjywUQcQjD5LJZehoIEmxEqQ74ZAB/oSbgdw5wU
         S5cytmyQ1C2wQ==
Date:   Thu, 13 Jul 2023 15:55:23 +0100
From:   Lee Jones <lee@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: pwm: Fix error code in led_pwm_create_fwnode()
Message-ID: <20230713145523.GF10768@google.com>
References: <a33b981a-b2c4-4dc2-b00a-626a090d2f11@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a33b981a-b2c4-4dc2-b00a-626a090d2f11@moroto.mountain>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 11 Jul 2023, Dan Carpenter wrote:

> Negative -EINVAL was intended, not positive EINVAL.  Fix it.
> 
> Fixes: 95138e01275e ("leds: pwm: Make error handling more robust")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/leds/leds-pwm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
