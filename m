Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8549F08E
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2019 18:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbfH0Qpn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Aug 2019 12:45:43 -0400
Received: from muru.com ([72.249.23.125]:58862 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbfH0Qpm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 27 Aug 2019 12:45:42 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A860C8107;
        Tue, 27 Aug 2019 16:46:10 +0000 (UTC)
Date:   Tue, 27 Aug 2019 09:45:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        sre@kernel.org, nekit1000@gmail.com, mpartap@gmx.net,
        merlijn@wizzup.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] leds: lm3532: Fix brightness control for i2c mode
Message-ID: <20190827164538.GB52127@atomide.com>
References: <20190820195307.27590-1-dmurphy@ti.com>
 <20190826215822.GY52127@atomide.com>
 <20190826221413.GA19124@amd>
 <20190826224437.GZ52127@atomide.com>
 <20190827121818.GB19927@amd>
 <0eab6f72-ddb7-3da7-e90e-888374531f86@ti.com>
 <9939e253-0c9e-5ef7-e160-c1e5fe99c453@ti.com>
 <20190827160454.GA52127@atomide.com>
 <56200c16-dcfe-3b14-6f22-80e5a387a66b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56200c16-dcfe-3b14-6f22-80e5a387a66b@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* Dan Murphy <dmurphy@ti.com> [190827 16:20]:
> Tony
> 
> On 8/27/19 11:04 AM, Tony Lindgren wrote:
> > * Dan Murphy <dmurphy@ti.com> [190827 13:02]:
> > > Hello
> > > 
> > > On 8/27/19 7:44 AM, Dan Murphy wrote:
> > > > Tony
> > > > 
> > > > On 8/27/19 7:18 AM, Pavel Machek wrote:
> > > > > On Mon 2019-08-26 15:44:37, Tony Lindgren wrote:
> > > > > > * Pavel Machek <pavel@ucw.cz> [190826 22:14]:
> > > > > > > On Mon 2019-08-26 14:58:22, Tony Lindgren wrote:
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > * Dan Murphy <dmurphy@ti.com> [190820 19:53]:
> > > > > > > > > Fix the brightness control for I2C mode.  Instead of
> > > > > > > > > changing the full scale current register update the ALS target
> > > > > > > > > register for the appropriate banks.
> > > > > > > > > 
> > > > > > > > > In addition clean up some code errors and random misspellings found
> > > > > > > > > during coding.
> > > > > > > > > 
> > > > > > > > > Tested on Droid4 as well as LM3532 EVM connected to
> > > > > > > > > a BeagleBoneBlack
> > > > > > > > > 
> > > > > > > > > Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the
> > > > > > > > > lm3532 LED driver")
> > > > > > > > > Reported-by: Pavel Machek <pavel@ucw.cz>
> > > > > > > > > Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > > > > > > > > ---
> > > > > > > > > 
> > > > > > > > > v3 - Removed register define updates -
> > > > > > > > > https://lore.kernel.org/patchwork/patch/1114542/
> > > > > > > > Looks like starting with this patch in Linux next the LCD on droid4
> > > > > > > > is so dim it's unreadable even with brightness set to 255. Setting
> > > > > > > > brightness to 0 does blank it completely though.
> > > > > > > > 
> > > > > > > > Did something maybe break with the various patch revisions or are
> > > > > > > > we now missing some dts patch?
> > > > > > > Maybe missing dts patch. We should provide maximum current the LED can
> > > > > > > handle...
> > > > > > Or i2c control is somehow broken and only als control now works?
> > > > With only setting CONFIG_LEDS_LM3532=m to the next branch I get full
> > > > brightness with 255.
> > > > 
> > > > I also see half brightness at 128 with the ramp down working.
> > > > 
> > > > I am not able to reproduce this issue on my device.
> > > > 
> > > Just to make sure my data was right I did a clean rebuild on commit
> > > 1dbb9fb4082ce2a2f1cf9596881ddece062d15d0
> > > 
> > > from the led-next branch.
> > > 
> > > Just adding the above config flag.  I still cannot reproduce the issue
> > > 
> > > See attached pic
> > OK thanks for checking. Probably you can reproduce the issue if you
> > reset things to commit c4b8354e5341 ("leds: lm3532: Fix brightness
> > control for i2c mode"). There might now be something uninitialized
> > with that commit depending on the hardware state on boot if you
> > care to check that. Or maybe there's some interaction with other
> > patches not yet at commit c4b8354e5341 level.
> 
> Ok the fix for that issue is in this patch
> 
> leds: lm3532: Fixes for the driver for stability
> 
> The fix for setting the brightness control register during the init forced
> the ALS mode to
> 
> be enabled.  The Fixes for driver stability patch then set the led->mode to
> the correct register setting.

OK yeah so that part starts to make sense now. I wonder if the reason
for my issues was caused by change in sysfs brightness level values
and I ended up chasing an already fixed issue. I think I was using
value of 30 recently, which is now very dim :)

> > I confirmed again that things fail at commit c4b8354e5341. But
> > now testing with the same Linux next as yesterday things works again.
> > Not sure what's going on as failures with Linux next yestreday
> > made me start narrowing down what commit causes the issues.
> > 
> > Anyways, playing with loading and unloading the leds-lm3532.ko I
> > noticed we can also have unpaired regulator calls when using sysfs
> > brightness that the below patch attempts to fix. Not sure how I got
> > to the point of regulator warnings, but I was trying to enable
> > the brightness via sysfs. Maybe I had other patches too when
> > I got the regulator warnings.. But please check if the below
> > patch makes sense.
> 
> Makes sense did you want me to push a patch?

No need to, I can send out a proper patch later today after typing up
the patch description if no other comments.

Regards,

Tony
