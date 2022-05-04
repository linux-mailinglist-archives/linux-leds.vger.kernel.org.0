Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACEFB51AC3E
	for <lists+linux-leds@lfdr.de>; Wed,  4 May 2022 20:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376484AbiEDSIe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 May 2022 14:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376488AbiEDSI0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:08:26 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648B5719FF
        for <linux-leds@vger.kernel.org>; Wed,  4 May 2022 10:23:57 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CB7C11C0BBE; Wed,  4 May 2022 19:23:55 +0200 (CEST)
Date:   Wed, 4 May 2022 19:23:54 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Uwe Kleine-K??nig <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger/tty: Add knob to blink only for tx or only
 for rx
Message-ID: <20220504172354.GD1623@bug>
References: <20220224155655.702255-1-u.kleine-koenig@pengutronix.de>
 <20220420162915.2brgxwkrxwqpw5mr@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420162915.2brgxwkrxwqpw5mr@pengutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> > The newly introduced "triggerevent" attribute allows to restrict
> > blinking to TX or RX only.
> 
> I didn't get any maintainer feedback for this patch since nearly 2
> months. I assume the problem is missing maintainer time? Or did this
> fell through the cracks?

Missing time, or more accurately "went on trip with notebook but not charger". Sorry.

But... I don't think sysfs interface is acceptable due to "one value per file" sysfs rule.

Separate "blink for tx" and "blink for rx" files containing booleans should be acceptable.

Best regards,
										Pavel

-- (english) http://www.livejournal.com/~pavelmachek (cesky, pictures) 
http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
