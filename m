Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FF86BE34
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 16:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfGQO16 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 10:27:58 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33457 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfGQO15 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 10:27:57 -0400
Received: by mail-pg1-f195.google.com with SMTP id f20so2019481pgj.0;
        Wed, 17 Jul 2019 07:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nvqNr9SLuwwZZcGIJgyeLTzR5iN49WRmD1bzET7qrX0=;
        b=fZbqig6DExgJMx86f03afKw6OwCDHbTpt3kZa8PZYEL3OaDDQRrrRg8tQI3mt8mqxN
         s3RW8s5Za59L4GeXU2LEhWXBPRhMvkhNhDyB5sUYzVamWXn2p3DYqzbZcxWqFUOC5x3D
         RvkB/2/3DxL+SP7N7+TPjU4UjQ+gU2nB2XgCVPSn7s8eJTMe4MZjvY98/JDunyEYu0fp
         7Kh0buABkIsMJNBGrzzG4cRrnZrc/b89mAqQj6VlVT9nMDGpcjrdS/MnwqnfgM8TqiAq
         /6SOCMQ385Yv/JxsdNTvI6yptg9NnkTKSVxsXrh2je/S0i3YgZdaiJzz+aBFbgT0E8Vv
         iAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nvqNr9SLuwwZZcGIJgyeLTzR5iN49WRmD1bzET7qrX0=;
        b=klqn5Wy9KniOWtNVkw4guWGjo0J6MqY6gmIDo5GtKArjDaCWN078dc2bPCAzu/z/Et
         PL4f0xP4DPLyWXpTEjAs8CrnnTQpLZG3feATeYmrr207GOs9QbeH4GrrWicLO1Y0FCdq
         g8bdEHLkGfOoV2CtWYawf5azwq0sn7QM5Ks7Wa4HAs1DRjINh/BD1BcNg3pnslTngs06
         nHVFDB2QwM39/LXhE+pkJq1JCRFvpkySwyvSlb2XG/D1+BYbqVgO2ARvrFXfXLyq/3F/
         SzvOox4pzwlnXZ8z2JsL9KSKR5Ju8HlyMyI4/z6avRR3V6EDlk/n7GgF7J9DRUykIBIL
         XGQA==
X-Gm-Message-State: APjAAAULhLajj2DxOSb+s+k0Xvbb7KRyB9t69DhFvhe+1Mx2LARq1LjY
        QEdTVAy9aDDtR+DSQHbJ2tEnejvHF/CwWimebMg=
X-Google-Smtp-Source: APXvYqwhAEQJYHqg+zo9ow9mDEV6qDdC8D9kEUY/g6y1OE313KSTV8uAp24yxQENP1K6vRVs9TLqvxUbZ5cUiyq4jCU=
X-Received: by 2002:a63:7455:: with SMTP id e21mr35805147pgn.439.1563373677041;
 Wed, 17 Jul 2019 07:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <1562435939-15466-1-git-send-email-akinobu.mita@gmail.com>
 <1562435939-15466-3-git-send-email-akinobu.mita@gmail.com> <89262967-667f-80cc-0fd5-ba480e879fe0@gmail.com>
In-Reply-To: <89262967-667f-80cc-0fd5-ba480e879fe0@gmail.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 17 Jul 2019 23:27:45 +0900
Message-ID: <CAC5umyjDNh+MP+jLST1sLyFhGsRe-SJCm+KjSOp4ppHqXog3Qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] block: introduce LED block device activity trigger
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B47=E6=9C=8817=E6=97=A5(=E6=B0=B4) 5:57 Jacek Anaszewski <jacek.=
anaszewski@gmail.com>:
>
> Hi Akinobu,
>
> Thank you for the patch set. It looks nice in general, but I'd like
> to maintain it under LED subsystem. See my below comments.

Thanks for reviewing. I'll apply your feedback.

> On 7/6/19 7:58 PM, Akinobu Mita wrote:
> > This allows LEDs to be controlled by block device activity.
> >
> > We already have ledtrig-disk (LED disk activity trigger), but the lower
> > level disk drivers need to utilize ledtrig_disk_activity() to make the
> > LED blink.
> >
> > The LED block device trigger doesn't require the lower level drivers to
> > have any instrumentation. The activity is collected by polling the disk
> > stats.
> >
> > Example:
> >
> > echo block-nvme0n1 > /sys/class/leds/diy/trigger
> >
> > Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
> > Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Dan Murphy <dmurphy@ti.com>
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >  block/Makefile        |   1 +
> >  block/blk-ledtrig.c   | 219 ++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  block/blk.h           |  13 +++
> >  block/genhd.c         |   2 +
> >  include/linux/genhd.h |   4 +
> >  5 files changed, 239 insertions(+)
> >  create mode 100644 block/blk-ledtrig.c
> >
> > diff --git a/block/Makefile b/block/Makefile
> > index eee1b4c..c74d84e6 100644
> > --- a/block/Makefile
> > +++ b/block/Makefile
> > @@ -35,3 +35,4 @@ obj-$(CONFIG_BLK_DEBUG_FS)  +=3D blk-mq-debugfs.o
> >  obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+=3D blk-mq-debugfs-zoned.o
> >  obj-$(CONFIG_BLK_SED_OPAL)   +=3D sed-opal.o
> >  obj-$(CONFIG_BLK_PM)         +=3D blk-pm.o
> > +obj-$(CONFIG_LEDS_TRIGGERS)  +=3D blk-ledtrig.o
> > diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
>
> Please move the whole trigger implementation to
> drivers/leds/trigger and rename the file to ledtrig-blk.c

OK. Then we don't need to patch 1/2 ("leds: move declaration of
led_stop_software_blink() to linux/leds.h") anymore.

> > new file mode 100644
> > index 0000000..da93b06
> > --- /dev/null
> > +++ b/block/blk-ledtrig.c
> > @@ -0,0 +1,219 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// LED Kernel Blockdev Trigger
> > +// Derived from ledtrig-netdev.c
> > +
> > +#include <linux/atomic.h>
> > +#include <linux/genhd.h>
> > +#include <linux/leds.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct blk_ledtrig_data {
> > +     struct delayed_work work;
> > +     struct led_classdev *led_cdev;
> > +
> > +     atomic_t interval;
> > +     u64 last_activity;
> > +
> > +     unsigned long mode;
> > +#define BLK_LEDTRIG_READ BIT(0)
> > +#define BLK_LEDTRIG_WRITE BIT(1)
> > +#define BLK_LEDTRIG_DISCARD BIT(2)
>
> s/BLK_LEDTRIG/LEDTRIG_BLK/

OK.

> > diff --git a/block/blk.h b/block/blk.h
> > index 7814aa2..dd4c230a 100644
> > --- a/block/blk.h
> > +++ b/block/blk.h
> > @@ -331,4 +331,17 @@ void blk_queue_free_zone_bitmaps(struct request_qu=
eue *q);
> >  static inline void blk_queue_free_zone_bitmaps(struct request_queue *q=
) {}
> >  #endif
> >
> > +#ifdef CONFIG_LEDS_TRIGGERS
> > +int blk_ledtrig_register(struct gendisk *disk);
> > +void blk_ledtrig_unregister(struct gendisk *disk);
> > +#else
> > +static inline int blk_ledtrig_register(struct gendisk *disk)
> > +{
> > +     return 0;
> > +}
> > +static inline void blk_ledtrig_unregister(struct gendisk *disk)
> > +{
> > +}
> > +#endif /* CONFIG_LEDS_TRIGGERS */
>
> Please move this part to include/linux/leds.h, next to the other
> triggers' facilities.

OK.
