Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E1771B8C
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jul 2019 17:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfGWP1B (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Jul 2019 11:27:01 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46757 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbfGWP1B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Jul 2019 11:27:01 -0400
Received: by mail-pg1-f194.google.com with SMTP id k189so562854pgk.13;
        Tue, 23 Jul 2019 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lxs5VlsVdL9Sw2uk5yhQZUeoFMow5gCQfDy+bMj4EpM=;
        b=hgGD2rQW7FwTiOqq3XVqqEMArc7PqghR7AZ20NaNFKoTDaTa+UPUIPQY2B3+MDNd2F
         //oH3hsoBO1Z6/S3GxBzg1WO5CVWdHCDREwEpP6SkUz8rZyM8HP/CPhqXxVc5JXZvkUD
         vpIIp2GNCN9uw2KNpre024rULANo734t0Q7tb8We8ocHU+lRf7yRTbEsVPDiG809B5Zp
         gs6i0Rc4F0p2d88FDIuLw4Z5Z2k9lkuyyZ2VVL6S/iMymoS/BxVArJ2iz2bgFxZ2/Twb
         Cg5JBiYstbHHJhyCFbWXYlpYXdJUX2mGRVfbHij7r08xI9K0lDtNrRoEkEFPkz486QW5
         95QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lxs5VlsVdL9Sw2uk5yhQZUeoFMow5gCQfDy+bMj4EpM=;
        b=saHkBuCDZOkW4bp61ALShno9qFDIdA1E3JsT0wubZQ6Hv1kWaVBfAT3a6yN6ZP7XvY
         t4pQx4oemkdrDf6E8RKlO4/b/81A/gaGXhXT79twCLzr637EmLmhmGvPY0IvIoc3B/CJ
         z6ChKJ16VtPoBHjRzeuiZeQgYPluksdS8WJgnDVIiby/2rx8BQrtZ1RsZsHQFvBbuJAp
         cQYwNoAPe1AiM1gRuZITMe3rsHk6ccPMSA8jNQdsi9DJ1nn6Wa9UwEAEtmBZfvY6D5Pw
         1mWiE2Kyw9LidX84j7jNGZSjtUl1cPI6WqFiCCBWCF4Mlwvn6g3g7Oni5HjS/nDY0dr7
         1RAA==
X-Gm-Message-State: APjAAAUtlauw8CUEPojqW4lgO22U7OqU1T6Tp16BBBmYoDrKnXeuBxJo
        OwpopzdORgKC1QuUevFSYv1JLTFI9nx1nr4qE94=
X-Google-Smtp-Source: APXvYqyWEgipmXUI/XX4GGx7YCvH+Dx+bt0QQopcRMQ+5RC5SwagAhqljsl9yMoAQuB/WrhmNvu2LR5zrbugys7zdKM=
X-Received: by 2002:aa7:8c52:: with SMTP id e18mr6599748pfd.233.1563895620894;
 Tue, 23 Jul 2019 08:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <1563807552-23498-2-git-send-email-akinobu.mita@gmail.com> <201907231015.ELtC6gvZ%lkp@intel.com>
In-Reply-To: <201907231015.ELtC6gvZ%lkp@intel.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 24 Jul 2019 00:26:49 +0900
Message-ID: <CAC5umygkNgxori1RKi7UqvxEBDfM7i9UUzYvtgRreht=qTFkGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] block: introduce LED block device activity trigger
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B47=E6=9C=8823=E6=97=A5(=E7=81=AB) 11:05 kbuild test robot <lkp@=
intel.com>:
>
> Hi Akinobu,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.3-rc1 next-20190722]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Akinobu-Mita/block-intro=
duce-LED-block-device-activity-trigger/20190723-074956
> config: x86_64-fedora-25 (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from drivers/block/umem.c:52:0:
> >> drivers/block/umem.h:39:19: error: expected identifier before numeric =
constant
>     #define  LED_OFF  0x00
>                       ^
> >> include/linux/leds.h:27:2: note: in expansion of macro 'LED_OFF'
>      LED_OFF  =3D 0,
>      ^~~~~~~

The umem driver defines LED_* macros for MEMCTRLCMD_LEDCTRL register
values. I'm going to prepare a patch that renames these macros with
s/LED_/LEDCTRL_/ in umem.
