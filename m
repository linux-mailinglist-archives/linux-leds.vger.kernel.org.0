Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6900E262BAC
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 11:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgIIJWa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 05:22:30 -0400
Received: from mail.thorsis.com ([92.198.35.195]:42873 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbgIIJW3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 9 Sep 2020 05:22:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 2D8D5356E;
        Wed,  9 Sep 2020 11:22:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id enPhrRHJ5ZnP; Wed,  9 Sep 2020 11:22:27 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 0EC1F3DEB; Wed,  9 Sep 2020 11:22:26 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] leds: pwm: Make automatic labels work
Date:   Wed, 09 Sep 2020 11:22:18 +0200
Message-ID: <1670070.OCB1Fln39h@ada>
In-Reply-To: <20200909090033.GD10891@amd>
References: <20200831210232.28052-1-post@lespocky.de> <2019500.FJf2EgCAKA@ada> <20200909090033.GD10891@amd>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

Am Mittwoch, 9. September 2020, 11:00:33 CEST schrieb Pavel Machek:
> Hi!
> 
> > > > for leds-gpio you can use the properties 'function' and 'color' in the
> > > > devicetree node and omit 'label', the label is constructed
> > > > automatically.  This is a common feature supposed to be working for
> > > > all
> > > > LED drivers.  However it did not yet work for the 'leds-pwm' driver.
> > > > This series fixes the driver and takes the opportunity to update the
> > > > dt-bindings accordingly.
> > > > 
> > > > v1: based on v5.9-rc2, backport on v5.4.59 tested and working
> > > > 
> > > > v2: based on v5.9-rc3, added the dt-bindings update patch
> > > > 
> > > > Greets
> > > > Alex
> > > > 
> > > > Alexander Dahl (2):
> > > >    leds: pwm: Allow automatic labels for DT based devices
> > > >    dt-bindings: leds: Convert pwm to yaml
> > > >   
> > > >   .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
> > > >   .../devicetree/bindings/leds/leds-pwm.yaml    | 85
> > > >   +++++++++++++++++++
> > > >   drivers/leds/leds-pwm.c                       |  9 +-
> > > >   3 files changed, 93 insertions(+), 51 deletions(-)
> > > >   delete mode 100644
> > > >   Documentation/devicetree/bindings/leds/leds-pwm.txt
> > > >   create mode 100644
> > > >   Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > > 
> > > For both patches:
> > > 
> > > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > 
> > I'd like to make a v3 and change the license of the .yaml file to
> > "(GPL-2.0- only OR BSD-2-Clause)" as suggested by checkpatch and [1]. 
> > Can I keep your Acked-by for that?
> > 
> > Besides: those suggestions are obviously valid for new bindings.  What
> > about old bindings (.txt), which had no explicit SPDX tag or license note
> > before? What license would apply there?  Is the .yaml file technically
> > new, when it was mostly just converted from .txt?
> 
> If it is based on previous .txt binding, you have to respect previous
> author's license. That probably means GPL-2.0 only.

Probably?

> Alternatively, you can contact original author(s) to get permission to
> relicense under (GPL-2.0-only OR BSD-2-Clause).

Judging from your feedback on v3, there will be a v4 anyways, so I contacted 
Peter Ujfalusi, who added the original .txt binding back in 2012 (merged in 
2013).

Thanks for your feedback
Alex



