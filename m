Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1B68BD5F
	for <lists+linux-leds@lfdr.de>; Tue, 13 Aug 2019 17:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729684AbfHMPkS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Aug 2019 11:40:18 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34761 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727621AbfHMPkQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Aug 2019 11:40:16 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so49474774plt.1;
        Tue, 13 Aug 2019 08:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IFpHEZmO8P8ibZrjmbskVYzECLFyHY2hgPRhajuorfs=;
        b=sGF94uH4H9+S8YPc2Ukpi/1ZXz9Nz5ogn48iUe10002eaQGeW9R76QEXvloVxsJ8O5
         HHftRakxcyAtdpvm67SMNg/n8Ms24pXF0JFkGxKiA9TSjLsTxHN4KiK1qDDaENtFYpBt
         pmPZipPh5fmh3J6IRmnn807Dr6BBZ6KL4t3OwWfjNFfSGg/FtMNgrTbl42hETtN6zrxc
         XR3dq0hBHLWzqTvDFUd7bvaxJ20xYbY6J6UGBaoyO/YfbNb7xjWwF/yuUSlnsoywXPkN
         fTJ2EQilg187cc0fxhxA7//cI8yhQ83tgZtcbR/xaZDvN63r5FpSi9ydJ1D3w7zAenm+
         iedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IFpHEZmO8P8ibZrjmbskVYzECLFyHY2hgPRhajuorfs=;
        b=lo3o1Mk0jI1MZrSTwjF+kximH8Z/oBSzkkVWkIoeqGte1fieTW8JGEZM43AlRi9PzR
         J9o7ESDTEUwkrcOjrE3yDgGAdQbtWxxrgFx+4S1B1qHKglpGWyIvARDv8OuwvaOSKyka
         gBqeqyEDiJfWokwwhlPCsV/U6Pd5wNEiSU+ID/FZrA6fJBLjBV074q5fGJkhfXRlJhDT
         CUz5tEdI5iBLaZ2O1ldh5fNQJ5bRTWRQofIbCcOOg6VTJ14zfwSD2lBWrlp9ga3C/tpt
         ILlvlDYcCzLvifAcV0q4PFYbfh86dtozs5FV+vis1ubK/lSQUY6EDj4pcAI4yhT2iqpR
         QsPQ==
X-Gm-Message-State: APjAAAUwRdd590qPGoJuTcG/FBqWGyqLlqyRO9BHbJVdsirS+QVT26xK
        a8/lm8erfPeAIy+TE2JzbawkzIv+blDCoU8S0SA=
X-Google-Smtp-Source: APXvYqyi5GZcial+3zjrwPbvHTkx2yuaQQdgUEbv9P1uEG6WC3VBx9CpmJ5hPZttqtau7i2XXxydh7GEOMuGWFo/Izc=
X-Received: by 2002:a17:902:44f:: with SMTP id 73mr38874274ple.192.1565710815744;
 Tue, 13 Aug 2019 08:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
 <1565459703-30513-5-git-send-email-akinobu.mita@gmail.com> <20190813103313.GC26337@amd>
In-Reply-To: <20190813103313.GC26337@amd>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 14 Aug 2019 00:40:04 +0900
Message-ID: <CAC5umyhpVdMwrm_U7RGq=q4F+mrgGJC01rLvjs4HbF5_C-kXQw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] block: introduce LED block device activity trigger
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B48=E6=9C=8813=E6=97=A5(=E7=81=AB) 19:33 Pavel Machek <pavel@ucw=
.cz>:
>
> On Sun 2019-08-11 02:55:01, Akinobu Mita wrote:
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
>
> Some machines have lots of block devices... Should we perhaps have
> "echo block > trigger; echo nvme0n1 > device"?

I originally considered doing so, just like ledtrig-netdev. However, it
turned out that we needed an additional mechanism to mediate between
the led trigger registration and the block device unregistration.
