Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E464475A3
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2019 17:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfFPPuH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 Jun 2019 11:50:07 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50375 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfFPPuH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Jun 2019 11:50:07 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 0A0AC801F6; Sun, 16 Jun 2019 17:49:54 +0200 (CEST)
Date:   Sun, 16 Jun 2019 17:49:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] Multicolor Framework update
Message-ID: <20190616154934.GC24837@xo-6d-61-c0.localdomain>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <55737098.K72IVJ5cDM@ada>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55737098.K72IVJ5cDM@ada>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Am Donnerstag, 23. Mai 2019, 14:08:11 CEST schrieb Dan Murphy:
> >   leds: multicolor: Add sysfs interface definition
> >   dt: bindings: Add multicolor class dt bindings documention
> >   documention: leds: Add multicolor class documentation
> >   dt-bindings: leds: Add multicolor ID to the color ID  list
> >   leds: Add multicolor ID to the color ID list
> >   leds: multicolor: Introduce a multicolor class definition
> >   dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
> >   leds: lp50xx: Add the LP50XX family of the RGB LED driver
> >   leds: Update the lp55xx to use the multi color framework
> 
> While not having much experience with the implementation of the LED subsystem, 
> I've had a short look at those. Curious question: would it be possible to take 
> three gpio-leds and group those together to one multicolor-led? I know at 
> least one board, where things are wired up like this, see e.g. 
> at91-sama5d27_som1_ek.dts

Probably could be done, but is not really a good match. Multicolor was meant for
LEDs with many brightness levels.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
