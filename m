Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC98710B2E
	for <lists+linux-leds@lfdr.de>; Thu, 25 May 2023 13:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241097AbjEYLgj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 May 2023 07:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241098AbjEYLgV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 May 2023 07:36:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712431986
        for <linux-leds@vger.kernel.org>; Thu, 25 May 2023 04:34:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E685D61C04
        for <linux-leds@vger.kernel.org>; Thu, 25 May 2023 11:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120C6C433D2;
        Thu, 25 May 2023 11:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685014486;
        bh=5tqCe0o3qHHHqEwQ9G+N+YXbE4JiX5k0oC93jBjks2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cpui8xDeDsBFgt91SI/wvp5RLp2xe9cHiirgDgaDmbQQXxa+EqNUaimR6gXa/pp8N
         sKvU/BsjGPChZmpFts97y2nIUdlYLg8o4aEIq+KuuuwlHif4NBIM/QgziLjj54Vlu5
         bZsOxnaxbmP/9AtRH68cTNZQc77TbTzjsfP4VpVm8sBHtFiXN7+zeQ5nxeDWWzQprO
         Z36o51QYTIEh14ety/yfAhmp2iHqRP+LaG0vkcZx0YxUC2t3GfJEjserSGgA2W21Xu
         Y7iz/6xYJ5sXViUPejs1cvvdttlWcFETdflmJ1WewytChOdymGHEm2WXiUV6zMeY3G
         eewTVPAbdvblQ==
Date:   Thu, 25 May 2023 12:34:41 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-leds@vger.kernel.org,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: gpio: Configure per-LED pin control
Message-ID: <20230525113441.GG423913@google.com>
References: <20230523183151.5460-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523183151.5460-1-marex@denx.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 23 May 2023, Marek Vasut wrote:

> Each gpio-leds DT node DT subnode can have a pinctrl property assigned
> to it, parse the DT subnode pinctrl properties and configure each pin
> accordingly.
> 
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> To: linux-leds@vger.kernel.org
> ---
> V2: Cc Lee
> ---
>  drivers/leds/leds-gpio.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
