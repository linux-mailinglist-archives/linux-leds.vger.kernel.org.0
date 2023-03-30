Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5C36D052A
	for <lists+linux-leds@lfdr.de>; Thu, 30 Mar 2023 14:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbjC3Mqf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 Mar 2023 08:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjC3Mqe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Mar 2023 08:46:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D1091;
        Thu, 30 Mar 2023 05:46:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BBA8362047;
        Thu, 30 Mar 2023 12:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A32CC433D2;
        Thu, 30 Mar 2023 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680180393;
        bh=L+BzOBLvDWe+UgmmOwW9xkanH97MwblSyJjThnIMgXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AhSefVTxwCvRrbF25g7aMCSkLbV4EV/sBX2nMA9/vgg6916H6Q/1aoF4DpztmVM43
         MBWpX7mHCZYqyfDUofvi5RCii/3DN9wom3BC8v7PUY6EfWUbxcXKbjzkRStLxU0mGe
         5A2/AFBAnRrYdKU7mOYDw69NL4OGoODDRCzcwqmpmYq/xNvPFw/ZxJujT/Mv84KuKh
         vDrGoupbdKC5U3g1HmWiEbxceH7+6ODP1z/MOSfg0R6j9/CgyFf2p9rn9ahGDrXdXC
         k4Hlc1l13eGVQsBGt/lsTDBBHgBxnXFTK7X4ZFjKhKKcMcLxgWKXDWVGQ0JBrPRY/8
         YZzMvQaJ+jpTA==
Date:   Thu, 30 Mar 2023 13:46:28 +0100
From:   Lee Jones <lee@kernel.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Fenglin Wu <quic_fenglinw@quicinc.com>, linux-leds@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: flash: qcom: Fix a signedness bug in
 qcom_flash_register_led_device()
Message-ID: <20230330124628.GL434339@google.com>
References: <20aeda89-7ed2-4dd8-b707-404a15289fbc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20aeda89-7ed2-4dd8-b707-404a15289fbc@kili.mountain>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 22 Mar 2023, Dan Carpenter wrote:

> This bug is basically harmless at runtime because of the surrounding lines.
> Still the fwnode_property_count_u32() function returns negative error codes
> so storing them in an unsigned int will not work.
>
> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> The patch prefix on this was slightly tricky.  Ideally when people add a
> new driver the patch which adds the driver would use the patch prefix
> for the driver instead of the subsystem:
>
> Not ideal: [PATCH] leds: Add new driver for QWERTY
>     Ideal: [PATCH] leds: qwerty: Add new driver

That tends not to happen in my experience and I'm fine with it.

This precedence is usually set by the second commit.

>  drivers/leds/flash/leds-qcom-flash.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks

--
Lee Jones [李琼斯]
