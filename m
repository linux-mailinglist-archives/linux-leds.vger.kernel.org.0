Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FBC1293E3
	for <lists+linux-leds@lfdr.de>; Mon, 23 Dec 2019 10:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfLWJ7E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Dec 2019 04:59:04 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51757 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfLWJ7E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Dec 2019 04:59:04 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ijKUJ-0006Lz-Tc; Mon, 23 Dec 2019 10:58:55 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ijKUH-0002TQ-PJ; Mon, 23 Dec 2019 10:58:53 +0100
Date:   Mon, 23 Dec 2019 10:58:53 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@denx.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 0/3] tty/leds: implement a trigger for ttys
Message-ID: <20191223095853.yomqrkx2epa273oh@pengutronix.de>
References: <20191217165816.19324-1-u.kleine-koenig@pengutronix.de>
 <20191217172232.GC3829986@kroah.com>
 <20191221183611.GB32732@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191221183611.GB32732@amd>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Dec 21, 2019 at 07:36:11PM +0100, Pavel Machek wrote:
> On Tue 2019-12-17 18:22:32, Greg Kroah-Hartman wrote:
> > On Tue, Dec 17, 2019 at 05:58:13PM +0100, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > v3 of this series was sent earlier today starting with Message-Id:
> > > 20191217150736.1479-1-u.kleine-koenig@pengutronix.de.
> > > 
> > > v4 only changes patch 3 dropping a few printks, fixing the show callback
> > > for the dev attribute to match its store function. And I moved
> > > ledtrig_tty_restart() into the already existing if (tty) {...} block in
> > > dev_store and dropped the same check from the former function.
> > > 
> > 
> > All looks good to me, so if the LED developers give their ack, I can
> > take it in my tty tree.
> 
> Nothing obviously wrong in 1 and 2 of the series. Feel free to take
> them.
> 
> I fear conflicts if you take 3/ through your tree, so perhaps I can
> take it through the LEDs?
> 
> But I'll have some comments there.

If the feedback implies that using statistics is not the right thing,
the tty patches are not needed however, so I suggest to wait until the
discussion is closed before taking them.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
