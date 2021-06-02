Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DD839842F
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jun 2021 10:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFBIfF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Jun 2021 04:35:05 -0400
Received: from mail.thorsis.com ([92.198.35.195]:48746 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229571AbhFBIfF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 2 Jun 2021 04:35:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 37D33F2F;
        Wed,  2 Jun 2021 10:33:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id k6LAhRHarBbO; Wed,  2 Jun 2021 10:33:21 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 155164E6; Wed,  2 Jun 2021 10:33:21 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
        * -0.0 NO_RECEIVED Informational: message has no Received headers
Date:   Wed, 2 Jun 2021 10:33:11 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 02/15] leds: leds-gpio-register: Supply description for
 param 'id'
Message-ID: <YLdCR9VlDgVmwK7D@ada.ifak-system.com>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-3-lee.jones@linaro.org>
 <20210528094118.xw53q46i676wx6gb@pengutronix.de>
 <20210528095531.GO543307@dell>
 <20210528103532.5n6zzr26hqglvz2p@pengutronix.de>
 <20210601090503.GY543307@dell>
 <20210602082436.hdi4olxekvvbtzef@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602082436.hdi4olxekvvbtzef@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Uwe,

Am Wed, Jun 02, 2021 at 10:24:36AM +0200 schrieb Uwe Kleine-König:
> Ah, that the patch is already merged is news to me. Indeed, then fixing
> this is not sensible. My initial feedback was less than an hour after
> you sent the patch and it appeared just yesterday in next, so this
> wasn't easily noticeable for me.
> 
> Usually I'm annoyed about maintainers who don't react to patch series
> and don't apply it. Here I'm more annoyed that I was Cc:d---which I
> interpret as a request for feedback---and an hour later was already too
> late for my review reply and there was (up to today) no maintainer mail
> that the patch set was applied.

Pavel applied (part of) the series quite quickly and stated in reply
to patch 14/15:

https://lore.kernel.org/linux-leds/20210528093921.GA2209@amd/

So I was also surprised my review of two patches, one hour after
posting the series, was already too late.

This is not really motivating to review at all. ¯\_(ツ)_/¯

Greets
Alex

