Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBFE24597F
	for <lists+linux-leds@lfdr.de>; Sun, 16 Aug 2020 22:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgHPUlW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Sun, 16 Aug 2020 16:41:22 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38386 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgHPUlW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Aug 2020 16:41:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 34E941C0BB5; Sun, 16 Aug 2020 22:41:19 +0200 (CEST)
Date:   Sun, 16 Aug 2020 22:41:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "xing.zhang" <xing.zhang@mediatek.com>
Cc:     Luotao Fu <l.fu@pengutronix.de>,
        "; Jacek Anaszewski" <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: leds-pwm  driver further requirement discussion
Message-ID: <20200816204118.GA1481@bug>
References: <1597377070.2687.35.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1597377070.2687.35.camel@mbjsdccf07>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

>     We have used leds-pwm driver to control led in some mediatek IC, but
> we have some further requirement, and want to add some common functions
> for this driver, could you give us some suggestions?
>     For dts, we want to add led-bits and trans-bits, led-bits represents
> the led bits(8->255, 10->1023) from user space, trans-bits represents
> the led hardware IC bits.

First, please make sure there is no existing functionality that can be used. If not, please
use something like "max brightness", not bits.

>     For function, we want to add led event notify, one event is for led
> brightness change, the other one is for led shutdown.
>     We also want to add setMaxBrightness function and setLedBrightness
> function for other module to call.

Umm. No?

Best regards,

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
