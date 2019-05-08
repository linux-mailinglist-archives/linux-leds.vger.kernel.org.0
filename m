Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C88417160
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 08:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfEHGVJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 02:21:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36855 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbfEHGVJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 02:21:09 -0400
Received: by mail-wr1-f65.google.com with SMTP id o4so25537773wra.3
        for <linux-leds@vger.kernel.org>; Tue, 07 May 2019 23:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IxpIywyLKQBnJeFERaRsNuyr6beLjjROmJrDYYr4g80=;
        b=Uq0eTtmA4eAMi7pwAP0IBF51d9+0w5gjracj4O2wrlOaxlYKkfto+tyvFnPPYn8UH+
         6pqY34zhG9mGKUvWEGN2DaVGCbSL6AEr5HUYM0Ho0V4fPa2UlpPQR+/tdCmv3zON2yt9
         50M5ei7sD16bcZsKeLUYARwjTAZgXv+H6GE67mhrhmkPnNh1H0mZ3Jhu4uGmKn6w6fBc
         5xjMmXFXANUGsJsDDVekvbbi23GdXc4rrzOSuBf1OT3yeqLEkw+amfTESikjKiIMTaLv
         GaipL8vkJR71CUfX4HtWjDEoeUGiRo6je3bH5Q9701WJisQZDJl+jDbaB/VJPMERVN12
         dNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=IxpIywyLKQBnJeFERaRsNuyr6beLjjROmJrDYYr4g80=;
        b=rk6R+sPjDEjHodLG1Wojok0wudJCTYZeoWLer6nYYXnUnalWa3Cfp73eMO/nNcK5WR
         wkDNUvE9Sau0Yw8xAPkrovJqS7pMJI3oWThIhmOK7SYnk6VoxyyMyU+1KCPZkyRbLzQ+
         a5PY3KsLwQbvmVdD1DZg7noh5ykNncC8vrVdp2+wkLfVw4gJ/5QeTciEJR6UpA3xrO3E
         CZ7whsyUde/pQ7ovm1jnonBfljsjRc80e8wtPvqLHEM0/uSATKJJbQtBZtGs3Yko/4Z2
         9tn/UWEF3KxNTuLoSo092hLFznGPZe6fe7Ec8blhmi972vPzlPwaZs+nFS3j6Bvs39r2
         EYtA==
X-Gm-Message-State: APjAAAWkNFOXbzy0gP4Ywtb9cLsUNfxUVEYysh7hb8ZJvnX4GITcxoQO
        jEd6ivFgIzKyM7qktBEZAGUKPA==
X-Google-Smtp-Source: APXvYqxqJRUTmdCNQIUkExSABPDRdpSRp4eRvCnOlO4H0Yz3b2gIgBZuWvldFknjK1OFyJ1FvIEokA==
X-Received: by 2002:adf:8068:: with SMTP id 95mr24762121wrk.174.1557296467607;
        Tue, 07 May 2019 23:21:07 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id d17sm2764602wrw.73.2019.05.07.23.21.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 23:21:06 -0700 (PDT)
Date:   Wed, 8 May 2019 07:21:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] LMU Common code intro
Message-ID: <20190508062104.GC7627@dell>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 01 May 2019, Jacek Anaszewski wrote:

> Ekhm, I forgot to add the main recipient.
> 
> Adding Lee.
> 
> On 5/1/19 12:05 AM, Jacek Anaszewski wrote:
> > Hi Lee,
> > 
> > This patch set has dependency on the previous one for lm3532, which
> > also touches ti-lmu.txt bindings, and for which I already created
> > immutable branch. Now if I created another immutable branch for
> > this patch set we would have to resolve conflicts between the two,
> > as they would both be based on 5.1-rc1. Adds much overhead and
> > is error prone. Therefore I propose to apply this patch set on
> > top of my merge of LED tree with the immutable branch for lm3532.
> > 
> > Please let me know if you see it differently. I'll wait for your
> > response until Friday, and then proceed with the above as I think
> > it should be harmless for MFD.

Looks like this set wasn't sent until -rc6 which is when I normally
stop applying significant patches.  I think it's best that we wait
until the next rotation.  That way all this dependency related
hoop-jumping just goes away.

> > On 4/30/19 9:17 PM, Dan Murphy wrote:
> > > Hello
> > > 
> > > I have added the Reviewed-by for dt bindings as well as made the
> > > Kconfig change
> > > pointed out for the common code flag
> > > 
> > > Dan
> > > 
> > > Dan Murphy (7):
> > >    dt-bindings: mfd: LMU: Fix lm3632 dt binding example
> > >    dt-bindings: mfd: LMU: Add the ramp up/down property
> > >    dt-bindings: mfd: LMU: Add ti,brightness-resolution
> > >    leds: TI LMU: Add common code for TI LMU devices
> > >    dt-bindings: ti-lmu: Modify dt bindings for the LM3697
> > >    mfd: ti-lmu: Remove support for LM3697
> > >    leds: lm3697: Introduce the lm3697 driver
> > > 
> > >   .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ++++
> > >   .../devicetree/bindings/mfd/ti-lmu.txt        |  56 ++-
> > >   drivers/leds/Kconfig                          |  15 +
> > >   drivers/leds/Makefile                         |   2 +
> > >   drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
> > >   drivers/leds/ti-lmu-led-common.c              | 155 +++++++
> > >   drivers/mfd/Kconfig                           |   2 +-
> > >   drivers/mfd/ti-lmu.c                          |  17 -
> > >   include/linux/mfd/ti-lmu-register.h           |  44 --
> > >   include/linux/mfd/ti-lmu.h                    |   1 -
> > >   include/linux/ti-lmu-led-common.h             |  47 +++
> > >   11 files changed, 712 insertions(+), 95 deletions(-)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/leds/leds-lm3697.txt
> > >   create mode 100644 drivers/leds/leds-lm3697.c
> > >   create mode 100644 drivers/leds/ti-lmu-led-common.c
> > >   create mode 100644 include/linux/ti-lmu-led-common.h
> > > 
> > 
> > 
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
