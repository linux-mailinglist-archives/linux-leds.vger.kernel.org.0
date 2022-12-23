Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E7A655098
	for <lists+linux-leds@lfdr.de>; Fri, 23 Dec 2022 13:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiLWMvp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Dec 2022 07:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLWMvp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Dec 2022 07:51:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C53BF64
        for <linux-leds@vger.kernel.org>; Fri, 23 Dec 2022 04:51:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA22860ACE
        for <linux-leds@vger.kernel.org>; Fri, 23 Dec 2022 12:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266A6C433D2;
        Fri, 23 Dec 2022 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671799903;
        bh=zqkAJYSSOGmXZqPIYtFHlyevLAZcMk1ycgHELL0KFAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DKFGYXtSD8YvakY41rcJ93lfbVpSS0z8K1gML0FKzD2l2tgC6ZNQaimW5v9ef/Lg5
         wYe6L2XpKNofJctUc2enBY7zETysA4zoKAR98iWdFefLlZ3KpFyzFVietgtQZ5wYtT
         /+SBakRENsHgHJedIYsdM8O84rJnO/3HXX8E3WNJcIS3LwqIh7Gzbicq4ceJnU5P8V
         g+KH5WG2Ac50vUgEksiRewM7ds9N6ZLYOGByjhKDN9j7ggFKB/qGFl1g/4jE22kVop
         Ho6/3eN7RNefSR/0mAK6bS28KJWKww1dPwV7P3UpJvjbWdeffgN9VpU+6MgVpLEOLI
         k87FdrbDQ6mAQ==
Date:   Fri, 23 Dec 2022 12:51:37 +0000
From:   Lee Jones <lee@kernel.org>
To:     Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc:     Pavel Machek <pavel@ucw.cz>, lee.jones@linaro.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        kabel@kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 4/6] leds: class: store the color index in struct
 led_classdev
Message-ID: <Y6WkWUIZe1YLQIFO@google.com>
References: <20221117160447.294491-1-jjhiblot@traphandler.com>
 <20221117160447.294491-5-jjhiblot@traphandler.com>
 <CAHp75VfMdGRz5mqhQDZT3ozwmYF2OmT8uk1yGMHXLf5Z-m_tUw@mail.gmail.com>
 <662ed1bc-c513-fb58-9f74-060a2bc4c3f4@traphandler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <662ed1bc-c513-fb58-9f74-060a2bc4c3f4@traphandler.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 09 Dec 2022, Jean-Jacques Hiblot wrote:

> Hello Pavel,
> 
> I haven't had feedback on this series from the maintainers for some time
> now.
> 
> I understand that you're quite busy, but I'd appreciate if you could have a
> look at it.

Not in my inbox.  Would you be kind enough to submit a [RESEND] please?

-- 
Lee Jones [李琼斯]
