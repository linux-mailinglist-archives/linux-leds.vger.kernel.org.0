Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C1E751E79
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jul 2023 12:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbjGMKKk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Jul 2023 06:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjGMKKT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Jul 2023 06:10:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BA33AB1
        for <linux-leds@vger.kernel.org>; Thu, 13 Jul 2023 03:09:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32D0C608D5
        for <linux-leds@vger.kernel.org>; Thu, 13 Jul 2023 10:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254D5C433C8;
        Thu, 13 Jul 2023 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689242928;
        bh=DM40r30N6pimubvqd9IiuylUtIis5dx4RsPAIGWkUac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dl7OCjxuf+dCW1vRAsmMzYPrqVoME/M3VPvg7wxhgDpai3fVTkd6ZEtEG2jihEIfu
         Xvb6WWvoeV1YtzSrDJd6oZoIJypwzhf8sTFlw3PZCp7Voe04SPbksTTX0rPeiEO1Hv
         Rf+G+8ZuZTm4sHXhASxTBQM3+OxIWNTOL6S81NdIehw4hPcTf724CFJ5sR9Q+SSHP9
         z0GOxYoi9zAQIL2MVC9gid2j1jArHuwie18CdjL6moZi0UpVtgM+tbtVOL3wXdaL8m
         J+E8iMyKkyLCSpZkprB/6HOuIZOsZGy+nx4XcbMppdMK6xvoG4ntpj1Xg7eic3Lgcj
         Qe16k+MUjN87Q==
Date:   Thu, 13 Jul 2023 11:08:43 +0100
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] leds: aw200xx: Switch back to use struct
 i2c_driver::probe
Message-ID: <20230713100843.GK10768@google.com>
References: <20230626090254.556206-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626090254.556206-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 26 Jun 2023, Uwe Kleine-König wrote:

> struct i2c_driver::probe_new is about to go away. Switch the driver to
> use the probe callback with the same prototype.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/leds/leds-aw200xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
