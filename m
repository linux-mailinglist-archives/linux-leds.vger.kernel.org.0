Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB042650C2
	for <lists+linux-leds@lfdr.de>; Thu, 10 Sep 2020 22:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgIJU1H (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Sep 2020 16:27:07 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35970 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgIJUZO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Sep 2020 16:25:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 62CDA1C0B76; Thu, 10 Sep 2020 22:25:10 +0200 (CEST)
Date:   Thu, 10 Sep 2020 22:25:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>, robh+dt@kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200910202510.GB18431@ucw.cz>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200908222544.GF1005@bug>
 <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
 <20200910122958.GF7907@duo.ucw.cz>
 <489fc92f-f6f5-839e-e417-7761d404e6ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <489fc92f-f6f5-839e-e417-7761d404e6ae@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> > > 1. set FLED1 brightness
> > > # echo 1 > /sys/class/leds/white:flash1/flash_brightness
> > > 2. enable FLED1 strobe
> > > # echo 1 > /sys/class/leds/white:flash1/flash_strobe
> > > 3 . turn off FLED1 strobe (just used to gaurantee the strobe mode
> > > flash leds must be turned off)
> > > # echo 0 > /sys/class/leds/white:flash1/flash_strobe
> > 
> > I believe I'd preffer only exposing torch functionality in
> > /sys/class/leds. .. strobe can be supported using v4l2 APIs.
> 
> Actually having LED flash class without strobe is pointless.
> If you looked at led_classdev_flash_register_ext() you would see that
> it fails with uninitialized strobe_set op. And V4L2 API for strobing
> flash calls strobe_set from LED flash class beneath.
> 
> That was the idea behind LED and V4L2 flash API unification - there
> is one hardware driver needed, the V4L2 Flash layer just takes over
> control over it when needed.

I agree that one driver is enough.

But we should not need flash_strobe file in sysfs. Simply use V4L2 for
that.

Best regards,
								Pavel
