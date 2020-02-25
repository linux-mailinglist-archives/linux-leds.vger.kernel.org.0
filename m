Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C80016BCF4
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2020 10:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbgBYJGA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Feb 2020 04:06:00 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48635 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729765AbgBYJGA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Feb 2020 04:06:00 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j6WA5-0007xl-H8; Tue, 25 Feb 2020 10:05:53 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j6WA3-0003FW-Gm; Tue, 25 Feb 2020 10:05:51 +0100
Date:   Tue, 25 Feb 2020 10:05:51 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     kernel@pengutronix.de, linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 2/4] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
Message-ID: <20200225090551.jhj7sc75neyphbss@pengutronix.de>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-3-uwe@kleine-koenig.org>
 <20200219132113.GD32540@localhost>
 <20200219163758.5rypsol4n6ucost4@pengutronix.de>
 <20200219171759.GE32540@localhost>
 <20200220110427.e6jgzvdhh3ysql3n@pengutronix.de>
 <20200225085503.GP32540@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200225085503.GP32540@localhost>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Feb 25, 2020 at 09:55:03AM +0100, Johan Hovold wrote:
> On Thu, Feb 20, 2020 at 12:04:27PM +0100, Uwe Kleine-König wrote:
> > Ah I think I see. tty_driver_lookup_tty() might return NULL which for
> > the trigger driver indicates that tty_kopen_shared should be retried,
> > right?
> 
> I'm not sure how best to handle this, but yes, your trigger can only be
> enabled while the port is open currently. And no error is returned to a
> user trying to enable the trigger before it has been opened.
> 
> But regardless of the error reporting, I don't think failing when the
> port isn't open is the right thing to do as as this makes the interface
> rather useless since you cannot enable a trigger from for example a udev
> rule.
> 
> If this approach is to be used at all, it seems you may need to allocate
> the struct tty when the trigger is enabled. And make sure you don't mess
> up some other assumption in tty core...

My idea is instead to retry opening the device later. At least this
sounds easier.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
