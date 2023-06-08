Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7105F72831D
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jun 2023 16:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236417AbjFHO4a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Jun 2023 10:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235886AbjFHO43 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Jun 2023 10:56:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D1A2D4A
        for <linux-leds@vger.kernel.org>; Thu,  8 Jun 2023 07:56:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D315F6181A
        for <linux-leds@vger.kernel.org>; Thu,  8 Jun 2023 14:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DBDC433D2;
        Thu,  8 Jun 2023 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686236188;
        bh=guzezODL1OpG1dkwE+w+K/a7eZRjPG0n9i0v5yDJBPE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gFNjau4vgZy8sa4CQZ0cnmzGguFAIQEz/2JQ9NpA1HLz0kxxDlrTEPqQ4L/13l27R
         WxlwOMSJ82HJLyouO5JGxD9HDGLApInkPayfXfuniaJwYqqoULWCsc3iAdxjkDZWQ8
         nS7XGeQ0cbUWSQLZN+rPS3TuBIHsbAfqSpFGARhqjBHZfeKW0Bp23pFfyRgG1+1lQG
         BLn2whSPGw7zkQtkMsA1BwrS2UtWA+2yXwHtesRIQMzf565yZDL1bsOqYhoGUyY9XD
         PMkVBRcGEwVI3YF4GqSHWN6DIEKGAv8C6ocm3OtmvobOAyJuRz5LTs0lzVFalXfxqW
         bRqgtLiPd6e4A==
Date:   Thu, 8 Jun 2023 15:56:23 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] leds: cht-wcove: Mark cht_wc_leds_brightness_get() static
Message-ID: <20230608145623.GM1930705@google.com>
References: <20230525183317.129232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230525183317.129232-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 25 May 2023, Hans de Goede wrote:

> cht_wc_leds_brightness_get() is only used internally, mark it static.
> 
> Cc: Yauhen Kharuzhy <jekhor@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305260008.QCRrKILf-lkp@intel.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/leds-cht-wcove.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
